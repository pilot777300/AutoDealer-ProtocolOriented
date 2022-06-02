import UIKit

var greeting = "Hello, playground"
import Darwin

//Задача №1
//часть 1. Создаем протокол Car
protocol Car {
    var model: String {get}
    var colour: String {get}
    var buildDate: Int {get}
    var price: Double {get set}
    var accesorise: [String] {get set}
    var isServiced: Bool {get set}
}
//часть 2  Создаем протокол Dealership
protocol Dealership {
    var name: String {get}
    var showRoomCapacity: Int {get}
    var stockCars: [Car] {get set}
    var showroomCars: [Car] {get set}
    var cars: [Car] {get set}
    func offerAccesories (accesorise: [String])
    func presaleService (car: Car)
    func addToShowroom (car: Car)
    func sellCar (car:Car, isServiced: Bool, accesorise: String) -> String
    func orderCar ()
}
//часть 3. Создаем структуры Машин
struct BMW: Car{
    
    var model: String
    
    var colour: String
    
    var buildDate: Int
    
    var price: Double
    
    var accesorise: [String] = []
    
    var isServiced: Bool
    
}
// Ауди
struct Audi: Car {
    
    var model: String
    
    var colour: String
    
    var buildDate: Int
    
    var price: Double
    
    var accesorise: [String] = ["Диски", "Тонировка", "Сигнализация"]
    
    var isServiced: Bool
}
// Хонда
struct Honda: Car {
    
    var model: String
    
    var colour: String
    
    var buildDate: Int
    
    var price: Double
    
    var accesorise: [String] = ["Диски", "Тонировка", "Сигнализация"]
    
    var isServiced: Bool
    
}
//Вольво
struct Volvo: Car {
    
    var model: String
    
    var colour: String
    
    var buildDate: Int
    
    var price: Double
    
    var accesorise: [String] = []
    
    var isServiced: Bool
    
}
// создаем экземпляры структур. Машины
var bmw = BMW(model: "520", colour: "Black", buildDate: 2020, price: 4253.60, isServiced: true)

let bmw1 = BMW(model: "X5", colour: "Blue", buildDate: 2022, price: 4536.79, isServiced: true)
let audi = Audi(model: "A7", colour: "White", buildDate: 2018, price: 4636.20,  isServiced: true)
let audi1 = Audi(model: "Q5", colour: "Red", buildDate: 2021, price: 34521.34,  isServiced: true)
let honda = Honda(model: "Accord", colour: "Blue", buildDate: 2017, price: 23569.90,  isServiced: true)
let honda1 = Honda(model: "CR-V", colour: "Blue", buildDate: 2022, price: 32953.5,  isServiced: true)
let volvo = Volvo(model: "V90", colour: "Blue", buildDate: 2021, price: 26437.75,  isServiced: true)
let volvo1 = Volvo(model: "V70", colour: "White", buildDate: 2021, price: 9546.6,  isServiced: true)

// cоздаем классы- дилерские центры, которые принимают протокол Dealership, свойства и методы ( которые согласно условию задачи выполняют определенные действия с машиной)

class BmvDealer: Dealership {
  
    
    var name: String
    
    var showRoomCapacity: Int
    
    var stockCars: [Car] = []
    
    var showroomCars: [Car] = []
    
    var cars: [Car] = [bmw, bmw1]
    
    init(name:String, showRoomCapacity:Int) {
        self.name = name
        self.showRoomCapacity = showRoomCapacity
    }
 // на вход принимаем массив из аксессуаров, которые предлагаем купить
    func offerAccesories(accesorise: [String]) {
        let accesorise = accesorise
        print("доп оборудование: \(accesorise)")
             
    }
 // у этого метода принтуем  в консоль, тк в условии задачи не написано как именно должна предпродажная подготовка проходить
    func presaleService(car: Car) {
        _ = Car.self
        print( "машина \(car.model) отправлена на  предпродажную подготовку")
        print("---------------------------------")
    }
    // меняем статус isServiced на true и добавляем в массив машин в автосалоне
    func addToShowroom(car:Car) {
        var isServiced = car.isServiced
        isServiced = true
        showroomCars.append(car)
     print("Автомобиль \(car) перемещен в шоурум, Подготовка перед продажей сделана")
        print("------------------------------")
    }
    // продаем машину. Если предпрод подготовка не сделана, уведомляем
    func sellCar(car: Car, isServiced: Bool, accesorise: String) -> String {
        if isServiced == true {
            _ = car
            _ = accesorise
            return "Автомобиль \(car) прошел предпродажную подготовку. Аксессуары: \(accesorise)"
        } else {
            return "Внимание!!!! Автомобиль \(car) не прошел предпродажную подготовку. Аксессуары: \(accesorise)"
        }
        
    }
    // Добавляем на парковку одну машину из тех,  что есть на заводе рандомным методом
    func orderCar() {
        if let x = cars.randomElement() {
        stockCars.append(x)
        } else {
            print("Массив пуст")
        }
        print("-------------------------------------")
    }
    
}
//Создаем экземпляр класса Дилерского центра БМВ. И выполняем методы

