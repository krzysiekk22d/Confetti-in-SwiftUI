//
//  ContentView.swift
//  Confetti in SwiftUI
//
//  Created by Krzysztof Czura on 15/09/2023.
//

import SwiftUI
import LBConfettiView

 struct ContentView: View {
     @State private var isConfettiAnimating = false
     @State private var numForConfettiStyle = 1
     @State private var confettiView = ConfettiView(frame: UIScreen.main.bounds)

     var body: some View {
         ZStack {
             ConfettiViewWrapper(confettiView: $confettiView)

             Button(action: {
                 startConfetti()
             }) {
                 Text("Start")
             }
             .padding()
         }
     }

     func startConfetti() {
         switch numForConfettiStyle {
         case 1:
             confettiView.style = .confetti
         case 2:
             confettiView.style = .diamond
         case 3:
             confettiView.style = .star
         case 4:
             confettiView.style = .triangle
         default:
             confettiView.style = .confetti
         }

         if numForConfettiStyle == 4 {
             numForConfettiStyle = 1
         } else {
             numForConfettiStyle += 1
         }

         confettiView.scale = .custom(0.4)
         confettiView.start()

         DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
             confettiView.stop()
         }
     }
 }

 struct SwiftUIViewkol_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
     }
 }

 struct ConfettiViewWrapper: UIViewRepresentable {
     @Binding var confettiView: ConfettiView

     func makeUIView(context: Context) -> UIView {
         return confettiView
     }

     func updateUIView(_ uiView: UIView, context: Context) {
         // Aktualizacja widoku nie jest wymagana
     }
 }
