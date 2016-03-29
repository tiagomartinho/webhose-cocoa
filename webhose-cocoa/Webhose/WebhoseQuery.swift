public struct WebhoseQuery {
    public let allTerms: [String]?
    public let exactTerm: String?
    public let oneOrMoreTerms: [String]?
    public let excludeTerm: String?
    public let language: String?
    public let threadTitle: String?
    public let threadSectionTitle: String?
    public let threadCountry: String?
    public let site: String?
    public var siteType: SiteType?
    public let performanceScore: Int?
    public let timestamp: Double?
}
