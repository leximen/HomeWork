import UIKit

/* 1 -  Задание: Времена года и их температура
 Описание: Создайте приложение, которое отображает среднюю температуру для различных времен года.
 Требования:
 Перечисление "Времена года»: Создайте перечисление Season с четырьмя вариантами: Winter, Spring, Summer и Fall.
 Средняя температура: Каждому времени года должна соответствовать средняя температура. Используйте свойство вычисляемого типа (computed property) для этой цели.
 Вывод температуры: Реализуйте функцию, которая выводит среднюю температуру для выбранного времени года.
 Ожидаемый результат: При запуске приложения можно получить среднюю температуру для любого из четырех времен года.
 */
 enum Season {
     case winter
     case spring
     case summer
     case fall
     
     var averageTemperature: Int {
         switch self {
         case .winter:
             return 0
         case .spring:
             return 20
         case .summer:
             return 30
         case .fall:
             return 15
         }
     }
 }

 func printAverageTemperature(for season: Season) {
     print("Average temperature for \(season) is \(season.averageTemperature)")
 }

 printAverageTemperature(for: .winter)

 
/* 2 -  Задание: Информация о транспортных средствах
 Описание: Создайте приложение, которое предоставляет информацию о различных видах транспортных средств, таких как их максимальная скорость.
 Требования:
 Перечисление "Транспорт":  Создайте перечисление Transport с различными типами транспортных средств, такими как автомобиль, велосипед, поезд и самолет.
 Максимальная скорость: Для каждого транспортного средства укажите его максимальную скорость. Используйте ассоциативные значения для этой цели.
 Вывод информации: Реализуйте функцию, которая выводит максимальную скорость для выбранного транспортного средства.
 Ожидаемый результат: Пользователь может узнать максимальную скорость любого из указанных транспортных средств.
 */
    enum Transport {
    case car
    case bicycle
    case train
    case airplane
    
    var maxSpeed: Int {
        switch self {
        case .car:
            return 120
        case .bicycle:
            return 20
        case .train:
            return 300
        case .airplane:
            return 700
        }
    }
}
func printMaxSpeed(for transport: Transport) {
    switch transport {
    case .car:
        print("Максимальная скорость автомобиля: \(transport.maxSpeed) км/ч")
    case .bicycle:
        print("Максимальная скорость велосипеда: \(transport.maxSpeed) км/ч")
    case .train:
        print("Максимальная скорость поезда: \(transport.maxSpeed) км/ч")
    case .airplane:
        print("Максимальная скорость самолета: \(transport.maxSpeed) км/ч")
    }
}
printMaxSpeed(for: .airplane)

/* 3 -  Задание: Статусы платежей
 Описание: Создайте систему учета статусов платежей, которая позволяет отслеживать различные этапы обработки платежа.
 Требования:
 Перечисление "Статус платежа»: Создайте перечисление PaymentStatus со статусами: Неоплачено, В обработке, Оплачено, Ошибка.
 Дополнительная информация: Некоторые статусы требуют дополнительной информации. Например, для оплаченного статуса нужна дата оплаты, а для статуса ошибки - сообщение об ошибке. Используйте ассоциативные значения для сохранения этой информации.
 Вывод информации: Реализуйте функционал, который позволяет пользователю узнать дату оплаты для определенного платежа или причину ошибки.
 Ожидаемый результат: Пользователь может узнать детали каждого платежа в зависимости от его статуса.
 */
enum PaymentStatus {
    case unpaid
    case processing
    case paid(date: String)
    case error(message: String)
}

func printPaymentDetails(for status: PaymentStatus) {
    switch status {
    case .unpaid:
        print("Статус платежа: Неоплачено")
    case .processing:
        print("Статус платежа: В обработке")
    case .paid(let date):
        print("Статус платежа: Оплачено")
        print("Дата оплаты: \(date)")
    case .error(let message):
        print("Статус платежа: Ошибка")
        print("Сообщение об ошибке: \(message)")
    }
}

let unpaidStatus = PaymentStatus.unpaid
let processingStatus = PaymentStatus.processing
let paidStatus = PaymentStatus.paid(date: "19.05.2021")
let errorStatus = PaymentStatus.error(message: "Ошибка обработки платежа")

printPaymentDetails(for: unpaidStatus)
printPaymentDetails(for: processingStatus)
printPaymentDetails(for: paidStatus)
printPaymentDetails(for: errorStatus)

