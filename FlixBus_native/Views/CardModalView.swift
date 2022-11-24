//
//  CardModalView.swift
//  FlixBus_native
//
//  Created by Ariuna Banzarkhanova on 20/11/22.
//

import SwiftUI

struct CardModalView: View {
    var tripCard: TripCard
    var cardD: Date
    
    init(tripCard: TripCard) {
        self.tripCard = tripCard
        self.cardD = cardDate(date: tripCard.date)
    }
    
    var body: some View {
        VStack{
            HStack {
                VStack(alignment: .leading){
                    Text(currentDayOfWeekMod(chdate:cardD)+", " + currentDayMod(chdate: cardD)+" "+currentMonthMod(chdate: cardD))
                        .font(.title)
                        .fontWeight(.semibold)
                    Text(tripCard.duration)
                    Divider()
                }
                Spacer()
            }
            .padding()
            HStack (alignment: .top, spacing: 15){
                VStack (alignment: .leading, spacing: 10){
                    Text(tripCard.startTime)
                    Spacer()
                    Text(tripCard.duration)
                        .font(.footnote)
                    Text(tripCard.endTime)
                }
                GuageView()
                    .frame(maxWidth: 10.0)
                VStack (alignment: .leading, spacing: 10){
                    Text(tripCard.startPoint)
                    Text(tripCard.startAdress)
                        .font(.footnote)
                        .fontWeight(.thin)
                    TransportType(tripCard: tripCards[0])
                        .font(.footnote)
                    Text("Free Wifi Outlets Regulary Disinfected")
                        .font(.footnote)
                        .fontWeight(.thin)
                    Text(tripCard.endPoint)
                    Text(tripCard.endAdress)
                        .font(.footnote)
                        .fontWeight(.thin)
                }
                Spacer()
            }
            .padding(.horizontal)
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .shadow(radius: 3)
                    .ignoresSafeArea()
                VStack{
                    
                    Divider()
                    HStack{
                        Text("1")
                        Image(systemName: "person.fill")
                        Divider()
                            .frame(maxHeight: 20)
                        Spacer()
                        HStack(alignment: .top,spacing: 0){
                            Text(chPrice(price:tripCard.price)[0])
                                .font(.title)
                            Text(","+chPrice(price:tripCard.price)[1])
                                .font(.headline)
                                .padding(.top, 2.0)
                        }
                        .fontWeight(.semibold)
                        Text("€")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    Text("SELECT THIS TRIP")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 350)
                                .foregroundColor(Color("flixbusColor")))
                }
                .padding()
            }
        }
    }
}

struct CardModalView_Previews: PreviewProvider {
    static var previews: some View {
        CardModalView(tripCard: tripCards[2])
    }
}

func cardDate(date: String)-> Date {
    
    // Create Date Formatter
    let dateFormatter = DateFormatter()
    
    // Set Date Format
    dateFormatter.dateFormat = "dd-MM-yy"
    
    // Convert String to Date
    return dateFormatter.date(from: date) ?? Date()
}

func currentMonthMod(chdate: Date) -> String {
    
    let nameFormatter = DateFormatter()
    nameFormatter.dateFormat = "MMM"
    
    let name = nameFormatter.string(from: chdate)
    
    return name
}

func currentDayMod(chdate: Date) -> String {
    
    let nameFormatter = DateFormatter()
    nameFormatter.dateFormat = "dd"
    
    let name = nameFormatter.string(from: chdate)
    
    return name
}

func currentDayOfWeekMod(chdate: Date) -> String {
    
    let nameFormatter = DateFormatter()
    nameFormatter.dateFormat = "EEE"
    
    let name = nameFormatter.string(from: chdate)
    
    return name
}
