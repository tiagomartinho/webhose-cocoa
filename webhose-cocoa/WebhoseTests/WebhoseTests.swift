@testable import Webhose
import XCTest
import OHHTTPStubs

class WebhoseTests: XCTestCase {
    let aKey = "aKey"
    let aQuery = "aQuery"
    let webhose = "webhose.io"

    func testError() {
        stubsError()
        let client = WebhoseClient(key: aKey)
        let response = client.search(aQuery)
        XCTAssertEqual(0, response.posts.count)
    }

    func testSuccess() {
        stubsSuccess()
        let client = WebhoseClient(key: aKey)
        let response = client.search(aQuery)
        XCTAssertEqual(2, response.posts.count)
    }

    func stubsError() {
        stub(isHost(webhose)) { _ in
            return fixture("", status: 500, headers: ["Content-Type":"application/json"])
        }
    }

    func stubsSuccess() {
        stub(isHost(webhose)) { _ in
            let stubPath = OHPathForFile("Response.json", self.dynamicType)
            return fixture(stubPath!, headers: ["Content-Type":"application/json"])
        }
    }
}
