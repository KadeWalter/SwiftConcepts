import UIKit

struct Test: Codable {
    var name: String
}

let json: [String : String] = ["name" : "123"]
let isValidJson = JSONSerialization.isValidJSONObject(json)

if isValidJson {
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
        let decoded = try JSONDecoder().decode(Test.self, from: jsonData)
        let mirror = Mirror(reflecting: decoded)
        for mir in mirror.children {
            print(mir.label!)
        }
    } catch {
        print("fail")
    }
}
