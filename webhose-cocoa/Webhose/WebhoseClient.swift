public class WebhoseClient {

    let key: String
    let service: Service
    var delegate: WebhoseClientDelegate?

    public typealias WebhoseResponseCallback = (WebhoseResponse) -> Void

    public init(key: String) {
        self.key = key
        self.service = AlamofireService()
    }

    public func search(query: WebhoseQuery, callback: WebhoseResponseCallback? = nil) {
        let endpoint = WebhoseEndpoint.buildWithKey(key, AndQuery: query)
        service(endpoint, callback: callback)
    }

    public func search(query: String, callback: WebhoseResponseCallback? = nil) {
        let endpoint = WebhoseEndpoint.buildWithKey(key, AndQuery: query)
        service(endpoint, callback: callback)
    }

    public func more(response: WebhoseResponse, callback: WebhoseResponseCallback? = nil) {
        let endpoint = response.next
        service(endpoint, callback: callback)
    }

    private func service(endpoint: String, callback: WebhoseResponseCallback?) {
        service.get(endpoint) { [unowned self] data in
            let response = WebhoseResponse(data: data)
            self.delegate?.didEndSearchWithResponse(response)
            if let callback = callback {
                callback(response)
            }
        }
    }
}
