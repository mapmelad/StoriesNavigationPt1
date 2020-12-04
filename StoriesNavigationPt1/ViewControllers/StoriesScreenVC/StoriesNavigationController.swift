//
//  StoriesNavigationController.swift
//  StoriesNavigations
//
//  Created by Semyon on 27.11.2020.
//

import UIKit

class StoriesNavigationController: UINavigationController {
        
    // MARK: - Private properties
    private var viewModel: StoriesNavigationViewModelProtocol?
    private var previewFrame: PreviewFrameProtocol?
    
    // MARK: - Setup
    func setup(viewModel: StoriesNavigationViewModelProtocol, viewControllers: [UIViewController], previewFrame: PreviewFrameProtocol?) {
        self.viewModel = viewModel
        self.previewFrame = previewFrame
        self.viewControllers = viewControllers
    }

    // MARK: - Lifecycle
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        setupUI()
    }
    
}

extension StoriesNavigationController {
    
    private func setupUI() {
        setNavigationBarHidden(true, animated: false)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
}

extension StoriesNavigationController: UIViewControllerTransitioningDelegate {
    
    public func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        guard let startFrame = previewFrame?.startFrame else { return nil }
        return StoriesNavigationPresentAnimator(startFrame: startFrame)
    }
    
    public func animationController(
        forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        guard let endFrame = previewFrame?.endFrame else { return nil }
        return StoriesNavigationDismissAnimator(endFrame: endFrame)
    }
    
}


