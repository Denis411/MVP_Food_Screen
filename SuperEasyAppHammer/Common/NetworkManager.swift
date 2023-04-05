import Foundation
import Alamofire

typealias NetworkParameters = [String:String]
typealias NetworkHeaders = [String:String]

extension NetworkHeaders {
    var toHTTPHeader: HTTPHeaders {
        return HTTPHeaders(self)
    }
}

protocol NetworkManager {
    func get<T: Codable>(of type: T.Type, url: String, parameters: NetworkParameters, headers: NetworkHeaders) async throws -> T
}

// No authorization added yet
final class NetworkManagerImp: NetworkManager {
//  use login and password if needed
    private let sessionAF: Session

    init() {
            let urlSessionConfig = URLSessionConfiguration.default

//          add trust evaluation if you have some problems with any website
            let evaluators: Dictionary<String, ServerTrustEvaluating> = [
                "www.website_under_sunctions.ru":
                    PinnedCertificatesTrustEvaluator(acceptSelfSignedCertificates: true),
            ]

            let serverTrustManager = ServerTrustManager(evaluators: evaluators)

            self.sessionAF = Session(
                configuration: urlSessionConfig,
                serverTrustManager: serverTrustManager)

    }

    func get<T: Codable>(of type: T.Type = T.self, url: String, parameters: NetworkParameters = [:], headers: NetworkHeaders = [:]) async throws -> T {
        return try await withUnsafeThrowingContinuation { continuation in
            let headers = HTTPHeaders(headers)
            sessionAF.request(url, method: .get, parameters: parameters, headers: headers)
//                .authenticate(username: login, password: password)
                .validate()
                .responseDecodable (of: T.self) { response in
                    if let value = response.value {
                        continuation.resume(returning: value)
                        return
                    }
                    if let error = response.error {
                        continuation.resume(throwing: error)
                        return
                    }
                }
        }
    }
}
