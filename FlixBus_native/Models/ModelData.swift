//
//  ModelData.swift
//  FlixBus_native
//
//  Created by Ariuna Banzarkhanova on 21/11/22.
//

import Foundation

var tripCards: [TripCard] = load("flixbusData") ?? []

func load<T: Decodable>(_ filename: String) -> T? {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: "json")
    else {
        return nil
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        return nil
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        return nil
    }
}
