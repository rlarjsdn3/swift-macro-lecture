
import Foundation
import RxSwift
import MacrosInterface

// MARK: - URL Macro

print(#URL("www.apple.com"))



// MARK: - DiscardableResult Macro

public enum RealEmojiEvent {
    case didTapRealEmojiPad(Int)
    case updateRealEmojiImage(Int, URL)
    case createRealEmojiImage(Int, URL, String)
}

@DiscardableResult
public protocol RealEmojiServiceType {
    
    var event: PublishSubject<RealEmojiEvent> { get }
    
    func updateRealEmojiImage(
        indexPath row: Int,
        image: URL) -> Observable<(Int, URL)>
    
    func createRealEmojiImage(
        indexPath row: Int,
        image: URL,
        emojiType: String) -> Observable<(Int, URL, String)>
    
    func didTapRealEmojiEvent(
        indexPath row: Int) -> Observable<Int>
}




// MARK: - DictionaryStorage Macro

@DictionaryStorage
struct Storage { }
