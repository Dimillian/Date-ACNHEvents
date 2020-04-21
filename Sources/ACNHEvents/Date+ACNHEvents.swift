import Foundation

public enum Hemisphere {
    case north, south
}

public enum Event {
    // 1.0.0 - 1.1.4
    case bunnyDay, fishingTourney, earthDay, newYearsDay, newYearsEve, cherryBlossumSeason, bugOff
    // 1.2.0
    case natureDay, mayDay, museumDay, weddingSeason
}

public extension Date {
    func events(for hemisphere: Hemisphere) -> [Event] {
        var events: [Event] = []
        
        // v1.0.0 - 1.1.4
        if isBunnyDay { events.append(.bunnyDay) }
        if isFishingTourneyDay { events.append(.fishingTourney) }
        if isEarthDay { events.append(.earthDay) }
        if isNewYearsDay { events.append(.newYearsDay) }
        if isNewYearsEve { events.append(.newYearsEve) }
        if isCherryBlossomSeason(hemisphere) { events.append(.cherryBlossumSeason) }
        if isBugOffDay(hemisphere) { events.append(.bugOff) }
        
        // v1.2.0
        if isNatureDay { events.append(.natureDay) }
        if isMayDay { events.append(.mayDay) }
        if isMuseumDay { events.append(.museumDay) }
        if isWeddingSeason { events.append(.weddingSeason) }

        return events
    }
    
    var isBunnyDay: Bool {
        let components = Calendar.current.dateComponents([.day, .month], from: self)
        
        guard let month = components.month, let day = components.day else {
            return false
        }

        return month == 4 && day >= 1 && day <= 12
    }
    
    var isNatureDay: Bool {
        let components = Calendar.current.dateComponents([.day, .month], from: self)
        
        guard let month = components.month, let day = components.day else {
            return false
        }
        
        return (month == 4 && day >= 23 && day <= 31) || (month == 5 && day <= 4)
    }
    
    var isMayDay: Bool {
        let components = Calendar.current.dateComponents([.day, .month], from: self)
        
        guard let month = components.month, let day = components.day else {
            return false
        }
        
        return month == 5 && day >= 1 && day <= 7
    }
    
    var isMuseumDay: Bool {
        let components = Calendar.current.dateComponents([.day, .month], from: self)
        
        guard let month = components.month, let day = components.day else {
            return false
        }
        
        return month == 5 && day >= 18 && day <= 31
    }
    
    var isWeddingSeason: Bool {
        let components = Calendar.current.dateComponents([.day, .month], from: self)
        
        guard let month = components.month, let day = components.day else {
            return false
        }
        
        return month == 6 && day >= 1 && day <= 30
    }
    
    var isFishingTourneyDay: Bool {
        let components = Calendar.current.dateComponents([.day, .month, .weekday], from: self)
        
        guard let month = components.month, let day = components.day else {
            return false
        }
        
        switch month {
        case 1, 4, 7, 10:
            return components.weekday == 7 && (day - 1) / 7 == 1
        default:
            return false
        }
    }
    
    var isEarthDay: Bool {
        let components = Calendar.current.dateComponents([.day, .month], from: self)
        
        guard let month = components.month, let day = components.day else {
            return false
        }
        
        return month == 4 && day == 22
    }
    
    var isNewYearsDay: Bool {
        let components = Calendar.current.dateComponents([.day, .month], from: self)
        
        guard let month = components.month, let day = components.day else {
            return false
        }
        
        return month == 1 && day == 1
    }
    
    var isNewYearsEve: Bool {
        let components = Calendar.current.dateComponents([.day, .month], from: self)
        
        guard let month = components.month, let day = components.day else {
            return false
        }
        
        return month == 12 && day == 31
    }
    
    func isCherryBlossomSeason(_ hemisphere: Hemisphere) -> Bool {
        let components = Calendar.current.dateComponents([.day, .month], from: self)

        guard let month = components.month, let day = components.day else {
            return false
        }
        
        let inDayRange = (day >= 1 && day <= 10)
        
        switch hemisphere {
        case .north:
            return month == 4 && inDayRange
        case .south:
            return month == 10 && inDayRange
        }
    }
    
    func isBugOffDay(_ hemisphere: Hemisphere) -> Bool {
        let components = Calendar.current.dateComponents([.day, .month, .weekday], from: self)

        guard let month = components.month, let day = components.day else {
            return false
        }
        
        switch hemisphere {
        case .north:
            switch month {
            case 6, 7, 8, 9:
                return components.weekday == 7 && (day - 1) / 7 == 2
            default:
                return false
            }
        case .south:
            switch month {
            case 1, 2, 11, 12:
                return components.weekday == 7 && (day - 1) / 7 == 2
            default:
                return false
            }
        }
    }
}
