extension WebhoseQuery: CustomStringConvertible {
    public var description: String {
        var description = ""
        description += concatenate(allTerms, WithSeparator: "AND")
        description += concatenate(oneOrMoreTerms, WithSeparator: "OR")
        if let exactTerm = exactTerm {
            description += "\"" + exactTerm + "\" "
        }
        if let excludeTerm = excludeTerm {
            description += "-" + excludeTerm + " "
        }
        if let language = language {
            description += "language:(" + language + ") "
        }
        if let threadTitle = threadTitle {
            description += "thread.title:(" + threadTitle + ") "
        }
        if let threadSectionTitle = threadSectionTitle {
            description += "thread.section_title:(" + threadSectionTitle + ") "
        }
        if let threadCountry = threadCountry {
            description += "thread.country:" + threadCountry + " "
        }
        if let site = site {
            description += "site:" + site + " "
        }
        if let siteType = siteType {
            description += "site_type:" + siteType.rawValue + " "
        }
        if let performanceScore = performanceScore {
            description += "performance_score:>" + "\(performanceScore)" + " "
        }
        return description
    }

    private func concatenate(terms: [String]?, WithSeparator separator: String) -> String {
        var result = ""
        if let terms = terms {
            if terms.count > 0 {
                result += "("
                for (index, term) in terms.enumerate() {
                    result += term
                    if index + 1 != terms.count {
                        result += " " + separator + " "
                    }
                }
                result += ") "
            }
        }
        return result
    }
}
