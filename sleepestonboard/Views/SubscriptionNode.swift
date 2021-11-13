//
// Created by ashlee.muscroft on 11/11/2021.
//

import AsyncDisplayKit

class SubscriptionNode: ASDisplayNode {
    var logo: LogoNode
    var dismiss: DismissButtonNode
    var title: ASTextNode
    var ctaTable: ASTableNode
    init(features: Any){
        dismiss = DismissButtonNode()
        logo = LogoNode()
        title = ASTextNode()
        ctaTable = ASTableNode()
        super.init()
        automaticallyManagesSubnodes = true
        self.backgroundColor = .clear
        setup()
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        var layoutElements = [ASLayoutElement]()
        let asWidth = ASDimensionMakeWithPoints(257)
        let asHeight = ASDimensionMakeWithPoints(58)
        let ratio = constrainedSize.min.height / constrainedSize.min.width * 0.3
        //why did I have to set a preferredSize to affect the image layout size and nothing setting
        //the layoutspec size changed the image size, isn't layout king in this framework?
        //logo.style.preferredSize = CGSize(width: asWidth.value, height: asHeight.value)
        let ratioLayoutSpec = ASRatioLayoutSpec(ratio: ratio , child: logo)

        let rightPadding = UIEdgeInsets(top: 0,
                left: constrainedSize.min.width * 0.3,
                bottom: constrainedSize.min.height * 0.3,
                right: 0)
        let leftPadding = UIEdgeInsets(top: 0,left: 20,bottom: 10,right: 0)

        let rightLayout = ASInsetLayoutSpec(insets: rightPadding, child: dismiss)
        rightLayout.style.flexShrink = 1.0

        let leftLayout = ASInsetLayoutSpec(insets: leftPadding, child: ratioLayoutSpec)
        leftLayout.style.flexShrink = 1.0
        leftLayout.style.flexBasis = ASDimensionMake(.fraction, 0.5)

        //position Dismiss
        let dismissRelative = ASRelativeLayoutSpec(horizontalPosition: .end,
                verticalPosition: .start,
                sizingOption: [],
                child: rightLayout)
        let headerStack = ASStackLayoutSpec.horizontal()
        //why do I have to add dimiss as a child for it to render as a corner layout?
        headerStack.children = [leftLayout,dismissRelative]
        headerStack.debugName = "header"
        headerStack.asciiArtString()  // Where is my debug when this is ran per docs?
//        let height = ASDimensionMake(.auto, 0)
//        let width = ASDimensionMakeWithFraction(0.002)
//        headerStack.style.preferredLayoutSize = ASLayoutSizeMake(width, height)

        layoutElements.append(headerStack)
        layoutElements.append(title)
        var vStack = ASStackLayoutSpec(
                direction: .vertical,
                spacing: 0,
                justifyContent: .start,
                alignItems: .start,
                children: layoutElements)
        return ASInsetLayoutSpec(insets: .zero, child: vStack)
    }

    func setup(){
        //figma 60 x 61
        dismiss.setup(size: CGSize(width: 30, height: 31))
        //Title setup
        let attributes = [NSAttributedString.Key.font:title]
        title.attributedText =
        NSAttributedString(string: NSLocalizedString("OpeningStatement", comment: ""), attributes: attributes)
    }
}