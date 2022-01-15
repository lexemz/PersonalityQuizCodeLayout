//
//  MainViewController.swift
//  PersonalityQuizCodeLayout
//
//  Created by Igor on 13.01.2022.
//

import UIKit

class WeclomeViewController: UIViewController {
    
    // MARK: - Private properties
    private let startButton = UIButton()
    private let welcomeLabel = UILabel()
    private let stackView = UIStackView()
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        configureButton()
        configureWelcomeLabel()
        configureStackView()

        configureAndSetConstraintsForDecorativeEmoji()
    }
    
    // MARK: - Private methods
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
    
    // MARK: - Layout methods
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
        
        let leftUpperSmile = createLabelForEmoji("🐶")
        let rightUpperSmile = createLabelForEmoji("🐱")
        let leftLowerSmile = createLabelForEmoji("🐢")
        let rightLowerSmile = createLabelForEmoji("🐰")

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
    
    private func createLabelForEmoji(_ emoji: String) -> UILabel {
        let emojiLabel = UILabel()
        emojiLabel.text = emoji
        emojiLabel.font = .systemFont(ofSize: 30)
        return emojiLabel
    }
}
