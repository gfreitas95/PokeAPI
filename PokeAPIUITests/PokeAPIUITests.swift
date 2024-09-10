import XCTest

final class PokeAPIUITests: XCTestCase {

    func testTappingPokemon() throws {
        let app = XCUIApplication()
        app.launch()
        app.scrollViews.otherElements/*@START_MENU_TOKEN@*/.staticTexts["Venusaur"]/*[[".buttons[\"Venusaur\"].staticTexts[\"Venusaur\"]",".staticTexts[\"Venusaur\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }

    func testScrollingPokemonList() throws {
        let app = XCUIApplication()
        app.launch()
        
        let scrollViewsQuery = XCUIApplication().scrollViews
        let element = scrollViewsQuery.children(matching: .other).element(boundBy: 0).children(matching: .other).element
        element.swipeUp()
        scrollViewsQuery.otherElements/*@START_MENU_TOKEN@*/.staticTexts["Squirtle"]/*[[".buttons[\"Squirtle\"].staticTexts[\"Squirtle\"]",".staticTexts[\"Squirtle\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        element.swipeUp()
    }
    
    func testSearchingPokemon() throws {
        let app = XCUIApplication()
        app.launch()
        
        let scrollViewsQuery = XCUIApplication().scrollViews
        let element = scrollViewsQuery.children(matching: .other).element(boundBy: 0).children(matching: .other).element
        element.swipeDown()
        
        let searchBar = app.navigationBars["Pokedex"].searchFields["Search"]
        XCTAssertTrue(searchBar.exists)
        
        searchBar.tap()
        searchBar.typeText("Hitmonchan")
        scrollViewsQuery.otherElements.staticTexts["Hitmonchan"].tap()
    }
}
