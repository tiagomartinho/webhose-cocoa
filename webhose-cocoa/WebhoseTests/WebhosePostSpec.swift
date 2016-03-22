@testable import Webhose
import Quick
import Nimble

class WebhosePostSpec: QuickSpec {

    let aKey = "aKey"
    let aQuery = "aQuery"

    override func spec() {
        describe("the Webhose Client") {
            let client = WebhoseClient(key: self.aKey)

            context("when the response is incorrect") {
                beforeEach {
                    WebhoseStub.stubIncorrectResponse()
                }
                it("has empty post list") {
                    var posts: [WebhosePost]?
                    client.search(self.aQuery) { response in
                        posts = response.posts
                    }
                    expect(posts?.count).toEventually(equal(0))
                }
            }

            context("when the response is correct") {
                beforeEach {
                    WebhoseStub.stubCorrectResponse()
                }
                it("has not empty post list") {
                    var posts: [WebhosePost]?
                    client.search(self.aQuery) { response in
                        posts = response.posts
                    }
                    expect(posts?.count).toEventually(equal(2))
                }
                it("has an uuid") {
                    var posts: [WebhosePost]?
                    client.search(self.aQuery) { response in
                        posts = response.posts
                    }
                    let expectedUUID = "7ac79ae99e3e9aa8acce5ce36ae34ed3443fc3d0"
                    expect(posts?.first?.uuid).toEventually(equal(expectedUUID))
                }
            }
        }
    }
}
