//
//  SmackApp2UITests.swift
//  SmackApp2UITests
//
//  Created by Sabri Sönmez on 5/29/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import XCTest

class SmackApp2UITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testValidLoginSuccess() {
//
//        let validUsername = "test@test.com"
//        let validPassword = "123456"
//
//        let app = XCUIApplication()
//        app.textFields["username"].tap()
//
//        let passwordSecureTextField = app.secureTextFields["password"]
//        passwordSecureTextField.tap()
//
//        app.buttons["Login"].tap()
//
//    }
    
    
   
    func testValidLoginSuccess(){
        
        let validUsername = "test@test.com"
        let validPassword = "123456"
        
        let app = XCUIApplication()
        
        app.buttons["smackBurger"].tap()
        
        let loginButton = app.buttons["Login"]
        loginButton.tap()
       
        let usernameTextField = app.textFields["username"]
        XCTAssertTrue(usernameTextField.exists)
        usernameTextField.tap()
        usernameTextField.typeText(validUsername)
        
        let passwordSecureTextField = app.secureTextFields["password"]
        XCTAssertTrue(passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(validPassword)
        
        loginButton.tap()
       
        let generalChat = XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["#general"]/*[[".cells.staticTexts[\"#general\"]",".staticTexts[\"#general\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: generalChat, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertTrue(generalChat.exists)
    }
    
    func testValidSignUpSuccess(){
        
        let validUsername = generateUserName(UserNameLength: 6)
        let validPassword = generatePassword(passwordLength: 6)
        let validEmail = generateUserEmail(UserEmailLength: 5)
        
        let app = XCUIApplication()
        
        app.buttons["smackBurger"].tap()
        //app.tables["Empty list"].swipeRight()
        
        app.buttons["Login"].tap()
        app.buttons["Don't have an account? Sign up here"].tap()
        
        let usernameTextField = app.textFields["username"]
        XCTAssertTrue(usernameTextField.exists)
        usernameTextField.tap()
        usernameTextField.typeText(validUsername)
        
        let userEmailTextField = app.textFields["email"]
        XCTAssertTrue(userEmailTextField.exists)
        userEmailTextField.tap()
        userEmailTextField.typeText(validEmail)
        
      
        let passwordSecureTextField = app.secureTextFields["password"]
        XCTAssertTrue(passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(validPassword)
        
        
        app.buttons["Choose an Avatar"].tap()
        app.collectionViews.cells.otherElements.containing(.image, identifier:"dark2").element.tap()
        
        app.buttons["Generate background color"].tap()
        
        app.buttons["Create Account"].tap()
       
        let generalChat = XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["#general"]/*[[".cells.staticTexts[\"#general\"]",".staticTexts[\"#general\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: generalChat, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertTrue(generalChat.exists)
    }
    
    func generatePassword(passwordLength: Int) -> String {
        
        let passwordMaterial : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let passwordMaterialLength = UInt32(passwordMaterial.length)
        
        var returnValue = ""
        
        for _ in 0 ..< passwordLength {
            let randomPosition = arc4random_uniform(passwordMaterialLength)
            var character = passwordMaterial.character(at: Int(randomPosition))
            returnValue += NSString(characters: &character, length: 1) as String
        }
        
        return returnValue
    }
    
    func generateUserName(UserNameLength: Int) -> String {
        
        let UserNameMaterial : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let UserNameMaterialLength = UInt32(UserNameMaterial.length)
        
        var returnValue = ""
        
        for _ in 0 ..< UserNameLength {
            let randomPosition = arc4random_uniform(UserNameMaterialLength)
            var character = UserNameMaterial.character(at: Int(randomPosition))
            returnValue += NSString(characters: &character, length: 1) as String
        }
        
        return returnValue
    }
    
    func generateUserEmail(UserEmailLength: Int) -> String {
        
        let UserEmailMaterial : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let UserEmailMaterialLength = UInt32(UserEmailMaterial.length)
        
        var returnValue = ""
        
        for _ in 0 ..< UserEmailLength {
            let randomPosition = arc4random_uniform(UserEmailMaterialLength)
            var character = UserEmailMaterial.character(at: Int(randomPosition))
            returnValue += NSString(characters: &character, length: 1) as String
        }
        
        return returnValue + "@test.com"
    }

}
