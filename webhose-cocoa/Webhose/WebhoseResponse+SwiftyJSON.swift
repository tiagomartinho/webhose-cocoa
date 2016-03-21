import SwiftyJSON

extension WebhoseResponse {
    init(data: NSData?) {
        let json = JSON(data: data ?? NSData())
        self.totalResults = json["totalResults"].int ?? 0
        self.next = json["next"].string ?? ""
        self.requestsLeft = json["requestsLeft"].int ?? 0
        self.moreResultsAvailable = json["moreResultsAvailable"].int ?? 0
    }
}
