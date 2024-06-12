//
//  File.swift
//  
//
//  Created by 김건우 on 6/12/24.
//

import SwiftSyntax

public extension PatternBindingSyntax {
    
    /// AccessBlock이 존재하면 true, 없으면 false 반환
    var hasAccessBlock: Bool {
        self.accessorBlock != nil
    }
    
}
