import UIKit

var str = "Hello, playground"

var age = 42
age = 10

age = Int(10.5)

let a = 20
let b = 2
let c = Double(a) / Double(b) // ?????

let d = 4.5
let e: Float = 2.5

let f: String

//print(f) //Constant 'f' used before being initialized


switch a {
case 0:
    print("0")
    break
case 2:
    print("2")
    fallthrough
case 5:
    print("5")
    fallthrough
default:
    print("Autre chose")
}

switch a {
case 0...10: //entre 0 et 10 INCLUS
    print("Entre 0 et 10")
case 11..<20: // Entre 11 et 20 EXCLUS
    print("Entre 11 et 19")
default:
    print("")
}

let temp = 75

switch temp {
case ..<65:
    print("Too cold")
case 65...75:
    print("It's ok")
case 75...:
    print("too hot")
default:
    print("default")
    break
}

let text = """
       iOS 14 brings a fresh look to the things you do
       most often, making them easier than ever. New
        features help you get what you need in the moment. And the apps you use all the time become even more intelligent, more personal, and more private. 🤔🤔👨🏽
   """
print(text)
text.count
text.unicodeScalars.count

let char: Character = "è"

switch char {
case "A"..."é":
    print("test")
default:
    print("")
}

//CharacterSet.capitalizedLetters

a.isMultiple(of: 2)
a.distance(to: 10)


func multiply(_ firstNumber: Int, by secondNumber: Int) -> Int {
    firstNumber * secondNumber
}

multiply(2, by: 5)

//text.remove(at: 5)
//text.insert("A", at: 5)
//text.append("AZ")

func display(teamName: String, score: Int = 0) -> Int {
  print("\(teamName): \(score)")

    return Int(4.8)
}

struct Temperature {
    var celsius: Double
//    var kelvin: Double {
//        celsius + 273.15
//    }

    var kelvin: Double  {
        get {
            celsius + 273.15
        }

        set {
            celsius = newValue - 273.15
        }
    }

    init(celsius: Double) {
        self.celsius = celsius
    }

    init(fahrenheit: Double) {
        celsius = (fahrenheit - 32) / 1.8
    }

    init(kelvin: Double) {
        celsius = kelvin - 273.15
    }

}

var temperature = Temperature(kelvin: 0)

print(temperature.celsius)
print(temperature.kelvin)

temperature.kelvin = 0

class Vehicle {
    var currentSpeed: Double = 0.0

   var description: String {
     "traveling at \(currentSpeed) miles per hour"
   }

   func makeNoise() {
      // do nothing - an arbitrary vehicle doesn't necessarily make a noise
   }
}

let aVehicle = Vehicle()
print(aVehicle.description)

struct Book {
    var title: String
    var pubYear: Int?
}

let aBook = Book(title: "SwiftUI for dummies", pubYear: 2020)

let pubYear: Int? = aBook.pubYear

if pubYear != nil {
    print(pubYear!)
} else {
    print("Livre non publié")
}