let bmwCar = BmvDealer(name: "Авилон", showRoomCapacity: 40)
bmwCar.cars.count

  // количество автомобилей в наличичи
bmwCar.orderCar()
bmwCar.cars
bmwCar.stockCars
bmwCar.addToShowroom(car: bmw)
bmwCar.showroomCars.count

bmwCar.cars.count
bmwCar.offerAccesories(accesorise: ["Противоугонка","тонировка"])
bmwCar.presaleService(car: bmw)




// Создаем тоже самое для Ауди
class AudiDealer: Dealership {
    
      var name: String
      
      var showRoomCapacity: Int
      
      var stockCars: [Car] = []
      
      var showroomCars: [Car] = []
      
      var cars: [Car] = [audi, audi1]
      
      init(name:String, showRoomCapacity:Int) {
          self.name = name
          self.showRoomCapacity = showRoomCapacity
      }
   
      
      func offerAccesories(accesorise: [String]) {
          _ = [accesorise]
          print ("доп оборудование: \(accesorise)")
      }
      
      func presaleService(car: Car) {
          _ = Car.self
          print( "машине \(car.model) выполнена предпродажная подготовка")
          print("---------------------------------")
      }
      
      func addToShowroom(car:Car) {
          showroomCars.append(car)
        
       print("Автомобиль \(car) перемещен в шоурум")
          print("------------------------------")
      }
      
      func sellCar(car: Car, isServiced: Bool, accesorise: String) -> String {
          if isServiced == true {
              _ = car
              _ = accesorise
              return "Автомобиль \(car) прошел предпродажную подготовку. Аксессуар: \(accesorise)"
          } else {
              return "Внимание!!!! Автомобиль \(car) не прошел предпродажную подготовку. Аксессуар: \(accesorise)"
          }
          
      }
    // Добавляем на парковку одну машину из тех,  что есть на заводе рандомным методом
      func orderCar() {
          if let x = cars.randomElement() {
          stockCars.append(x)
          } else {
              print("Массив пуст")
          }
          print("-------------------------------------")
      }
      
  }
// Создаем экземпляр
let audiCar = AudiDealer(name: "Дилер Ауди у болота ", showRoomCapacity: 30)

audiCar.cars.count
audiCar.addToShowroom(car: audi)
audiCar.presaleService(car: audi)

// Класс Хонда
class HondaDealer: Dealership {
    var name: String
    
    var showRoomCapacity: Int
    
    var stockCars: [Car] = []
    
    var showroomCars: [Car] = []
    
    var cars: [Car] = [honda, honda1]
    
    init(name:String, showRoomCapacity:Int) {
        self.name = name
        self.showRoomCapacity = showRoomCapacity
    }
 
    
    func offerAccesories(accesorise: [String]) {
        _ = [accesorise]
        print( "предложить клиентк купить аксееуары:")
    }
    
    func presaleService(car: Car) {
        _ = Car.self
        print( "машине \(car.model) выполнена предпродажная подготовка")
        print("---------------------------------")
    }
    
    func addToShowroom(car:Car) {
        showroomCars.append(car)
      
     print("Автомобиль \(car) перемещен в шоурум")
        print("------------------------------")
    }
    
    func sellCar(car: Car, isServiced: Bool, accesorise: String) -> String {
        if isServiced == true {
            _ = car
            _ = accesorise
            return "Автомобиль \(car) прошел предпродажную подготовку. Аксессуары: \(accesorise)"
        } else {
            return "Внимание!!!! Автомобиль \(car) не прошел предпродажную подготовку. Аксессуары: \(accesorise)"
        }
        
    }
    func orderCar() {
        if let x = cars.randomElement() {
        stockCars.append(x)
        } else {
            print("Массив пуст")
        }
        print("-------------------------------------")
    }
}
let hondaCar = HondaDealer(name: "Дилер Хонда у леса", showRoomCapacity: 15)

hondaCar.cars.count
hondaCar.addToShowroom(car: honda)
hondaCar.presaleService(car: honda1)

// для вольво
class VolvoDealer: Dealership {
    var name: String
    
    var showRoomCapacity: Int
    
    var stockCars: [Car] = []
    
    var showroomCars: [Car] = []
    
    var cars: [Car] = [volvo, volvo1]
    
    init(name:String, showRoomCapacity:Int) {
        self.name = name
        self.showRoomCapacity = showRoomCapacity
    }
 
    
    func offerAccesories(accesorise: [String]) {
        _ = [accesorise]
        print("доп оборудование: \(accesorise)")
        print("-----------------------------")
    }
    
    func presaleService(car: Car) {
        _ = Car.self
        print( "машине \(car.model) выполнена предпродажная подготовка")
        print("---------------------------------")
    }
    
