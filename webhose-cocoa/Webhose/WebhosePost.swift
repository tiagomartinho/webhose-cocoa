import Foundation

public struct WebhosePost {
    public let uuid: String
    public let url: NSURL
    public let published: NSDate
    public let title: String
    public let orderInThread: Int
    public let author: String
    public let text: String
    public let highlightText: String
    public let highlightTitle: String
    public let language: String
    public let externalLinks: [String]
    public let persons: [String]
    public let locations: [String]
    public let organizations: [String]
    public let crawled: NSDate
    public let thread: WebhoseThread
}
