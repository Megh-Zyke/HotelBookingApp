//
//  RoomType.swift
//  HotelBookingBootcamp
//
//  Created by user1 on 11/01/24.
//

import Foundation

struct RoomType : Equatable {
    var id : Int
    var name : String
    var shortName : String
    var price  : Int
    
    static func == (lhs : RoomType , rhs : RoomType) -> Bool {
        return lhs.id == rhs.id
    }
    
    static var all : [RoomType] {
        return[RoomType(id : 0 , name : "Two Queens" , shortName: "2Q" , price: 179),
               RoomType(id : 1 , name : "One King" , shortName: "OK" , price: 209),
               RoomType(id : 2, name : "Penthouse Suite" , shortName: "PHS" , price: 309)]
    }
}
