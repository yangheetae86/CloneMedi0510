//
//  NoteRow.swift
//  CloneMedi0510
//
//  Created by JU HAN LEE on 2020/05/11.
//  Copyright © 2020 HEETAE YANG. All rights reserved.
//
import SwiftUI

struct NoteRow: View {
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    var isDestination = false
    
    @State var note: [String]
    
    var body: some View {
        HStack {
            Text(note[0])
            Spacer()
            Text(note[1])
        }
        .padding(.horizontal, 20.0)
        
    }
}

struct NoteRow_Previews: PreviewProvider {
    static var previews: some View {
//        NoteRow(note: ["",""])
        NoteRow(note: ["테스트","13:21","하하하하"])
    }
}
