import UIKit

func initialCountConstruct(_ targetWord: String, _ wordBank: [String]) -> Int {
    if targetWord == "" { return 1 }
    
    var totalCount = 0
    for word in wordBank {
        if targetWord.hasPrefix(word) {
            let count = initialCountConstruct(String(targetWord.dropFirst(word.count)), wordBank)
            totalCount = totalCount + count
        }
    }
  
    return totalCount
}

var countForWord: [String : Int] = [:]
func optimalCountConstruct(_ targetWord: String, _ wordBank: [String]) -> Int {
    if let value = countForWord[targetWord] { return value }
    if targetWord == "" { return 1 }
    
    var totalCount = 0
    for word in wordBank {
        if targetWord.hasPrefix(word) {
            let count = optimalCountConstruct(String(targetWord.dropFirst(word.count)), wordBank)
            totalCount = totalCount + count
        }
    }
    countForWord[targetWord] = totalCount
    return totalCount
}

print("Initial: \(initialCountConstruct("purple", ["purp", "ur", "p", "le", "purpl"]))") // 2
print("Initial: \(initialCountConstruct("abcdef", ["ab", "abc", "cd", "def", "abcd"]))") // 1
print("Initial: \(initialCountConstruct("skateboard", ["bo", "rd", "ate", "t", "ska", "sk", "boar"]))") // 0
print("Initial: \(initialCountConstruct("enterapotentpot", ["a", "p", "ent", "enter", "ot", "o", "t"]))") // 4
//print("Initial: \(initialCountConstruct("eeeeeeeeeeeeeeeeeeeeeeeeeeeeef", ["e", "eeee", "eeee", "eeeeeeeeee"]))") // 0
print("\n")

print("Optimal: \(optimalCountConstruct("purple", ["purp", "ur", "p", "le", "purpl"]))") // 2
countForWord = [:]
print("Optimal: \(optimalCountConstruct("abcdef", ["ab", "abc", "cd", "def", "abcd"]))") // 1
countForWord = [:]
print("Optimal: \(optimalCountConstruct("skateboard", ["bo", "rd", "ate", "t", "ska", "sk", "boar"]))") // 0
countForWord = [:]
print("Optimal: \(optimalCountConstruct("enterapotentpot", ["a", "p", "ent", "enter", "ot", "o", "t"]))") // 4
countForWord = [:]
print("Optimal: \(optimalCountConstruct("eeeeeeeeeeeeeeeeeeeeeeeeeeeeef", ["e", "eeee", "eeee", "eeeeeeeeee"]))") // 0
