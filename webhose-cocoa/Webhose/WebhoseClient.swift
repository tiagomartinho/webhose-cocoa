open class WebhoseClient {

    open weak var delegate: WebhoseClientDelegate?

    public typealias WebhoseResponseCallback = (WebhoseResponse) -> Void

    let key: String
    let service: Service

    public init(key: String) {
        self.key = key
        self.service = AlamofireService()
    }

    open func search(_ query: WebhoseQuery, callback: WebhoseResponseCallback? = nil) {
        let endpoint = WebhoseEndpoint.buildWithKey(key, AndQuery: query)
        service(endpoint, callback: callback)
    }

    open func search(_ query: String, callback: WebhoseResponseCallback? = nil) {
        let endpoint = WebhoseEndpoint.buildWithKey(key, AndQuery: query)
        service(endpoint, callback: callback)
    }

    open func more(_ response: WebhoseResponse, callback: WebhoseResponseCallback? = nil) {
        let endpoint = response.next
        service(endpoint, callback: callback)
    }

    fileprivate func service(_ endpoint: String, callback: WebhoseResponseCallback?) {
        service.get(endpoint) { [unowned self] data in
            guard let data = data else { return }
            let response = WebhoseResponse(data: data)
            self.delegate?.didEndSearchWithResponse(response)
            if let callback = callback {
                callback(response)
            }
        }
    }
}
