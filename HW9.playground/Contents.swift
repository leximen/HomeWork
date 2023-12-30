import UIKit

protocol Animal {
    var name: String { get }
    func makeSound()
}

class Dog: Animal {
    let name: String = ""
    func makeSound() {
        print("Woof!")
    }
}

class Cat: Animal {
    let name: String = ""
    func makeSound() {
        print("Meow!")
    }
}

func makeSound<T: Animal>(animal: T) {
    animal.makeSound()
}

let dog = Dog()
let cat = Cat()

makeSound(animal: dog)
makeSound(animal: cat)

class RetainCycleExample {
     var weakDog: Dog?
     var weakCat: Cat?
    
    init() {
        weakDog = Dog()
        weakCat = Cat()
    }
    
    deinit {
        print("RetainCycleExample is deallocated")
    }
}

var example: RetainCycleExample? = RetainCycleExample()
example = nil

