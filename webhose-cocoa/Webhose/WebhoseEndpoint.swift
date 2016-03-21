class WebhoseEndpoint {
    static let endpoint = "https://webhose.io"

    static func buildWithKey(key: String, AndQuery query: String) -> String {
        return WebhoseEndpoint.endpoint + "/search?token=" + key + "&format=json&q=" + query
    }

    static func buildWithKey(key: String, AndNext next: String) -> String {
        return WebhoseEndpoint.endpoint + next
    }
}
