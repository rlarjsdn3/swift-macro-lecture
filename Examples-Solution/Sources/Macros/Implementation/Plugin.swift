//
//  File.swift
//  
//
//  Created by 김건우 on 6/12/24.
//

import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct MacroPlugin: CompilerPlugin {
    var providingMacros: [Macro.Type] = [
        DictionaryStorageMacro.self,
        DiscardableResultMacro.self,
        URLMacro.self
    ]
}
