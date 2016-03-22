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
                    var post: WebhosePost?
                    client.search(self.aQuery) { response in
                        post = response.posts.first
                    }
                    let expectedUUID = "7ac79ae99e3e9aa8acce5ce36ae34ed3443fc3d0"
                    expect(post?.uuid).toEventually(equal(expectedUUID))
                }
                it("has an uuid") {
                    var post: WebhosePost?
                    client.search(self.aQuery) { response in
                        post = response.posts.first
                    }
                    let expectedURL = "http://omgili.com/r/"
                    expect(post?.url).toEventually(equal(expectedURL))
                }
            }
        }
    }
}
