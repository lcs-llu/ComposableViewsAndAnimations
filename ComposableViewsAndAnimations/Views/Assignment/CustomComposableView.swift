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
        
//        .rotationEffect(.degrees(rotationAmount), anchor:  .center)
        .offset(x:xOffset, y:0)
                 .animation(
                    Animation.easeInOut(duration: 2)
                        .repeatForever(autoreverses: true)
                    )
                 .onReceive(timer) { input in
                 
                             xOffset = 100.0
                             rotationAmount = 360.0
                 
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
