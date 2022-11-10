import Foundation
import UIKit

import Moya
/*
회원가입 [POST] http://3.39.169.52:3000 / user/ signup
 case  method /     baseUrl          / path
 */
enum UserRouter {
    case signup(param: SignupRequestDto) // 회원가입 요청 모델
    case login(param: LoginRequestDto) // 로그인 요청 모델
}

extension UserRouter: TargetType {
    
    // baseURL
    var baseURL: URL {
        return URL(string: Environment.baseURL)!
    }
    
    // path
    var path: String {
        switch self {
        case .signup(param: _):
            return "/user/signup"
            
        case .login(param: _):
            return "/user/signin"
        }
    }
    
    // method
    var method: Moya.Method {
        switch self {
        case .signup(param: _):
            return .post
            
        case .login(param: _):
            return .post
        }
    }
    
    // 해야할 일
    var task: Task {
        switch self {
        case .signup(param: let param):
            
            return .requestParameters(parameters: try! param.asParameter(), encoding: JSONEncoding.default)
            
        case .login(param: let param):
            return .requestParameters(parameters: try! param.asParameter(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}



/*
 import Foundation

 /// Represents an HTTP task.
 public enum Task {

     /// A request with no additional data.
     case requestPlain

     /// A requests body set with data.
     case requestData(Data)

     /// A request body set with `Encodable` type
     case requestJSONEncodable(Encodable)

     /// A request body set with `Encodable` type and custom encoder
     case requestCustomJSONEncodable(Encodable, encoder: JSONEncoder)

     /// A requests body set with encoded parameters.
     case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)

     /// A requests body set with data, combined with url parameters.
     case requestCompositeData(bodyData: Data, urlParameters: [String: Any])

     /// A requests body set with encoded parameters combined with url parameters.
     case requestCompositeParameters(bodyParameters: [String: Any], bodyEncoding: ParameterEncoding, urlParameters: [String: Any])

     /// A file upload task.
     case uploadFile(URL)

     /// A "multipart/form-data" upload task.
     case uploadMultipart([MultipartFormData])

     /// A "multipart/form-data" upload task  combined with url parameters.
     case uploadCompositeMultipart([MultipartFormData], urlParameters: [String: Any])

     /// A file download task to a destination.
     case downloadDestination(DownloadDestination)

     /// A file download task to a destination with extra parameters using the given encoding.
     case downloadParameters(parameters: [String: Any], encoding: ParameterEncoding, destination: DownloadDestination)
 }*/
