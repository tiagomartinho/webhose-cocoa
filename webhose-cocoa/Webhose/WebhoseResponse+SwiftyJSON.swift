import SwiftyJSON

extension WebhoseResponse {
    init(data: NSData?) {
        let json = JSON(data: data ?? NSData())
        self.totalResults = json["totalResults"].int ?? 0
    }
}
