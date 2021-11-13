//
// Created by ashlee.muscroft on 12/11/2021.
//

import AsyncDisplayKit

class LogoNode: ASDisplayNode {
    var logoImage: ASImageNode
    override init() {
        logoImage = ASImageNode()
        logoImage.image = UIImage(named: "logo")
        logoImage.contentMode = .scaleAspectFit
        super.init()
        addSubnode(logoImage)
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let inset = UIEdgeInsets(top: 25, left: 0, bottom: 4, right: 20)
        let logoStack = ASInsetLayoutSpec(insets: inset, child: logoImage)
        return logoStack
    }
}
