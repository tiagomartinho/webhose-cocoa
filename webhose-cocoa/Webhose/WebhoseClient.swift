class WebhoseClient {
    typealias WebhoseResponseCallback = (WebhoseResponse) -> Void

    let key: String
    let service: Service

    init(key: String) {
        self.key = key
        self.service = AlamofireService()
    }

    func search(query: WebhoseQuery, callback: WebhoseResponseCallback) {
        let endpoint = WebhoseEndpoint.buildWithKey(key, AndQuery: query)
        service(endpoint, callback: callback)
    }

    func search(query: String, callback: WebhoseResponseCallback) {
        let endpoint = WebhoseEndpoint.buildWithKey(key, AndQuery: query)
        service(endpoint, callback: callback)
    }

    func more(response: WebhoseResponse, callback: WebhoseResponseCallback) {
        let endpoint = response.next
        service(endpoint, callback: callback)
    }

    private func service(endpoint: String, callback: WebhoseResponseCallback) {
        service.get(endpoint) { data in
            callback(WebhoseResponse(data: data))
        }
    }
}
