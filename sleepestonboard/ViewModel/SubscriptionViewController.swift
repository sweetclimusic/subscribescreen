//
//  SubscriptionViewController.swift
//  sleepestonboard
//
//  Created by ashlee.muscroft on 08/11/2021.
//
//
import AsyncDisplayKit

class SubscriptionViewController: ASDKViewController<ASDisplayNode> {
    let subscriptionNode = SubscriptionNode(features: "Test")
    override init(){
        let bgImage = ASImageNode()
        let blurImage = ASImageNode()
        bgImage.image = UIImage(named: "purplebluegradient")
        blurImage.image = bgImage.image

        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.layoutSpecBlock = { [self] (_,constrainedSize)  in
            let ratio = constrainedSize.min.height / constrainedSize.min.width
            let ratioSpec = ASRatioLayoutSpec(ratio: ratio, child: bgImage)
            let overLaySpec = ASOverlayLayoutSpec(child: ratioSpec, overlay: subscriptionNode)
            return overLaySpec
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        //let manager = UIWindowScene.windows
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.post(name: .presentedControllerNotification , object: self)
    }
}
