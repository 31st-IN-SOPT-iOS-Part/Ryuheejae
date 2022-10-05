# 1) iOS & Xcode
## i) iOS
> iOS란 애플의 모바일 운영체제를 말한다. 현재 개발하려고 하는 iOS는 2008년 iOS SDK가 공개되면서 가능해졌고, 이때부터 개발자들의 적극적인 참여가 이루어지면서 현재 애플의 생태계까 구축되었다. 

## ii) Xcode
> Mac X OS, iOS를 위한 IDE이며, iOS 개발을 위한 필수적인 개발 도구.
iOS 뿐만 아니라, MacOS, WatchOS 등등 많은 응용 소프트웨어의 개발이 가능하다!


## iii) Xcode의 UI 및 구성

### 1.*.Swift
> Swift Class 파일로 앱의 소스 코드를 구성한다. 

### 2. ViewController.swift
> 화면(View)에서 처리하는 여러 작업들을 하기 위해 구현한 소스코드를 담고 있는 Class File
= > 일반적으로 화면의 개수 만큼의 ViewController 파일이 생성된다.

### 3. SceneDelegate.swift & AppDelegate.swift
> 앱 전체의 생명주기를 관리하는 Class File
생명주기 : 어떤 객체가 생겨나서 폐기될 때 까지의 기간 혹은 Cycle

### 4. *.Storyboard
> UI를 종합적으로 구현할 때, 앱의 흐름을 나타내며 시각적으로 화면을 구성하는 곳





# 2) View의 위치와 크기

## i) CGRect
> 사각형의 위치와 크기를 포함하는 구조체, origin과 size를 가지고 있다.
**즉, 원점에서 위치에서 넓이와 높이만큼 그려지는 사각형이다.**

### CGPoint & CGSize
**origin**: 원점을 나타내며 **CGPoint(minX,minY)** 즉, 왼쪽 상단을 말한다.
**size**: 넓이와 높이를 포함한 크기로 **CGSize(width,height)**로 나타낸다.

### 예시코드

```
import UIKit

class Rec : UIViewController {
    
    private let view1:UIView = {
        let first = UIView(frame: CGRect(x: 50, y: 100, width: 300, height: 500))
        first.backgroundColor = .green
        return first
    }()
    
    
    private let view2: UIView = {
        let second = UIView(frame: CGRect(x:72, y: 130, width: 200, height: 400))
        second.backgroundColor = .red
        return second
    }()
    
    private let view3: UIView = {
        let third = UIView(frame: CGRect(x: 98, y: 160, width: 150, height:150))
        third.backgroundColor = .yellow
        return third
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        
        
    }
}


```
### 실행 결과 
<center><img src="https://velog.velcdn.com/images/hello_hidi/post/214f826a-0dd2-4e92-9a19-54e885d59cc2/image.png" width = "50%" height = "50%"></center>

## ii) Frame
> SuperView(상위뷰)의 좌표시스템 안에서 View의 위치와 크기
SuperView: 바로 한 단계 앞의 상위뷰를 뜻한다.

### 예시코드
```
import UIKit

class Rec : UIViewController {
    
    private let view1:UIView = {
        let first = UIView(frame: CGRect(x: 50, y: 100, width: 300, height: 500))
        first.backgroundColor = .green
        return first
    }()
    
    
    private let view2: UIView = { --- 1)
        let second = UIView(frame: CGRect(x:22, y: 30, width: 200, height: 400))
        second.backgroundColor = .red
        return second
    }()
    
    private let view3: UIView = {
        let third = UIView(frame: CGRect(x: 26, y: 106, width: 150, height:150))
        third.backgroundColor = .yellow
        return third
    }()
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        view.addSubview(view1)
        view1.addSubview(view2) --- 2)
        view2.addSubview(view3)
        
        
    }
}


```

