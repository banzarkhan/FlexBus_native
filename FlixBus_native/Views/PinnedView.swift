//
//  PinnedView.swift
//  FlixBus_native
//
//  Created by Ariuna Banzarkhanova on 23/11/22.
//

import SwiftUI

struct PinnedView: View {
    @State private var showingCalendar = false
    @Binding var chdate: Date
    
    var body: some View {
        VStack (spacing: 0){
            HStack(alignment: .center){
                Text("NAPLES TO ROME")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "person.fill")
                Text("X1")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
            .padding(.bottom, 8.0)
            .padding(.horizontal)
            .background(Color("flixbusColor"))
            HStack(spacing: 2.0) {
                Image(systemName: "calendar")
                
                Text(currentDayOfWeek(chdate: chdate)+" "+currentDay(chdate: chdate))
                    .fontWeight(.semibold)
                Text(currentMonth(chdate: chdate)+" "+currentYear(chdate: chdate))
                Image(systemName: "chevron.down")
                    .font(.caption2)
                Spacer()
            }
            .padding(.vertical, 8.0)
            .padding(.horizontal)
            .background(Color("flixDark"))
            .onTapGesture {
                showingCalendar.toggle()
            }
            .foregroundColor(.white)
            .sheet(isPresented: $showingCalendar) {
                CalendarView(selectedDate: $chdate)
                    .presentationDetents([.height(460)])
            }
        }
    }
}

//struct PinnedView_Previews: PreviewProvider {
//    static var previews: some View {
//        PinnedView()
//    }
//}

func currentMonth(chdate: Date) -> String {
    
    let nameFormatter = DateFormatter()
    nameFormatter.dateFormat = "MMM"
    
    let name = nameFormatter.string(from: chdate)
    
    return name
}

func currentDay(chdate: Date) -> String {
    
    let nameFormatter = DateFormatter()
    nameFormatter.dateFormat = "dd"
    
    let name = nameFormatter.string(from: chdate)
    
    return name
}

func currentDayOfWeek(chdate: Date) -> String {
    
    let nameFormatter = DateFormatter()
    nameFormatter.dateFormat = "EEEE"
    
    let name = nameFormatter.string(from: chdate)
    
    return name
}

func currentYear(chdate: Date) -> String {
    
    let nameFormatter = DateFormatter()
    nameFormatter.dateFormat = "YYYY"
    
    let name = nameFormatter.string(from: chdate)
    
    return name
}

func currDate() -> Date {
    let string = "18-12-2022"
    
    // Create Date Formatter
    let dateFormatter = DateFormatter()
    
    // Set Date Format
    dateFormatter.dateFormat = "dd-MM-yy"
    
    // Convert String to Date
    return dateFormatter.date(from: string) ?? Date()
}
