import XCTest
@testable import iCalendarKit

final class iCalendarKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(iCalendarKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
