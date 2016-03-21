struct WebhoseResponse {
    let totalResults: Int
    let next: String
    let requestsLeft: Int
    let moreResultsAvailable: Int
    let posts: [WebhosePost]
}
