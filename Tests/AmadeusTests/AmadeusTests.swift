import XCTest
@testable import Amadeus

final class AmadeusTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Amadeus().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
