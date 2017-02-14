import SwiftyJSON

extension WebhoseResponse {
    init(data: Data) {
        let json = JSON(data: data)
        self.init(json: json)
    }

    init(json: JSON) {
        self.totalResults = json["totalResults"].int ?? 0
        self.next = json["next"].string ?? ""
        self.requestsLeft = json["requestsLeft"].int ?? 0
        self.moreResultsAvailable = json["moreResultsAvailable"].int ?? 0
        self.posts = WebhosePost.collection(json["posts"])
    }
}
