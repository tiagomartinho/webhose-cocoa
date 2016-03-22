struct WebhosePost {
    let uuid: String
    let url: NSURL
    let orderInThread: Int
    let author: String
    let published: NSDate
    let title: String
    let text: String
    let highlightText: String
    let highlightTitle: String
    let language: String
    let externalLinks: [String]
    let persons: [String]
    let locations: [String]
    let organizations: [String]
    let crawled: NSDate
}
