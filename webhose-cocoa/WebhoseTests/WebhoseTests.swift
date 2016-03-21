@testable import Webhose
import XCTest
import OHHTTPStubs

class WebhoseTests: XCTestCase {
    let aKey = "aKey"
    let aQuery = "aQuery"
    
    func testError() {
        stubsError()
        let client = WebhoseClient(key: aKey)
        let response = client.search(aQuery)
        XCTAssertEqual(0, response.posts.count)
    }
    
    func stubsError() {
        stub(isHost("webhose.io")) { _ in
            return fixture("", status: 500, headers: ["Content-Type":"application/json"])
        }
    }
}
