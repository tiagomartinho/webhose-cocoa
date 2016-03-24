class WebhoseQueryBuilder {
    var allTerms: [String]?
    var exactTerm: String?
    var oneOrMoreTerms: [String]?
    var excludeTerm: String?
    var language: String?
    var threadTitle: String?
    var threadSectionTitle: String?
    var threadCountry: String?
    var site: String?

    typealias BuilderClosure = (WebhoseQueryBuilder) -> ()

    init(buildClosure: BuilderClosure) {
        buildClosure(self)
    }
}

extension WebhoseQuery {
    init(builder: WebhoseQueryBuilder) {
        self.allTerms = builder.allTerms
        self.exactTerm = builder.exactTerm
        self.oneOrMoreTerms = builder.oneOrMoreTerms
        self.excludeTerm = builder.excludeTerm
        self.language = builder.language
        self.threadTitle = builder.threadTitle
        self.threadSectionTitle = builder.threadSectionTitle
        self.threadCountry = builder.threadCountry
        self.site = builder.site
    }
}
