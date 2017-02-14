import SwiftyJSON

extension WebhoseThread {
    init(json: JSON) {
        self.uuid = json["uuid"].stringValue
        self.url = URL(string: json["url"].stringValue)!
        self.published = Date.dateFromString(json["published"].stringValue)
        self.title = json["title"].stringValue
        self.titleFull = json["title_full"].stringValue
        self.sectionTitle = json["section_title"].stringValue
        self.site = json["site"].stringValue
        self.siteFull = json["site_full"].stringValue
        self.siteSection = json["site_section"].stringValue
        self.siteType = json["site_type"].stringValue
        self.repliesCount = json["replies_count"].intValue
        self.participantsCount = json["participants_count"].intValue
        self.country = json["country"].stringValue
        self.spamScore = json["spam_score"].doubleValue
        self.mainImage = json["main_image"].stringValue
        self.performanceScore = json["performance_score"].intValue
    }
}
