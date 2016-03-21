class WebhoseClient {
    let key: String

    init(key: String) {
        self.key = key
    }

    func search(query: String) -> WebhoseResponse {
        return WebhoseResponse(posts: [WebhosePost]())
    }
}
