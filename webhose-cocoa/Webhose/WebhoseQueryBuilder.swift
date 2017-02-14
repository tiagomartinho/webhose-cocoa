open class WebhoseQueryBuilder {
    open var allTerms: [String]?
    open var exactTerm: String?
    open var oneOrMoreTerms: [String]?
    open var excludeTerm: String?
    open var language: String?
    open var threadTitle: String?
    open var threadSectionTitle: String?
    open var threadCountry: String?
    open var site: String?
    open var siteType: SiteType?
    open var performanceScore: Int?
    open var timestamp: Int?

    public typealias BuilderClosure = (WebhoseQueryBuilder) -> Void

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
