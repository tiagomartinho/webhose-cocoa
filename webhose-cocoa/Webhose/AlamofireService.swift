import Alamofire

class AlamofireService: Service {
    func get(url: String, callback: NSData? -> Void) {
        Alamofire.request(.GET, url)
            .validate()
            .responseJSON { callback($0.data) }
    }
}
