//
//  CoffeeOrderingAppTests.swift
//  CoffeeOrderingAppTests
//
//  Created by Aysel on 11/17/21.
//

import XCTest
@testable import CoffeeOrderingApp


// test_UnitOfTesting_StateUnderTest_ExpectedBehaviour
// test_[struct or class]_[var or func of class]_[expected value/result]

// Structure of the test: Given , When , Then


class CoffeeOrderingAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_UnitTestingCoffeeViewModel_isPremium_shouldBeTrue() throws {
        
        //Given
        let userIsPremium = true
        
        //When
        let vm = UnitTestingCoffeeViewModel(isPremium: userIsPremium)
        
        //Then
        XCTAssertTrue(vm.isPremium)
    }
    
    func test_UnitTestingCoffeeViewModel_isPremium_shouldBeFalse() throws {
        
        //Given
        let userIsPremium = false
        
        //When
        let vm = UnitTestingCoffeeViewModel(isPremium: userIsPremium)
        
        //Then
        XCTAssertFalse(vm.isPremium)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
