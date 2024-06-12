//
//  File.swift
//  
//
//  Created by 김건우 on 6/12/24.
//

import Foundation

enum MacroError: Error {
    case message(String)
}

extension MacroError: CustomStringConvertible {
    var description: String {
        switch self {
        case let .message(text):
            return text
        }
    }
}


