import UIKit

// 3 Types of Dependency Injection:
// 1. Initializer Injection
// 2. Property Injection
// 3. Method Injection
class AgeExample {
    
    // Initializer Injection allows us to set the values of immutable/constant properties.
    let immutableAge: Int
    
    // Property Injection requires the properties to be mutable/non-constant.
    var mutableAge: Int?
    
    // 1. Initializer Injection:
    // - allows us to inject data to an immutable property in the class.
    init(withAge age: Int) {
        self.immutableAge = age
    }
    
    // 3. Method Injection:
    // - This will allow us to increase the age of the property passed in, and return the updated age.
    func increaseAge(withAge age: Int) -> Int {
        return age + 1
    }
}

// 1. Initializer Injection:
// - Injection happens at the time of creating the class.
let ageClass = AgeExample(withAge: 25)

// 2. Property Injection:
// - After we have created the class, we can inject the value we want for mutable age.
ageClass.mutableAge = 26

// 3. Method Injection:
// - Call the increase age function with passing a parameter into it.
// - The passed parameter is injecting a variable via a function.
ageClass.mutableAge = ageClass.increaseAge(withAge: ageClass.mutableAge!)
