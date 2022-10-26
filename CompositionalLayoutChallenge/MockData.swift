//
//  MockData.swift
//  CompositionalLayoutChallenge
//
//  Created by Григорий Душин on 26.10.2022.
//

import Foundation

struct ListItem {
    let title1: String
    let title2: String
    let image: String
}

enum ListSection {
    case one([ListItem])
    case two([ListItem])
    case three([ListItem])
    case four([ListItem])
    case five([ListItem])
    case six([ListItem])
    case seven([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .one(let items),
                .two(let items),
                .three(let items),
                .four(let items),
                .five(let items),
                .six(let items),
                .seven(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .one:
            return "hui"
        case .two:
            return "hui"
        case .three:
            return "hui"
        case .four:
            return "hui"
        case .five:
            return "Первая ступень"
        case .six:
            return "Вторая ступень"
        case .seven:
            return "hui"
        }
    }
}

struct MockData {
    static let shared = MockData()
    
    private let one: ListSection = {
        .one([.init(title1: "", title2: "", image: "rocket")])
    }()
    
    private let two: ListSection = {
        .two([.init(title1: "FalconHeavy", title2: "", image: "")])
    }()
    
    private let three: ListSection = {
        .three([.init(title1: "Высота", title2: "229", image: ""),
                     .init(title1: "Диаметр", title2: "39", image: ""),
                     .init(title1: "Масса", title2: "3125000", image: ""),
                     .init(title1: "Нагрузка", title2: "140660", image: "")
        ])
        
    }()
    private let four: ListSection = {
        .four([.init(title1: "Первый запуск", title2: "7 февраля", image: ""),
                     .init(title1: "Страна", title2: "USA", image: ""),
                     .init(title1: "Стоимость запуска", title2: "90$", image: "")
        ])
        
    }()
    private let five: ListSection = {
        .five([.init(title1: "Количество двигателей", title2: "27", image: ""),
               .init(title1: "Количество топлива", title2: "308", image: ""),
               .init(title1: "Время сгорания", title2: "593", image: "")
  ])
        
    }()
    private let six: ListSection = {
        .six([.init(title1: "Количество двигателей", title2: "1", image: ""),
              .init(title1: "Количество топлива", title2: "243", image: ""),
              .init(title1: "Время сгорания", title2: "397", image: "")
 ])
        
    }()
    private let seven: ListSection = {
        .seven([.init(title1: "", title2: "", image: "")
        ])
        
    }()
    
    
    var pageData: [ListSection] {
        [one,two,three,four,five,six,seven]
    }
}

