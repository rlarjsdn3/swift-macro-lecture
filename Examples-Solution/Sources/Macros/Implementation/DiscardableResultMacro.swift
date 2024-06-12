//
//  File.swift
//  
//
//  Created by 김건우 on 6/12/24.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

/* - Original Source Code
 *
 * @DiscardableResult
 * protocol ServiceType {
 *   var event: PublishSubject<ServiceEvent>
 *   func didTapRealEmojiButton() -> Observable<UUID>
 * }
 */


public struct DiscardableResultMacro: MemberAttributeMacro {
    
    public static func expansion(
        of node: AttributeSyntax,
        attachedTo declaration: some DeclGroupSyntax,
        providingAttributesFor member: some DeclSyntaxProtocol,
        in context: some MacroExpansionContext
    ) throws -> [AttributeSyntax] {
//        return ["@discardableResult"]
        
        guard
            let _ = declaration.as(ProtocolDeclSyntax.self)
        else {
            throw MacroError.message("이 매크로는 Protocol에만 적용할 수 있습니다.")
        }
        
        if let _ = member.as(VariableDeclSyntax.self) {
            return []
        }
        
        return [
            AttributeSyntax(
                atSign: .atSignToken(),
                attributeName: IdentifierTypeSyntax(
                    name: .identifier("discardableResult")
                )
            )
        ]
    }
    
}
