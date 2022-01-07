//
//  ContentView.swift
//  InDos
//
//  Created by Andy Jones on 02/01/2022.
//

import SwiftUI
import Foundation

struct ContentView: View {

    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var inDosData: InDosData = InDosData()
    
    @State private var width: CGFloat? = 240

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        formatter.numberStyle = .decimal
        return formatter
    }()

    var body: some View {
        List {
            Section (header: Text("Carbohydrate coverage").fontWeight(.bold).font(.system(size: 18)).frame(maxWidth: .infinity, alignment: .center)) {
                HStack {
                    Text("Carbohydrate content")
                        .font(.system(size: 18))
                        .frame(width: width, alignment: .leading)
                        .lineLimit(1)
                    TextField("0.0", value: $inDosData.coverageCarbContent, formatter: formatter)
                        .font(.system(size: 18))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
                    Text("Carbohydrate ratio")
                        .font(.system(size: 18))
                        .frame(width: width, alignment: .leading)
                        .lineLimit(1)
                    TextField("0.0", value: $inDosData.coverageCarbRatio, formatter: formatter)
                        .font(.system(size: 18))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
                    Text("Insulin dose required")
                        .font(.system(size: 18))
                        .frame(width: width, alignment: .leading)
                        .lineLimit(1)
                    Text("\(inDosData.coverageDoseRequired, specifier: "%.1f")")
                        .font(.system(size: 18))
                        .frame(width: width, alignment: .leading)
                        .lineLimit(1)
                }
            }
            Section (header: Text("Blood sugar correction").fontWeight(.bold).font(.system(size: 18)).frame(maxWidth: .infinity, alignment: .center)) {
                HStack {
                    Text("Current blood glucose")
                        .font(.system(size: 18))
                        .frame(width: width, alignment: .leading)
                        .lineLimit(1)
                    TextField("0.0", value: $inDosData.correctionCurrentBloodGlucose, formatter: formatter)
                        .font(.system(size: 18))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
                    Text("Target blood glucose")
                        .font(.system(size: 18))
                        .frame(width: width, alignment: .leading)
                        .lineLimit(1)
                    TextField("0.0", value: $inDosData.correctionTargetBloodGlucose, formatter: formatter)
                        .font(.system(size: 18))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
                    Text("Insulin sensitivity factor")
                        .font(.system(size: 18))
                        .frame(width: width, alignment: .leading)
                        .lineLimit(1)
                    TextField("0.0", value: $inDosData.correctionInsulinSensitivity, formatter: formatter)
                        .font(.system(size: 18))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
                    Text("Insulin dose required")
                        .font(.system(size: 18))
                        .frame(width: width, alignment: .leading)
                        .lineLimit(1)
                    Text("\(inDosData.correctionDoseRequired, specifier: "%.1f")")
                        .font(.system(size: 18))
                        .frame(width: width, alignment: .leading)
                        .lineLimit(1)
                }
            }
            Section (header: Text("Total insulin required").fontWeight(.bold).font(.system(size: 18)).frame(maxWidth: .infinity, alignment: .center)) {
                Text("\(inDosData.totalDoseRequired, specifier: "%.1f")")
                    .fontWeight(.bold).font(.system(size: 22))
                    .frame(maxWidth: .infinity, alignment: .center)
            }

        }
        .background(colorScheme == .dark ? Color.black : Color.white)
        .onTapGesture {
            // Hide Keyboard
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .gesture(
            DragGesture(minimumDistance: 0, coordinateSpace: .local).onEnded({ gesture in
                // Hide keyboard on swipe down
                if gesture.translation.height > 0 {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
        }))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
