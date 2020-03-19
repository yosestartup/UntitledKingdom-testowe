//
//  NetworkLayerTests.swift
//  NetworkLayerTests
//
//  Created by Oleksandr Bambulyak on 19/03/2020.
//  Copyright © 2020 Untitled Kingdom. All rights reserved.
//

import XCTest
@testable import Recruitment_iOS

class Recruitment_iOSTests: XCTestCase {
    
    var netManager: NetworkingManager! = nil
    
    override func setUp() {
        super.setUp()
        self.netManager = NetworkingManager.sharedManager
    }
    
    func testReceiveModel_downloadItems() {
      let promise = expectation(description: "Data is loaded")
        self.netManager.downloadItems { (model, error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            }
            
            if model != nil {
                promise.fulfill()
            }
        }
        wait(for: [promise], timeout: 3)
    }
    
    func testReceiveModel_downloadItemWithId() {
      let promise = expectation(description: "Data is loaded")
        self.netManager.downloadItemWithID("1", completion: { model, error in
            
             if let error = error {
                 XCTFail("Error: \(error.localizedDescription)")
                 return
             }
             
            if model != nil {
                 promise.fulfill()
             }
        })
        wait(for: [promise], timeout: 3)
    }
    
    func testModelParsing_itemsList() {
        
        let idPromise = expectation(description: "ID parsed properly")
        let typePromise = expectation(description: "Type parsed properly")
        let namePromise = expectation(description: "Name parsed properly")
        let colorPromise = expectation(description: "Color parsed properly")
        let previewPromise = expectation(description: "Preview parsed properly")
        
        self.netManager.downloadItems { (model, error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            }
            
            if let model = model {
                
                //Check first item from array
                let firstModelFromArray = model.data[0]
                
                if (firstModelFromArray.id == "2") {
                    idPromise.fulfill()
                } else {
                    XCTFail("ID parse error")
                }
                
                if(firstModelFromArray.type == "Items") {
                    typePromise.fulfill()
                } else {
                    XCTFail("Type parse error")
                }
                
                if(firstModelFromArray.attributes.name == "Item2") {
                    namePromise.fulfill()
                } else {
                    XCTFail("Name parse error")
                }
                
                if(firstModelFromArray.attributes.color == "Red") {
                    colorPromise.fulfill()
                } else {
                    XCTFail("Color parse error")
                }
                
                if(firstModelFromArray.attributes.preview == "Lorem ipsum dolor sit amet, consectetur adipiscing elit.") {
                    previewPromise.fulfill()
                } else {
                    XCTFail("Preview parse error")
                }
            }
        }
        wait(for: [idPromise, typePromise, namePromise, colorPromise, previewPromise], timeout: 5)
    }

    override func tearDown() {
        self.netManager = nil
        super.tearDown()
    }

}
