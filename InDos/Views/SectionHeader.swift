//
//  SectionHeader.swift
//  InDos
//
//  Created by John Yorke on 08/01/2022.
//

import SwiftUI

struct SectionHeader: View {
    let title: String
    var body: some View {
        Text(verbatim: title)
            .font(.headline)
    }
}

struct SectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeader(title: "Section")
    }
}
