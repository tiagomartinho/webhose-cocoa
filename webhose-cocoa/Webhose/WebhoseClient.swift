class WebhoseClient {
    let key: String
    let service: Service

    init(key: String) {
        self.key = key
        self.service = AlamofireService()
    }

    func search(query: String, callback: (WebhoseResponse) -> Void) {
        let endpoint = WebhoseEndpoint.buildWithKey(key, AndQuery: query)
        service.get(endpoint) { data in
            callback(WebhoseResponse(data: data))
        }
    }
}
