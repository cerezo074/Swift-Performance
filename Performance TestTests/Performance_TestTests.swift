//
//  Performance_TestTests.swift
//  Performance TestTests
//
//  Created by eli on 4/23/17.
//  Copyright © 2017 Rappi. All rights reserved.
//

import XCTest
@testable import Performance_Test

class Performance_TestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceTaskMessageDispatch() {
        self.measure {
            let messageDispatch = MessageDispatchTask()
            messageDispatch.sum10000000()
        }
    }
    
    func testPerformanceTaskTableDispatch() {
        self.measure {
            let tableDispatch = TableDispatchTask()
            tableDispatch.sum10000000()
        }
    }
    
    func testPerformanceTaskDirectDispatch() {
        self.measure {
            var directDispatch = DirectDispatchTask()
            directDispatch.sum10000000()
        }
    }
    
}

//MARK: Message Dispatch
class MessageDispatchParentTask {
    
    var number: Int = 0
    
    dynamic func add(newValue: Int) {}
    
    func showNumber() {
        print("Number: \(number)")
    }
    
    func sum10000000() {
        
        for _ in 0 ..< 10000000 {
            add(newValue: 1)
        }
        
        showNumber()
    }
    
}

class MessageDispatchTask: MessageDispatchParentTask {
    
    override func add(newValue: Int) {
        number += newValue
    }
    
}

//MARK: Table Dispatch
class TableDispatchParentTask {

    var number: Int = 0
    
    func add(newValue: Int) {
        number += newValue
    }
    
    func showNumber() {
        print("Number: \(number)")
    }
    
    func sum10000000() {
        
        for _ in 0 ..< 10000000 {
            add(newValue: 1)
        }
        
        showNumber()
    }
    
}

class TableDispatchTask: TableDispatchParentTask {
    
    override func add(newValue: Int) {
        number += newValue
    }
    
}

//MARK: Static Dispatch
struct DirectDispatchTask {
    
    var number: Int = 0
    
    mutating func add(newValue: Int) {
        number += newValue
    }
    
    func showNumber() {
        print("Number: \(number)")
    }
    
    mutating func sum10000000() {
        
        for _ in 0 ..< 10000000 {
            add(newValue: 1)
        }
        
        showNumber()
    }
    
}
