import XCTest
@testable import PokeAPI

final class PokemonServiceTests: XCTestCase {
    
    override class func setUp() {
        let app = XCUIApplication()
        app.launch()
        XCUIApplication().buttons["Gotta Catch ém All !"].tap()
    }
    
    func testGetListOfPokemon() {
        var responseData: Data?
        var responseError: Error?
        
        guard let url = URL(string: .pokeAPIListUrl(limit: 9)) else { return }
        let expectation = self.expectation(description: "GET \(url)")
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            responseData = data
            responseError = error
            expectation.fulfill()
        }
        .resume()
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNil(responseError)
        XCTAssertNotNil(responseData)
        
        if let data = responseData {
            do {
                if let response = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    XCTAssertTrue(response.count > 0)
                } else {
                    XCTFail("\n Response is not a valid JSON array \n")
                }
            } catch {
                XCTFail("\n Failed to parse JSON: \(error)\n")
            }
        }
    }
    
    func testSearchForAPokemon() {
        var responseData: Data?
        var responseError: Error?
        
        guard let url = URL(string: .pokeAPISearchUrl(name: "lugia")) else { return }
        let expectation = self.expectation(description: "GET \(url)")
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            responseData = data
            responseError = error
            expectation.fulfill()
        }
        .resume()
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNil(responseError)
        XCTAssertNotNil(responseData)
        
        if let data = responseData {
            do {
                if let response = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    XCTAssertTrue(response.count > 0)
                } else {
                    XCTFail("\n Response is not a valid JSON array \n")
                }
            } catch {
                XCTFail("\n Failed to parse JSON: \(error)\n")
            }
        }
    }
    
    func testGetDetailsOfPokemon() {
        var responseData: Data?
        var responseError: Error?
        
        guard let url = URL(string: .pokeAPIDetailsUrl(id: 12)) else { return }
        let expectation = self.expectation(description: "GET \(url)")
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            responseData = data
            responseError = error
            expectation.fulfill()
        }
        .resume()
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNil(responseError)
        XCTAssertNotNil(responseData)
        
        if let data = responseData {
            do {
                if let response = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    XCTAssertTrue(response.count > 0)
                } else {
                    XCTFail("\n Response is not a valid JSON array \n")
                }
            } catch {
                XCTFail("\n Failed to parse JSON: \(error)\n")
            }
        }
    }
    
    func testGetSpritesOfPokemon() {
        var responseData: Data?
        var responseError: Error?
        
        guard let url = URL(string: .pokeAPISpritesUrl(id: 99)) else { return }
        let expectation = self.expectation(description: "GET \(url)")
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            responseData = data
            responseError = error
            expectation.fulfill()
        }
        .resume()
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNil(responseError)
        XCTAssertNotNil(responseData)
        
        if let data = responseData {
            do {
                if let response = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    XCTAssertTrue(response.count > 0)
                } else {
                    XCTFail("\n Response is not a valid JSON array \n")
                }
            } catch {
                XCTFail("\n Failed to parse JSON: \(error)\n")
            }
        }
    }
}
