//
//  String + Extension.swift
//  UIComponents
//
//  Created by Berkay on 14.11.2022.
//

public extension String {
    var convertUrl: URL? {
        let string = self.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        if let string = string {
            return URL(string: string)
        } else {
            return nil
        }
    }
}