/* 4 -  Задание: Рекомендации по режимам камеры
 Описание: Создайте систему, которая дает рекомендации по использованию различных режимов камеры.
 Требования:
 Перечисление "Режим камеры»: Создайте перечисление CameraMode с режимами: Авто, Портрет, Ландшафт, Ночной.
 Рекомендации: Для каждого режима предоставьте рекомендацию, когда и как лучше его использовать.
 Получение рекомендации: Реализуйте функционал, который позволяет пользователю получить рекомендацию для выбранного режима камеры.
 Ожидаемый результат: При выборе определенного режима камеры пользователь получает рекомендацию по его использованию.
 */
enum CameraMode {
    case auto
    case portrait
    case landscape
    case nightly

    var recommendation: String {
        switch self {
        case .auto:
            return "В этом режиме фотоаппарат автоматически выбирает наиболее подходящие настройки для съемки в зависимости от условий освещения и сцены"
        case .portrait:
            return "В этом режиме фокус камеры фокусируется на объекте съемки, размывая задний план, чтобы создать эффект глубины"
        case .landscape:
            return "Этот режим предназначен для фотографирования обширных пейзажей, где требуется широкий угол обзора"
        case .nightly:
            return "Этот режим идеально подходит для фотографирования в условиях низкой освещенности"
        }
    }
}

let cameraMode: CameraMode = .auto
cameraMode.recommendation

/* 5 - Задание: Диеты животных в зоопарке
 Описание: Создайте информационную систему о типах животных в зоопарке и их предпочтениях в пище.
 Требования:
 Перечисление "Тип животного»: Создайте перечисление AnimalType с типами: Хищник, Травоядное, Насекомое.
 Диета: Укажите, что ест каждый тип животного.
 Получение информации о диете: Реализуйте функционал, который позволяет узнать, что ест определенное животное.
 Ожидаемый результат:  Пользователь может узнать, что ест определенное животное в зоопарке.
*/
enum AnimalType {
    case predator
    case herbivore
    case insect

    var diet: String {
        switch self {
        case .predator:
            return "Хищники едят других животных, таких как кролики, олени, антилопы и другие более мелкие млекопитающие. Они также могут есть рыбу, птиц и насекомых."
        case .herbivore:
            return "Травоядные могут есть большинство видов растений, включая траву, листья деревьев, цветы, фрукты и овощи."
        case .insect:
            return "Насекомые едят растения, фрукты, овощи, грибы и других насекомых"
        }
    }
}

let insect: AnimalType = .insect
insect.diet

/* 6 - Задание: Отслеживание статуса заказа в ресторане
Описание: Разработайте систему, которая позволяет отслеживать статус приготовления заказа в ресторане.
 Требования:
 Перечисление "Статус заказа»: Создайте перечисление OrderStatus со статусами: Принят, Готовится, Готов к подаче, Доставляется.
 Следующий статус: Реализуйте функционал, который показывает, какой статус будет следующим после текущего.
 Получение следующего статуса: Пользователь может узнать, какой статус будет следующим для его заказа.
 Ожидаемый результат: Пользователь может отслеживать, на каком этапе находится его заказ.
 */
enum OrderStatus: String {
    case received
    case prepared = "Готовится"
    case readyToServe = "Готов к подаче"
    case delivered = "Доставляется"

    var nextStatus: String {
        switch self {
        case .received:
            return "Следующий статус: \(OrderStatus.prepared.rawValue)"
        case .prepared:
            return "Следующий статус: \(OrderStatus.readyToServe.rawValue)"
        case .readyToServe:
            return "Следующий статус: \(OrderStatus.delivered.rawValue)"
        case .delivered:
            return ""
        }
    }
}

let statusMyOrder: OrderStatus = .prepared
statusMyOrder.nextStatus

/* 7 - Задание: Информация о номерах в отеле
 Описание: Создайте систему, которая предоставляет информацию о различных типах номеров в отеле.
 Требования:
 Перечисление "Тип комнаты»: Создайте перечисление RoomType с типами номеров: Одноместный, Двухместный, Люкс.
 Информация о комнате: Для каждого типа комнаты укажите его стоимость и количество доступных номеров.
 Получение информации о комнате: Пользователь может узнать стоимость и количество доступных номеров для выбранного типа комнаты.
 Ожидаемый результат: Пользователь может узнать детали о различных типах номеров в отеле.
 */
enum RoomType {
    case singleRoom
    case doubleRoom
    case luxuryRoom

    var price: Int {
        switch self {
        case .singleRoom:
            return 100
        case .doubleRoom:
            return 200
        case .luxuryRoom:
            return 700
        }
    }