    func addToShowroom(car:Car) {
        showroomCars.append(car)
      
     print("Автомобиль \(car) перемещен в шоурум")
        print("------------------------------")
    }
    
    func sellCar(car: Car, isServiced: Bool, accesorise: String) -> String {
        if isServiced == true {
            _ = car
            _ = accesorise
            return "Автомобиль \(car) прошел предпродажную подготовку. Аксессуары: \(accesorise)"
        } else {
            return "Внимание!!!! Автомобиль \(car) не прошел предпродажную подготовку. Аксессуары: \(accesorise)"
        }
        
    }
    // Добавляем на парковку одну машину из тех,  что есть на заводе рандомным методом
    func orderCar() {
        if let x = cars.randomElement() {
        stockCars.append(x)
        } else {
            print("Массив пуст")
        }
        print("-------------------------------------")
    }
}
let volvoCar = VolvoDealer(name: "Дилер вольво у горы", showRoomCapacity: 10)

volvoCar.cars.count
volvoCar.addToShowroom(car: volvo)
volvoCar.presaleService(car: volvo1)


// подпункт 3 части 3 задачи. С помощью приведения типов задаем слоганы салонам и выводим их
let dealersArray = [
BmvDealer(name: "Слоган БМВ С удовольствием за рулем", showRoomCapacity: 10),
AudiDealer(name: "Слоган АУДИ Все будет гуд", showRoomCapacity: 20),
HondaDealer(name: "Слоган Хонда Потерпите, доедем", showRoomCapacity: 20),
VolvoDealer(name: "Слоган Вольво Шведы рулят", showRoomCapacity: 30)
] as [Any]
for item in dealersArray {
    if let bmwdealer = item as? BmvDealer {
        print(bmwdealer.name)
    }
        if let audidealer = item as? AudiDealer {
            print(audidealer.name)
}
    if let hondadealer = item as? HondaDealer {
        print(hondadealer.name)
    }
    if let volvodealer = item as? VolvoDealer {
        print(volvodealer.name)
        print("----------------------")
    }
    
}
// Часть 4
print("Часть 4")
// cоздаем протокол
protocol SpecialOffer {
    func addEmergencyPack()
    func makeSpecialOffer()
}
// и расширение
extension BmvDealer: SpecialOffer {
    
   // добавляем аптечку и огнетушитель к массиву аксессуаров
    func addEmergencyPack () {
        cars[0].accesorise.append("Apt")
        cars[0].accesorise.append("ogn")

    }
    // пробегаем по массиву машин в наличии и если год выпуска меньше 2022 считаем скидку и добавляем в массив showRoomCars
    func makeSpecialOffer () {
        for i in  cars {
            let newPrice = (i.price / 100) * 15
            if i.buildDate < 2022 {
                showroomCars.append(i)
                print("Автомобилю \(i.model) из-за года выпуска \(i.buildDate) полагается скидка. Сейчас цена \(i.price). Размер скидки \(newPrice). Машину перегнали в автосалон со стоянки")
                addEmergencyPack()
            } else {print(" Машине \(i.model) скидка не полагается. Она и так новая")

                }
            }
        }
    }

print("------------------")
bmwCar.makeSpecialOffer()
bmwCar.addEmergencyPack()
bmwCar.cars
print("------------------")

// создаем расширение для ауди
extension AudiDealer: SpecialOffer {
   
    func makeSpecialOffer() {
        for i in  cars {
            let newPrice = (i.price / 100) * 15
            if i.buildDate < 2022 {
                showroomCars.append(i)
                print("Автомобилю \(i.model) из-за года выпуска \(i.buildDate) полагается скидка. Сейчас цена \(i.price). Размер скидки \(newPrice). Машину перегнали в автосалон со стоянки")
                addEmergencyPack()
            } else {print(" Машине \(i.model) скидка не полагается. Она и так новая")

                }
            }
        }
    
   
    func addEmergencyPack () {
        self.offerAccesories(accesorise: ["аптечка", "огнетушитель"])
        print("-----------------------")
    }
}
 
audiCar.makeSpecialOffer()

extension VolvoDealer: SpecialOffer {
        func addEmergencyPack () {
            self.offerAccesories(accesorise: ["аптечка", "огнетушитель"])
            print("-----------------")
        }
    func makeSpecialOffer() {
        for i in  cars {
            let newPrice = (i.price / 100) * 15
            if i.buildDate < 2022 {
                showroomCars.append(i)
                print("Автомобилю \(i.model) из-за года выпуска \(i.buildDate) полагается скидка. Сейчас цена \(i.price). Размер скидки \(newPrice). Машину перегнали в автосалон со стоянки")
                addEmergencyPack()
            } else {print(" Машине \(i.model) скидка не полагается. Она и так новая")

                }
            }
        }
    }
volvoCar.makeSpecialOffer()
