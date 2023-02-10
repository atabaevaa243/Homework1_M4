
import Foundation

let productJSON = """
[{
    "productImage" : "burgerImage",
    "productName" : "Burger Craze",
    "productTime" : "Open",
    "productReting" : "4.6 (601)",
    "productCountry" : "American",
    "productType" : "Burgers",
    "productDelivery" : "Delivery: FREE",
    "productDeliveryPrice" : "Minimum: $10",
    "timeOfDelivery" : "15-20 min",
    "productLocation" : "1.5 km away"
},
{
    "productImage" : "pizzaImage",
    "productName" : "Vegetarian Pizza",
    "productTime" : "Open",
    "productReting" : "4.6 (601)",
    "productCountry" : "Italian",
    "productType" : "Pizza",
    "productDelivery" : "Delivery: FREE",
    "productDeliveryPrice" : "Minimum: $10",
    "timeOfDelivery" : "10-15 min",
    "productLocation" : "1.8 km away"
}]
"""

struct Product: Decodable {
    var productImage: String
    var productName: String
    var productTime: String
    var productReting: String
    var productCountry: String
    var productType: String
    var productDelivery: String
    var productDeliveryPrice: String
    var timeOfDelivery: String
    var productLocation: String
}
