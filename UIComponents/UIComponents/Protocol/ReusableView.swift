//
//  ReusableView.swift
//  UIComponents
//
//  Created by Berkay on 13.11.2022.
//

import Foundation
import UIKit

public protocol ReusableView: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
