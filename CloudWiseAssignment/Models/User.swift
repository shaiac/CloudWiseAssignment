import SwiftUI

class User: Identifiable, Codable {
    var fullName: String = ""
    var email: String = ""
    var password: String = ""
    var phone: String = ""
    var vehiclenumber: String = ""
    var fuelConsumtion: Float = 0.0
    
}

class UserData: ObservableObject {
    @Published var user: User
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "UserData") {
            if let decoded = try? JSONDecoder().decode(User.self, from: data) {
                user = decoded
                return
            }
        }
        user = User()
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: "UserData")
        }
    }
    
}
