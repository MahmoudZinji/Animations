//
//  ContentView.swift
//  Animations
//
//  Created by User on 11/06/2021.
//

import SwiftUI

struct CornerRotateModifier : ViewModifier {
    
    let amount : Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot : AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .bottomLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .bottomLeading)
        )
    }
}

struct ContentView: View {
    let letters = Array("Hello SwiftUI")
    
    @State private var animationAmount = 0.0
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var isShowingRed = false


    var body: some View {
        VStack {
            Button("Tap Me") {
                // do nothing
                withAnimation{
                    self.isShowingRed.toggle()
                }
            }

            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
//                    .transition(.scale)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    .transition(.pivot)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




//    var body: some View {
//
//        Button("Tap Me") {
//            // do nothing
////            animationAmount += 1
//        }
//        .padding(50)
//        .background(Color.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .overlay(
//            Circle()
//                .stroke(Color.blue)
//                .scaleEffect(animationAmount)
//                .opacity(Double(2 - animationAmount))
//                .animation(
//                    Animation.easeInOut(duration: 1)
//                        .repeatForever(autoreverses: false)
//                )
//        )
//        .onAppear{
//            self.animationAmount = 2
//        }
////        .scaleEffect(animationAmount)
////        .blur(radius: (animationAmount - 1) * 3 )
////        .animation(
////            Animation.easeInOut(duration: 2)
////                .delay(1)
////                .repeatCount(3, autoreverses: true)
////        )
//    }









//    var body: some View {
//        print(animationAmount)
//
//        return VStack {
//            Stepper("Scale Amount", value: $animationAmount, in: 1 ... 10)
//
//            Spacer()
//
//            Button("Tap ME") {
//                self.animationAmount += 1
//
//            }
//            .padding(40)
//            .background(Color.red)
//            .foregroundColor(.blue)
//            .clipShape(Circle())
//            .scaleEffect(animationAmount)
//        }
//    }





//var body: some View {
//    Button("Tap Me") {
//        // do nothing
//        withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
//            self.animationAmount += 360
//        }
//    }
//    .padding(50)
//    .background(Color.red)
//    .foregroundColor(.white)
//    .clipShape(Circle())
//    .rotation3DEffect(
//        .degrees(animationAmount),
//        axis: (x: 0.0, y: 1.0, z: 0.0))
//}




//var body: some View {
//
//    Button("Tap Me") {
//        self.enabled.toggle()
//    }
//    .frame(width: 200, height: 200)
//    .background(enabled ? Color.blue : Color.red)
//    .animation(nil)
//    .foregroundColor(.white)
//    .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//    .animation(.interpolatingSpring(stiffness: 10, damping: 1))
//}





//var body: some View {
//
//    LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
//        .frame(width: 300, height: 200)
//        .clipShape(RoundedRectangle(cornerRadius: 10))
//        .offset(dragAmount)
//        .gesture(
//            DragGesture()
//                .onChanged{
//                    //$0 is the value
//                    self.dragAmount = $0.translation
//                }
//                .onEnded { _ in
//                //this way its called explicit animation
//                    withAnimation(.spring()) {
//                        self.dragAmount = .zero
//                    }
//                    self.dragAmount = .zero
//                }
//        )
//          //this way its called implicit animation
////            .animation(.spring())
//
//}






//var body: some View {
//    HStack(spacing: 0) {
//
//        ForEach(0..<letters.count) { num in
//            Text(String(self.letters[num]))
//                .padding(5)
//                .font(.title)
//                .background(self.enabled ? Color.blue : Color.red)
//                .offset(self.dragAmount)
//                .animation(Animation.default.delay(Double(num) / 20))
//        }
//    }
//    .gesture(
//        DragGesture()
//            .onChanged{
//                self.dragAmount = $0.translation
//            }
//            .onEnded({ (_) in
//                self.dragAmount = .zero
//                self.enabled.toggle()
//            })
//    )
//}
