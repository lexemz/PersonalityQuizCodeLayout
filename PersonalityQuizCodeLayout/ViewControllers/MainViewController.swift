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
        setupAndSetSmilesForCorners()
    }

//    private func setupNavigationBar() {
//        title = "Question"
//        navigationController?.navigationBar.prefersLargeTitles = true
//
//        let barAppearance = UINavigationBarAppearance()
//        barAppearance.backgroundColor = UIColor.systemBackground
//
//        barAppearance.titleTextAttributes = [.foregroundColor: UIColor.label]
//        barAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
//
//        navigationController?.navigationBar.standardAppearance = barAppearance
//        navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
//    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupAndSetSmilesForCorners() {
        let fontSize = UIFont.systemFont(ofSize: 30)
        
        let leftUpperSmile = UILabel()
        leftUpperSmile.text = "🐶"
        leftUpperSmile.font = fontSize
        
        let rightUpperSmile = UILabel()
        rightUpperSmile.text = "🐱"
        rightUpperSmile.font = fontSize
        
        let leftLowerSmile = UILabel()
        leftLowerSmile.text = "🐢"
        leftLowerSmile.font = fontSize
        
        let rightLowerSmile = UILabel()
        rightLowerSmile.text = "🐰"
        rightLowerSmile.font = fontSize

        setupSubviews(leftUpperSmile, rightUpperSmile, leftLowerSmile, rightLowerSmile)
        
        let margins = view.layoutMarginsGuide
        
        // leftUpperSmile
        NSLayoutConstraint.activate([
            leftUpperSmile.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
            leftUpperSmile.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20)
        ])

        // rightUpperSmile
        NSLayoutConstraint.activate([
            rightUpperSmile.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
            rightUpperSmile.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20),
            rightUpperSmile.leadingAnchor.constraint(greaterThanOrEqualTo: leftUpperSmile.trailingAnchor)
        ])
        
        // leftLowerSmile
        NSLayoutConstraint.activate([
            leftLowerSmile.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20),
            leftLowerSmile.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20)
        ])
        
        // rightLowerSmile
        NSLayoutConstraint.activate([
            rightLowerSmile.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20),
            rightLowerSmile.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20),
            rightLowerSmile.leadingAnchor.constraint(greaterThanOrEqualTo: leftLowerSmile.trailingAnchor)
        ])
    }
}

