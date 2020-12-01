//
//  StoryBaseViewController.swift
//  StoriesNavigations
//
//  Created by Semyon on 23.11.2020.
//

import UIKit
import Foundation

public class StoryBaseViewController: UIViewController {
    
    // MARK: - Constants
    private enum Spec {
        enum CloseImage {
            static let size: CGSize = CGSize(width: 40, height: 40)
            static var original: CGPoint = CGPoint(x: 24, y: 50)
        }
    }
    
    // MARK: - UI components
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "close"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonAction(sender:)), for: .touchUpInside)
        button.frame = CGRect(origin: Spec.CloseImage.original, size: Spec.CloseImage.size)
        return button
    }()
    
    // MARK: - Lifecycle
    public override func loadView() {
        super.loadView()
        setupUI()
    }
    
}

extension StoryBaseViewController {
    
    private func setupUI() {
        view.addSubview(closeButton)
    }
    
    @objc
    private func closeButtonAction(sender: UIButton!) {
        dismiss(animated: true, completion: nil)
    }
    
}
