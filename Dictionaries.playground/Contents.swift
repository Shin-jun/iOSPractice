import UIKit


let employee = ["name": "Taylor Swift", "job": "Singer", "location": "Nashville"]
print(employee["name", default: "Unknown"])


let hasGreduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false
]

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaqille O'Neal"] = 216

