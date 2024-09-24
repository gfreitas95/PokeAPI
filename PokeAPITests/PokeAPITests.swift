import XCTest
@testable import PokeAPI

final class PokeAPITests: XCTestCase {
    
    var viewModel: PokemonViewModel!
    
    override func setUp() async throws {
        viewModel = PokemonViewModel()
    }
    
    func testViewModelInit() {
        XCTAssertNotNil(viewModel)
    }
    
    func testIfSearchBarIsClear() {
        let result = viewModel.searchText
        XCTAssertEqual(result, "")
    }
    
    func testIfSearchBarPlaceholderIsShowing() {
        let result = viewModel.searchBarPlaceholder
        XCTAssertEqual(result, "Search Pokemon")
    }
    
    func testIfSearchBarImageIsShowing() {
        let result = viewModel.searchBarImage
        XCTAssertEqual(result, "magnifyingglass")
    }
    
    func testIfOffsetIsZero() {
        let result = viewModel.offset
        XCTAssertEqual(result, 0)
    }
    
    func testIfIsLoading() {
        let result = viewModel.isLoading
        XCTAssertEqual(result, false)
    }
    
    func testIfIsShowingAlert() {
        let result = viewModel.isShowingAlert
        XCTAssertEqual(result, false)
    }
    
    func testIfPokemonViewTitleIsDisplayed() {
        let result = viewModel.pokemonViewTitle
        XCTAssertNotNil(result)
        XCTAssertEqual(result, "Pokemon")
    }
    
    func testIfPokemonViewImageIsDisplayed() {
        let result = viewModel.pokemonViewImage
        XCTAssertNotNil(result)
        XCTAssertEqual(result, "person.3.fill")
    }
    
    func testIfPokedexViewTitleIsDisplayed() {
        let result = viewModel.pokedexViewTitle
        XCTAssertNotNil(result)
        XCTAssertEqual(result, "Pokedex")
    }
    
    func testIfPokedexViewImageIsDisplayed() {
        let result = viewModel.pokedexViewImage
        XCTAssertNotNil(result)
        XCTAssertEqual(result, "books.vertical.fill")
    }
    
    func testIfPokemonListIsClear() {
        let result = viewModel.pokemonList.isEmpty
        XCTAssertEqual(result, true)
    }
    
    func testIfCatchedPokemonIsClear() {
        let result = viewModel.catchedPokemon.isEmpty
        XCTAssertEqual(result, true)
    }
}
