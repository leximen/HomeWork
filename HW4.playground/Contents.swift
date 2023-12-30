import UIKit

/*1. Задание Необходимо разработать простое текстовое приложение для управления и отображения событий в календаре.
 Требования:
 Хранилище данных:
 Создайте словарь для хранения событий. Ключом в этом словаре должна быть строка, представляющая дату, а значением - массив строк, представляющий события этой даты.
 Функциональность:
 a. Добавление события:
 Напишите функцию, которая принимает дату и событие в качестве параметров.
 Если для этой даты еще не существует списка событий, создайте его.
 Добавьте событие к указанной дате.
 b. Отображение событий:
 Напишите функцию, которая принимает дату в качестве параметра.
 Функция должна выводить все события этой даты или сообщение о том, что событий на указанную дату нет.
 Интерфейс пользователя:
 Создайте функцию, которая предоставляет пользователю следующие опции:
 Добавить мероприятие
 Показать мероприятия на определенную дату
 Выйти из приложения
 В зависимости от выбора пользователя вызывайте соответствующие функции.
 Для получения ввода от пользователя используйте функцию readLine().
 Убедитесь, что приложение корректно обрабатывает неверный ввод пользователя.
 Запуск:
 После того как весь функционал будет реализован, инициируйте запуск приложения.
 Подсказки:
 Используйте условные операторы и циклы для реализации логики.
 Помните о безопасности работы с опциональными значениями в Swift.
 Ожидаемый результат: При запуске приложения пользователь должен видеть меню с опциями. После выбора опции он может добавить событие к определенной дате или просмотреть события на выбранную дату. Приложение должно корректно обрабатывать ввод и предоставлять информативные сообщения пользователю.
 */
var events: [String: [String]] = [:]

func addEvent(date: String, event: String) {
    if var existingEvents = events[date] {
        existingEvents.append(event)
        events[date] = existingEvents
    } else {
        events[date] = [event]
    }
}

func showEvents(date: String) {
    if let eventsForDate = events[date] {
        print("Events for date (date):")
        for event in eventsForDate {
            print("- " + event)
        }
    } else {
        print("No events for the specified date.")
    }
}

func displayMenu() {
    print("Menu:")
    print("1. Add Event")
    print("2. Show Events for Date")
    print("3. Exit")
}

func getInput() -> String {
    if let input = readLine() {
        return input
    } else {
        return ""
    }
}

func run() {
    var running = true
    while running {
        displayMenu()
        if let choice = Int(getInput()) {
            switch choice {
            case 1:
                print("Enter date (YYYY-MM-DD):")
                let date = getInput()
                print("Enter event:")
                let event = getInput()
                addEvent(date: date, event: event)
            case 2:
                print("Enter date to show events (YYYY-MM-DD):")
                let date = getInput()
                showEvents(date: date)
            case 3:
                running = false
            default:
                print("Invalid choice. Please enter a valid option.")
            }
        } else {
            print("Invalid input. Please enter a number.")
        }
    }
    print("Exiting the application.")
}

 /*2 Задание: Хранилище настроек
 Описание: Разработайте текстовое приложение, которое позволяет пользователю устанавливать и извлекать значения настроек по ключам.
 Требования:
 Хранилище данных:
 Создайте приватный словарь для хранения настроек. Ключом в этом словаре должна быть строка, представляющая ключ настройки, а значением - строка, представляющая значение настройки.
 Функциональность:
a. Установка настройки:
Реализуйте метод, который принимает ключ и значение настройки в качестве параметров. Метод должен устанавливать или обновлять значение настройки по указанному ключу в вашем приватном словаре.
b. Извлечение настройки:
Реализуйте метод, который принимает ключ в качестве параметра и возвращает значение настройки для указанного ключа. Если ключ не существует, метод должен возвращать nil.
c. Вывод всех настроек:
Реализуйте метод для вывода всех настроек в удобочитаемом формате. Этот метод может быть полезен для пользователя, чтобы быстро проверить все текущие настройки.
d. Защита от ошибок:
Обеспечьте безопасность работы с вашим хранилищем настроек. Рассмотрите возможность добавления проверок на ввод данных, предоставление информативных сообщений об ошибках.
 */
