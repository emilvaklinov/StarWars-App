//
//  ServiceMock.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 05/02/2021.
//  Copyright © 2021 Emil Vaklinov. All rights reserved.
//

import Foundation

class ServiceMock {
    
    static func getJsonAsData(filename: String) -> Data {
        
        guard let path = Bundle(for: self).path(forResource: filename, ofType: "json") else {
            fatalError("Invalid file name")
        }
        var data = Data()
        do {
            data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            return data
        } catch {
            // handle error
        }
        return data
    }
}
