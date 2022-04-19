import Foundation

open class AdjacencyList<T: Hashable> {
    public var adjacencyDict: [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
}

extension AdjacencyList: Graphable {
    public var description: CustomStringConvertible {
        var result = ""
        for (vertex, edges) in adjacencyDict {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ] \n ")
        }
        return result
    }
    
    public func edges(from source: Vertex<T>) -> [Edge<T>]? {
        return adjacencyDict[source]
    }
    
    public typealias Element = T
    
    public func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data)
        
        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }
        
        return vertex
    }
    
    fileprivate func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencyDict[source]?.append(edge)
    }
    
    fileprivate func addUndirectedEdge(vertices: (Vertex<Element>, Vertex<Element>), weight: Double?) {
      let (source, destination) = vertices
      addDirectedEdge(from: source, to: destination, weight: weight)
      addDirectedEdge(from: destination, to: source, weight: weight)
    }

    public func add(type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
      switch type {
      case .directed:
        addDirectedEdge(from: source, to: destination, weight: weight)
      case .undirected:
        addUndirectedEdge(vertices: (source, destination), weight: weight)
      }
    }
    
    public func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? {
      guard let edges = adjacencyDict[source] else { // 1
        return nil
      }
      
      for edge in edges { // 2
        if edge.destination == destination { // 3
          return edge.weight
        }
      }
      
      return nil // 4
    }


}
