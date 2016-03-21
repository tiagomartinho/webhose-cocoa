@testable import Webhose
import Quick
import Nimble
import OHHTTPStubs

class WebhoseSpec: QuickSpec {
    let aKey = "aKey"
    let aQuery = "aQuery"
    let webhose = "webhose.io"
    var totalResults: Int?

    override func spec() {
        describe("the Webhose Client") {
            context("when the response is incorrect") {
                beforeEach {
                    stub(isHost(self.webhose)) { _ in
                        return fixture("", status: 500,
                            headers: ["Content-Type":"application/json"])
                    }
                }
                it("has empty post list") {
                    let client = WebhoseClient(key: self.aKey)
                    client.search(self.aQuery) { response in
                        self.totalResults = response.totalResults
                    }
                    expect(self.totalResults).toEventually(be(0))
                }
            }

            context("when the response is correct") {
                beforeEach {
                    stub(isHost(self.webhose)) { _ in
                        let stubPath = OHPathForFile("Response.json", self.dynamicType)
                        return fixture(stubPath!, headers: ["Content-Type":"application/json"])
                    }
                }
                it("has not empty items list") {
                    let client = WebhoseClient(key: self.aKey)
                    client.search(self.aQuery) { response in
                        self.totalResults = response.totalResults
                    }
                    expect(self.totalResults).toEventually(be(2))
                }
            }
        }
    }
}
