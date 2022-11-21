import Foundation

/*
 1단계: 응답 모델 구현
 */


// MARK: - LoginResponseDto
struct LoginResponseDto: Codable {
    let status: Int
    let message: String
    let result: Results?
}

// Moya의 Result와 충돌이 나기 때문에 뒤에 s 하나만 붙여주세요!
// MARK: - Resultss
struct Results: Codable {
    let id: Int
    let name: String
    let profileImage, bio: String?
    let email, password: String
}
