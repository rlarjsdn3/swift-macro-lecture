//
//  File.swift
//  
//
//  Created by 김건우 on 6/12/24.
//

import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

/* - Original Source Code
 *
 * #URL("www.apple.com/kr")
 */


public struct URLMacro: ExpressionMacro {
    
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        guard
            let argument = node.argumentList.first,
            let segments = argument.expression
                .as(StringLiteralExprSyntax.self)?
                .segments,
            segments.count == 1,
            case let .stringSegment(urlString) = segments.first
        else {
            throw MacroError.message("이 매크로의 인자로 유효한 문자열 리터럴을 전달해야 합니다.")
        }
        
        guard
            let _ = URL(string: urlString.description)
        else {
            throw MacroError.message("URL이 유효하지 않습니다.")
        }
        
        return "URL(string: \(literal: urlString.description))!"
    }
    
}
