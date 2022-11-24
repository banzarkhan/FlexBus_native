//
//  TripCardView.swift
//  FlixBus_native
//
//  Created by Ariuna Banzarkhanova on 16/11/22.
//

import SwiftUI

struct TripCardView: View {
    @State private var showingCredits = false
    var tripCard: TripCard
    @State var isChosen = false
    
    var body: some View {
        VStack {
            HStack (spacing: 15){
                VStack (alignment: .leading, spacing: 10){
                    Text(tripCard.startTime)
                    Text(tripCard.endTime)
                }
                .font(.callout)
                GuageView()
                    .frame(maxWidth: 10.0, maxHeight: 35.0)
                VStack (alignment: .leading, spacing: 10){
                    Text(tripCard.startPoint)
                        .multilineTextAlignment(.leading)
                    Text(tripCard.endPoint)
                        .multilineTextAlignment(.leading)
                }
                .font(.callout)
                Spacer()
//                Image(systemName: isChosen ? "checkmark": "")
//                    .foregroundColor(Color("flixbusColor"))
//                    .padding(.trailing, 15.0)
//                    .font(.system(size: 40))
//                    .fontWeight(.bold)
            }
            .onTapGesture {
                showingCredits.toggle()
            }
            Divider()
            HStack {
                TransportType(tripCard: tripCards[8])
                    .onTapGesture {
                        showingCredits.toggle()
                    }
                Spacer()
                HStack(alignment: .top,spacing: 0){
                    Text(chPrice(price:tripCard.price)[0])
                        .font(.title2)
                    Text(","+chPrice(price:tripCard.price)[1])
                        .font(.subheadline)
                        .padding(.top, 2.0)
                }
                .fontWeight(.bold)
                Text("€")
                    .font(.title2)
                    .fontWeight(.bold)
                Image(systemName: isChosen ? "checkmark" : "chevron.forward")
                    .padding()
                    .font(.footnote)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .background(
                        Circle()
                            .frame(width: 35.0, height: 35.0)
                            .foregroundColor(Color("flixbusColor"))
                    )
                    .onTapGesture {
                        withAnimation(.easeOut(duration: 0.5)){
                            isChosen.toggle()
                        }
                    }
            }
            .padding(.vertical, -3)
            .font(.footnote)
            HStack{
                Text(tripCard.duration)
                Divider()
                    .frame(height: 20)
                HStack (spacing: 1.0){
                    if (tripCard.wifi == true){
                        Image(systemName: "wifi")
                            .font(.caption)
                    }
                    if (tripCard.plug == true){
                        Image(systemName: "powerplug")
                            .font(.caption)
                        
                    }
                    if (tripCard.desinfection == true){
                        ZStack{
                            Image(systemName: "shield")
                                .font(.subheadline)
                            Image(systemName: "allergens")
                                .font(.caption2)
                                .padding(.leading, 5.0)
                        }
                        .padding(0)
                        .fontWeight(.thin)
                    }
                }
                Spacer()
            }
            .padding(.vertical, -3)
            .font(.footnote)
            .onTapGesture {
                showingCredits.toggle()
            }
        }
        .padding()
        .background(Color.white)
        .sheet(isPresented: $showingCredits) {
            CardModalView(tripCard: tripCard)
                .presentationDetents([.height(460)])
        }
    }
}

struct TripCardView_Previews: PreviewProvider {
    static var previews: some View {
        TripCardView(tripCard: tripCards[0])
    }
}


struct GuageView: View {
    var body: some View {
        VStack (spacing: 0){
            Circle()
                .frame(width: 8.0, height: 8.0)
                .foregroundColor(.white)
                .overlay{
                    Circle().stroke(Color("GrayElem"), lineWidth: 2)
                }
            Rectangle()
                .frame(maxWidth: 2, minHeight: 26)
                .foregroundColor(Color("GrayElem"))
            Circle()
                .frame(width: 8.0, height: 8.0)
                .foregroundColor(Color("GrayElem"))
        }
    }
}

struct GuageView_Previews: PreviewProvider {
    static var previews: some View {
        GuageView()
    }
}

struct TransportType: View {
    var tripCard: TripCard
    
    var body: some View {
        if (tripCard.transportType=="bus"){
            HStack (spacing: 5.0){
                Image(systemName: "bus.fill")
                    .fontWeight(.thin)
                Text("Bus")
            }
            .padding([.top, .leading, .bottom], 5.0)
            .padding(.trailing)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.white)
                    .overlay{
                        RoundedRectangle(cornerRadius: 15).stroke(Color("GrayElem"), lineWidth: 1)
                    }
            )
        }
    }
}

struct TransportType_Previews: PreviewProvider {
    static var previews: some View {
        TransportType(tripCard: tripCards[8])
    }
}

func chPrice(price: String) -> [String]{
    let changedPrice = price.components(separatedBy: ",")
    return changedPrice
}
