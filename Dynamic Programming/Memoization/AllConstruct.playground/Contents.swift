import UIKit

func allConstruct(_ targetWord: String, _ wordBank: [String]) -> [[String]?] {
    if targetWord == "" { return [[]] }
    
    var results: [[String]] = []
    for word in wordBank {
        if targetWord.hasPrefix(word) {
            let newWord = String(targetWord.dropFirst(word.count))
            let allWays = allConstruct(newWord, wordBank)
            for subArray in allWays {
                if var sub = subArray {
                    sub.insert(word, at: 0)
                    results.append(sub)
                }
            }
        }
    }
    return results
}

print("Initial: \(allConstruct("purple", ["purp", "ur", "p", "le", "purpl"]))")
print("Initial: \(allConstruct("abcdef", ["ab", "abc", "cd", "def", "abcd"]))")
print("Initial: \(allConstruct("skateboard", ["bo", "rd", "ate", "t", "ska", "sk", "boar"]))")
