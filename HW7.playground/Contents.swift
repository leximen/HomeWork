class Car {
    let brand: String
    let model: String
    let yearOfProduction: Int
    let isCruiseControl: Bool

    init(
        brand: String,
        model: String,
        yearOfProduction: Int,
        isCruiseControl: Bool
    ) {
        self.brand = brand
        self.model = model
        self.yearOfProduction = yearOfProduction
        self.isCruiseControl = isCruiseControl
    }

    func carAction() -> String? { nil }

    enum CarAction {}
}

class TruckCar: Car {
    let capacity: Int
    var cargoStatus: CarAction = .unloading
    
    init(
        brand: String,
        model: String,
        yearOfProduction: Int,
        isCruiseControl: Bool,
        capacity: Int
    ) {
        self.capacity = capacity
        super.init(
            brand: brand,
            model: model,
            yearOfProduction: yearOfProduction,
            isCruiseControl: isCruiseControl
        )
    }

    override func carAction() -> String {
        switch cargoStatus {
        case .loading:
            cargoStatus = .unloading
        case .unloading:
            cargoStatus = .loading
        }
        return cargoStatus.rawValue
    }
}

class SportCar: Car {
    let maxSpeed: Int
    var turboStatus: CarAction = .turboIsOff
    
    init(
        brand: String,
        model: String,
        yearOfProduction: Int,
        isCruiseControl: Bool,
        maxSpeed: Int
    ) {
        self.maxSpeed = maxSpeed
        super.init(
            brand: brand,
            model: model,
            yearOfProduction: yearOfProduction,
            isCruiseControl: isCruiseControl
        )
    }

    override func carAction() -> String {
        switch turboStatus {
        case .turboIsOn:
            turboStatus = .turboIsOff
        case .turboIsOff:
            turboStatus = .turboIsOn
        }
        return turboStatus.rawValue
    }
}

extension TruckCar {
    enum CarAction: String {
        case loading = "Погрузка"
        case unloading = "Разгрузка"
    }
}

extension SportCar {
    enum CarAction: String {
        case turboIsOn = "Запущен"
        case turboIsOff = "Заглушен"
    }
}

let BMW = SportCar(
    brand: "BMW",
    model: "X5",
    yearOfProduction: 2017,
    isCruiseControl: true,
    maxSpeed: 299
)

BMW.carAction()

print("""
Марка: \(BMW.brand)
Модель: \(BMW.model)
Год выпуска: \(BMW.yearOfProduction)
Круиз-контроль: \(BMW.isCruiseControl ? "присутствует" : "отсутствует")
Макс скорость: \(BMW.maxSpeed) км/ч
Турбонаддув: \(BMW.carAction())
""")

let kamaz = TruckCar(
    brand: "kamaz",
    model: "54115",
    yearOfProduction: 2010,
    isCruiseControl: false,
    capacity: 20000
)

kamaz.carAction()

print("""
Марка: \(kamaz.brand)
Модель: \(kamaz.model)
Год выпуска: \(kamaz.yearOfProduction)
Круиз-контроль: \(kamaz.isCruiseControl ? "присутствует" : "отсутствует")
Грузоподъемность: \(kamaz.capacity / 3000) тонн
Статус погрузки: \(kamaz.carAction())
""")
