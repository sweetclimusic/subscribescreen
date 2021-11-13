//
// Created by ashlee.muscroft on 12/11/2021.
//

import AsyncDisplayKit

class SubscribeButtonNode: ASDisplayNode {
    var delegate: UIViewController!
    var processingController: UIViewController!
    var subscribeButton: ASButtonNode
    override init() {
        subscribeButton = ASButtonNode()
        super.init()
        addSubnode(subscribeButton)
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASCenterLayoutSpec(
                centeringOptions: .XY,
                sizingOptions: .minimumX,
                child: subscribeButton)
    }

    func setup( size: CGSize, tintColor: UIColor? = .white){
        subscribeButton.style.preferredSize = size
        //Title setup
        let attributes = [NSAttributedString.Key.font:ctaLink]
        subscribeButton.titleNode.attributedText = NSAttributedString(string:
                NSLocalizedString("SubscribeCTA", comment: "")
                , attributes: attributes)

        if let tintColor = tintColor {
            subscribeButton.tintColor = tintColor
        }

        NotificationCenter.default.addObserver(
                self,
                selector: #selector(registerSubscribeNotification),
                name: .subscriptionControllerNotification,
                object: nil)

        subscribeButton.addTarget(
                self,
                action: #selector(dismissPresentedViewController),
                forControlEvents: .touchUpInside)
        subscribeButton.accessibilityLabel = NSLocalizedString("Subscription_accessibility", comment: "")
    }

    @objc func dismissPresentedViewController(){
        delegate.show(processingController, sender: self)
    }

    @objc func registerSubscribeNotification(notification: Notification) {
        guard let controllers = notification.object as? [String:ASDKViewController<ASDisplayNode>]
                else { return }
        delegate = controllers["presenting"]
        processingController = controllers["processing"]
    }

    deinit {
        // Save your memory by releasing notification listener
        NotificationCenter.default.removeObserver(self, name: .presentedControllerNotification, object: nil)
    }
}
