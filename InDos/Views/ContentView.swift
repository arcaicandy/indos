//
//  ContentView.swift
//  InDos
//
//  Created by Andy Jones on 02/01/2022.
//

import SwiftUI
import Foundation

struct ContentView: View {

    @StateObject var inDosData: InDosData = InDosData()

    var body: some View {
        NavigationView {
            Form {
                Section(header: SectionHeader(title: "Carbohydrate coverage"))
                {
                    FieldRow(title: "Carbohydrate content", value: $inDosData.coverageCarbContent)
                    FieldRow(title: "Units to carbs (10g)", value: $inDosData.coverageCarbRatio)
                    ResultRow(title: "Insulin dose required", value: inDosData.coverageDoseRequired)
                }
                Section (header: SectionHeader(title: "Blood sugar correction"))
                {
                    FieldRow(title: "Current blood glucose", value: $inDosData.correctionCurrentBloodGlucose)
                    FieldRow(title: "Target blood glucose", value: $inDosData.correctionTargetBloodGlucose)
                    FieldRow(title: "Insulin sensitivity factor", value: $inDosData.correctionInsulinSensitivity)
                    ResultRow(title: "Insulin dose required", value: inDosData.correctionDoseRequired)
                }
                Section (header: SectionHeader(title: "Total Insulin Required"))
                {
                    Text("\(inDosData.totalDoseRequired, specifier: "%.1f")")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
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
            .navigationTitle("Insulin Dosage")
            .navigationBarHidden(true)
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
