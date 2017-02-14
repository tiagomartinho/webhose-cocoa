public protocol WebhoseClientDelegate: class {
    func didEndSearchWithResponse(_ response: WebhoseResponse)
}
