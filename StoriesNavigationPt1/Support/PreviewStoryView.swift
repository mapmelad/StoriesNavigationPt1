//
//  PreviewStoryViewProtocol.swift
//  StoriesNavigations
//
//  Created by Semyon on 27.11.2020.
//

import UIKit

public protocol PreviewStoryViewProtocol: AnyObject {
    
    var endFrame: CGRect { get }
    var startFrame: CGRect { get }
    
}

public class PreviewStoryView: UIView, PreviewStoryViewProtocol {
    
    public var startFrame: CGRect {
        return convert(bounds, to: nil)
    }
    
    public var endFrame: CGRect {
        return convert(bounds, to: nil)
    }

}
