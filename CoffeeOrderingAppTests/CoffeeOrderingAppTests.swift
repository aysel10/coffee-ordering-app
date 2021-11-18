//
//  CoffeeOrderingAppTests.swift
//  CoffeeOrderingAppTests
//
//  Created by Aysel on 11/17/21.
//

import XCTest
import Foundation
import SwiftUI
@testable import CoffeeOrderingApp


// test_UnitOfTesting_StateUnderTest_ExpectedBehaviour
// test_[struct or class]_[var or func of class]_[expected value/result]

// Structure of the test: Given , When , Then


class CoffeeOrderingAppTests: XCTestCase {
    
    var viewModel: UnitTestingCoffeeViewModel?
        

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = UnitTestingCoffeeViewModel(isPremium: Bool.random())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil  // to reset everything in viewModel(list items etc)
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

    func test_UnitTestingCoffeeViewModel_isPremium_shouldBeInjectedValue() throws {
        
        //Given
        let userIsPremium = Bool.random()
        
        //When
        let vm = UnitTestingCoffeeViewModel(isPremium: userIsPremium)
        
        //Then
        XCTAssertEqual(vm.isPremium,userIsPremium)
    }
    
    func test_UnitTestingCoffeeViewModel_isPremium_shouldBeInjectedValue_stress() throws {
        for _ in 0..<100 {
            //Given
            let userIsPremium = Bool.random()
            
            //When
            let vm = UnitTestingCoffeeViewModel(isPremium: userIsPremium)
            
            //Then
            XCTAssertEqual(vm.isPremium,userIsPremium)
        }
    }
    
    func test_UnitTestingCoffeeViewModel_dataArray_shoulBeEmpty() throws{
        
        //When
        let vm = UnitTestingCoffeeViewModel(isPremium: Bool.random())
        
        //Then
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0)
    }
    
    func test_UnitTestingCoffeeViewModel_dataArray_shoulAddItems() throws{
        
        //Given
        let vm = UnitTestingCoffeeViewModel(isPremium: Bool.random())
        
        //When
        let loopCount: Int = Int.random(in: 0..<100)
        
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString) //random func to generate string is better approach
        }
        
        //Then
        XCTAssertTrue(!vm.dataArray.isEmpty)
        XCTAssertNotEqual(vm.dataArray.count, 0)
        XCTAssertEqual(vm.dataArray.count, loopCount)
    }
    
    func test_UnitTestingCoffeeViewModel_dataArray_shoulNotAddBlankItems() throws{
        
        //Given
        let vm = UnitTestingCoffeeViewModel(isPremium: Bool.random())
        
        //When
        vm.addItem(item: "") //random func to generate string is better approach
        
        //Then
        XCTAssertTrue(vm.dataArray.isEmpty)
    }
    
    func test_UnitTestingCoffeeViewModel_dataArray_shoulNotAddBlankItems2() throws{
        
        //Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        //When
        vm.addItem(item: "") //random func to generate string is better approach
        
        //Then
        XCTAssertTrue(vm.dataArray.isEmpty)
    }
    
    func test_UnitTestingCoffeeViewModel_dataArray_selectingInvalidItems() throws{
        
        //Given
        let vm = UnitTestingCoffeeViewModel(isPremium: Bool.random())
        
        //When
        //valid item
        let newItem = UUID().uuidString
        vm.addItem(item: newItem)
        vm.selectItem(item: newItem)
        
        //invalid item
        vm.selectItem(item: UUID().uuidString)
        
        //Then
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestingCoffeeViewModel_dataArray_selectedItemShouldBeSelected() throws{
        
        //Given
        let vm = UnitTestingCoffeeViewModel(isPremium: Bool.random())
        
        //When
        let newItem = "Aysel"
        vm.addItem(item: newItem)
        vm.selectItem(item: newItem)
        
        //Then
        XCTAssertEqual(vm.selectedItem, newItem)
        XCTAssertNotNil(vm.selectedItem)
    }
    

    
    func test_UnitTestingCoffeeViewModel_dataArray_selectedItemShouldBeSelected_stress() throws{
        
        //Given
        let vm = UnitTestingCoffeeViewModel(isPremium: Bool.random())
        
        //When
        var itemsArray: [String] = []
        for _ in 0..<50 {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemsArray.append(newItem)
        }
        let randomItem = itemsArray.randomElement() ?? ""
        XCTAssertFalse(randomItem.isEmpty)
        
        vm.selectItem(item: randomItem)
        //Then
        XCTAssertEqual(vm.selectedItem, randomItem)
        XCTAssertNotNil(vm.selectedItem)
    
    }
    
    
    func test_UnitTestingCoffeeViewModel_saveItem_shouldThrowError_ItemNotFound() throws{
        
        //Given_saveItem_shouldThrowError_NoData
        let vm = UnitTestingCoffeeViewModel(isPremium: Bool.random())
        
        //When
        for _ in 0..<50 {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
        }
        
        //Then
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString))
        
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString), "Should throw item not found") { error in
            let returnedError = error as? UnitTestingCoffeeViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingCoffeeViewModel.DataError.itemNotFound)
        }
    }
    
    func test_UnitTestingCoffeeViewModel_saveItem_shouldThrowError_noData() throws{
        
        //Given_saveItem_shouldThrowError_NoData
        let vm = UnitTestingCoffeeViewModel(isPremium: Bool.random())
        
        //When
        for _ in 0..<50 {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
        }
        
        //Then
        do {
            try vm.addItem(item: "")
        } catch let error {
            let returnedError = error as? UnitTestingCoffeeViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingCoffeeViewModel.DataError.noData)
        }
    }
    
    func test_UnitTestingCoffeeViewModel_saveItem_shouldSaveItem() throws{
        
        //Given_saveItem_shouldThrowError_NoData
        let vm = UnitTestingCoffeeViewModel(isPremium: Bool.random())
        
        //When
        var itemsArray: [String] = []
        for _ in 0..<50 {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemsArray.append(newItem)
        }
        let randomItem = itemsArray.randomElement() ?? ""
        XCTAssertFalse(randomItem.isEmpty)
        //Then
        XCTAssertNoThrow(try vm.saveItem(item: randomItem))
        
        do {
            try vm.saveItem(item: randomItem)
        }catch{
            XCTFail()
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
