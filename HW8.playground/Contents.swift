import UIKit

/*
 Задача 1:
 Разработка и тестирование боевой системы в ролевой игре с улучшениями для Warrior и Mag
Описание задачи:
Вам предоставлена задача расширить систему боевых единиц для ролевой игры, внедрив уникальные суперспособности для классов Warrior и Mag. Класс Fighter остается базовым, а классы-наследники получают новый метод useUltimateAbility().
Требования:
Базовый класс Fighter:
Добавьте новый метод useUltimateAbility(), который по умолчанию выводит сообщение о том, что у бойца нет уникальной способности.
Классы-наследники Warrior и Mag:
Добавьте уникальные суперспособности для каждого класса в метод useUltimateAbility().
Warrior может использовать "Мощный Удар", который увеличивает урон бойца в следующей атаке.
Mag может использовать "Огненный Взрыв", который наносит урон всем врагам на поле боя.
Тестирование:
Расширьте функции startFighter1() и startFighter2() так, чтобы они вызывали useUltimateAbility() после нескольких обычных атак.
Убедитесь, что суперспособности работают корректно и выводят соответствующие сообщения.

Завершение программы:
Обеспечьте, чтобы суперспособности были специфичными для каждого класса и внедрены в код без нарушения принципов объектно-ориентированного программирования.
Поддерживайте чистоту и читаемость кода.

————————
после того как выполните 1 - Задание, измените вашу игру Бойцовский клуб добавив к ним протоколы ->
———————————————
*/
//// Базовый класс Fighter
//class Fighter {
//    func attack() {
//        print("Выполняю обычную атаку")
//    }
//
//    func useUltimateAbility() {
//        print("У бойца нет уникальной способности")
//    }
//}
//
//// Класс Warrior - наследник класса Fighter
//class Warrior: Fighter {
//    override func useUltimateAbility() {
//        print("Warrior использует Мощный Удар")
//    }
//}
//
//// Класс Mag - наследник класса Fighter
//class Mag: Fighter {
//    override func useUltimateAbility() {
//        print("Mag использует Огненный Взрыв")
//    }
//}
//
//// Функция для тестирования
//func startFighter1(fighter: Fighter) {
//    fighter.attack()
//    fighter.useUltimateAbility()
//    fighter.attack()
//    fighter.useUltimateAbility()
//}
//
//func startFighter2(fighter: Fighter) {
//    fighter.attack()
//    fighter.useUltimateAbility()
//    fighter.attack()
//    fighter.useUltimateAbility()
//}
//
////Создание экземпляров классов и тестирование
//let warrior = Warrior()
//let mag = Mag()
//
//startFighter1(fighter: warrior)
//startFighter2(fighter: mag)
/*
Задача 2:
Разработка и тестирование иерархии классов животных
Описание задачи:
Вам предоставлена задача создания иерархии классов животных для моделирования кошек и собак. Класс Animal является базовым, а классы Cat и Dog представляют собой конкретные типы животных.
Требования:
Базовый класс Animal:
Содержит свойство name (имя животного).
Имеет инициализатор required init(name: String).
Объявляет вычисляемое свойство type, возвращающее строковое представление типа животного (кот, собака или животное по умолчанию).
Реализует метод sleep(), который возвращает строку, представляющую состояние сна животного.
Класс Cat:
Наследуется от Animal.
Содержит свойство sound (звук, который издает кот).
Имеет инициализатор init(name: String, sound: String).
Переопределяет метод sleep() для добавления информации о типе животного и его состоянии сна.
Объявляет метод play(), выводящий сообщение о том, что кот играет.
Класс Dog:
Наследуется от Animal.
Содержит свойство sound (звук, который издает собака).
Имеет инициализатор init(name: String, sound: String).
Переопределяет метод sleep() для добавления информации о типе животного и его состоянии сна.
Объявляет метод play(), выводящий сообщение о том, что собака играет.
Тестирование:
Создайте экземпляры классов Cat и Dog с различными характеристиками (имя и звук).
Выведите информацию о типе животного с использованием свойства type.
Проверьте метод sleep(), убедившись, что он корректно отображает тип и состояние сна животного.
Вызовите метод play() для каждого класса и убедитесь, что соответствующее сообщение выводится.
Дополнительно:
Создайте еще один экземпляр класса Cat без указания звука, чтобы проверить, что по умолчанию устанавливается "Мяу".
Выведите информацию о новом экземпляре и убедитесь, что звук корректно установлен.
Завершение программы:
После завершения тестирования выведите сообщения о свойствах звуков для кота и собаки.
Примечание:
Поддерживайте код в чистом и читаемом виде, следуя принципам объектно-ориентированного программирования.
*/
// Базовый класс Animal
class Animal {
    let name: String
    required init(name: String) {
        self.name = name
    }
    
    var type: String {
        return "животное"
    }
    
    func sleep() -> String {
        return "\(type) \(name) спит"
    }
}

// Класс Cat - наследник класса Animal
class Cat: Animal {
    let sound: String
    
    init(name: String, sound: String = "Мяу") {
        self.sound = sound
        super.init(name: name)
    }
    
    required init(name: String) {
        fatalError("init(name:) has not been implemented")
    }
    
    override var type: String {
        return "кот"
    }
    
    override func sleep() -> String {
        return "\(type) \(name) спит. Звук: \(sound)"
    }
    
    func play() {
        print("\(type) \(name) играет")
    }
}

// Класс Dog - наследник класса Animal
class Dog: Animal {
    let sound: String
    
    init(name: String, sound: String) {
        self.sound = sound
        super.init(name: name)
    }
    
    required init(name: String) {
        fatalError("init(name:) has not been implemented")
    }
    
    override var type: String {
        return "собака"
    }
    
