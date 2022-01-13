//
//  MainViewController.swift
//  PersonalityQuizCodeLayout
//
//  Created by Igor on 13.01.2022.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        title = "Question"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = UIColor.systemBackground
        
        barAppearance.titleTextAttributes = [.foregroundColor: UIColor.label]
        barAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
        
        navigationController?.navigationBar.standardAppearance = barAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
    }
}

