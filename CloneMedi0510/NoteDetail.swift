//
//  NoteDetail.swift
//  CloneMedi0510
//
//  Created by JU HAN LEE on 2020/05/11.
//  Copyright © 2020 HEETAE YANG. All rights reserved.
//

import SwiftUI

struct NoteDetail: View {
    
//    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
//    var isDestination = false
    
    @State var note: [String]
    
    var body: some View {
        VStack(alignment: .leading){
//             Color("배경0").edgesIgnoringSafeArea(.all).frame(height: 100)
            HStack{
                Text(note[0])
                    .font(.largeTitle)
                    .fontWeight(.thin)
                Spacer()
                Text(note[1])
            }
            .padding(.bottom, 20.0)
            Text(note[2])
            Spacer()
        }
//        .padding(.all, 20.0)
        .navigationBarTitle(Text("약관 및 정책"), displayMode: .inline)
    }
}

struct NoteDetail_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetail(note: ["테스트","00:04","내용2"])
//        NoteDetail(note: ["테스트","13:21","오오오오"])
    }
}
