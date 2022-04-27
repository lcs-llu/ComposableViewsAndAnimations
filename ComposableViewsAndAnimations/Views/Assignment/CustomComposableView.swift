//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
    
    
    @State var xOffset = -100.0
    
    @State var rotationAmount = 0.0
    
    @State var shouldAnimate = false
    
    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 40, height: 40)
            
            HStack {
                Rectangle()
                    .frame(width: 40, height: 10)
                
                ZStack {
                    Rectangle()
                        .frame(width: 80, height: 80)
                        .overlay(
                            ZStack {
                                Circle()
                                    .stroke(Color.yellow, lineWidth: 100)
                                    .scaleEffect(shouldAnimate ? 1 : 0)
                                Circle()
                                    .stroke(Color.red, lineWidth: 100)
                                    .scaleEffect(shouldAnimate ? 1.5 : 0)
                                Circle()
                                    .stroke(Color.blue, lineWidth: 100)
                                    .scaleEffect(shouldAnimate ? 2 : 0)
                            }
                                .opacity(shouldAnimate ? 0.0 : 0.2)
                                .animation(
                                    Animation
                                        .easeInOut(duration: 2)
                                        .repeatForever(autoreverses: true)
                                )
                        )
                    Text("Leo")
                        .foregroundColor(.white)
                    
                }
                Rectangle()
                    .frame(width: 40, height: 10)
            }
            HStack{
                Circle()
                    .frame(width: 30, height: 30)
                
                Circle()
                    .frame(width: 30, height: 30)
            }
        }
        
        .rotationEffect(.degrees(rotationAmount), anchor:  .center)
        .offset(x:xOffset, y:0)
        .animation(
            Animation
                .easeInOut(duration: 2)
                .repeatForever(autoreverses: true)
        )
        .onReceive(timer) { input in
            xOffset = 100.0
            rotationAmount = 360.0
            shouldAnimate = true
            timer.upstream.connect().cancel()
        }
        //       ZStack {
        //
        //
        //
        //            Circle()
        //                .frame(width: 50, height: 50)
        //            Text("Ok")
        //                .foregroundColor(.white)
        //        }
        //
        //        .rotationEffect(.degrees(rotationAmount), anchor: .center)
        //        .offset(x:xOffset, y:0)
        //            .animation(
        //                Animation.easeInOut(duration: 2)
        //                    .repeatForever(autoreverses: true)
        //
        //        )
        //
        //        .onReceive(timer) { input in
        //
        //            xOffset = 100.0
        //            rotationAmount = 360.0
        //
        //            timer.upstream.connect().cancel()
        //        }
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}
