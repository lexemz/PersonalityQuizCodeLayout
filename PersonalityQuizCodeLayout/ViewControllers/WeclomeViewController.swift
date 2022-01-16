//
//  MainViewController.swift
//  PersonalityQuizCodeLayout
//
//  Created by Igor on 13.01.2022.
//

import UIKit

class WeclomeViewController: UIViewController {
    
    // MARK: - UI properties
    private lazy var startButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Начать опрос", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.setTitleColor(.tintColor, for: .normal)
        button.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Какое вы животное?"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 16
        
        return stackView
    }()
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureStackView()
        configureAndSetConstraintsForDecorativeEmoji()
    }
    
    // MARK: - Private methods
    private func configureStackView() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(welcomeLabel)
        stackView.addArrangedSubview(startButton)
        setStackViewConstraints()
    }
    
    private func configureAndSetConstraintsForDecorativeEmoji() {
        
        let leftUpperSmile = UILabel.createLabelForEmoji("🐶")
        let rightUpperSmile = UILabel.createLabelForEmoji("🐱")
        let leftLowerSmile = UILabel.createLabelForEmoji("🐢")
        let rightLowerSmile = UILabel.createLabelForEmoji("🐰")

        [leftUpperSmile, rightUpperSmile, leftLowerSmile, rightLowerSmile].forEach {
            view.addSubview($0)
        }
        
        let safeArea = view.layoutMarginsGuide
        
        // leftUpperSmile
        leftUpperSmile.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftUpperSmile.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            leftUpperSmile.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20)
        ])

        // rightUpperSmile
        rightUpperSmile.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rightUpperSmile.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            rightUpperSmile.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            rightUpperSmile.leadingAnchor.constraint(greaterThanOrEqualTo: leftUpperSmile.trailingAnchor)
        ])
        
        // leftLowerSmile
        leftLowerSmile.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftLowerSmile.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20),
            leftLowerSmile.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20)
        ])
        
        // rightLowerSmile
        rightLowerSmile.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rightLowerSmile.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20),
            rightLowerSmile.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            rightLowerSmile.leadingAnchor.constraint(greaterThanOrEqualTo: leftLowerSmile.trailingAnchor)
        ])
    }
}

// MARK: - UIControl actions
extension WeclomeViewController {
    @objc private func startButtonPressed() {
        let quizVC = QuizViewController()
        let quizVCWithNavigationController = UINavigationController(rootViewController: quizVC)
        quizVCWithNavigationController.modalPresentationStyle = .fullScreen
        present(quizVCWithNavigationController, animated: true)
    }
}

// MARK: - Layout methods
extension WeclomeViewController {
    private func setStackViewConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor)
        ])
    }
}
