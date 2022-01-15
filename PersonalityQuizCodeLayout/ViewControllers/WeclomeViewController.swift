//
//  MainViewController.swift
//  PersonalityQuizCodeLayout
//
//  Created by Igor on 13.01.2022.
//

import UIKit

class WeclomeViewController: UIViewController {
    
    private var startButton = UIButton()
    private var welcomeLabel = UILabel()
    private var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        configureButton()
        configureWelcomeLabel()
        configureStackView()

        configureAndSetConstraintsForDecorativeEmoji()
    }
    
    private func configureButton() {
        startButton.setTitle("Начать опрос", for: .normal)
        startButton.titleLabel?.font = .systemFont(ofSize: 20)
        startButton.setTitleColor(.tintColor, for: .normal)
        
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
    }
    
    private func configureWelcomeLabel() {
        welcomeLabel.text = "Какое вы животное?"
        welcomeLabel.font = .systemFont(ofSize: 30)
        welcomeLabel.textColor = .label
    }
    
    private func configureStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 16
        
        stackView.addArrangedSubview(welcomeLabel)
        stackView.addArrangedSubview(startButton)
        setStackViewConstraints()
    }
    
    private func setStackViewConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor)
        ])
    }
    
    @objc private func startButtonPressed() {
        let quizVC = QuizViewController()
        let quizVCWithNavigationController = UINavigationController(rootViewController: quizVC)
        quizVCWithNavigationController.modalPresentationStyle = .fullScreen
        present(quizVCWithNavigationController, animated: true)
    }
    
    private func configureAndSetConstraintsForDecorativeEmoji() {
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

        [leftUpperSmile, rightUpperSmile, leftLowerSmile, rightLowerSmile].forEach {
            view.addSubview($0)
        }
        
        let margins = view.layoutMarginsGuide
        
        // leftUpperSmile
        leftUpperSmile.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftUpperSmile.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
            leftUpperSmile.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20)
        ])

        // rightUpperSmile
        rightUpperSmile.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rightUpperSmile.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
            rightUpperSmile.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20),
            rightUpperSmile.leadingAnchor.constraint(greaterThanOrEqualTo: leftUpperSmile.trailingAnchor)
        ])
        
        // leftLowerSmile
        leftLowerSmile.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftLowerSmile.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20),
            leftLowerSmile.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20)
        ])
        
        // rightLowerSmile
        rightLowerSmile.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rightLowerSmile.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20),
            rightLowerSmile.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20),
            rightLowerSmile.leadingAnchor.constraint(greaterThanOrEqualTo: leftLowerSmile.trailingAnchor)
        ])
    }
}
