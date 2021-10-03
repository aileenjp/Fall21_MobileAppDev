//ARC

// class

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

// define variables
var person1: Person?
var person2: Person?
var person3: Person?

//initialize and create the instance
person1 = Person(name: "John Appleseed")
// 1 strong reference

person2 = person1
person3 = person1
// 2 more strong references, count=3

person1 = nil
person2 = nil
// 2 strong references removed, count=1

person3 = nil
// last strong reference removed, count=0, memory deallocated


//Strong Reference Cycle

//class Person{
//    let name: String
//    var apartment: Apartment?
//    init(name: String) {
//        self.name = name
//        print("\(name) is being initialized")
//    }
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//class Apartment {
//    let unit: String
//    var tenant: Person?
//    init(unit: String) {
//        self.unit = unit
//        print("Apartment \(unit) is being initialized")
//    }
//    deinit {
//        print("Apartment \(unit) is being deinitialized")
//    }
//}
//
//// define variables
//var john: Person?
//var unit4A: Apartment?
//
////initialize and create the instance
//john = Person(name: "John Appleseed")
//unit4A = Apartment(unit: "4A")
//
////instances get linked together
//john?.apartment = unit4A
//unit4A?.tenant = john
//
////break strong references
//john = nil
//unit4A = nil



//Breaking the Strong Reference Cycle

//class Person{
//    let name: String
//    var apartment: Apartment?
//    init(name: String) {
//        self.name = name
//        print("\(name) is being initialized")
//    }
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//class Apartment {
//    let unit: String
//    weak var tenant: Person?
//    init(unit: String) {
//        self.unit = unit
//        print("Apartment \(unit) is being initialized")
//    }
//    deinit {
//        print("Apartment \(unit) is being deinitialized")
//    }
//}
//
////define variables
//var john: Person?
//var unit4A: Apartment?
//
////initialize and create the instance
//john = Person(name: "John Appleseed")
//unit4A = Apartment(unit: "4A")
//
////instances get linked together
//john?.apartment = unit4A
//unit4A?.tenant = john
//
////break strong references
//john = nil
//unit4A = nil




