import XCTest
@testable import PokeAPI

final class PokemonViewModelTests: XCTestCase {
    
    let viewModel = PokemonViewModel()
    
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
    
    func testIfPokemonListIsClear() {
        let result = viewModel.pokemonList.isEmpty
        XCTAssertEqual(result, true)
    }
    
    func testIfCatchedPokemonIsClear() {
        let result = viewModel.catchedPokemon.isEmpty
        XCTAssertEqual(result, true)
    }
}
