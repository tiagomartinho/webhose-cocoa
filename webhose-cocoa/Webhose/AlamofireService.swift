import Alamofire

class AlamofireService: Service {

    func get(_ url: String, callback: @escaping (Data?) -> Void) {
        Alamofire.request(url, method: .get)
            .validate()
            .responseJSON { callback($0.data) }
    }
}
