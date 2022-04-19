//
//  MyMathTests.swift
//  UnitTestingExampleTests
//
//  Created by Kade Walter on 4/19/22.
//

import XCTest
@testable import UnitTestingExample

class MyMathTests: XCTestCase {

    var mathController: MyMath!
    
    override func setUp() {
        mathController = MyMath()
    }

    override func tearDown() {
        mathController = nil
    }

    func testAdd() {
        XCTAssertEqual(mathController!.add(numberOne: 1, numberTwo: 0), 1)
        XCTAssertEqual(mathController!.add(numberOne: 1, numberTwo: 1), 2)
        XCTAssertEqual(mathController!.add(numberOne: 1, numberTwo: 2), 3)
        XCTAssertEqual(mathController!.add(numberOne: 1, numberTwo: 3), 4)
        
        XCTAssertNotEqual(mathController!.add(numberOne: 2, numberTwo: 2), 5)
    }

    func testSub() {
        XCTAssertEqual(mathController!.sub(numberOne: 1, numberTwo: 0), 1)
        XCTAssertEqual(mathController!.sub(numberOne: 1, numberTwo: 1), 0)
        XCTAssertEqual(mathController!.sub(numberOne: 1, numberTwo: 2), -1)
        XCTAssertEqual(mathController!.sub(numberOne: 1, numberTwo: 3), -2)
        
        XCTAssertNotEqual(mathController!.sub(numberOne: 2, numberTwo: 2), 5)
    }
    
    func testDiv() {
        XCTAssertEqual(mathController!.div(numberOne: 0, numberTwo: 1), 0)
        XCTAssertEqual(mathController!.div(numberOne: 1, numberTwo: 1), 1)
        XCTAssertEqual(mathController!.div(numberOne: 1, numberTwo: 2), 1)
        XCTAssertEqual(mathController!.div(numberOne: 1, numberTwo: 3), 1)
        
        XCTAssertNotEqual(mathController!.div(numberOne: 2, numberTwo: 2), 5)
    }
    
    func testMul() {
        XCTAssertEqual(mathController!.mul(numberOne: 1, numberTwo: 0), 0)
        XCTAssertEqual(mathController!.mul(numberOne: 1, numberTwo: 1), 1)
        XCTAssertEqual(mathController!.mul(numberOne: 1, numberTwo: 2), 2)
        XCTAssertEqual(mathController!.mul(numberOne: 1, numberTwo: 3), 3)
        
        XCTAssertNotEqual(mathController!.mul(numberOne: 2, numberTwo: 2), 5)
    }
}
