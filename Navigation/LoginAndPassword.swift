
import Foundation

struct LoginAndPassword {
    var login: String
    var password: String
}

var john: LoginAndPassword = LoginAndPassword(login: "somename@mail.ru", password: "qwerty123")
var garry: LoginAndPassword = LoginAndPassword(login: "garry@gmail.com", password: "abc12345")
var bill: LoginAndPassword = LoginAndPassword(login: "person@yahoo.com", password: "12345678")



var usersArray: [LoginAndPassword] = [john, garry, bill]
