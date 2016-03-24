extension WebhoseQuery: CustomStringConvertible {
    var description: String {
        var description = ""
        description += concatenate(allTerms, WithSeparator: "AND")
        description += concatenate(oneOrMoreTerms, WithSeparator: "OR")
        if let exactTerm = exactTerm {
            description += "\"" + exactTerm + "\""
        }
        if let excludeTerm = excludeTerm {
            description += "-" + excludeTerm
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
                result += ")"
            }
        }
        return result
    }
}
