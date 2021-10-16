import UIKit

func initialCanConstruct(_ targetWord: String, _ wordBank: [String]) -> Bool {
    if targetWord == "" { return true }
    
    for word in wordBank {
        if targetWord.hasPrefix(word) {
            if initialCanConstruct(String(targetWord.dropFirst(word.count)), wordBank) {
                return true
            }
        }
    }
    return false
}

var wordExists: [String : Bool] = [:]
func optimalCanConstruct(_ targetWord: String, _ wordBank: [String]) -> Bool {
    if let value = wordExists[targetWord] { return value }
    if targetWord == "" { return true }
    
    for word in wordBank {
        if targetWord.hasPrefix(word) {
            if optimalCanConstruct(String(targetWord.dropFirst(word.count)), wordBank) {
                wordExists[targetWord] = true
                return true
            }
        }
    }
    wordExists[targetWord] = false
    return false
}

print("Initial: \(initialCanConstruct("abcdef", ["ab", "abc", "cd", "def", "abcd"]))") // true
print("Initial: \(initialCanConstruct("skateboard", ["bo", "rd", "ate", "t", "ska", "sk", "boar"]))") // false
print("Initial: \(initialCanConstruct("enterapotentpot", ["a", "p", "ent", "enter", "ot", "o", "t"]))") // true
//print("Initial: \(initialCanConstruct("eeeeeeeeeeeeeeeeeeeeeeeeeeeeef", ["e", "eeee", "eeee", "eeeeeeeeee"]))") // false
print("\n")

print("Optimal: \(optimalCanConstruct("abcdef", ["ab", "abc", "cd", "def", "abcd"]))") // true
wordExists = [:]
print("Optimal: \(optimalCanConstruct("skateboard", ["bo", "rd", "ate", "t", "ska", "sk", "boar"]))") // false
wordExists = [:]
print("Optimal: \(optimalCanConstruct("enterapotentpot", ["a", "p", "ent", "enter", "ot", "o", "t"]))") // true
wordExists = [:]
print("Optimal: \(optimalCanConstruct("eeeeeeeeeeeeeeeeeeeeeeeeeeeeef", ["e", "eeee", "eeee", "eeeeeeeeee"]))") // false
