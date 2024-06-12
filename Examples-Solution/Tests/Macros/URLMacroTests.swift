
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import MacrosImplementation
import XCTest

fileprivate let testMacros: [String: Macro.Type] = [
    "URL": URLMacro.self
]

final class URLMacroTests: XCTestCase {
    
    func testURLMacro() {
        
        assertMacroExpansion(
            """
            #URL("www.apple.com")
            """,
            expandedSource:
            """
            URL(string: "www.apple.com")!
            """,
            macros: testMacros
        )
        
    }
    
}
