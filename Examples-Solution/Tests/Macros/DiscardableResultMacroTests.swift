//
//  File.swift
//  
//
//  Created by 김건우 on 6/12/24.
//

import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import MacrosImplementation
import XCTest

fileprivate let testMacros: [String: Macro.Type] = [
    "DiscardableResult": DiscardableResultMacro.self
]

final class DiscardableResultMacroTests: XCTestCase {
    
    func testDiscardableResultMacro() {
        
        assertMacroExpansion(
            """
            @DiscardableResult
            protocol ServiceType {
                var subject: Int
                func didTapRealEmoji()
            }
            """,
            expandedSource:
            """
            protocol ServiceType {
                var subject: Int
                @discardableResult
                func didTapRealEmoji()
            }
            """,
            macros: testMacros
        )
        
    }
    
}
