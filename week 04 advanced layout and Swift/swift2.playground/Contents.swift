//class

class Vehicle {
    var wheelNum = 4
    var speed = 25
    var mpg = 20
    let tankCapacity = 20
    var name : String?
    
    func changeSpeed(amount: Int){
        speed = speed + amount
    }
    func changeEfficiency(newSpeed: Int, newmpg: Int){
        speed = newSpeed
        mpg = newmpg
    }
    
    //initializers
//    init(vehicleName vname: String){
//        name = vname
//    }
//    init(){
//    }
}

//instance

//let myJeep = Vehicle()
//myJeep.mpg
//myJeep.speed
//myJeep.name

//initialization

//let myHybrid = Vehicle(vehicleName: "Prius")
//myHybrid.name
//
//if myHybrid.name != nil {
//    print(myHybrid.name!)
//}

//methods

//myJeep.changeSpeed(amount: 10)
//myJeep.speed
//myJeep.changeEfficiency(newSpeed: 35, newmpg: 25)
//myJeep.speed
//myJeep.mpg

//inheritance

class Bicycle : Vehicle {
    var reflectors = false

//    init(_ ref: Bool){
//        reflectors=ref
//        super.init()
//    }
//
//    override init(){
//        super.init()
//    }

}

//var bike = Bicycle()
//bike.wheelNum
//bike.wheelNum = 2
//bike.wheelNum
//
//bike.reflectors
// myJeep.reflectors //error

//classes are reference types

//var new_bike = bike
//new_bike.reflectors
//new_bike.reflectors = true
//new_bike.reflectors
//bike.reflectors

//structs are value types

//struct Skateboard {
//    var color : String
//    var type : String
//}
//
//var board = Skateboard(color: "black", type: "longboard")
//board.color
//var new_board = board
//new_board.color
//new_board.color = "purple"
//new_board.color
//board.color

//arrays

//var myList2:[String]
//var myList=[String]()
//var shoppingList=["cereal", "milk"]
//print(shoppingList[0])
//
//shoppingList.append("bread")
//
//if shoppingList.isEmpty{
//    print("there's nothing you need")
//} else {
//    print("You need \(shoppingList.count)" + " items")
//}
//
//let item = shoppingList.removeLast()
//print("\(shoppingList.count)")
//
//shoppingList.insert("coffee", at:0)
//let olditem=shoppingList.remove(at: 1)

//dictionaries

//var newList:[String:String]
//var classes:[String: String]=["4120":"MAD", "2200":"Web"]
////var classes=["4120":"MAD", "2200":"Web"]
//classes["4120"]
//classes["2000"]="MIT"
//classes.count
//
//classes.updateValue("Mobile App Dev", forKey: "4120")
//classes["4120"]
//classes.removeValue(forKey: "2200")
//classes.count






