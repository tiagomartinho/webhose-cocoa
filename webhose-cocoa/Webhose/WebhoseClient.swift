class WebhoseClient {
    let key: String
    let service: Service

    init(key: String) {
        self.key = key
        self.service = AlamofireService()
    }

    func search(query: String, callback: (WebhoseResponse) -> Void) {
        service.get("https://webhose.io/") { data in
            callback(WebhoseResponse(data: data))
        }
    }
}
