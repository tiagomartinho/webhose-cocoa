import Foundation

protocol Service {
    func get(_ url: String, callback: @escaping (Data?) -> Void)
}
