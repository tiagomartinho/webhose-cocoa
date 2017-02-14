class WebhoseEndpoint {
    static let endpoint = "https://webhose.io"

    static func buildWithKey(_ key: String, AndQuery query: String) -> String {
        return WebhoseEndpoint.endpoint + "/search?token=" + key + "&format=json&q=" + query
    }

    static func buildWithKey(_ key: String, AndQuery query: WebhoseQuery) -> String {
        let q = "\(query)"
        let eq = q.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        return buildWithKey(key, AndQuery: eq ?? "")
    }

    static func buildWithKey(_ key: String, AndNext next: String) -> String {
        return WebhoseEndpoint.endpoint + next
    }
}
