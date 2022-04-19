//
//  MyMath.swift
//  UnitTestingExample
//
//  Created by Kade Walter on 4/19/22.
//

import Foundation

class MyMath {
    
    func add(numberOne: Int, numberTwo: Int) -> Int {
        return numberOne + numberTwo
    }
    
    func sub(numberOne: Int, numberTwo: Int) -> Int {
        return numberOne - numberTwo
    }
    
    func div(numberOne: Int, numberTwo: Int) -> Int {
        if numberTwo == 0 { return 0 }
        return Int(ceil(Double(numberOne) / Double(numberTwo)))
    }
    
    func mul(numberOne: Int, numberTwo: Int) -> Int {
        return numberOne * numberTwo
    }
    
}
