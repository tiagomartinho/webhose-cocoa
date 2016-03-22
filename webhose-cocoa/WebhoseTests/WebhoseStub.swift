import OHHTTPStubs

class WebhoseStub {

    static let webhose = "webhose.io"

    class func stubIncorrectResponse() {
        stub(isHost(self.webhose)) { _ in
            return fixture("", status: 500,
                           headers: ["Content-Type":"application/json"])
        }
    }

    class func stubCorrectResponse() {
        stub(isHost(self.webhose)) { _ in
            let stubPath = OHPathForFile("Response.json", self)
            return fixture(stubPath!, headers: ["Content-Type":"application/json"])
        }
    }
}
