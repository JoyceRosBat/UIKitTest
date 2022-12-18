//
//  CustomFlowLayout.swift
//  TestUIKit
//
//  Created by Joyce Rosario Batista on 17/12/22.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        itemSize = CGSize(width: UIScreen.main.bounds.size.width - 50, height: 100)
        scrollDirection = .horizontal
        
        minimumInteritemSpacing = 8
        minimumLineSpacing = 10
        
        sectionInset = UIEdgeInsets(top: 8, left: 30, bottom: 8, right: 30)
        
        super.prepare()
    }
    
    override func targetContentOffset(
        forProposedContentOffset proposedContentOffset: CGPoint,
        withScrollingVelocity velocity: CGPoint
    ) -> CGPoint {
        guard let collectionView = collectionView else { return .zero }

        let targetRect = CGRect(
            x: proposedContentOffset.x,
            y: 0,
            width: collectionView.frame.width,
            height: collectionView.frame.height
        )
        guard let rectAttributes = super.layoutAttributesForElements(in: targetRect) else { return .zero }

        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        let horizontalCenter = proposedContentOffset.x + collectionView.frame.width / 2

        for layoutAttributes in rectAttributes {
            let itemHorizontalCenter = layoutAttributes.center.x
            if (itemHorizontalCenter - horizontalCenter).magnitude < offsetAdjustment.magnitude {
                offsetAdjustment = itemHorizontalCenter - horizontalCenter
            }
        }

        return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
    }
}
