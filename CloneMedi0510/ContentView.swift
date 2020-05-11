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
                ZStack {
                    Color(.white).edgesIgnoringSafeArea(.all)
                    VStack(spacing: 0) {
                        AppBar(index: self.$index, offset: self.$offset)
                        
                        GeometryReader { g in
                            
                            HStack(spacing: 0){
                                First()
                                    .frame(width: g.frame(in: .global).width)
                                Scnd()
                                    .frame(width: g.frame(in: .global).width)
                            }
                            .offset(x: self.offset)
                            .padding(.trailing, 410)
                            .padding(.top)
                            .highPriorityGesture(DragGesture() //Gesture 작동원리
                            .onEnded({ (value) in
                                
                                if value.translation.width > 0{ //minimun drag..
                                    print("right")
                                    self.changeView(left: false)
                                }
                                else{
                                    print("left")
                                    self.changeView(left: true)
                                }
                            }))
                            
                        }
                    }
                }
            }
            .animation(.default)
            .edgesIgnoringSafeArea(.all)
    }
    
    func changeView(left: Bool){
        
        if left {
            if self.index != 0{
                self.index -= 1
            }
        }
        
        if self.index == 1{
            self.offset = self.width
        }
        else if self.index == 2{
            self.offset = 0
        }
        else {
            self.offset = -self.width
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
        
        
        VStack() {
            HStack() {
                Text("메디콜 공중전화")
                    Spacer()
                NavigationLink(destination:
                    NoteMain(isDestination: true)) {
                        Image(systemName: "gear")
                }
                
            }
            .foregroundColor(.white)
            .padding()
            HStack{
                    Button(action: {
                        
                        self.index = 1
                        self.offset = self.width
                        
                    }) {
                        VStack(spacing: 8) {
                            HStack(spacing: 12){
                                Text("홈")
                                    .foregroundColor(self.index == 1 ? .white : Color.white.opacity(0.6))
                            }
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
                            HStack(spacing: 12){
                                    Text("통화목록")
                                        .foregroundColor(self.index == 2 ? .white : Color.white.opacity(0.6))
                            }
                            Capsule()
                                .fill(self.index == 2 ? .yellow : Color.clear)
                                .frame(height: 4)
                        }
                    }
                }
        }
//        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)!-15)
        .padding(.bottom, 1)
        .background(Color("배경0"))
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
