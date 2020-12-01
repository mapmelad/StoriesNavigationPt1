//
//  StoriesScreenViewController.swift
//  StoriesNavigations
//
//  Created by Semyon on 27.11.2020.
//

import UIKit

class StoriesScreenViewController: UINavigationController {
        
    // MARK: - Private properties
    private var viewModel: StoriesScreenViewModelProtocol?
    private var previewFrame: IPreviewFrame?
    
    // MARK: - Setup
    func setup(viewModel: StoriesScreenViewModelProtocol, viewControllers: [UIViewController], previewFrame: IPreviewFrame?) {
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

extension StoriesScreenViewController {
    
    private func setupUI() {
        setNavigationBarHidden(true, animated: false)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
}

extension StoriesScreenViewController: UIViewControllerTransitioningDelegate {
    
    public func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        guard let startFrame = previewFrame?.startFrame else { return nil }
        return StoriesScreenAnimatorPresent(startFrame: startFrame)
    }
    
    public func animationController(
        forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        guard let endFrame = previewFrame?.endFrame else { return nil }
        return StoriesScreenAnimatorDismiss(endFrame: endFrame)
    }
    
}


