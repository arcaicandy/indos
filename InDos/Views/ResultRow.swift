//
//  ResultRow.swift
//  InDos
//
//  Created by John Yorke on 08/01/2022.
//

import SwiftUI

struct ResultRow: View {
    let title: String
    let value: Double
    var specifier: String = "%.1f"

    var body: some View {
        HStack {
            Text(title)
                .font(.body)
                .lineLimit(1)
            Spacer()
            Text("\(value, specifier: specifier)")
                .font(.body)
                .lineLimit(1)
                .frame(minWidth:50, maxWidth: 65)
        }
    }
}

struct ResultRow_Previews: PreviewProvider {
    static var previews: some View {
        ResultRow(title: "Something else", value: 4.2)
    }
}
