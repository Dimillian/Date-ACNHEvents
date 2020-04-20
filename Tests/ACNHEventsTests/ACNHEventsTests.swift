import XCTest
@testable import ACNHEvents

final class ACNHEventsTests: XCTestCase {

    func testEarthDay() {
        let c = DateComponents(calendar: .current, month: 4, day: 22)
        let d = Calendar.current.date(from: c)
        XCTAssertEqual(d?.isEarthDay, true)
    }
    
    func testNewYearDay() {
        let c = DateComponents(calendar: .current, month: 1, day: 1)
        let d = Calendar.current.date(from: c)
        XCTAssertEqual(d?.isNewYearsDay, true)
    }
    
    func testNewYearEve() {
        let c = DateComponents(calendar: .current, month: 12, day: 31)
        let d = Calendar.current.date(from: c)
        XCTAssertEqual(d?.isNewYearsEve, true)
    }
    
    func testSpringFishTourney() {
        let c = DateComponents(calendar: .current, year: 2020, month: 4, day: 11)
        let d = Calendar.current.date(from: c)
        XCTAssertEqual(d?.isFishingTourneyDay, true)
    }
    
    func testSummerFishTourney() {
        let c = DateComponents(calendar: .current, year: 2020, month: 7, day: 11)
        let d = Calendar.current.date(from: c)
        XCTAssertEqual(d?.isFishingTourneyDay, true)
    }
    
    func testFallFishTourney() {
        let c = DateComponents(calendar: .current, year: 2020, month: 10, day: 10)
        let d = Calendar.current.date(from: c)
        XCTAssertEqual(d?.isFishingTourneyDay, true)
    }
    
    func testWinterFishTourney() {
        let c = DateComponents(calendar: .current, year: 2020, month: 1, day: 11)
        let d = Calendar.current.date(from: c)
        XCTAssertEqual(d?.isFishingTourneyDay, true)
    }
    
    func testNorthCherryBlossomSeason() {
        let c = DateComponents(calendar: .current, year: 2020, month: 4, day: 1)
        let d = Calendar.current.date(from: c)
        XCTAssertEqual(d?.isCherryBlossomSeason(.north), true)
        
        let c1 = DateComponents(calendar: .current, year: 2020, month: 4, day: 10)
        let d1 = Calendar.current.date(from: c1)
        XCTAssertEqual(d1?.isCherryBlossomSeason(.north), true)
        
        let c2 = DateComponents(calendar: .current, year: 2020, month: 4, day: 11)
        let d2 = Calendar.current.date(from: c2)
        XCTAssertEqual(d2?.isCherryBlossomSeason(.north), false)
    }
    
    func testSouthCherryBlossomSeason() {
        let c = DateComponents(calendar: .current, year: 2020, month: 10, day: 1)
        let d = Calendar.current.date(from: c)
        XCTAssertEqual(d?.isCherryBlossomSeason(.south), true)
        
        let c1 = DateComponents(calendar: .current, year: 2020, month: 10, day: 10)
        let d1 = Calendar.current.date(from: c1)
        XCTAssertEqual(d1?.isCherryBlossomSeason(.south), true)
        
        let c2 = DateComponents(calendar: .current, year: 2020, month: 10, day: 11)
        let d2 = Calendar.current.date(from: c2)
        XCTAssertEqual(d2?.isCherryBlossomSeason(.south), false)
    }
    
    func testBunnyDay() {
        let c = DateComponents(calendar: .current, year: 2020, month: 4, day: 1)
        let d = Calendar.current.date(from: c)
        XCTAssertEqual(d?.isBunnyDay, true)
        
        let c1 = DateComponents(calendar: .current, year: 2020, month: 4, day: 12)
        let d1 = Calendar.current.date(from: c1)
        XCTAssertEqual(d1?.isBunnyDay, true)
        
        let c2 = DateComponents(calendar: .current, year: 2020, month: 4, day: 13)
        let d2 = Calendar.current.date(from: c2)
        XCTAssertEqual(d2?.isBunnyDay, false)
    }
    
    func testNorthBugDayOffs() {
        let c = DateComponents(calendar: .current, year: 2020, month: 6, day: 20)
        let d = Calendar.current.date(from: c)
        XCTAssertEqual(d?.isBugOffDay(.north), true)
        
        let c1 = DateComponents(calendar: .current, year: 2020, month: 7, day: 18)
        let d1 = Calendar.current.date(from: c1)
        XCTAssertEqual(d1?.isBugOffDay(.north), true)
        
        let c2 = DateComponents(calendar: .current, year: 2020, month: 8, day: 15)
        let d2 = Calendar.current.date(from: c2)
        XCTAssertEqual(d2?.isBugOffDay(.north), true)
        
        let c3 = DateComponents(calendar: .current, year: 2020, month: 9, day: 19)
        let d3 = Calendar.current.date(from: c3)
        XCTAssertEqual(d3?.isBugOffDay(.north), true)
    }
    
    func testSouthBugDayOffs() {
        let c = DateComponents(calendar: .current, year: 2020, month: 11, day: 21)
        let d = Calendar.current.date(from: c)
        XCTAssertEqual(d?.isBugOffDay(.south), true)
        
        let c1 = DateComponents(calendar: .current, year: 2020, month: 12, day: 19)
        let d1 = Calendar.current.date(from: c1)
        XCTAssertEqual(d1?.isBugOffDay(.south), true)
        
        let c2 = DateComponents(calendar: .current, year: 2020, month: 1, day: 18)
        let d2 = Calendar.current.date(from: c2)
        XCTAssertEqual(d2?.isBugOffDay(.south), true)
        
        let c3 = DateComponents(calendar: .current, year: 2020, month: 2, day: 15)
        let d3 = Calendar.current.date(from: c3)
        XCTAssertEqual(d3?.isBugOffDay(.south), true)
    }
    
    static var allTests = [
        ("testEarthDay", testEarthDay),
        ("testNewYearDay", testNewYearDay),
        ("testNewYearEve", testNewYearEve),
        ("testSpringFishTourney", testSpringFishTourney),
        ("testSummerFishTourney", testSummerFishTourney),
        ("testFallFishTourney", testFallFishTourney),
        ("testWinterFishTourney", testWinterFishTourney),
        ("testNorthCherryBlossomSeason", testNorthCherryBlossomSeason),
        ("testSouthCherryBlossomSeason", testSouthCherryBlossomSeason),
        ("testBunnyDay", testBunnyDay),
        ("testNorthBugDayOffs", testNorthBugDayOffs),
        ("testSouthBugDayOffs", testSouthBugDayOffs),
    ]
}
