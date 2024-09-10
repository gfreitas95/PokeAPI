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
    
    func testIfTitleIsDisplayed() {
        let result = viewModel.title
        XCTAssertNotNil(result)
        XCTAssertEqual(result, "Pokedex")
    }
    
    func testIfHeightIsDisplayed() {
        let result = viewModel.height
        XCTAssertNotNil(result)
    }
    
    func testIfWeightIsDisplayed() {
        let result = viewModel.weight
        XCTAssertNotNil(result)
    }
    
    func testIfIdIsDisplayed() {
        let result = viewModel.id
        XCTAssertNotNil(result)
    }
    
    func testIfTheresAListOfPokemon() {
        let result = viewModel.pokemonList
        XCTAssertNotNil(result)
    }
    
    func testIfTheresSpriteData() {
        let result = viewModel.pokemonSpriteUrl(pokemon: .mock())
        XCTAssertNotNil(result)
    }
    
    func testIfTheresAIdToFilterData() {
        let result = viewModel.getPokemonId(pokemon: .mock())
        XCTAssertNotNil(result)
    }
    
    func testIfTheresPokemonDetailsData() {
        let result: () = viewModel.getPokemonDetails(pokemon: .mock())
        XCTAssertNotNil(result)
    }
}
