import Foundation

/*
 1단계: 요청 모델 구현
 */
// MARK: - SignupRequestDto

struct SignupRequestDto: Codable {
    var email: String
    var name: String
    var password: String
}


// MARK: - LoginRequestDto

struct LoginRequestDto: Codable {
    var email: String
    var password: String
}

