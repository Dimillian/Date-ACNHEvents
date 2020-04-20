import Foundation

public enum Hemisphere {
    case north, south
}

public extension Date {
    var isBunnyDay: Bool {
        let components = Calendar.current.dateComponents([.day, .month], from: self)
        
        guard let month = components.month, let day = components.day else {
            return false
        }

        return month == 4 && day >= 1 && day <= 12
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
