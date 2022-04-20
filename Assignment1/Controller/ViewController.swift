//
//  ViewController.swift
//  FileParsingJSON
//
//  Created by Shereena Sunny on 17/03/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showSwiftUIView()
    }
    
    func showSwiftUIView() {
        let displayViewController = UIHostingController(rootView: DisplayView())
        
        displayViewController.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(displayViewController)
        view.addSubview(displayViewController.view)
        
        NSLayoutConstraint.activate([
            displayViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            displayViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            displayViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            displayViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        displayViewController.didMove(toParent: self)
    }

}
