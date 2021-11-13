//
//  BackgroundNode.swift
//  sleepestonboard
//
//  Created by ashlee.muscroft on 09/11/2021.
//

import AsyncDisplayKit

class BackgroundImageNode: ASDisplayNode {
    var backGroundImageNode: ASImageNode
    override init() {
        backGroundImageNode = ASImageNode()
        super.init()
        addSubnode(backGroundImageNode)
        imageSetup()
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: .zero, child: backGroundImageNode)
    }

    private func imageSetup(name: String = "purplebluegradient") {
        backGroundImageNode.image = UIImage(named: name)
        backGroundImageNode.contentMode = .scaleAspectFit
        backGroundImageNode.style.preferredSize = UIScreen.main.bounds.size
        backGroundImageNode.isUserInteractionEnabled = false
        backGroundImageNode.displaysAsynchronously = false

        let modificationBlock = { (image: UIImage, traitCollection: ASPrimitiveTraitCollection) -> UIImage in
            return image.createBlurredVisualImageEffect(
                    size: UIScreen.main.bounds.size
            )
        }
        backGroundImageNode.imageModificationBlock = modificationBlock
    }
}