    override func sleep() -> String {
        return "\(type) \(name) спит. Звук: \(sound)"
    }
    
    func play() {
        print("\(type) \(name) играет")
    }
}

// Создание экземпляров классов и тестирование
let cat1 = Cat(name: "Барсик", sound: "Мур")
let dog1 = Dog(name: "Шарик", sound: "Гав")

print(cat1.type)
print(cat1.sleep())
cat1.play()

print(dog1.type)
print(dog1.sleep())
dog1.play()

let cat2 = Cat(name: "Мурзик")
print(cat2.type)
print(cat2.sleep())

// Вывод информации о звуках
print("Звук кота: \(cat1.sound)")
print("Звук собаки: \(dog1.sound)")
/*
Задача 3:
 Разработка и использование протоколов для представления людей и бойцов в игре
Описание задачи:
Вам предоставлена задача разработать протоколы для представления людей и бойцов в игровой системе. Каждый боец должен обладать уникальными характеристиками и методами. Ваша задача - определить протоколы, расширения и структуры, которые позволят корректно представить эти концепции.
Требования:
Протокол PeopleProtocol:
Содержит свойства name (имя) и _strength (сила) с геттерами и сеттерами.
Определяет метод startTrainingFight(), выводящий сообщение о начале тренировки.
Протокол FighterProtocol:
Требует реализации свойства typeFighter (тип бойца) типа TypeFighter.
Протокол AttackProtocol:
Наследуется от PeopleProtocol.
Определяет метод attacking() -> Int, возвращающий урон бойца.
Перечисление TypeFighter:
Структура People:
Реализует протокол PeopleProtocol.
Содержит свойства name и _strength.
Структуры Warrior и Mag:
Реализуют протоколы FighterProtocol и AttackProtocol.
Содержат свойства name и _strength.
Тестирование:
Создайте экземпляры структур People, Warrior и Mag с различными характеристиками.
Выведите информацию о каждом созданном объекте.
Проверьте работу методов startTrainingFight() и attacking() для объектов, где это применимо.
Выведите информацию о типе бойцов и уроне, который они могут нанести.
Примечание:
Обеспечьте, чтобы реализация протоколов и структур была логичной и соответствовала задаче.
Поддерживайте код в чистом и читаемом виде, следуя принципам объектно-ориентированного программирования.
*/
//// Протокол PeopleProtocol
//protocol PeopleProtocol {
//    var name: String { get set }
//    var strength: Int { get set }
//
//    func startTrainingFight()
//}
//
//// Протокол FighterProtocol
//protocol FighterProtocol {
//    var typeFighter: TypeFighter { get }
//}
//
//// Протокол AttackProtocol
//protocol AttackProtocol: PeopleProtocol {
//    func attacking() -> Int
//}
//
//// Перечисление TypeFighter
//enum TypeFighter {
//    case warrior
//    case mage
//}
//
//// Структура People
//struct People: PeopleProtocol {
//    var name: String
//    var strength: Int
//
//    func startTrainingFight() {
//        print("\(name) начинает тренировку")
//    }
//}
//
//// Структура Warrior
//struct Warrior: FighterProtocol, AttackProtocol {
//    var name: String
//    var strength: Int
//
//    var typeFighter: TypeFighter {
//        return .warrior
//    }
//
//    func attacking() -> Int {
//        return strength * 3
//    }
//}
//
//// Структура Mag
//struct Mag: FighterProtocol, AttackProtocol {
//    var name: String
//    var strength: Int
//
//    var typeFighter: TypeFighter {
//        return .mage
//    }
//
//    func attacking() -> Int {
//        return strength * 5
//    }
//}
//
//// Создание экземпляров структур и тестирование
//let person1 = People(name: "Иван", strength: 10)
//let warrior1 = Warrior(name: "Воин1", strength: 15)
//let mag1 = Mag(name: "Маг1", strength: 8)
//
//print("Имя: \(person1.name), Сила: \(person1.strength)")
//person1.startTrainingFight()
//
//print("Имя: \(warrior1.name), Тип бойца: \(warrior1.typeFighter), Урон: \(warrior1.attacking())")
//print("Имя: \(mag1.name), Тип бойца: \(mag1.typeFighter), Урон: \(mag1.attacking())")
// Протокол PeopleProtocol
protocol PeopleProtocol {
    var name: String { get set }
    var strength: Int { get set }
    
    func startTrainingFight()
}
// Протокол FighterProtocol
protocol FighterProtocol {
    var typeFighter: TypeFighter { get }
}
// Протокол AttackProtocol
protocol AttackProtocol: PeopleProtocol {
    func attacking() -> Int
}
// Перечисление TypeFighter
enum TypeFighter {
    case warrior
    case magician
}
// Структура People
struct People: PeopleProtocol {
    var name: String
    var strength: Int
    
    func startTrainingFight() {
        print("Training fight started for \(name)")
    }
}
// Структуры Warrior и Mag
struct Warrior: FighterProtocol, AttackProtocol {
    var name: String
    var strength: Int
    
    var typeFighter: TypeFighter {
        return .warrior
    }
        func attacking() -> Int {
        return strength * 2
    }
}

struct Mag: FighterProtocol, AttackProtocol {
    var name: String
    var strength: Int
    
    var typeFighter: TypeFighter {
        return .magician
    }
    
    func attacking() -> Int {
        return strength * 3
    }
}

// Тестирование
let person = People(name: "John", strength: 10)
let warriors = Warrior(name: "Conan", strength: 15)
let mages = Mag(name: "Gandalf", strength: 12)

person.startTrainingFight()

print("Warrior \(warrior.name) type: \(warrior.typeFighter), damage: \(warrior.attacking)")
print("Magician \(mage.name) type: \(mage.typeFighter), damage: \(mage.attacking())")
