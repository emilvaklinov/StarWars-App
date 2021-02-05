//
//  ActivityIndicator.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 05/02/2021.
//  Copyright © 2021 Emil Vaklinov. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class ActivityIndicator {
    
    static let shared = ActivityIndicator()
    var container = UIView()
    var activityIndicator = UIActivityIndicatorView()

    private init() { }
    
    func show(in view: UIView) {
        loadingView.center = view.center
        view.addSubview(loadingView)
        loadingView.play()
    }
    
    private var loadingView: AnimationView = {
        let jsonName = "loaderAnimation"
        let animation = Animation.named(jsonName)

        // Load animation to AnimationView
        let animationView = AnimationView(animation: animation)
        animationView.frame = CGRect(origin: .zero,
                                     size: CGSize(width: 100, height: 100))
        animationView.loopMode = .loop
        // Play the animation
        return animationView
    }()

    func hide() {
        loadingView.stop()
        loadingView.removeFromSuperview()
    }
}
