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
        
    
        GeometryReader { g in
            VStack {

                ZStack {
                    Color("배경0").edgesIgnoringSafeArea(.all).frame(height:g.frame(in: .global).width/7)
                    HStack {
                        Text("설정")
                    }.background(Color("배경0").edgesIgnoringSafeArea(.all))
                    .padding()
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            
                            
                        }) {
                            Text("취소")
                        }
                    }
                    .padding()
                }
                .foregroundColor(.white)
                
                List {
                    Button(action:{
                        NoteDetail(note: ["ss","ss","dd"])
                    }
                    ) {
                        NoteRow(note: ["약관 및 정책",">"])
                    }
                    
                }
            }
        }
    }
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
