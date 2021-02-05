//
//  URLStrings.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 02/02/2021.
//

import Foundation

extension String {
    func localized() -> String{
        return NSLocalizedString(self, tableName:"Localizable", comment: "")
    }
}
