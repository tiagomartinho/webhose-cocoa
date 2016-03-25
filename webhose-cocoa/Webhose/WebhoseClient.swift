public class WebhoseClient {

    let key: String
    let service: Service

    public typealias WebhoseResponseCallback = (WebhoseResponse) -> Void

    public init(key: String) {
        self.key = key
        self.service = AlamofireService()
    }

    public func search(query: WebhoseQuery, callback: WebhoseResponseCallback) {
        let endpoint = WebhoseEndpoint.buildWithKey(key, AndQuery: query)
        service(endpoint, callback: callback)
    }

    public func search(query: String, callback: WebhoseResponseCallback) {
        let endpoint = WebhoseEndpoint.buildWithKey(key, AndQuery: query)
        service(endpoint, callback: callback)
    }

    public func more(response: WebhoseResponse, callback: WebhoseResponseCallback) {
        let endpoint = response.next
        service(endpoint, callback: callback)
    }

    private func service(endpoint: String, callback: WebhoseResponseCallback) {
        service.get(endpoint) { data in
            callback(WebhoseResponse(data: data))
        }
    }
}
