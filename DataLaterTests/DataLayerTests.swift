//
//  DataLaterTests.swift
//  DataLayerTests
//
//  Created by Oleksandr Bambulyak on 19/03/2020.
//  Copyright © 2020 Untitled Kingdom. All rights reserved.
//

import XCTest
@testable import Recruitment_iOS

class DataLayerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testModelConvertion_itemsList() {
        
        let idPromise = expectation(description: "ID converted properly")
        let typePromise = expectation(description: "Type converted properly")
        let namePromise = expectation(description: "Name converted properly")
        let colorPromise = expectation(description: "Color converted properly")
        let previewPromise = expectation(description: "Preview converted properly")
        let descriptionPromise = expectation(description: "Description converted properly")
        
        //Check first item from array
        let itemAttributesApiResponseModel = ItemAttributesApiResponseModel(name: "Item2", color: "Red", preview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", desc: "Desc test")
        let itemDataApiResponseModel = ItemDataApiResponseModel(id: "2", type: "Items", attributes: itemAttributesApiResponseModel)
        let itemApiModel = ItemApiResponseModel(data: itemDataApiResponseModel)
        
        let firstModelFromArray = itemApiModel.data
        let convertedModel = ItemData.convert(from: firstModelFromArray)
    
        if (convertedModel.id == "2") {
            idPromise.fulfill()
        } else {
            XCTFail("ID convertion error")
        }
        
        if(convertedModel.type == "Items") {
            typePromise.fulfill()
        } else {
            XCTFail("Type convertion error")
        }
        
        if(convertedModel.attributes.name == "Item2") {
            namePromise.fulfill()
        } else {
            XCTFail("Name convertion error")
        }
        
        if(convertedModel.attributes.color == UIColor.red) {
            colorPromise.fulfill()
        } else {
            XCTFail("Color convertion error")
        }
        
        if(convertedModel.attributes.preview == "Lorem ipsum dolor sit amet, consectetur adipiscing elit.") {
            previewPromise.fulfill()
        } else {
            XCTFail("Preview convertion error")
        }
        
        if(convertedModel.attributes.desc == "Desc test") {
            descriptionPromise.fulfill()
        } else {
            XCTFail("Description convertion error")
        }

        wait(for: [idPromise, typePromise, namePromise, colorPromise, previewPromise, descriptionPromise], timeout: 2)
    }

}
