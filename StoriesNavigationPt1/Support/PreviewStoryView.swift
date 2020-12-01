//
//  IPreviewFrame.swift
//  StoriesNavigations
//
//  Created by Semyon on 27.11.2020.
//

import UIKit

public protocol IPreviewFrame: AnyObject {
    
    var endFrame: CGRect { get }
    var startFrame: CGRect { get }
    
}

public class PreviewStoryView: UIView, IPreviewFrame {
    
    public var startFrame: CGRect {
        return convert(bounds, to: nil)
    }
    
    public var endFrame: CGRect {
        return convert(bounds, to: nil)
    }

}
