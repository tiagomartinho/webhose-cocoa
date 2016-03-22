@testable import Webhose
import Quick
import Nimble

class WebhoseThreadSpec: QuickSpec {

    let aKey = "aKey"
    let aQuery = "aQuery"

    override func spec() {
        describe("the Webhose Client") {
            let client = WebhoseClient(key: self.aKey)

            context("when the response is correct") {
                beforeEach {
                    WebhoseStub.stubCorrectResponse()
                }
                it("has an uuid") {
                    var thread: WebhoseThread?
                    client.search(self.aQuery) { response in
                        thread = response.posts.first?.thread
                    }
                    let expectedUUID = "7ac79ae99e3e9aa8acce5ce36ae34ed3443fc3d0"
                    expect(thread?.uuid).toEventually(equal(expectedUUID))
                }
                it("has a spam score") {
                    var thread: WebhoseThread?
                    client.search(self.aQuery) { response in
                        thread = response.posts[1].thread
                    }
                    let expectedSpamScore = 0.001
                    expect(thread?.spamScore).toEventually(equal(expectedSpamScore))
                }
            }
        }
    }
}
