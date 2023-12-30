struct SportCar {

    var brand: String
    var year: Int
    var trunkVolume: Double
    var engineIsRunning: Bool
    var windowsAreOpen: Bool
    var currentTrunkVolume: Double

    mutating func performAction(_ action: Action) {
        switch action {
        case .startEngine:
            engineIsRunning = true
            windowsAreOpen = false
        case .stopEngine:
            engineIsRunning = false
            windowsAreOpen = false
        case .openWindows:
            windowsAreOpen = true
        case .closeWindows:
            windowsAreOpen = false
        case .loadCargo(let volume):
            if currentTrunkVolume + volume <= trunkVolume {
                currentTrunkVolume += volume
            } else {
                print("Объем багажника превышает доступный объем багажника!")
            }
        case .unloadCargo(let volume):
            if currentTrunkVolume - volume >= 0 {
                currentTrunkVolume -= volume
            } else {
                print("Объем груза превышает текущий объем багажника!")
            }
        }
    }
}

struct TrunkCar {

    var brand: String
    var year: Int
    var bodyVolume: Double
    var engineIsRunning: Bool
    var windowsAreOpen: Bool
    var currentBodyVolume: Double

    mutating func performAction(_ action: Action) {
        switch action {
        case .startEngine:
            engineIsRunning = true
            windowsAreOpen = false
        case .stopEngine:
            engineIsRunning = false
            windowsAreOpen = false
        case .openWindows:
            windowsAreOpen = true
        case .closeWindows:
            windowsAreOpen = false
        case .loadCargo(let volume):
            if currentBodyVolume + volume <= bodyVolume {
                currentBodyVolume += volume
            } else {
                print("Объем груза превышает располагаемый объем кузова!")
            }
        case .unloadCargo(let volume):
            if currentBodyVolume - volume >= 0 {
                currentBodyVolume -= volume
            } else {
                print("Объем груза превышает текущий объем кузова!")
            }
        }
    }
}

enum Action {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadCargo(volume: Double)
    case unloadCargo(volume: Double)
}

var sportCar = SportCar(brand: "BMW", year: 2021, trunkVolume: 200, engineIsRunning: false, windowsAreOpen: false, currentTrunkVolume: 0)
var trunkCar = TrunkCar(brand: "Man", year: 2019, bodyVolume: 1000, engineIsRunning: false, windowsAreOpen: false, currentBodyVolume: 0)

sportCar.performAction(.startEngine)
sportCar.performAction(.openWindows)
sportCar.performAction(.loadCargo(volume: 150))

trunkCar.performAction(.startEngine)
trunkCar.performAction(.loadCargo(volume: 800))
trunkCar.performAction(.openWindows)

print("Sport Car:")
print("Brand: \(sportCar.brand)")
print("Year: \(sportCar.year)")
print("Trunk Volume: \(sportCar.trunkVolume)")
print("Engine Is Running: \(sportCar.engineIsRunning)")
print("Windows Are Open: \(sportCar.windowsAreOpen)")
print("Current Trunk Volume: \(sportCar.currentTrunkVolume)")

print("Trunk Car:")
print("Brand: \(trunkCar.brand)")
print("Year: \(trunkCar.year)")
print("Body Volume: \(trunkCar.bodyVolume)")
print("Engine Is Running: \(trunkCar.engineIsRunning)")
print("Windows Are Open: \(trunkCar.windowsAreOpen)")
print("Current Body Volume: \(trunkCar.currentBodyVolume)")
