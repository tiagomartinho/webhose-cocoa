extension WebhoseQuery: CustomStringConvertible {
    var description: String {

        var description = ""

        if let terms = allTerms {
            if terms.count > 0 {
                description += "("
                for (index, term) in terms.enumerate() {
                    description += term
                    if index + 1 != terms.count {
                        description += " AND "
                    }
                }
                description += ")"
            }
        }

        if let exactTerm = exactTerm {
            description += "\"" + exactTerm + "\""
        }

        if let terms = oneOrMoreTerms {
            if terms.count > 0 {
                description += "("
                for (index, term) in terms.enumerate() {
                    description += term
                    if index + 1 != terms.count {
                        description += " OR "
                    }
                }
                description += ")"
            }
        }

        return description
    }
}