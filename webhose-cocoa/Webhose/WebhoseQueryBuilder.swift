class WebhoseQueryBuilder {
    var allTerms: [String]?
    var exactTerm: String?
    var oneOrMoreTerms: [String]?
    var excludeTerm: String?

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
    }
}
