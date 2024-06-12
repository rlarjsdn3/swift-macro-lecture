//
//  File.swift
//  
//
//  Created by 김건우 on 6/12/24.
//

import SwiftSyntax

public extension AttributeListSyntax {
    
    /// 속성이 존재하면 true, 없다면 false 반환
    func hasAttribute(_ name: String) -> Bool {
        
        self.first(where: { attribute in
            attribute
                .as(AttributeSyntax.self)?
                .attributeName
                .description == name
        }) != nil
        
    }
    
}