### 코드 설명
위에 코드를 실행하면 CGRECT와 같은 결과화면을 얻을 수 있다. 하지만 파라미터의 값이 다르다. 왜 이럴까? 이것은 Frame의 SuperView의 차이때문이다.

2)part를 보면 view2의 SuperView가 view1이라는 것을 알 수 있다.
즉. view1의 origin이 view2의 (0,0)이 되는 것이다. 그렇기에 1)코드의 view2의 x,y값은 이전 (72,130)에서 view1의 origin(50,100)을 뺀 (22,30)으로 설정해야 CGRect 예시 코드와 같은 결과창을 도출 할 수 있다.

## iii) Bounds
> View의 위치와 크기를 자신만의 좌표 시스템 안에서 나타낸다
즉 자신의 origin이 무조건 (0,0)이라고 생각하는 것.

#### 코드 설명 
```
print(view1.frame.origin.x,view1.frame.origin.y)
print(view1.bounds.origin.x,view1.bounds.origin.y)
```

#### 실행결과
<img src="https://velog.velcdn.com/images/hello_hidi/post/e06b507d-0000-49b3-a0b2-a9acc3af05fe/image.png">


### Q. 그럼  bounds.origin(98,157)로 바꾸면?
<center><img src="https://velog.velcdn.com/images/hello_hidi/post/ac6f9668-d58a-4af9-9757-477e27545880/image.png"width = "50%" height = "50%"></center>

View2의 screen의 위치가 옮겨진 것을 볼 수 있다. 왜 이런 현상이 일어날까?

### frame이 움직인 게 아니라 viewport가 움직인 것이다.
> viewport: 화면이 보여지는 창
bounds의 origin을 움직인다는 것은 내 View의 viewport 좌표를 움직인다는 것. 
즉, 내 View에 Sub View 어디를 담을지 움직이는 것이다.

i) 각 View는 View size만큼 viewport를 가지며
ii) 자기 자신은 가만히 있고, Sub View들이 반대 좌표로 이동하는 것처럼 보이게 됨
iii) 사실은 Sub View들이 반대 좌표로 가는 게 아니라, View가 Sub View를 바라보는 시점(viewport)이 달라진 것

자세한 설명은 <a href="https://babbab2.tistory.com/45">여기를</a> 참고해주세요. 정말 정리가 잘 되어 있더라고요!



# 3. ![](https://velog.velcdn.com/images/hello_hidi/post/fc3df3ba-eeab-436d-84a5-fcb81bb7b649/image.jpg)
 생명주기
![](https://velog.velcdn.com/images/hello_hidi/post/055bb019-5599-4b5b-a28f-ff26e1e67182/image.png)
### i) viewDidLoad
> - 뷰의 로딩이 완료 되었을 때 시스템에 의해 자동으로 호출되기 때문에 일반적으로 리소스를 초기화하거나 초기 화면을 구성하는 용도로 사용됨
- 화면이 처음 만들어질 때 한 번만 실행되므로, 
처음 한 번만 실행해야하는 초기화 코드가 있을 경우 이 메소드 내부에 작성하면 됩니다. 

### ii) viewWillAppear
> - 뷰가 이제 나타날 거라는 신호를 컨트롤러에게 알리는 역할
- 즉 뷰가 나타나기 직전에 호출된다고 볼 수 있어요. 
- 얼핏 보면 viewDidLoad랑 비슷해보이지만 viewDidLoad는 화면이 처음 만들어질 때 한번만 실행됨으로, 다른 화면을 갔다가 돌아오는 경우 등의 상황에서는 viewWillAppear을 활용하여 초기화하는 것이 좋다.

### iii) viewDidAppear
>  - 뷰가 나타났다는 것을 컨트롤러에게 알리는 역할
- 또한 화면에 적용될 애니메이션을 그려주는데 이 viewDidAppear는 뷰가 화면에 나타난 직후에 실행됩니다. 


### iv) viewWillDisappear
> - 뷰가 사라지기 직전에 호출되는 역할
- 뷰가 삭제 되려고하고있는 것을 뷰 콘트롤러에 통지한다. 


### v) viewDidDisappear
> - 뷰 컨트롤러가 뷰가 제거되었음을 알려주는 역할

+) loadView는 컨트롤러가 관리하는 뷰를 '만드는' 역할을 합니다. 그럼 loadView가 뷰를 만들고, 메모리에 올린 후에!viewDidLoad가 호출된다고 할 수 있겠죠?




