//
//  ViewController.swift
//  StoriesNavigations
//
//  Created by Semyon on 23.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI components
    private lazy var previewView: PreviewStoryView = {
        let preview = PreviewStoryView()
        preview.frame.size = CGSize(width: 200, height: 200)
        preview.backgroundColor = .black
        preview.layer.cornerRadius = 10
        preview.center = view.center
        return preview
    }()
    
    private lazy var showButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show", for: .normal)
        button.addTarget(self, action: #selector(handleButtonAction), for: .touchUpInside)
        button.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 200, height: 200))
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}

extension ViewController {
    
    private func setupUI() {
        view.backgroundColor = .darkGray
        view.addSubview(previewView)
        previewView.addSubview(showButton)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(gesture:)))
        previewView.addGestureRecognizer(panGesture)
    }
    
}

extension ViewController {
    
    @objc
    func handleButtonAction(sender: UIButton!) {
        
        var storyViewControllers: [UIViewController] {
            
            let vc1 = StoryBaseViewController()
            vc1.view.backgroundColor = .red
            
            let vc2 = StoryBaseViewController()
            vc2.view.backgroundColor = .green
            
            let vc3 = StoryBaseViewController()
            vc3.view.backgroundColor = .blue
            
            return [vc1, vc2, vc3]
        }
        
        let storiesVC = StoriesNavigationController()
        storiesVC.setup(viewModel: StoriesNavigationViewModel(), viewControllers: storyViewControllers, previewFrame: previewView)
        
        present(storiesVC, animated: true, completion: nil)
    }
    
    @objc
    func handlePanGesture(gesture: UIPanGestureRecognizer) {
        
        let stateIsValidate = gesture.state == .began || gesture.state == .changed
        
        if let gestureView = gesture.view, stateIsValidate {
            let translation = gesture.translation(in: self.view)
            let newXPosition = gestureView.center.x + translation.x
            let newYPosition = gestureView.center.y + translation.y
            
            gestureView.center = CGPoint(x: newXPosition, y: newYPosition)
            gesture.setTranslation(.zero, in: self.view)
        }
    }
    
}
