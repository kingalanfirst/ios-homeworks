
import Foundation

struct Post {
    var title: String // title of post
    var author: String
    var description: String // text of post
    var image: String
    var likes: Int // number of likes
    var views: Int // number of views
}

let robberyPost = Post(title: "Crime went fail - move to jail",
                       author: "LA Weekly",
                       description: """
At sunday afternoon the vizitors of the fastfood restaurant called "Chiken Surprize" have witnessed the most epic dumb fail robbery of the year.
A 42 years old woman named Carla Karlmarks wearing paper bag over her head came in to the restaurant and started to threaten the stuff with non-existent weapon.
Her requirements were incredibly simple. The mad woman wanted all the money the stuff and clients had. "All right, everybody be cool, this is a robbery! Any of you chiken pricks move, and I'll execute every fatherfiring last one of ya!" she said.
""",
                       image: "robbery.png",
                       likes: 665,
                       views: 5999)

let eatingPost = Post(title: "Joey wins Coney Island Hot Dog-Eating Contest",
                       author: "NY Times",
                       description: """
We've all been there before. The Fourth of July picnic is almost over and you're faced with the question of whether you should have that fourth or fifth hot dog. For competitors in the Nathan's Hot Dog Eating Contest, that would be a mere snack.
The annual competition is returning to its Coney Island location in New York for yet another year, where competitors stuff their faces with dozens of hot dogs and buns in a 10-minute span.
Joey "Jaws" Chestnut is seeking his 15th Mustard Belt. He won again in 2021 a year after setting a new record in the 2020 contest by eating 74 hot dogs, a full 33 more than the next best competitor.
""",
                       image: "eating.png",
                       likes: 377,
                       views: 1277)

let elephantPost = Post(title: "Why elephants need our protection",
                       author: "Al Jazeera",
                       description: """
Kenyan reporter Alvin Kaunda had an important message for viewers about human impacts on the environment. A nearby baby elephant had other concerns.
Kaunda, flanked by several elephants at the Sheldrick Wildlife Trust in Nairobi, Kenya, began his report discussing a charity ball that would fund efforts to protect natural elephant habitats.
""",
                       image: "elephant.png",
                       likes: 901,
                       views: 2791)

let camelPost = Post(title: "Camel pageant on Qatar World Cup sidelines",
                       author: "Hasavyurt Today",
                       description: """
Like all good pageant contestants, Nazaa'a displayed not only dazzling beauty but also poise and grace. She batted her eyelashes and flashed a toothy smile for the television cameras at the Mzayen World Cup, a pageant held in the Qatari desert about 15 miles (25 kilometers) away from Doha and soccer's World Cup.
""",
                       image: "camel.png",
                       likes: 355,
                       views: 1234)
