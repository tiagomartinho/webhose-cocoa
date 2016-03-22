import SwiftyJSON

extension WebhosePost {
    init(json: JSON) {
        self.uuid = json["uuid"].string ?? ""
        self.url = json["url"].string ?? ""
    }
}

extension WebhosePost {
    static func collection(json: JSON) -> [WebhosePost] {
        return json.map { WebhosePost(json: $1) }
    }
}
