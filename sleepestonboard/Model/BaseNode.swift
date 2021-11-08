//
//  BaseNode.swift
//  sleepestonboard
//
//  Created by ashlee.muscroft on 08/11/2021.
//

import AsyncDisplayKit

/// Helper base class for automatic adding of subnodes. Docs indicated this is needed for animation transitions
class BaseNode: ASDisplayNode {
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
}