# 4. UI Component
## i) UIViewController
> -  기본적인 데이터의 변화에 대한 응답으로 **뷰들의 내용을 업데이트**
- 뷰에 대한 **유저의 상호작용에 응답**
- 전체적인 인터페이스의 **레이아웃을 관리하고 뷰의 사이즈를 재조정**
- 앱에서 ViewController 등의 **다른 객체들과 상호작용**

## ii) UIView
> - iOS 앱의 UI를 구성하는 기본 구성 요소
- 직사각형의 영역 안에서 UIKit이나 Core Graphics를 사용하여 **내용을 그림**
- 0개 이상의 **SubView를 가지며, SubView의 레이아웃을 관리**
- UIResponder의 Subclass로서 touch 등의 여러 event에 반응하여 **Event Handling**을 하는 녀석
**=> 여러 UI객체를 담을 수 있는 일종의 바구니 같은 역할**

## iii) Other UI Components

### <a href="https://developer.apple.com/documentation/uikit/uilabel">UILabel</a>
>-  정보가 담겨있는 텍스트를 보여주는 하나 혹은 그 이상의 줄로 구성된 뷰
- 사용자가 Label을 편집하여 바꿀 수 없음
- 우리가 보는 대부분의 짧은 텍스트들은 UILabel

### <a href="https://developer.apple.com/documentation/uikit/uibutton">UIButton</a>
> - 유저 인터렉션에 반응하여 우리가 구현하는 Custom Code를 실행
- 앱에서 동작을 인지하여 코드에 따른 기능을 수행하는 녀석

### <a href="https://developer.apple.com/documentation/uikit/uitextfield">UITextField</a>
> - Editable Text를 표시하는 객체
- 유저의 동작으로 수정가능한 텍스트를 보여주는 객체
- delegate 패턴을 사용하여 유저의 인터랙션에 대한 다양한 기능을 수행 가능

#### 예시코드
```
import UIKit

class FirstViewController: UIViewController {

    private let questionLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 80, y: 200, width: 250, height: 30))
        label.text = "민초 vs 반민초 당신의 선택은?"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let answerTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 80, y: 280, width: 250, height: 40))
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemGray6
        textField.font = .systemFont(ofSize: 18, weight: .medium)
        return textField
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 80, y: 350, width: 250, height: 42))
        button.setTitle("다음으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(touchupNextButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let components: [Any] = [questionLabel, answerTextField, nextButton]
        components.forEach {
            view.addSubview($0 as! UIView)
        }
    }

```

```
import UIKit

class SecondViewController: UIViewController {
    
    private let resultLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 80, y: 200, width: 300, height: 30))
        label.text = "당신의 선택은 이거였군요!"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 150, y: 260, width: 80, height: 30))
        button.setTitle("뒤로가기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.addTarget(self, action: #selector(touchupBackButton), for: .touchUpInside)
        return button
    }()
    
	override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let components: [Any] = [questionLabel, answerTextField, nextButton]
        components.forEach {
            view.addSubview($0 as! UIView)
        }
    }

```
#### 실행결과
<table>
  <tr>
    <td><img src="https://velog.velcdn.com/images/hello_hidi/post/cee7fe59-6ca5-4a8a-b788-604a3eb39cfe/image.jpg"></td>
    <td> 
      <img src="https://velog.velcdn.com/images/hello_hidi/post/52f904d4-5ce3-4298-8c3b-afc7763bfad6/image.jpeg">
</td>
  <tr>
</table>

 
 
  



