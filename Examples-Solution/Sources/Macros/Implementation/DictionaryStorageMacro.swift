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
 * @DictionaryStorage
 * struct DictionaryStorage { }
 */




public struct DictionaryStorageMacro { }


extension DictionaryStorageMacro: MemberMacro {
    
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        return [
            """
            var _storage: [String: Any]
            """,
            """
            init(_ storage: [String: Any]) { self._storage = storage }
            """
        ]
    }
    
}


extension DictionaryStorageMacro: ExtensionMacro {
    
    public static func expansion(
        of node: AttributeSyntax,
        attachedTo declaration: some DeclGroupSyntax,
        providingExtensionsOf type: some TypeSyntaxProtocol,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [ExtensionDeclSyntax] {
        let extensionDecl = try ExtensionDeclSyntax("extension \(type.trimmed): DictionaryRepresentable { }")
        
        return [extensionDecl]
    }
    
}
