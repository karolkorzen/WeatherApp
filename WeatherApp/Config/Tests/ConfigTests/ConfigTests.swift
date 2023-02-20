import XCTest
@testable import Config

final class ConfigTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Config().text, "Hello, World!")
    }
}
