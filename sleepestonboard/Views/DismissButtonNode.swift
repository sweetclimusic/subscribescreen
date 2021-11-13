//
// Created by ashlee.muscroft on 12/11/2021.
//

import AsyncDisplayKit

class DismissButtonNode: ASDisplayNode {
    var delegate: UIViewController!
    var dismissButton: ASImageNode
    override init() {
        dismissButton = ASImageNode()
        super.init()
        addSubnode(dismissButton)
        dismissButton.image = UIImage(named: "close")
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASCenterLayoutSpec(
                centeringOptions: .XY,
                sizingOptions: .minimumX,
                child: dismissButton)
    }

    func setup( size: CGSize, tintColor: UIColor? = .white){
        dismissButton.style.preferredSize = size
        if let tintColor = tintColor {
            dismissButton.tintColor = tintColor
        }

        NotificationCenter.default.addObserver(
                self,
                selector: #selector(registerDismissNotification),
                name: NSNotification.Name("PresentedController"),
                object: nil)

        dismissButton.addTarget(
                self,
                action: #selector(dismissPresentedViewController),
                forControlEvents: .touchUpInside)
        dismissButton.accessibilityLabel = NSLocalizedString("CloseSubscription_accessibility", comment: "")
    }

    @objc func dismissPresentedViewController(){
        delegate?.dismiss(animated:true)
    }

    @objc func registerDismissNotification(notification: Notification) {
        guard let controller = notification.object as? ASDKViewController<ASDisplayNode>
                else { return }
        delegate = controller

    }

    deinit {
        // Save your memory by releasing notification listener
        NotificationCenter.default.removeObserver(self, name: .presentedControllerNotification, object: nil)
    }
}
