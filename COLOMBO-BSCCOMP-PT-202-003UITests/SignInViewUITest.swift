//
//  SignInViewUITest.swift
//  COLOMBO-BSCCOMP-PT-202-003UITests
//
//  Created by Sahan Ruwanga on 2022-04-17.
//

import XCTest
class SignInViewUITest: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }
    func testSignInViewElementExistance(){
                        
        let SignInView_Image = app.images["background image"]
        let SignInView_TextView = app.staticTexts["Email_TextFeild"]
        let SignInView_EmailField = app.textFields["SignInView_EmailField"]
        let SignInView_PassField = app.textFields["SignInView_PassField"]
        let SignInView_SecurePassField = app.secureTextFields["SignInView_PassField"]
        let SignInView_VisibleLabel = app.staticTexts["SignInView_VisibleLabel"]
        let SignInView_ForgetLabel = app.staticTexts["SignInView_ForgetLabel"]
        let SignInView_TermsTermsLabel = app.staticTexts["SignInView_TermsLabel"]
        let SignInView_SignInButton = app.buttons["SignInView_SignInButton"]
        let SignInView_SignUpButton = app.buttons["SignInView_SignUpButton"]


        XCTAssert(SignInView_Image.exists)
        XCTAssertTrue(SignInView_TextView.exists, "SignIn View Text View exists")
        XCTAssertTrue(SignInView_EmailField.exists, "SignIn View Email Field exists")
        XCTAssertTrue(SignInView_PassField.exists, "SignIn View Password Field exists")
        XCTAssertTrue(SignInView_SecurePassField.exists, "SignIn Secure Password Field  exists")
        XCTAssertTrue(SignInView_VisibleLabel.exists, "SignIn View Visible Label exists")
        XCTAssertTrue(SignInView_ForgetLabel.exists, "SignIn View Forget Label exists")
        XCTAssertTrue(SignInView_TermsTermsLabel.exists, "SignIn View Terms Terms Label exists")
        XCTAssertTrue(SignInView_SignInButton.exists, "SignIn View New SignIn Button exists")
        XCTAssertTrue(SignInView_SignUpButton.exists, "SignIn View New Signup Button exists")
    }
    func testLoginFlow() {
            let email = app.textFields["SignInView_EmailField"]
            email.tap()
            email.typeText("sahanruwanga2030@gmail.com")

            let pwd = app.secureTextFields["SignInView_PassField"]
            pwd.tap()
            pwd.typeText("")

            app.buttons["SignInView_SignInButton"].tap()
        }
}