var settingStorage = [String: String]()

func addSetting(key: String, value: String) {
    settingStorage[key] = value
}

func extractSetting(key: String) -> String? {
    settingStorage[key]
}

func displayAllSettings() {
    for i in settingStorage {
        print("Ключ: \(i.key), значение: \(i.value)")
    }
}
  

/*3 Задание: Простой англо-русский переводчик
 Описание: Разработайте текстовое приложение, которое позволяет пользователю переводить слова с английского языка на русский, используя предопределенный словарь.
 Требования:
 Словарь перевода:
 Создайте словарь с парами "английское слово": "русское слово".
 Например: "hello" переводится как "привет", "world" как "мир" и так далее.
 Этот словарь будет служить вашей базой для перевода слов.
 Функциональность:
 a. Перевод слова:
 Реализуйте функцию, которая принимает слово на английском языке в качестве параметра.
 Функция должна возвращать перевод этого слова с помощью словаря, если такой перевод существует. В противном случае, возвращайте nil.
 b. Интерфейс пользователя:
 Создайте функцию, которая предоставляет пользователю две опции:
 Перевести слово.
 Выйти из приложения.
 Если пользователь выбирает опцию перевода слова, предложите ему ввести слово на английском.
 Используйте вашу функцию перевода, чтобы перевести введенное слово и выведите результат. Если слово не найдено в словаре, информируйте пользователя об этом.
 Запуск:
 После того как весь функционал будет реализован, инициируйте запуск приложения.
 Подсказки:
 Убедитесь, что вы обрабатываете различные варианты ввода пользователя, например, если пользователь вводит слово, которого нет в словаре.
 Используйте функцию readLine(), чтобы получить ввод от пользователя.
 Ожидаемый результат: При запуске приложения пользователь видит меню с опциями. После выбора опции "Перевести слово" ему предлагается ввести слово на английском. Приложение затем выдает русский перевод этого слова или сообщает пользователю, что перевод не найден.
 */
var dictionary: [String: String] = [
    "hello": "привет",
    "world": "мир",
]

func translateWord(_ word: String) -> String? {
    return dictionary[word]
}

func disMenu() {
    print("Menu:")
    print("1. Translate a word")
    print("2. Exit")
}

func go() {
    var running = true
    while running {
        displayMenu()
        if let choice = Int(readLine() ?? "0") {
            switch choice {
            case 1:
                print("Enter a word in English:")
                if let inputWord = readLine() {
                    if let translation = translateWord(inputWord) {
                        print("Translation: (translation)")
                    } else {
                        print("Translation not found.")
                    }
                } else {
                    print("Invalid input.")
                }
            case 2:
                running = false
            default:
                print("Invalid choice. Please enter a valid option.")
            }
        } else {
            print("Invalid input. Please enter a number.")
        }
    }
    print("Exiting the application.")
}
/*
 4. Задание: Справочник городов по странам
  Описание: Разработайте текстовое приложение для управления базой данных, содержащей страны и их города. Пользователь должен иметь возможность добавлять и удалять города, а также просматривать список городов для определенной страны.
  Требования:
  База данных:
  Создайте словарь, где ключом является название страны, а значением - множество городов этой страны.
  Функциональность:
  a. Добавление города к стране:
  Реализуйте функцию, которая добавляет город к заданной стране.
  Если страна еще не существует в базе данных, создайте новую запись.
  Если страна уже есть в базе данных, просто добавьте город к множеству городов этой страны.
  b. Удаление города из страны:
  Реализуйте функцию, которая удаляет город из заданной страны.
  Если после удаления города у страны не осталось городов, удаляйте страну из базы данных.
  c. Просмотр городов страны:
  Реализуйте функцию, которая отображает список городов для заданной страны.
  Если страны нет в базе данных или у нее нет городов, информируйте пользователя об этом.
  d. Интерфейс пользователя:
  Создайте функцию, предоставляющую пользователю меню с различными действиями.
  Предоставьте опции для добавления города, удаления города, просмотра городов страны и выхода из приложения.
  Запуск:
  После того как весь функционал будет реализован, инициируйте запуск приложения.
  Подсказки:
  Используйте Set<String> для хранения городов каждой страны, чтобы избежать дубликатов.
  Убедитесь, что вы обрабатываете все возможные случаи, например, добавление уже существующего города или удаление несуществующего города.
  Ожидаемый результат: При запуске приложения пользователь видит меню с различными опциями. Он может добавлять города, удалять их или просматривать список городов для определенной страны.
*/
var countries: [String: Set<String>] = [:]

