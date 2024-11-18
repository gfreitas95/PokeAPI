import SwiftUI

enum PokeAPIErrors: String, Error {
    case invalidUrl = "Unable to complete your request. Please try again"
    case invalidData = "The data received from the server was invalid. Please try again"
    case invalidResponse = "Invalid response from the server. Please try again"
    case pokemonNotFound = "It seems that we haven't registered this pokemon in our files yet.\nPlease try again"
    case defaultError = "A wild error appears: "
}
