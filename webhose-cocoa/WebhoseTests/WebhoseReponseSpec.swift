@testable import Webhose
import Quick
import Nimble

class WebhoseReponseSpec: QuickSpec {

    let aKey = "aKey"
    let aQuery = "aQuery"

    override func spec() {
        describe("the Webhose Client") {
            let client = WebhoseClient(key: self.aKey)

            context("when the response is incorrect") {
                beforeEach {
                    WebhoseStub.stubIncorrectResponse()
                }
                it("does not have totalResults") {
                    var totalResults: Int?
                    client.search(self.aQuery) { response in
                        totalResults = response.totalResults
                    }
                    expect(totalResults).toEventually(equal(0))
                }
            }

            context("when the response is correct") {
                beforeEach {
                    WebhoseStub.stubCorrectResponse()
                }
                it("has total results") {
                    var totalResults: Int?
                    client.search(self.aQuery) { response in
                        totalResults = response.totalResults
                    }
                    expect(totalResults).toEventually(equal(2))
                }
                it("has next search url") {
                    var next: String?
                    client.search(self.aQuery) { response in
                        next = response.next
                    }
                    let expectedNext = "/search?token=1&format=json&ts=1458339113634&q=ipod"
                    expect(next).toEventually(equal(expectedNext))
                }
                it("has number of requests left") {
                    var requestsLeft: Int?
                    client.search(self.aQuery) { response in
                        requestsLeft = response.requestsLeft
                    }
                    expect(requestsLeft).toEventually(equal(998))
                }
                it("has number of more results available") {
                    var moreResultsAvailable: Int?
                    client.search(self.aQuery) { response in
                        moreResultsAvailable = response.moreResultsAvailable
                    }
                    expect(moreResultsAvailable).toEventually(equal(5113))
                }
            }
        }
    }
}