func addCity(country: String, city: String) {
    if var existingCities = countries[country] {
        existingCities.insert(city)
        countries[country] = existingCities
        print("City '(city)' added to '(country)'")
    } else {
        countries[country] = [city]
        print("Country '(country)' created with city '(city)'")
    }
}

func removeCity(country: String, city: String) {
    guard var existingCities = countries[country] else {
        print("Country '(country)' does not exist.")
        return
    }

    existingCities.remove(city)

    if existingCities.isEmpty {
        countries.removeValue(forKey: country)
        print("Removed last city from '(country)'. Country removed.")
    } else {
        countries[country] = existingCities
        print("City '(city)' removed from '(country)'")
    }
}

func showCities(country: String) {
    if let cities = countries[country] {
        print("Cities in (country):")
        for city in cities {
            print("- " + city)
        }
    } else {
        print("Country '(country)' does not exist or has no cities.")
    }
}

func displayMenu1() {
    print("Menu:")
    print("1. Add City to Country")
    print("2. Remove City from Country")
    print("3. Show Cities for Country")
    print("4. Exit")
}

func round2() {
    var running = true
    while running {
        displayMenu()
        if let choice = Int(readLine() ?? "0") {
            switch choice {
            case 1:
                print("Enter country:")
                let country = readLine() ?? ""
                print("Enter city:")
                let city = readLine() ?? ""
                addCity(country: country, city: city)
            case 2:
                print("Enter country:")
                let country = readLine() ?? ""
                print("Enter city:")
                let city = readLine() ?? ""
                removeCity(country: country, city: city)
            case 3:
                print("Enter country:")
                let country = readLine() ?? ""
                showCities(country: country)
            case 4:
                running = false
            default:
                print("Invalid choice. Please enter a valid option.")
            }
        } else {
            print("Invalid input. Please enter a number.")
        }
    }
    print("Exiting the application.")
}
  
/*  5. Задание: Нахождение общих элементов двух массивов
  Описание: Разработайте функцию, которая определяет общие элементы между двумя массивами и возвращает их в виде нового массива.
  Требования:
  Функция commonElements:
  Входные параметры: два массива целых чисел - array1 и array2.
  Возвращаемое значение: массив целых чисел.
  Логика функции:
  Преобразуйте каждый из входных массивов в множества (Set) для устранения возможных дубликатов и для использования встроенных операций множеств.
  Найдите пересечение двух множеств, что даст вам множество общих элементов.
  Преобразуйте результат обратно в массив и верните его.
  Пример использования:
  Создайте два тестовых массива: arrayA и arrayB.
  Вызовите функцию commonElements, передав эти массивы в качестве аргументов.
  Выведите на экран результат выполнения функции.
  Подсказки:
  Порядок элементов в результирующем массиве может зависеть от внутреннего устройства Set, поэтому не обязательно ожидать определенный порядок.
 */
 func commonElements(array1: [Int], array2: [Int]) -> [Int] {
     let set1 = Set(array1)
     let set2 = Set(array2)
     let intersection = set1.intersection(set2)
     return Array(intersection)
 }

 let arrayA = [1, 2, 3, 4, 5]
 let arrayB = [3, 4, 5, 6, 7]

 let result = commonElements(array1: arrayA, array2: arrayB)
 print(result)

