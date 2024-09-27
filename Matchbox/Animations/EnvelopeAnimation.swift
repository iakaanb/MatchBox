//
//  Envelope.swift
//  Matchbox
//
//  Created by kai on 3/7/24.
//

import SwiftUI

struct Envelope: View {
    
    @State var Envelope : String = "envelope1"
    @State var ReadyToOpen : Bool = false
    
    var body: some View {
        //    VStack {
        //        Triangle()
        //            .foregroundColor(Color.brown)
        //            .frame(width: 300, height: 130)
        //            .cornerRadius(13)
        ////            .strokeBi(.black, lineWidth: 2)
        //        Rectangle()
        //            .foregroundColor(Color.brown)
        //            .frame(width: 300, height: 170)
        //            .cornerRadius(7)
        //            .offset(y: -7)
        //    }
        
        
        VStack(alignment:.center){
            
//            Image(ReadyToOpen ? "envelope2" : "envelope1")
            Image(Envelope)
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 300, alignment: .center)
//                .onChange(of: ReadyToOpen) { ready in
//                    if ready {
//                        openEnvelope()
//                    }
//                }
                .onChange(of: ReadyToOpen, initial: false) { oldValue, newValue in
//                    openEnvelope()
                    Envelope = "envelope2"
                }
        }
//        ReadyToOpen.toggle()
        
    }
//    func openEnvelope(){
//        
////        var index = 1
////        let timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (Timer) in
////            
////            Envelope = "Envelope\(index)"
////            
////            index += 1
////            
////            if (index > 23){
////                index = 1
////                
////            }
////        for index in 1...2 {
//            
////            Envelope = "Envelope\(index)"
//        Envelope = "envelope2"
//        ReadyToOpen.toggle()
//            
//        }
//    }
    

//struct Triangle: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        path.move(to: CGPoint(x : rect.midX, y : rect.minY))
//        path.addLine (to : CGPoint(x: rect.minX, y : rect.maxY))
//        path.addLine (to : CGPoint(x: rect.maxX, y : rect.maxY))
//        path.addLine (to : CGPoint(x: rect.midX, y : rect.minY))
//        
//        return path
//    }
}

#Preview {
    Envelope()
}
