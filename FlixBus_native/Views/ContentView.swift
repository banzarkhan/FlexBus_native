//
//  ContentView.swift
//  FlixBus_native
//
//  Created by Ariuna Banzarkhanova on 16/11/22.
//

import SwiftUI

struct ContentView: View {
    var tripCard: TripCard
    
    @State var tripDate: Date = currDate()
    
    var filteredTripCards: [TripCard] {
        tripCards.filter { tripCard in
            tripCard.earlyTrip==false &&
            tripCard.date == dateString(date: tripDate)
        }
    }
    
    @State var showEarly = false
    
    var earlyTripCards: [TripCard] {
        tripCards.filter { tripCard in
            tripCard.earlyTrip==showEarly &&
            tripCard.date == dateString(date: tripDate)
        }
    }
    
    var body: some View {
        
        NavigationStack{
            
            ScrollView {
                LazyVStack (spacing: 0, pinnedViews: [.sectionHeaders]){
                    Section(header: PinnedView(chdate: $tripDate)){
                        if !showEarly{
                            VStack(spacing: 0){
                                Button{
                                    showEarly.toggle()
                                } label: {
                                    Text("SHOW EARLIER TRIPS")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color("flixbusColor"))
                                        .multilineTextAlignment(.center)
                                        .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                                }
                                Rectangle()
                                    .foregroundColor(.white)
                                    .frame(width: 330)
                                    .shadow(radius: 3.0)
                                Rectangle()
                                    .foregroundColor(.white)
                                    .frame(width: 380)
                                    .shadow(radius: 3.0)
                            }
                        } else {
                            if !earlyTripCards.isEmpty {
                                VStack{
                                    ForEach(earlyTripCards) { trip in
                                        TripCardView(tripCard: trip)
                                    }
                                    ZStack{
                                        Divider()
                                            .padding(.bottom, 5.0)
                                            .padding(.horizontal)
                                        Text("EARLIER TRIPS")
                                            .foregroundColor(.gray)
                                            .background(Color.init(red: 0.949, green: 0.9494, blue: 0.9696))
                                            .font(.caption)
                                            .padding(.bottom, 5.0)
                                    }
                                }
                            }
                        }
                        VStack{
                            ForEach(filteredTripCards) { trip in
                                TripCardView(tripCard: trip)
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem (placement: .navigation){
                    Button{
                        //ggy
                    } label: {
                        Image(systemName: "chevron.backward")
                        Text("Search")
                    }
                }
                ToolbarItem(placement: .automatic){
                    Text("Stations & Filters")
                }
            }
            .navigationTitle("Select trip")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color("flixbusColor"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .background(Color.init(red: 0.949, green: 0.9494, blue: 0.9696))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tripCard: tripCards[1])
    }
}

func dateString(date: Date) -> String {
    
    let nameFormatter = DateFormatter()
    nameFormatter.dateFormat = "dd-MM-yyyy"
    
    let name = nameFormatter.string(from: date)
    
    return name
}
