//
//  ContentView.swift
//  Shared
//
//  Created by nyannyan0328 on 2021/09/05.
//

import SwiftUI

struct ContentView: View {
    
    @State var on = false
 
    var body: some View {
        VStack(spacing:25){
            
            AnimationView(text: "title", on: $on)
              
            AnimationView(text: "title", on: $on)
            
            
            Toggle(isOn: $on) {
                
                Text("Punsh Me")
                    .font(.largeTitle.bold())
                
            }
            .symbolVariant(.fill)
            .toggleStyle(.button)
            .tint(.purple)
        }
        .preferredColorScheme(.dark)
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AnimationView : View{
    
    var text : String
    @State var animation = false
    @Binding var on : Bool
    var body: some View{
        
        ZStack{
            
            
            Text(text)
                .font(.system(size: 75))
      
                .foregroundColor(.white.opacity(0.25))
            
            HStack(spacing:0){//spacingあるとズレる
                
                
                ForEach(0..<text.count,id:\.self){index in           //上で入力したtitle数＜tilte 2 -> 01
                    
                    Text(String(text[text.index(text.startIndex,offsetBy: index)]))
                        .font(.system(size: 75))
                        .foregroundColor(on ?  randomElement() : .white)
                    
                }
            }
            .mask(
            
        Rectangle()
            .fill(
            
                LinearGradient(colors: [.white.opacity(0.5),.white.opacity(0.5),], startPoint: .top, endPoint: .bottom)
            
            )
            .rotationEffect(.init(degrees: 70))
        
            .padding(20)
            .offset(x: -250)
            .offset(x: animation ? 500 : 0)
            
            )
            
        }
       
        .onAppear {
            
            
            withAnimation(.linear(duration: 2).speed(0.8) .repeatForever(autoreverses: true)){
                
                animation.toggle()
            }
            
        }
        
    }
    
    func randomElement()->Color{
        
        
        let color = UIColor(displayP3Red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        
        return Color(color)
    }
}
