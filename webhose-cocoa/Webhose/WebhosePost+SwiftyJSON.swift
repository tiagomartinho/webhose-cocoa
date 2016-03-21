import SwiftyJSON

extension WebhosePost {
    init(json: JSON) {
    }
}

extension WebhosePost {
    static func collection(json: JSON) -> [WebhosePost] {
        return json.map { WebhosePost(json: $1) }
    }
}
