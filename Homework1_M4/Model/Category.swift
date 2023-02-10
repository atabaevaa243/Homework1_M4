
import Foundation

let categoryJSON = """
[{
    "categoryImage" : "takeaways",
    "categoryLabel" : "Takeaways",
},
{
    "categoryImage" : "grocery",
    "categoryLabel" : "Grocery",
},
{
    "categoryImage" : "convinience",
    "categoryLabel" : "Convinience",
},
{
    "categoryImage" : "pharmacy",
    "categoryLabel" : "Pharmacy",
}]
"""

struct Category: Decodable {
    let categoryImage: String
    let categoryLabel: String
}
