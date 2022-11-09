import UIKit

extension UIView {
    func addSubviews(_ views: UIView...){
        views.forEach { self.addSubview($0) }
    }
    
    func makeCornerRound (radius : CGFloat){
        layer.cornerRadius = frame.height / radius
        layer.masksToBounds = false
        clipsToBounds = true
    }
}
