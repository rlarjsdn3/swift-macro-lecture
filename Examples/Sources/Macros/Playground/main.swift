
import Foundation
import RxSwift
import MacrosInterface

// MARK: - URL Macro

print(())



// MARK: - DiscardableResult Macro

public enum RealEmojiEvent {
    case didTapRealEmojiPad(Int)
    case updateRealEmojiImage(Int, URL)
    case createRealEmojiImage(Int, URL, String)
}

public protocol RealEmojiServiceType {
    
    var event: PublishSubject<RealEmojiEvent> { get }
    
    @discardableResult
    func updateRealEmojiImage(
        indexPath row: Int,
        image: URL) -> Observable<(Int, URL)>
    
    @discardableResult
    func createRealEmojiImage(
        indexPath row: Int,
        image: URL,
        emojiType: String) -> Observable<(Int, URL, String)>
    
    @discardableResult
    func didTapRealEmojiEvent(
        indexPath row: Int) -> Observable<Int>
}




// MARK: - DictionaryStorage Macro

struct Storage { }
