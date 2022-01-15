//
//  ViewController.swift
//  PersonalityQuizCodeLayout
//
//  Created by Igor on 15.01.2022.
//

import UIKit

class QuizViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        setupNavigationBar()
    }
    
        private func setupNavigationBar() {
            title = "Вопрос "
            navigationController?.navigationBar.prefersLargeTitles = true
    
            let barAppearance = UINavigationBarAppearance()
            barAppearance.backgroundColor = UIColor.systemBackground
    
            barAppearance.titleTextAttributes = [.foregroundColor: UIColor.label]
            barAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
    
            navigationController?.navigationBar.standardAppearance = barAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
