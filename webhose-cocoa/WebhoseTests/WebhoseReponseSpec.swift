@testable import Webhose
import Quick
import Nimble
import OHHTTPStubs

class WebhoseReponseSpec: QuickSpec {
    let aKey = "aKey"
    let aQuery = "aQuery"
    let webhose = "webhose.io"
    let expectedNext = "/search?token=1832ce648d&format=json&ts=1458339113634&q=ipod"
    var totalResults: Int?
    var next: String?
    var requestsLeft: Int?
    var moreResultsAvailable: Int?

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
                        self.next = response.next
                        self.requestsLeft = response.requestsLeft
                        self.moreResultsAvailable = response.moreResultsAvailable
                    }
                    expect(self.totalResults).toEventually(equal(0))
                    expect(self.next).toEventually(equal(""))
                    expect(self.requestsLeft).toEventually(equal(0))
                    expect(self.moreResultsAvailable).toEventually(equal(0))
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
                        self.next = response.next
                        self.requestsLeft = response.requestsLeft
                        self.moreResultsAvailable = response.moreResultsAvailable
                    }
                    expect(self.totalResults).toEventually(equal(2))
                    expect(self.next).toEventually(equal(self.expectedNext))
                    expect(self.requestsLeft).toEventually(equal(998))
                    expect(self.moreResultsAvailable).toEventually(equal(5113))
                }
            }
        }
    }
}
