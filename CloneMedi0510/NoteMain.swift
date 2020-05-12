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
    
    @State private var notes = [["약관 및 정책", "", "첫번째 메뉴"],
                                ["회사 소개", "", "두번째 메뉴"],
                                ["자기 진단", "", "세번째 메뉴"],
                                ["버전 정보", "Ver 1.0.0", ""]]
    
    var body: some View {
        NavigationView {
            VStack {
                Color("배경0").edgesIgnoringSafeArea(.all).frame(height: 0)
                List{
                    ForEach(notes, id: \.self){ note in
                        NavigationLink(destination: NoteDetail(note: note)){
                            NoteRow(note: note)
                        }
                    }
//                    .onDelete(perform: delete)
//                    .onMove(perform: move)
                }
                    .navigationBarTitle(Text("설정"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {self.presentationMode.wrappedValue.dismiss()//
                }) {
                    Text("취소")
                })
            }
//            .navigationBarTitle(Text("설정"), displayMode: .inline)
//            .navigationBarItems(trailing: Button(action: {self.presentationMode.wrappedValue.dismiss()//
//            }) {
//                Text("취소")
//            })
        }
    }
// func 자리
}

struct NoteMain_Previews: PreviewProvider {
    static var previews: some View {
        NoteMain()
    }
}

//    func delete(offsets: IndexSet){
//        notes.remove(atOffsets: offsets)
//    }
//
//    func move(offsets: IndexSet, index: Int){
//        notes.move(fromOffsets: offsets, toOffset: index)
//    }
