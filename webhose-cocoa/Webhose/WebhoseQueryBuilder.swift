public class WebhoseQueryBuilder {
    public var allTerms: [String]?
    public var exactTerm: String?
    public var oneOrMoreTerms: [String]?
    public var excludeTerm: String?
    public var language: String?
    public var threadTitle: String?
    public var threadSectionTitle: String?
    public var threadCountry: String?
    public var site: String?
    public var siteType: SiteType?
    public var performanceScore: Int?
    public var timestamp: Double?

    public typealias BuilderClosure = (WebhoseQueryBuilder) -> ()

    public init(buildClosure: BuilderClosure) {
        buildClosure(self)
    }
}

public extension WebhoseQuery {
    public init(builder: WebhoseQueryBuilder) {
        self.allTerms = builder.allTerms
        self.exactTerm = builder.exactTerm
        self.oneOrMoreTerms = builder.oneOrMoreTerms
        self.excludeTerm = builder.excludeTerm
        self.language = builder.language
        self.threadTitle = builder.threadTitle
        self.threadSectionTitle = builder.threadSectionTitle
        self.threadCountry = builder.threadCountry
        self.site = builder.site
        self.performanceScore = builder.performanceScore
        self.siteType = builder.siteType
        self.timestamp = builder.timestamp
    }
}
