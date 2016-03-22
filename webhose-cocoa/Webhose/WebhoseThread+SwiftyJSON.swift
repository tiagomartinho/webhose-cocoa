import SwiftyJSON

extension WebhoseThread {
    init(json: JSON) {
        self.uuid = json["uuid"].stringValue
        self.url = NSURL(string: json["url"].stringValue) ?? NSURL()
        self.published = NSDate.dateFromString(json["published"].stringValue)
        self.title = json["title"].stringValue
    }
}
