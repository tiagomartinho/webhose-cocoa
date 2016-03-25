public struct WebhoseResponse {
    public let totalResults: Int
    public let next: String
    public let requestsLeft: Int
    public let moreResultsAvailable: Int
    public let posts: [WebhosePost]
}
