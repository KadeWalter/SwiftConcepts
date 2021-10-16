import UIKit
import XCPlayground

let adjacencyList = AdjacencyList<String>()

let singapore = adjacencyList.createVertex(data: "Singapore")
let tokyo = adjacencyList.createVertex(data: "Tokyo")
let hongKong = adjacencyList.createVertex(data: "Hong Kong")
let detroit = adjacencyList.createVertex(data: "Detroit")
let sanFrancisco = adjacencyList.createVertex(data: "San Francisco")
let washingtonDC = adjacencyList.createVertex(data: "Washington DC")
let austinTexas = adjacencyList.createVertex(data: "Austin Texas")
let seattle = adjacencyList.createVertex(data: "Seattle")

adjacencyList.add(type: .undirected, from: singapore, to: hongKong, weight: 300)
adjacencyList.add(type: .undirected, from: singapore, to: tokyo, weight: 500)
adjacencyList.add(type: .undirected, from: hongKong, to: tokyo, weight: 250)
adjacencyList.add(type: .undirected, from: tokyo, to: detroit, weight: 450)
adjacencyList.add(type: .undirected, from: tokyo, to: washingtonDC, weight: 300)
adjacencyList.add(type: .undirected, from: hongKong, to: sanFrancisco, weight: 600)
adjacencyList.add(type: .undirected, from: detroit, to: austinTexas, weight: 50)
adjacencyList.add(type: .undirected, from: austinTexas, to: washingtonDC, weight: 292)
adjacencyList.add(type: .undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
adjacencyList.add(type: .undirected, from: washingtonDC, to: seattle, weight: 277)
adjacencyList.add(type: .undirected, from: sanFrancisco, to: seattle, weight: 218)
adjacencyList.add(type: .undirected, from: austinTexas, to: sanFrancisco, weight: 297)

adjacencyList.description

print(adjacencyList.weight(from: singapore, to: tokyo)!)

if let flightsFromSanFrancisco = adjacencyList.edges(from: sanFrancisco) {
  print("San Francisco Out Going Flights:")
  print("--------------------------------")
  for edge in flightsFromSanFrancisco {
    print("from: \(edge.source) to: \(edge.destination)")
  }
}

