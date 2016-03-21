import XCTest
@testable import Webhose

class WebhoseTests: XCTestCase {
    let aKey = "aKey"
    let aQuery = "aQuery"
    let expectedNumberOfResults = 123

    func testSimpleRequest() {
        let client = WebhoseClient(key: aKey)
        let response = client.search(aQuery)
        XCTAssertEqual(expectedNumberOfResults, response.posts.count)
    }
}
