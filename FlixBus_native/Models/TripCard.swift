//
//  TripCard.swift
//  FlixBus_native
//
//  Created by Ariuna Banzarkhanova on 21/11/22.
//

import Foundation

struct TripCard: Codable, Hashable, Identifiable{
    var id: Int
    var date: String
    var startPoint: String
    var endPoint: String
    var startTime: String
    var endTime: String
    var transportType: String
    var price: String
    var duration: String
    var wifi: Bool
    var plug: Bool
    var desinfection: Bool
    var startAdress: String
    var endAdress: String
    var earlyTrip: Bool
}

