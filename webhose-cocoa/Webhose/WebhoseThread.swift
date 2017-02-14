import Foundation

public struct WebhoseThread {
    public let uuid: String
    public let url: URL
    public let published: Date
    public let title: String
    public let titleFull: String
    public let sectionTitle: String
    public let site: String
    public let siteFull: String
    public let siteSection: String
    public let siteType: String
    public let repliesCount: Int
    public let participantsCount: Int
    public let country: String
    public let spamScore: Double
    public let mainImage: String
    public let performanceScore: Int
}
