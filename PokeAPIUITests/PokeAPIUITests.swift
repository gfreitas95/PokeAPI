import XCTest

final class PokeAPIUITests: XCTestCase {
    
    func testTappingPokemonAtPokedexView() throws {
        let app = XCUIApplication()
        app.launch()
        app.tabBars["Tab Bar"].buttons["Pokedex"].tap()
        app.scrollViews.otherElements.buttons["#1, Bulbasaur, grass"].tap()
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Pokedex"].tap()
    }
    
    func testScrollingPokedexView() throws {
        let app = XCUIApplication()
        app.launch()
        app.tabBars["Tab Bar"].buttons["Pokedex"].tap()
        
        let elementsQuery = app.scrollViews.otherElements
        let button = elementsQuery.buttons["#2, Ivysaur, grass"]
        button.swipeUp()
        
        let button2 = elementsQuery.buttons["#6, Charizard, fire"]
        button2.swipeUp()
    }
    
    func testSearchingPokemon() throws {
        let app = XCUIApplication()
        app.launch()
        XCUIApplication().scrollViews.otherElements.textFields["Search Pokemon"].tap()
        XCUIApplication().scrollViews.otherElements.textFields["Search Pokemon"].typeText("lugia")
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.textFields["Search Pokemon"].tap()
        elementsQuery.buttons["#249, Lugia, psychic"].tap()
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Pokemon"].tap()
    }
    
    func testShowingAlertMessage() throws {
        let app = XCUIApplication()
        app.launch()
        XCUIApplication().scrollViews.otherElements.textFields["Search Pokemon"].tap()
        XCUIApplication().scrollViews.otherElements.textFields["Search Pokemon"].typeText("gustavo")
        app.alerts["Ops ..."].scrollViews.otherElements.buttons["OK"].tap()
    }
}
