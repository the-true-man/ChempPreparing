//
//  SessionsPreparing3Tests.swift
//  SessionsPreparing3Tests
//
//  Created by Евгений Михайлов on 23.12.2024.
//

import XCTest
@testable import SessionsPreparing3

final class SessionsPreparing3Tests: XCTestCase {
    func testValidateEmail() throws {
        XCTAssertTrue("test@test.com".validateEmail())
        XCTAssertFalse("test@test.".validateEmail())
        XCTAssertFalse("test.test.ry".validateEmail())
        XCTAssertFalse("".validateEmail())
    }
    
    func testValidatePassword() throws {
        XCTAssertTrue("qweqwe123".validatePassword())
        XCTAssertFalse("qwe123".validatePassword())
        XCTAssertFalse("".validatePassword())
    }

}
