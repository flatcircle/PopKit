import UIKit
import PopKit

extension Bundle {
    
    static func loadView<T>(fromNib name: String, withType type: T.Type) -> T where T: UIView {
        if let view = Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T {
            return view
        }
        
        return UIView() as! T
    }
}

class MainViewController: UIViewController {
    
    var sideMenu: PopKit {
        return PopKitBuilder() {
            $0.constraints = [.edges(left: 0, right: nil, top: 0, bottom: 0), .width(Float(UIScreen.main.bounds.width*0.85))]
            $0.inAnimation = .bounceFromLeft(damping: 0.82, velocity: 2, animationOption: .curveEaseInOut)
            $0.outAnimation = .bounceFromRight(damping: 0.72, velocity: 2, animationOption: .curveEaseInOut)
            $0.backgroundEffect = .blurDark
            $0.popupViewController = BurgerNavController.fromStoryboard()
        }
    }
    
    var topNotification: PopKit {
        return PopKitBuilder() {
            $0.constraints = [.edges(left: 0, right: 0, top: 0, bottom:nil), .height(90)]
            $0.inAnimation = .bounceFromTop(damping: 0.9, velocity: 2, animationOption: .curveEaseInOut)
            $0.outAnimation = .bounceFromBottom(damping: 0.86, velocity: 2, animationOption: .curveEaseInOut)
            $0.backgroundEffect = .blurDark
            $0.transitionSpeed = 0.3
            $0.popupView = NotificationView.loadView()
        }
    }
    
    var bottomMenu: PopKit {
        return PopKitBuilder() {
            $0.constraints = [.edges(left: 0, right: 0, top: nil, bottom:0), .height(500)]
            $0.inAnimation = .bounceFromBottom(damping: 0.86, velocity: 2, animationOption: .curveEaseInOut)
            $0.outAnimation = .bounceFromTop(damping: 0.72, velocity: 2, animationOption: .curveEaseInOut)
            $0.backgroundEffect = .transparentOverlay(0.5)
            $0.transitionSpeed = 0.3
            $0.popupViewController = SideMenuViewController.fromStoryboard()
        }
    }
    
    var slideFromBottom: PopKit {
        return PopKitBuilder() {
            $0.constraints = [.center(x: 0, y: 0), .width(300), .height(300)]
            $0.inAnimation = .slideFromBottom(animationOption: .curveEaseOut)
            $0.outAnimation = .slideFromTop(animationOption: .curveEaseInOut)
            $0.backgroundEffect = .blurDark
            $0.transitionSpeed = 0.3
            $0.popupView = TestView()
        }
    }
    
    var bounceFromTop: PopKit {
        return PopKitBuilder() {
            $0.constraints = [.center(x: 0, y: 0), .width(300), .height(350)]
            $0.inAnimation = .bounceFromTop(damping: 0.72, velocity: 2, animationOption: .curveEaseInOut)
            $0.outAnimation = .bounceFromBottom(damping: 0.86, velocity: 2, animationOption: .curveEaseInOut)
            $0.backgroundEffect = .blurDark
            $0.popupView = CenterModalView.loadView()
        }
    }
    var zoomIn: PopKit {
        return PopKitBuilder() {
            $0.constraints = [.center(x: 0, y: 0), .width(300), .height(300)]
            $0.inAnimation = .zoomOut(1.2, animationOption: .curveEaseInOut)
            $0.outAnimation = .bounceFromBottom(damping: 0.86, velocity: 2, animationOption: .curveEaseInOut)
            $0.backgroundEffect = .blurDark
            $0.transitionSpeed = 0.46
            $0.popupView = TestView()
        }
    }
    @IBAction func didTapOpen(_ sender: Any) {
        sideMenu.show()
    }
    
    @IBAction func didTapTopNotfication(_ sender: Any) {
        topNotification.show()
    }
    
    @IBAction func didTapBounceFromTop(_ sender: Any) {
        bounceFromTop.show()
    }
    
    @IBAction func didTapSlideFromBottom(_ sender: Any) {
        slideFromBottom.show()
    }
    
    @IBAction func didTapBottomMenu(_ sender: Any) {
        bottomMenu.show()
    }
    
    @IBAction func didTapZoom(_ sender: Any) {
        zoomIn.show()
    }
    
}

class TestView: UIView {
    init(radius: Float = 15) {
        super.init(frame: .zero)
        backgroundColor = .white
        layer.cornerRadius = CGFloat(radius)
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

