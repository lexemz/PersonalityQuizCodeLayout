//
//  ResultViewController.swift
//  PersonalityQuizCodeLayout
//
//  Created by Igor on 15.01.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - UI properties
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Вы - 🐶"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .label
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Подробное описание"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        
        return stackView
    }()
    
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        title = "Результат"
        
        configureStackView()
    }
    
    // MARK: - Private methods
    private func configureStackView() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(resultLabel)
        stackView.addArrangedSubview(descriptionLabel)
        setStackViewConstraitns()
    }
}

// MARK: - Layout methods
extension ResultViewController {
    private func setStackViewConstraitns() {
        let safeArea = view.safeAreaLayoutGuide
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor)
        ])
    }
}
