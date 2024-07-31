import Foundation

class RewardViewModel: ObservableObject {
    let calendar = Calendar.current
    
    var listRewards : [Reward] = [
        Reward(nameCoffee: "americano", dateOrder: Date(), pts: 12),
        Reward(nameCoffee: "latte",  dateOrder: Date(), pts: 12),
        Reward(nameCoffee: "raf",  dateOrder: Date(), pts: 12),
        Reward(nameCoffee: "flat",  dateOrder: Date(), pts: 12),
        Reward(nameCoffee: "americano",  dateOrder: Date(), pts: 12)
    ]
    
    @Published var royalCart : [String?] = [
        "X","X","X","X","X",nil, nil,nil
    ]
    
    @Published var point : Int = 2750
    
    func getDateComponent(from date: Date) -> String {
        let dateComponent = calendar.component(.day, from: date)
        return "\(dateComponent)"
    }
    
    func getMonthComponent(from date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM"
            return dateFormatter.string(from: date)
        }
    
    func getHourComponent(from date: Date) -> String {
        let hourComponent = calendar.component(.hour, from: date)
        return String(format: "%02d", hourComponent)
    }
    
    func getMinuteComponent(from date: Date) -> String {
        let minuteComponent = calendar.component(.minute, from: date)
        return String(format: "%02d", minuteComponent)
    }
    
    func getDateFollowFormat(date: Date) -> String {
        let day = getDateComponent(from: date)
        let month = getMonthComponent(from: date)
        let hours = getHourComponent(from: date)
        let minutes = getMinuteComponent(from: date)
        
        return "\(day) \(month) | \(hours):\(minutes)"
    }
    
    func getAmountRoyal() -> Int {
        var count = 0
        for item in royalCart {
            if item != nil {
                count += 1
            }
        }
        return count
    }
}
