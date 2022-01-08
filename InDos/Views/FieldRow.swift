//
//  FieldRow.swift
//  InDos
//
//  Created by John Yorke on 08/01/2022.
//

import SwiftUI

struct FieldRow: View {
    let title: String
    var defaultValue: String = "0.0"
    @Binding var value: Double

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            TextField(defaultValue, value: $value, formatter: DecimalNumberFormatter)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(minWidth:44, maxWidth: 60)
                .multilineTextAlignment(.center)
        }
        .font(.body)
    }
}

struct FieldRow_Previews: PreviewProvider {
    @State static var dummyValue: Double = 1.1

    static var previews: some View {
        FieldRow(title: "Hello there", value: $dummyValue)
    }
}

let DecimalNumberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.minimumFractionDigits = 1
    formatter.maximumFractionDigits = 1
    formatter.numberStyle = .decimal
    return formatter
}()
