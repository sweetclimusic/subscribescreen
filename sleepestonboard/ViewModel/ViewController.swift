//
//  ViewController.swift
//  sleepestonboard
//
//  Created by ashlee.muscroft on 05/11/2021.
//

import AsyncDisplayKit

class ViewController: ASDKViewController<ASDisplayNode> {

    var mainLayoutNode: ASDisplayNode!
    var asButtonNodeSubscribe = ASButtonNode()
    
    override init() {
        super.init(node: ASDisplayNode())
        buttonSetup()
        node.addSubnode(asButtonNodeSubscribe)
        // center main Button
        node.layoutSpecBlock = { [self] (_,_) in
            return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: self.asButtonNodeSubscribe)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder not implemented")
    }
    
    private func buttonSetup() {
        asButtonNodeSubscribe.setTitle( NSLocalizedString("OpenSubscriptionButton", comment: ""),
                                        with: nil,
                                        with: .blue,
                                        for: .normal)
        asButtonNodeSubscribe.addTarget(
            self,
            action: #selector(OpenSubscriptionScreen),
            forControlEvents: .touchUpInside
        )
        asButtonNodeSubscribe.accessibilityLabel = NSLocalizedString("OpenSubscription_accessibility", comment: "")
    }

    @objc func OpenSubscriptionScreen()
    {
        let subscriptionViewController = SubscriptionViewController()
        show(subscriptionViewController, sender: self)
    }
    
}

