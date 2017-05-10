//
//  iosTests.swift
//  iosTests
//
//  Created by Lucas Freitas on 4/15/17.
//  Copyright © 2017 Everyday Activism. All rights reserved.
//

import Firebase
import XCTest
@testable import ios

class iosTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //MARK: ActionType Class Tests
    
    // Confirm that the ActionType initializer returns a ActionType object when passed valid parameters.
    func testActionTypeInitializationSucceeds() {
        let validStringActionType = ActionType.init(name: "Action type", backgroundImage: UIImage.init())
        XCTAssertNotNil(validStringActionType)
        // Confirm that name gets turned into uppercase.
        XCTAssertEqual(validStringActionType?.name, "ACTION TYPE")
    }
    
    // Confirm that the ActionType initialier returns nil when passed an empty name.
    func testActionTypeInitializationFails() {
        let emptyStringActionType = ActionType.init(name: "", backgroundImage: UIImage.init())
        XCTAssertNil(emptyStringActionType)
    }

    //MARK: ActionPreview Class Tests
    
    // Confirm that the ActionPreview initializer returns a ActionPreview object when passed valid parameters.
    func testActionPreviewInitializationSucceeds() {
        let validStringActionPreview = ActionPreview.init(name: "Action", backgroundImage: UIImage.init(), points: 4)
        XCTAssertNotNil(validStringActionPreview)
    }
    
    // Confirm that the ActionType initialier returns nil when passed an empty name or negative or zero score.
    func testActionPreviewInitializationFails() {
        XCTAssertNil(ActionPreview.init(name: "", backgroundImage: UIImage.init(), points: 4))
        XCTAssertNil(ActionPreview.init(name: "Action", backgroundImage: UIImage.init(), points: 0))
    }
}
