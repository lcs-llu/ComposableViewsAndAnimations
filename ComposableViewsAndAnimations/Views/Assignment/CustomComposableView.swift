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
    
    @State var bodySize = 80.0
    
    @State var headSize = 40.0
    
    @State var circleSize = 30.0
    
    @State var shouldAnimate = false
    
    @State var armRotationAngle = 0.0
    
    var message: String
    
    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: headSize, height: headSize)
            
            HStack {
                Rectangle()
                    .frame(width: armWidth, height: armHeight)
                    .rotationEffect(.degrees(armRotationAngle), anchor: .center)
                
                ZStack {
                    Rectangle()
                        .frame(width: bodySize, height: bodySize)
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
                    Text(message)
                        .foregroundColor(.white)
                    
                }
                Rectangle()
                    .frame(width: armWidth, height: armHeight)
                    .rotationEffect(.degrees(-armRotationAngle), anchor: .center)
            }
            HStack{
                Circle()
                    .frame(width: circleSize, height: circleSize)
                
                Circle()
                    .frame(width: circleSize, height: circleSize)
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
            armWidth = 80.0
            armHeight = 40.0
            bodySize = 140.0
            headSize = 70.0
            circleSize = 60.0
            armRotationAngle = 30.0
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
    static var previews: some View {        CustomComposableView( message: "hi")
    }
}