/*  6 Задание: Поиск общих друзей двух пользователей
  Описание: Разработайте систему для учета дружеских связей и функцию для определения общих друзей между двумя пользователями.
  Требования:
  Словарь friendsList:
  Ключи: строковые значения, представляющие имена пользователей.
  Значения: множества (Set), содержащие имена друзей соответствующего пользователя.
  Функция findCommonFriends:
  Входные параметры: две строки - user1 и user2, представляющие имена пользователей.
  Возвращаемое значение: множество строк (или nil в случае отсутствия какого-либо из пользователей в словаре).
  Логика функции:
  Проверьте, существуют ли оба пользователя в friendsList.
  Если один из пользователей или оба отсутствуют, верните nil.
  Если оба пользователя присутствуют, найдите и верните пересечение их множеств друзей.
  Пример использования:
  Вызовите функцию findCommonFriends, передав в неё имена двух пользователей.
  Определите и выведите результат. Если функция вернула nil, сообщите, что один из пользователей не найден в списке друзей.
  Подсказки:
*/
 var friendsList = [
     "user1": Set(["friend1", "friend2", "friend3"]),
     "user2": Set(["friend2", "friend3", "friend4"]),
 ]

 // Функция для поиска общих друзей
 func findCommonFriends(user1: String, user2: String) -> Set<String>? {
     guard let set1 = friendsList[user1], let set2 = friendsList[user2] else {
         return nil
     }
     
     return set1.intersection(set2)
 }

 if let commonFriends = findCommonFriends(user1: "user1", user2: "user2") {
     print("Общие друзья: (commonFriends)")
 } else {
     print("Один из пользователей не найден в списке друзей")
 }

/*7. Задание: Найти уникальные элементы в массиве
 Описание: Разработайте функцию, которая принимает массив целых чисел и возвращает новый массив, содержащий только уникальные значения из входного массива.
 Требования:
 Функция uniqueElements:
 Входной параметр: массив целых чисел - array.
 Возвращаемое значение: массив целых чисел.
 Логика функции:
 Преобразуйте входной массив в множество (Set). Это автоматически удалит все дубликаты из массива, так как множества содержат только уникальные элементы.
 Преобразуйте полученное множество обратно в массив и верните его.
 Пример использования:
 Вызовите функцию uniqueElements, передав в неё массив чисел.
 Отобразите результат. В результате выполнения функции, все дублирующиеся числа из входного массива должны быть удалены. Например, из массива [1, 2, 3, 1, 2, 4, 5] функция вернет массив [1, 2, 3, 4, 5] (порядок чисел может отличаться).
 Подсказки:
 Ожидаемый результат: После вызова функции и передачи в неё массива, вы должны увидеть массив без дубликатов. Например, для массива [1, 2, 3, 1, 2, 4, 5] результатом может быть: [2, 3, 1, 5, 4] (учтите, что порядок элементов может отличаться).
 */
 func uniqueElements(array: [Int]) -> [Int] {
     let set = Set(array) // Преобразование входного массива в множество
     return Array(set)
 }
 let inputArray = [1, 2, 3, 1, 2, 4, 5]
 let uniqueArray = uniqueElements(array: inputArray)
 print(uniqueArray)
 
 /*8 Задание:  Реализация простого телефонного справочника
 Описание: Создайте базовую систему управления телефонным справочником, позволяющую добавлять, удалять и искать номера телефонов по именам.
 Требования:
 Справочник:
 Используйте словарь (Dictionary) для хранения пар "имя-номер телефона".
 Функции:
 addNumber:
 Входные параметры: имя (name) и номер телефона (number).
 Добавляет указанный номер телефона для данного имени в справочник.
 removeNumber:
 Входной параметр: имя (name).
 Удаляет номер телефона, связанный с данным именем из справочника.
 findNumber:
 Входной параметр: имя (name).
 Возвращает номер телефона для данного имени (если он есть в справочнике) или nil, если такого имени нет.
 Пример использования:
 Добавьте несколько номеров телефонов в справочник.
 Выполните поиск по имени. Проверьте и отобразите результаты.
 Удалите номер телефона из справочника.
 Попробуйте найти этот номер снова, чтобы удостовериться, что он был удален.
 Ожидаемый результат:
 При добавлении и поиске номеров вы должны получить ожидаемые результаты на основе текущего содержимого справочника. Если имя не найдено в справочнике, функция поиска вернет nil, и вы должны уведомить пользователя об этом.
 Подсказки:
 При работе со словарями в Swift использование метода removeValue(forKey:) удаляет значение для заданного ключа (если оно существует). Если ключа нет, метод не делает ничего.
 Чтобы проверить, существует ли значение для определенного ключа в словаре, вы можете просто использовать индексацию словаря: dictionary[key]. Если ключ отсутствует, вам вернется nil.
  
  */
  var phoneBook = [String: Int]()

  func addNumber(name: String, number: Int) {
      phoneBook[name] = number
  }

  func removeNumber(name: String) {
      phoneBook.removeValue(forKey: name)
  }

  func removeNumber(name: String) -> Int? {
      phoneBook[name]
  }
  
 
