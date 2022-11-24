//
//  CalendarView.swift
//  FlixBus_native
//
//  Created by Ariuna Banzarkhanova on 20/11/22.
//

import SwiftUI

struct CalendarView: View {
    
    @Binding var selectedDate: Date
    @State var currentDate = false
    
    var body: some View {
        VStack{
            HStack{
                Text("Departing")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    currentDate.toggle()
                    if currentDate {
                        selectedDate=Date()
                    }
                } label: {
                    Text("Today")
                        .foregroundColor(Color("flixbusColor"))
                }
            }
            .padding()
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.graphical)
                .padding(.horizontal)
                .accentColor(Color("flixbusColor"))
        }
    }
}

//struct CalendarView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarView()
//    }
//}
