import Foundation

protocol Service {
    func get(url: String, callback: NSData? -> Void)
}
