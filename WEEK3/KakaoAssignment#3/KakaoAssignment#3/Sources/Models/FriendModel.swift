import Foundation
import UIKit

struct FriendModel {
    let name : String?
    let profileMessage : String?
    let profileImage : String?
    let sendTime : String?
    
}

var friendDummyData: [FriendModel] = [
    FriendModel(name: "나쟈냐", profileMessage: "오킹", profileImage: "profileImg", sendTime: ""),
    FriendModel(name: "김솝트", profileMessage: "햄볶아요", profileImage: "Image", sendTime: ""),
    FriendModel(name: "안솝트", profileMessage: "귀여아요", profileImage: "Image 1", sendTime: ""),
    FriendModel(name: "최솝트", profileMessage: "킹받아요", profileImage: "Image 2", sendTime: ""),
    FriendModel(name: "정솝트", profileMessage: "들어아요", profileImage: "Image 3", sendTime: ""),
    FriendModel(name: "강솝트", profileMessage: "작아요", profileImage: "Image 4", sendTime: ""),
    FriendModel(name: "오솝트", profileMessage: "자가용", profileImage: "Image 5", sendTime: ""),
    FriendModel(name: "황솝트", profileMessage: "암요암요", profileImage: "Image 6", sendTime: ""),
    FriendModel(name: "최솝트", profileMessage: "힘내봐아요", profileImage: "Image 7", sendTime: ""),
    FriendModel(name: "고솝트", profileMessage: "잘지내봐요", profileImage: "Image 7", sendTime: ""),
    FriendModel(name: "류솝트", profileMessage: "보고파요", profileImage: "Image 7", sendTime: ""),
    FriendModel(name: "성솝트", profileMessage: "난 이제 지쳤어요 땡벌땡벌", profileImage: "Image 7", sendTime: ""),
    FriendModel(name: "진솝트", profileMessage: "월클되아요", profileImage: "Image 7", sendTime: ""),

]

let chatDummyData: [FriendModel] = [
    FriendModel(name: "김솝트", profileMessage: "햄볶아요", profileImage: "Image", sendTime: "오후 9:41"),
    FriendModel(name: "안솝트", profileMessage: "귀여아요", profileImage: "Image 1", sendTime: "오후 9:41"),
    FriendModel(name: "최솝트", profileMessage: "킹받아요", profileImage: "Image 2", sendTime: "오후 9:41"),
    FriendModel(name: "황솝트", profileMessage: "들어아요", profileImage: "Image 3", sendTime: "오후 9:41"),
    FriendModel(name: "장솝트", profileMessage: "작아요", profileImage: "Image 4", sendTime: "오후 9:41"),
    FriendModel(name: "류솝트", profileMessage: "자가용", profileImage: "Image 5", sendTime: "오후 9:41"),
    FriendModel(name: "성솝트", profileMessage: "암요암요", profileImage: "Image 6", sendTime: "오후 9:41"),
    FriendModel(name: "진솝트", profileMessage: "힘내봐아요", profileImage: "Image 7", sendTime: "오후 9:41"),
    FriendModel(name: "정솝트", profileMessage: "잘지내봐요", profileImage: "Image 7", sendTime: "오후 9:41"),
    FriendModel(name: "남궁솝트", profileMessage:  "보고파요", profileImage: "Image", sendTime: "오후 9:41"),
    FriendModel(name: "행복솝트", profileMessage: "난 이제 지쳤어요 땡벌땡벌",profileImage: "Image", sendTime: "오후 9:41"),
    FriendModel(name: "안녕솝트", profileMessage: "상태메세지는 여기에", profileImage: "Image 1", sendTime: "오후 9:41")
]
