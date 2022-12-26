import UIKit

let actor = "Denzel Washington"
let filename = "paris.jpg"
let result = " Yon Win!"

let quote = "Then he tapped a sign saying \"Believe\" and walked away."

let movie = """
A day in
the life of an
Apple enngineer
"""

print(actor.count)
let nameLength = actor.count
print(nameLength)

// 모든 글자를 대문자로 변경
print(result.uppercased())

// 문자열이 선택한 문자로 시작하는지 여부를 알려준다.
print(movie.hasPrefix("A day"))
// 문자열이 선택한 문자로 끝나는지 여부를 알려준다,
print(filename.hasSuffix(".jpg"))
