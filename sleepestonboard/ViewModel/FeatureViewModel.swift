//
// Created by ashlee.muscroft on 13/11/2021.
//

import Foundation
import AsyncDisplayKit

class FeatureViewModel: ASDisplayNode, ASTableDelegate, ASTableDataSource {
    var tableNode: ASTableNode
    var features: Any
    init(_ features: Any) {
        self.features = features
        self.tableNode = ASTableNode(style: .plain)
        super.init()
        tableNode.delegate = self
        tableNode.dataSource = self
    }

    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 1
    }

    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        fatalError("tableNode(_:nodeBlockForRowAt:) has not been implemented")
    }

    func tableNode(_ tableNode: ASTableNode, willBeginBatchFetchWith context: ASBatchContext) {

    }
}