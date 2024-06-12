// The Swift Programming Language
// https://docs.swift.org/swift-book


// MARK: - URL Expression Macro






// MARK: - DiscardableResult MemberAttribute Macro






// MARK: - DictionaryStorage Complex Macro




public protocol DictionaryRepresentable {
    var _storage: [String: Any] { get set }
    init(_ storage: [String: Any])
}
