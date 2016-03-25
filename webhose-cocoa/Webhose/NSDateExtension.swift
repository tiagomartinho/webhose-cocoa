import Foundation

extension NSDate {
    static func dateFromString(date: String) -> NSDate {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter.dateFromString(date) ?? NSDate()
    }
}
