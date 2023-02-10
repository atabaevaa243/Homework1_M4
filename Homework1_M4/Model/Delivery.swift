
import Foundation

let deliveryJSON = """
[{
    "deliveryImage" : "deliveryIcon",
    "deliveryLabel" : "Delivery",

},
{
    "deliveryImage" : "pickupIcon",
    "deliveryLabel" : "Pickup",

},
{
    "deliveryImage" : "cateringIcon",
    "deliveryLabel" : "Catering",

},
{
    "deliveryImage" : "curbsideIcon",
    "deliveryLabel" : "Curbside",

}]
"""

struct Delivery: Decodable {
    var deliveryImage: String
    var deliveryLabel: String
}
