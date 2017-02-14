import SwiftyJSON

extension WebhosePost {
    init(json: JSON) {
        self.uuid = json["uuid"].stringValue
        self.url = URL(string: json["url"].stringValue)!
        self.published = Date.dateFromString(json["published"].stringValue)
        self.title = json["title"].stringValue
        self.orderInThread = json["ord_in_thread"].intValue
        self.author = json["author"].stringValue
        self.text = json["text"].stringValue
        self.highlightText = json["highlightText"].stringValue
        self.highlightTitle = json["highlightTitle"].stringValue
        self.language = json["language"].stringValue
        self.externalLinks = json["external_links"].arrayValue.map { $0.stringValue }
        self.persons = json["persons"].arrayValue.map { $0.stringValue }
        self.locations = json["locations"].arrayValue.map { $0.stringValue }
        self.organizations = json["organizations"].arrayValue.map { $0.stringValue }
        self.crawled = Date.dateFromString(json["crawled"].stringValue)
        self.thread = WebhoseThread(json: json["thread"])
    }
}

extension WebhosePost {
    static func collection(_ json: JSON) -> [WebhosePost] {
        return json.map { WebhosePost(json: $1) }
    }
}
