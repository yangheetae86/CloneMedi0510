//
//  ContentView.swift
//  CloneMedi0510
//
//  Created by Y on 2020/05/10.
//  Copyright © 2020 HEETAE YANG. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}

struct Home : View {
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    var isDestination = false
    
    @State var index = 1
    @State var offset : CGFloat = UIScreen.main.bounds.width
    var width = UIScreen.main.bounds.width
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) {
//                Color("배경0").edgesIgnoringSafeArea(.all).frame(height: 0)
                
                AppBar(index: self.$index, offset: self.$offset)
                
                GeometryReader { g in
                    
                    HStack(spacing: 0){
                        First()
                            .frame(width: g.frame(in: .global).width)
                        Scnd()
                            .frame(width: g.frame(in: .global).width)
                    }
                    .offset(x: self.offset)
                    .padding(.trailing, self.width)
                    .padding(.top)
                       
                .highPriorityGesture(
                    
                    DragGesture()
                    .onEnded({ value in
                        if value.translation.width > 0 {
                            print("right")
                            self.changeView(left: false)
                        }
                        else {
                            print("left")
                            self.changeView(left: true)
                        }
                    }))
                }
            }
        }
        .animation(.default)
        .edgesIgnoringSafeArea(.all)
    }
    
    func changeView(left: Bool){
        if left {// <- swipe
            if self.index == 1 {
                self.offset = 0
                self.index = 2
            }
        }
        else {// -> swipe
            if self.index == 2 {
                self.offset = self.width
                self.index = 1
            }
        }
    }
}

struct AppBar : View {
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    var isDestination = false
    
    @Binding var index : Int
    @Binding var offset : CGFloat
    var width = UIScreen.main.bounds.width
    
    var body: some View {
        
        VStack {
//            Color("배경0").edgesIgnoringSafeArea(.all).frame(height: 0)
            HStack {
                Text("메디콜 공중전화")
                Spacer()
                NavigationLink(destination:NoteMain(isDestination: true)) {
                        Image(systemName: "gear")
                }
            }
//            .navigationBarBackButtonHidden(false)
            .foregroundColor(.white)
            .padding()
            HStack {
                    Button(action: {
                        
                        self.index = 1
                        self.offset = self.width
                        
                    }) {
                        VStack(spacing: 8) {
                                Text("홈")
                                    .foregroundColor(self.index == 1 ? .white : Color.white.opacity(0.6))
                            Capsule()
                                .fill(self.index == 1 ? .yellow : Color.clear)
                                .frame(height: 4)
                        }
                    }
                    
                    Button(action: {
                        
                        self.index = 2
                        self.offset = 0
                        
                    }) {
                        VStack(spacing: 8) {
                                    Text("통화목록")
                                        .foregroundColor(self.index == 2 ? .white : Color.white.opacity(0.6))
                            Capsule()
                                .fill(self.index == 2 ? .yellow : Color.clear)
                                .frame(height: 4)
                        }
                    }
                }
        }
//        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)!-35)
//        .padding(.bottom)
        .background(Color("배경0").edgesIgnoringSafeArea(.all))
    }
}

struct First : View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            Image("imgSmartphone")
        }
    }
}

struct Scnd : View {
    var body: some View {
        Text("통화내역이 없습니다")
    }
}
