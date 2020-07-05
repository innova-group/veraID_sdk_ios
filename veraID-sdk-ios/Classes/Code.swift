import UIKit

public enum VeraIdError: Error {
    case authenticationFailed
    case userInfoRequestFailed
}

public typealias VeraIdUserRequestCompletion = (Result<[String: Any], VeraIdError>) -> Void

public protocol VeraIdDelegate: class {
    func veraIdAuhentication(result: Result<String, VeraIdError>)
}

@available(iOS 10.0, *)
public class VeraID {
    public static let shared = VeraID()
    public weak var delegate: VeraIdDelegate?
    public var partnerId: Int?
    
    private let baseUrl = "https://partner.myvera.id"
    private let appStoreLinkURL = URL(string: "https://apps.apple.com/app/id1474351717/")!
    
    private init() {}
    
    public func authenticate(requesting keys: [VeraIdParamKey]) {
        guard let partnerId = partnerId else {
            delegate?.veraIdAuhentication(result: .failure(.authenticationFailed))
            return
        }
        var urlString = "vera-id://authenticate?partnerId=\(partnerId)"
        for item in keys {
            urlString.append("&keys=\(item.rawValue)")
        }
        if let url = URL(string: urlString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.open(appStoreLinkURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    public func veraIdUser(token: String, apiVersion: String = "v1", completion: VeraIdUserRequestCompletion? = nil) {
        guard let partnerId = partnerId else {
            completion?(.failure(.userInfoRequestFailed))
            return
        }
        guard let url = URL(string: "\(baseUrl)/api/\(apiVersion)/partner/embed-data/?partner_id=\(partnerId)&uuid=\(token)") else {
            completion?(.failure(.userInfoRequestFailed))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data,
                let serialized = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
                let result = serialized as? [String: Any] {
                DispatchQueue.main.async {
                    completion?(.success(result))
                }
                return
            }
            DispatchQueue.main.async {
                completion?(.failure(.userInfoRequestFailed))
            }
        }.resume()
    }
    
    public func handle(url: URL) {
        guard let partnerId = partnerId else {
            delegate?.veraIdAuhentication(result: .failure(.authenticationFailed))
            return
        }
        guard let comps = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            delegate?.veraIdAuhentication(result: .failure(.authenticationFailed))
            return
        }
        guard let host = comps.host, host == "success" else {
            delegate?.veraIdAuhentication(result: .failure(.authenticationFailed))
            return
        }
        guard let scheme = comps.scheme, scheme == "vera-id-partner-\(partnerId)" else {
            delegate?.veraIdAuhentication(result: .failure(.authenticationFailed))
            return
        }
        guard let token = parameterValues(in: comps, param: "token")?.first else {
            delegate?.veraIdAuhentication(result: .failure(.authenticationFailed))
            return
        }
        delegate?.veraIdAuhentication(result: .success(token))
    }
    
    private func parameterValues(in comps: URLComponents, param: String) -> [String]? {
        return comps.queryItems?
            .filter { $0.name == param }
            .compactMap { $0.value }
    }
}
