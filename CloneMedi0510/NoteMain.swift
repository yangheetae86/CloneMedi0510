//
//  NoteMain.swift
//  CloneMedi0510
//
//  Created by JU HAN LEE on 2020/05/11.
//  Copyright © 2020 HEETAE YANG. All rights reserved.
//

import SwiftUI

struct NoteMain: View {
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    var isDestination = false
    
    @State private var notes = [["약관 및 정책", "20:12", "첫번째 메뉴"],
                                ["회사 소개", "19:00", "두번째 메뉴"],
                                ["자기 진단", "6:10", "세번째 메뉴"],
                                ["버전 정보", "6:10", "삭제할 메뉴"]]
    
    var body: some View {
        NavigationView{
            VStack {
                if isDestination {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("취소")
                            .foregroundColor(.black)
                            .padding(.leading, 340.0)
                    }
                }
                List{
                    ForEach(notes, id: \.self){ note in
                        NavigationLink(destination: NoteDetail(note: note)){
                            NoteRow(note: note)
                        }
                        
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
                .navigationBarItems(trailing: EditButton())
                .navigationBarTitle(Text("Setting"))
            }
        }
    }
    
    func delete(offsets: IndexSet){
        notes.remove(atOffsets: offsets)
    }
    
    func move(offsets: IndexSet, index: Int){
        notes.move(fromOffsets: offsets, toOffset: index)
    }
}

struct NoteMain_Previews: PreviewProvider {
    static var previews: some View {
        NoteMain()
    }
}
