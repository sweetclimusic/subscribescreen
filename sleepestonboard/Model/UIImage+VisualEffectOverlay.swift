//
// Created by ashlee.muscroft on 09/11/2021.
//

import Foundation
import UIKit

extension UIImage {
    func createBlurredVisualImageEffect(size: CGSize) -> UIImage {
        let frame = CGRect(origin: .zero, size: size)
        let imageEffect = UIVisualEffectView(frame: frame)
        let imageView = UIImageView(image: self)
        imageView.frame = frame
        //begin image context for TEXTURE
        UIGraphicsBeginImageContextWithOptions(size, false, 0 )
        imageEffect.effect = UIBlurEffect(style: .systemMaterialDark)
        imageEffect.contentView.addSubview(imageView)
        let visualEffectImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return visualEffectImage ?? self
    }
}