import UIKit
import Foundation

let url: URL = URL(string: "https://www.google.com")!
let request = URLRequest(url: url)

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    if error == nil {
        print("No error!")
    } else {
        print("Error")
    }
}
task.resume()
