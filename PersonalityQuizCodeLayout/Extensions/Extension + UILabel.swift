//
//  Extension + UILabel.swift
//  PersonalityQuizCodeLayout
//
//  Created by Igor on 17.01.2022.
//

import UIKit

extension UILabel {
    static func createLabelForEmoji(_ emoji: String) -> UILabel {
        let emojiLabel = UILabel()
        emojiLabel.text = emoji
        emojiLabel.font = .systemFont(ofSize: 30)
        return emojiLabel
    }
}