/* 9 Задание: Реализация теста по умножению
 Описание:
 Создайте систему для генерации и проведения теста из пяти уникальных вопросов по умножению для чисел от 1 до 10. После завершения теста программа должна выводить оценку на основе количества правильных ответов.
 Требования:
 Структуры данных:
 questionsAsked: Множество (Set), которое используется для отслеживания заданных вопросов, чтобы гарантировать уникальность каждого вопроса.
 questionsAndAnswers: Словарь (Dictionary), где ключ - это вопрос, а значение - это правильный ответ на этот вопрос.
 correctAnswers: Счетчик правильных ответов пользователя.
 Функции:
 generateUniqueMultiplicationQuestion:
 Генерирует уникальный вопрос по умножению.
 Возвращает кортеж из строки вопроса и правильного ответа.
 determineGrade:
 Определяет оценку на основе количества правильных ответов.
 Возвращает символьную оценку.
 *Тест:*
 Пройдитесь через цикл 10 раз (10 вопросов).
 Задайте пользователю вопрос и ожидайте ответ.
 Проверьте ответ пользователя на правильность.
 После завершения теста, определите и выведите оценку.
 Подсказки:
 Используйте множества для гарантирования уникальности вопросов.
 Словарь позволяет быстро связать вопрос с его ответом.
 Используйте switch в функции determineGrade для определения оценки на основе количества правильных ответов.
 Ожидаемый результат:
После запуска кода пользователь ответит на 10 уникальных вопросов по умножению. После завершения теста будет выведена его оценка.
 */
 var questionsAsked = Set<String>()

 let questionsAndAnswers = [
     "1*1": 1,
     "2*2": 4,
     "3*3": 9,
     "4*4": 16,
     "5*5": 25,
     "6*6": 36,
     "7*7": 49,
     "8*8": 64,
     "9*9": 81,
     "10*10": 100,
 ]

 var correctAnswers = 0

 func generateUniqueMultiplicationQuestion() -> (String, Int) {
     questionsAndAnswers.randomElement()!
 }

 func determineGrade(_ num: Int) -> Int {
     var result = Int()

     switch num {
     case 0...2: result = 2
     case 3...5: result = 3
     case 6...8: result = 4
     case 9,10: result = 5
     default: break
     }

     print("""
         Правильных ответов: \(correctAnswers)
         Оценка = \(result)
         """)
     return result
 }

 for _ in 1...10 {

     let question = generateUniqueMultiplicationQuestion()

     if !questionsAsked.contains(question.0) {
         print("Сколько будет \(question.0)?")
         let userAnswer = readLine()
         if userAnswer == String(question.1) {
             correctAnswers += 1
         }
         questionsAsked.insert(question.0)
     }
 }
//// Структуры данных
//var questionsAsked = Set<String>()
//var questionsAndAnswers = [String: Int]()
//var correctAnswers = 0
//
//// Функция для генерации уникального вопроса по умножению
//func generateUniqueMultiplicationQuestion() -> (String, Int) {
//    var question: String
//    var answer: Int
//    repeat {
//        let num1 = Int.random(in: 1...10)
//        let num2 = Int.random(in: 1...10)
//        question = "Сколько будет \(num1) умножить на \(num2)?"
//        answer = num1 * num2
//    } while questionsAsked.contains(question)
//    questionsAsked.insert(question)
//    questionsAndAnswers[question] = answer
//    return (question, answer)
//}
//
//// Функция для определения оценки на основе количества правильных ответов
//func determineGrade(correctAnswers: Int) -> String {
//    switch correctAnswers {
//    case 8...10:
//        return "Отлично!"
//    case 6...7:
//        return "Хорошо"
//    case 4...5:
//        return "Удовлетворительно"
//    default:
//        return "Плохо"
//    }
//}
//
//// Тест
//for _ in 1...10 {
//    let (question, answer) = generateUniqueMultiplicationQuestion()
//    print(question)
//    if let userAnswer = readLine(), let userIntAnswer = Int(userAnswer) {
//        if userIntAnswer == answer {
//            print("Правильно!")
//            correctAnswers += 1
//        } else {
//            print("Неправильно. Правильный ответ: \(answer)")
//        }
//    }
//}
//
//let grade = determineGrade(correctAnswers: correctAnswers)
//print("Оценка: \(grade)")
 