    var numberOfAvailable: Int {
        switch self {
        case .singleRoom:
            return 7
        case .doubleRoom:
            return 4
        case .luxuryRoom:
            return 2
        }
    }
}

let doubleRoom: RoomType = .singleRoom
doubleRoom.price
doubleRoom.numberOfAvailable

/* 8 - Задание: Уровни сложности в игре
 Описание: Разработайте систему, которая позволяет определить параметры игры на основе выбранного уровня сложности.
 Требования:
 Перечисление "Уровень сложности»: Создайте перечисление DifficultyLevel с уровнями: Легкий, Средний, Тяжелый, Эксперт.
 Параметры игры: Укажите количество врагов и временные ограничения для каждого уровня сложности.
 Получение параметров: Реализуйте функционал, который позволяет пользователю узнать параметры игры для выбранного уровня сложности.
 Ожидаемый результат: Пользователь может узнать, сколько врагов и какое временное ограничение установлено для выбранного уровня сложности.
 */
enum DifficultyLevel {
    case light
    case medium
    case heavy
    case expert

    var enemyCount: Int {
        switch self {
        case .light:
            return 50
        case .medium:
            return 20
        case .heavy:
            return 11
        case .expert:
            return 5
        }
    }

    var timeLimit: String {
        switch self {
        case .light:
            return "30 minutes"
        case .medium:
            return "15 minutes"
        case .heavy:
            return "10 minutes"
        case .expert:
            return "5 minutes"
        }
    }
}

let level: DifficultyLevel = .medium
level.enemyCount
level.timeLimit

/* 9 - Задание: Прогноз погоды по облачности
 Описание: Создайте систему, которая предоставляет информацию о вероятности осадков на основе уровня облачности.
 Требования:
 Перечисление "Облачность»: Создайте перечисление Cloudiness с уровнями: Ясно, Частичная облачность, Облачно, Пасмурно.
 Вероятность осадков: Укажите вероятность осадков для каждого уровня облачности.
 Получение прогноза: Реализуйте функционал, который позволяет пользователю узнать вероятность осадков для выбранного уровня облачности.
 Ожидаемый результат: Пользователь может узнать вероятность осадков, основываясь на текущем уровне облачности.
*/
enum Cloudiness {
    case clear
    case partlyCloudy
    case cloudy
    case overcast

    var rainfallProbability: String {
        switch self {
        case .clear:
            return "5%"
        case .partlyCloudy:
            return "20%"
        case .cloudy:
            return "40%"
        case .overcast:
            return "70%"
        }
    }
}

let precipitation: Cloudiness = .cloudy
precipitation.rainfallProbability

/* 10 - Задание: Цены напитков в автомате
 Описание: Создайте систему, которая предоставляет информацию о стоимости различных напитков, доступных в автомате.
 Требования:
 Перечисление "Тип напитка»: Создайте перечисление DrinkType с напитками: Кофе, Чай, Горячий шоколад, Вода.
 Стоимость напитка: Укажите стоимость каждого напитка.
 Получение цены: Реализуйте функционал, который позволяет пользователю узнать стоимость выбранного напитка.
 Ожидаемый результат: Пользователь может узнать стоимость напитка перед тем, как совершить покупку в автомате.
 */

 enum DrinkType: Int {
     case coffee = 30
     case tea = 20
     case hotChocolate = 35
     case water = 5
 }

 func costOfDrink(_ drink: DrinkType) -> Int {
     drink.rawValue
 }

 costOfDrink(.water)
 
enum ResultRequest {
    case success(String)
    case failure(String)
}

var resultData: [Int : String] = [
                                   1: "Данные получены",
                                   2 : "Отсутствуует подключение к интернету",
                                   3 : "Сервер не отвечает"
                                 ]
let resultRequestData = resultData.randomElement()

func fetchData(for request: String) -> ResultRequest {
    guard let requestData = resultRequestData else { return ResultRequest.failure("запрос не отправлен")}
    
    for (key, value) in [requestData] {
        switch key {
        case 1:
            return ResultRequest.success(value)
        case 2:
            return ResultRequest.failure(value)
        case 3:
            return ResultRequest.failure(value)
        default:
            return ResultRequest.failure("Ошибка \(resultData[key] ?? "")")
        }
    }
    return .failure("некоторый fallback-кейс")
}

// Выполняем запрос

let result2 = fetchData(for: "Freeman")

switch result2 {
case .success(let data):
    print("Data: \(data)")
case .failure(let errorMassage):
    print("Error: \(errorMassage)")
}
