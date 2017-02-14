import Foundation

extension Date {
    static func dateFromString(_ date: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter.date(from: date) ?? Date()
    }
}