/* 10 Задание: Функция склонения слова "монета" в зависимости от числа
 Описание:
 Функция coinCase(for:) принимает целое число и возвращает правильное склонение слова "монета" в соответствии с этим числом. Например, для числа 1 функция вернёт "монета", для числа 3 - "монеты", а для числа 5 - "монет".
 Основные моменты:
 Словарь cases:
 Этот словарь содержит основные варианты склонения слова "монета" для последних цифр от 1 до 4.
 1 - "монета", 2-4 - "монеты".
 lastDigit и lastTwoDigits:
 Эти переменные содержат последнюю цифру числа и последние две цифры числа соответственно.
 Проверка на исключения:
 Для чисел с последними двумя цифрами от 11 до 14 (например, 11, 12, 13, 14) правильное склонение будет "монет", несмотря на то что последняя цифра может быть 1 или 3.
 Определение склонения:
 Если число оканчивается на одну из цифр в словаре cases, функция возвращает соответствующее склонение из словаря.
 В противном случае возвращается "монет".
 Тестирование:
 При запуске этой программы для предоставленного списка чисел будет выведено правильное склонение слова "монета" для каждого числа.
 Примеры:
 "1 монета"
 "2 монеты"
 "5 монет"
 "11 монет"
 "23 монеты"
 */
 
 func coinCase(for number: Int) -> String {
 let cases = [1: "монета", 2: "монеты", 3: "монеты", 4: "монеты"]
 let lastDigit = number % 10
 let lastTwoDigits = number % 100

 if (11...14).contains(lastTwoDigits) {
     return "монет"
 }

 if let caseValue = cases[lastDigit] {
     return caseValue
 }

 return "монет"
 }

 print(coinCase(for: 1)) // "1 монета"
 print(coinCase(for: 2)) // "2 монеты"
 print(coinCase(for: 5)) // "5 монет"
 print(coinCase(for: 11)) // "11 монет"
 print(coinCase(for: 23)) // "23 монеты"


/*11. Сжатые строки
Создайте функцию которая будет сжимать входящую строку, например
print(compress("aabcccccaaa")) // Должен вернуть "a2b1c5a3"
 */
func compress(_ string: String) -> String {
    var result = ""
    var count = 0
    let characters = Array(string)
    
    for i in 0..<characters.count {
        count += 1
        
        if i == characters.count - 1 || characters[i] != characters[i + 1] {
            result.append("\(characters[i])\(count)")
            count = 0
        }
    }
    
    return result
}
 

/*12. Поиск двух чисел, сумма которых равна заданному числу
Условие: Дан массив целых чисел nums и целое число target. Найдите два числа в массиве, которые в сумме дают target.
 */

 func findTwoSum(nums: [Int], target: Int) -> (Int, Int)? {
     for i in 0..<nums.count {
         for j in (i+1)..<nums.count {
             if nums[i] + nums[j] == target {
                 return (i, j)
             }
         }
     }
     return nil
 }
let nums = [1,2,3,4,5]
let target = 7
findTwoSum(nums: nums, target: target)
// */

/*13. Первый уникальный символ в строке
Условие: Дана строка, найти первый неповторяющийся символ в ней и вернуть его индекс. Если такого нет, вернуть -1.
*/
func firstUniqueCharacterIndex(in str: String) -> Int {
    for (index, char) in str.enumerated() {
        if str.firstIndex(of: char) == str.lastIndex(of: char) {
            return index
        }
    }
    return -1
}

print("""
    \(firstUniqueCharacterIndex(in: "000001"))
    \(firstUniqueCharacterIndex(in: "Hello"))
    \(firstUniqueCharacterIndex(in: "aaaa"))
    """)
 

