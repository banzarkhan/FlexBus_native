//
//  TestView.swift
//  FlixBus_native
//
//  Created by Ariuna Banzarkhanova on 20/11/22.
//

import SwiftUI
import Foundation

struct TestView: View {
    
    var tripCard: TripCard
    @State var chdate: Date = currDate()
    
    var body: some View {
        VStack{
            Text(dateStringTest(date: chdate))
            CalendarView(selectedDate: $chdate)
        }
    }
}
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(tripCard: tripCards[0])
    }
}

func dateStringTest(date: Date) -> String {
    
    let nameFormatter = DateFormatter()
    nameFormatter.dateFormat = "dd-MM-yyyy"
    
    let name = nameFormatter.string(from: date)
    
    return name
}
