# 1. 화면 전환

## i) Modal
> 새로운 창이 밑에서 위로 나타나는 방식
**전체 로직의 흐름과 무관하지만, 특정 목적을 수행하기 위한 화면을 불러올 때 사용**
ex) 카카오톡의 친구 리스트에서 선택했을때 프로필이 올라오는 방식
- present로 새로운 창으로 들어가고, dismiss로 원래 창으로 빠져나온다.

#### 예시코드
> #### 1. @objc
**Swift를 사용한 코드를 Objective-C 코드와 상호작용 시키기 위한 키워드**
Swift를 사용한 코드에서 class나 method에 이 키워드를 붙이면 Objective-C와 Swift 코드에서 사용할 수 있게된다.
#### 2. #selector
Objective-C의 유산으로, 함수를 직접 지정해서 실행할 때 사용하며, 컴파일 시가 아닌 런타임에서 함수가 실행되는 동적 바인딩 형태를 가진다.
**@objc와 #selector는 짝꿍짝꿍짝짝꿍**
#### 3. addTarget(_:action:for:)
controlEvent가 수행되었을 때, 실행 주체인 target과 함수를 연결해주는 함수

```
# FirstViewController.swift
private func presentToSecondVC() {
    let secondVC = SecondViewController() // 이동할 ViewController 등록
    secondVC.modalPresentationStyle = .formSheet // modal 이동 스타일 결정
    self.present(secondVC, animated: true, completion: nil) // 모달방식으로 이동
}

@objc
private func touchupNextButton() {
	presentToSecondVC()
}

private let nextButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 80, y: 350, width: 250, height: 42))
        button.setTitle("다음으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        
        button.addTarget(self, action: #selector(touchupNextButton), for: .touchUpInside) // 여기에 함수를 등록한다..
        
        return button 
    }()
```

## ii) Navigation
> 화면의 좌우 전환 방식
**전체 로직의 흐름과 관계있는 화면을 불러올 때 사용**
ex) 카카오톡 채팅 리스트에서 선택했을 때, 채팅창이 나타나는 방식

### UINavigationController
> 뷰 사이에 계층구조를 탐색하게 해주는 스택 형태의 Container View Controller
- UIViewController를 담을 수 있으며, 자식 뷰를 Stackdㅡ로 관리한다.
- 위쪽 영역의 NavigationBar와 아래쪽 영역의 UIViewController를 모두 담고 있다.
![](https://velog.velcdn.com/images/hello_hidi/post/5030fbcd-a47a-4025-8908-24554e85017d/image.jpeg)


#### 예시코드
```
private func pushToSecondVC() {
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
```

### dismiss와 pop 예시코드
```
@objc
    private func touchupBackButton() {
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil) // present이면 dismiss
        }
        else {
            self.navigationController?.popViewController(animated: true) // push면 pop
        }
    }

private let backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 150, y: 260, width: 80, height: 30))
        button.setTitle("뒤로가기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        
        button.addTarget(self, action: #selector(touchupBackButton), for: .touchUpInside)
        
        return button
    }()

```
#### modal 실행결과
![업로드중..](blob:https://velog.io/c2d1dc6d-1ada-45f9-a7f7-dedcc17df76b)

#### nagivation 실행결과
![업로드중..](blob:https://velog.io/a5e12f0a-63e2-4770-afa2-8b7acb962e80)




# 2. 데이터 전달
## i) 옵셔널 바인딩
>  옵셔널을 안전하게 처리하는 방법
옵셔널 값은 랩에 쌓여 있어서, 사용하기 위해서는 unwrapping하는 과정이 필요하다.

### if let _ = _ _{}
> - if의 결과가 true 일 때 뿐만 아니라 false 일 때도 처리해줄 수 있다.
- 하지만 {} 밖에서는 사용할 수 없다

### guard let _ else {return}
> - else에 대한 처리를 하지 못함
- guard문 밖에서도 사용 가능하다.

#### 예시코드
```
private func optionalBind() { 
	if let xx = x{
    	print(xx)
    } else {
    	pinrt("error" //else값 표시가능
    }
    print(xx) // 실행안됨
}

private func guardBind() {
	guard let xx = x else {return} //else값 표시 못함
    print(xx) // guard문 밖에서 사용 가능
}
    
```

## ii) 프로퍼티 접근해서 데이터 넘기기
> 프로퍼티: 클래스/구조체/열거형에 연관되어 있는 값(변수,상수)등
다양한 방식이 있지만 우리는 일단 프로퍼티 접근을 통해 데이터를 넘기는 법을 배워보겠다!


![](https://velog.velcdn.com/images/hello_hidi/post/3fc32946-3499-4174-8ddf-d18b283ca4b9/image.jpeg)

### 코드설명
> #### 1) var result: String?
: 이전화면에서 전달되는 값을 받기 위해 프로퍼티를 추가한다.
#### 2),3) func dataBind()
: guard를 활용하여 옵셔널 바인딩을 한 데이터를 안전하게 값을 꺼낸 뒤 resultLabel.text의 값을 변경해준다.
#### 4),5) func dataBind(result:String)
: 2),3)과 비슷한 방식이지만 argument를 넣어서 만드는 방법이다. (뭔가 말로 확실히 설명을 못하겠다.)

#### 실행결과
![](https://velog.velcdn.com/images/hello_hidi/post/364943d3-a673-4bd2-b0ee-81c5831ee6dc/image.jpeg)





