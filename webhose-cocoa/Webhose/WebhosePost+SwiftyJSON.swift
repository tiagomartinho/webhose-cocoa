import SwiftyJSON

extension WebhosePost {
    init(json: JSON) {
        self.uuid = json["uuid"].stringValue
        self.url = NSURL(string: json["url"].stringValue) ?? NSURL()
        self.orderInThread = json["ord_in_thread"].intValue
        self.author = json["author"].stringValue
        self.published = NSDate.dateFromString(json["published"].stringValue)
        self.title = json["title"].stringValue
        self.text = json["text"].stringValue
        self.highlightText = json["highlightText"].stringValue
        self.highlightTitle = json["highlightTitle"].stringValue
        self.language = json["language"].stringValue
        self.externalLinks = json["external_links"].arrayValue.map { $0.stringValue }
        self.persons = json["persons"].arrayValue.map { $0.stringValue }
        self.locations = json["locations"].arrayValue.map { $0.stringValue }
        self.organizations = json["organizations"].arrayValue.map { $0.stringValue }
        self.crawled = NSDate.dateFromString(json["crawled"].stringValue)
    }
}

extension WebhosePost {
    static func collection(json: JSON) -> [WebhosePost] {
        return json.map { WebhosePost(json: $1) }
    }
}
