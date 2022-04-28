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
    
    @State var armWidth = 40.0
    
    @State var armHeight = 10.0
    
    @State var bodyWidth = 80.0
    
    @State var bodyHeight = 80.0
    
    @State var headWidth = 40.0
    
    @State var headHeight = 40.0
    
    @State var circleWidth = 30.0
    
    @State var circleHeight = 30.0
    
    @State var shouldAnimate = false
    
    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: headWidth, height: headHeight)
            
            HStack {
                Rectangle()
                    .frame(width: armWidth, height: armHeight)
                
                ZStack {
                    Rectangle()
                        .frame(width: bodyWidth, height: bodyHeight)
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
                    .frame(width: armWidth, height: armHeight)
            }
            HStack{
                Circle()
                    .frame(width: circleWidth, height: circleHeight)
                
                Circle()
                    .frame(width: circleWidth, height: circleHeight)
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
            armWidth = 100.0
            armHeight = 40.0
            bodyWidth = 140.0
            bodyHeight = 140.0
            headWidth = 70.0
            headHeight = 70.0
            circleWidth = 60.0
            circleHeight = 60.0
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
