import XCTest

final class PokeAPIUITests: XCTestCase {
    
    override class func setUp() {
        let app = XCUIApplication()
        app.launch()
        XCUIApplication().buttons["Gotta Catch ém All !"].tap()
    }
    
    func testTappingPokemonCardView() throws {
        let app = XCUIApplication()
        app.launch()
        app.scrollViews.otherElements.buttons["#1, Bulbasaur, grass"].tap()
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Back"].tap()
        
        let elementsQuery = app.scrollViews.otherElements
        let button = elementsQuery.buttons["#1, Bulbasaur, grass"]
        button.swipeUp()
        
        app.scrollViews.otherElements.buttons["#6, Charizard, fire"].tap()
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Back"].tap()
    }
    
    func testScrollingPokemonList() throws {
        let app = XCUIApplication()
        app.launch()
        
        let elementsQuery = app.scrollViews.otherElements
        let button = elementsQuery.buttons["#2, Ivysaur, grass"]
        button.swipeUp()
        
        let button2 = elementsQuery.buttons["#6, Charizard, fire"]
        button2.swipeUp()
    }
    
    func testSearchingPokemon() throws {
        let app = XCUIApplication()
        app.launch()
        app/*@START_MENU_TOKEN@*/.buttons["magnifyingglass"]/*[[".buttons[\"Search\"]",".buttons[\"magnifyingglass\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.textFields["Search Pokemon"].tap()
        app.scrollViews.otherElements.textFields["Search Pokemon"].typeText("lugia")
        elementsQuery.buttons["#249, Lugia, psychic"].tap()
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Back"].tap()
    }
    
    func testShowingAlertMessage() throws {
        let app = XCUIApplication()
        app.launch()
        app/*@START_MENU_TOKEN@*/.buttons["magnifyingglass"]/*[[".buttons[\"Search\"]",".buttons[\"magnifyingglass\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.textFields["Search Pokemon"].tap()
        app.scrollViews.otherElements.textFields["Search Pokemon"].typeText("gustavo")
        app.buttons["Ok"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["xmark.bin"]/*[[".buttons[\"Junk\"]",".buttons[\"xmark.bin\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testTappingFavoriteButton() throws {
        let app = XCUIApplication()
        app.launch()
        app.scrollViews.otherElements.buttons["#1, Bulbasaur, grass"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["heart"]/*[[".buttons[\"Love\"]",".buttons[\"heart\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["heart.fill"]/*[[".buttons[\"Love\"]",".buttons[\"heart.fill\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Back"].tap()
    }
}
