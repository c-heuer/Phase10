//
//  Phase10Tests.swift
//  Phase10Tests
//
//  Created by Christian Heuer on 20.07.17.
//  Copyright © 2017 Christian Heuer. All rights reserved.
//

import XCTest
@testable import Phase10

class Phase10Tests: XCTestCase {
    
    var game = Game()
    
    override func setUp() {
        super.setUp()
        
        let player = Player()
        player.name = "Omchen"
        
        let result = RoundResult()
        result.round = 1
        result.roundCompleted = true
        result.score = 10
        
        player.rounds.append(result)
        
        game.players.append(player)
        
    }
    
    override func tearDown() {
        game.players.removeAll()
        
        super.tearDown()
    }
    
    func testModel() {
        XCTAssert(game.players.count == 1, "Count of Players <> 1")
        XCTAssert(game.players.first?.name == "Omchen", "Name of Player not Omchen")
        XCTAssert(game.players.first?.phase() == 2, "Player not in Phase 2")
        XCTAssert(game.players.first?.score() == 10, "Players score <> 10")
    }
    
    func testRound() {
        let result = RoundResult()
        result.round = 2
        result.roundCompleted = true
        result.score = 0
        
        game.players.first?.rounds.append(result)
        
        XCTAssert(game.players.first?.phase() == 3, "Player did not advance Round")
        XCTAssert(game.players.first?.score() == 10, "Score not 10")
        
    }
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
