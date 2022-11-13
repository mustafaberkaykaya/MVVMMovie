//
//  SwiftEntryKit.swift
//  MVVMMovie
//
//  Created by Berkay on 13.11.2022.
//

import SwiftEntryKit
import TinyConstraints

final class EntryKitHelper {
    
    enum EntryKitType {
        case success
        case error
    }
    
    static func show(_ message: String?, type: EntryKitType, statusBar: EKAttributes.StatusBar = .light) {
        var attributes = EKAttributes.bottomFloat
        attributes.displayDuration = 2
        attributes.statusBar = statusBar
        
        let contentView = UIView()
        contentView.layer.cornerRadius = 16
        
        let label: UILabel = {
           let label = UILabel()
            label.font = .interRegular14
            label.numberOfLines = 0
            label.textColor = .appWhite
            label.textAlignment = .justified
            label.text = message
            return label
        }()
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.tintColor = .appWhite
            return imageView
        }()
        
        switch type {
        case .success:
            contentView.backgroundColor = .green
            imageView.image = .check24
        case .error:
            contentView.backgroundColor = .red
            imageView.image = .cancel24
        }
        
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        label.edgesToSuperview(excluding: .leading, insets: .init(top: 16, left: 0, bottom: 16, right: 16))
        
        imageView.size(.init(width: 24, height: 24))
        imageView.centerY(to: label)
        imageView.trailingToLeading(of: label, offset: -8)
        imageView.leadingToSuperview(offset: 16)

        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
}
