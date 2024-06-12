//
//  File.swift
//  
//
//  Created by 김건우 on 6/12/24.
//

import SwiftSyntax

public extension DeclModifierListSyntax {
    
    var isNeededPublicAccessControl: Bool {
        
        self.first(where: { modifier in
            modifier
                .description == "public"
        }) != nil
        
    }
    
}
