import UIKit

struct CityObject {
    var name: String
    var randomNum: Int
}

func printCities(cities: [CityObject]) {
    for city in cities {
        print("Name: \(city.name), number: \(city.randomNum)")
    }
    print("\n")
}


let newYork = CityObject(name: "New York", randomNum: 10000)
let boulder = CityObject(name: "Boulder", randomNum: 20000)
let chicago = CityObject(name: "Chicago", randomNum: 150000)
let stlouis = CityObject(name: "St. Louis", randomNum: 999)


var cities = [newYork, boulder, chicago, stlouis]
printCities(cities: cities)

let springfield = CityObject(name: "Springfield", randomNum: 123456)
cities.append(springfield)
printCities(cities: cities)

// MARK: - Filter
let citiesWithI = cities.filter({ $0.name.contains("i") })
printCities(cities: citiesWithI)

// MARK: - Sorted
let citiesWithTheSameNum = cities.sorted(by: { $0.randomNum < $1.randomNum })
printCities(cities: citiesWithTheSameNum)

// MARK: - Reduce
let totalNumber = cities.reduce(0, { x, number in
    x + number.randomNum
})
print("Total Number: \(totalNumber)")
print("\n")

// MARK: - Map
let cityNames = cities.map({ $0.name })
print("City names: \(cityNames)")
print("\n")

// MARK: - Enumeration practice.
for (index, city) in cities.enumerated() {
    print("\(city) is at index \(index) in the array.")
}
print("\n")
// Reverse the order, then enumerate.
for (index, city) in cities.reversed().enumerated() {
    print("\(city) is at index \(index) in the array.")
}
print("\n")
// Proof that cities wasnt reversed because .reveresed() was never stored in another var.
printCities(cities: cities)

let lastCity = cities.popLast()!
printCities(cities: [lastCity])
printCities(cities: cities)
cities.append(lastCity)
printCities(cities: cities)

