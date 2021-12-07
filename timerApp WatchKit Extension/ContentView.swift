//
//  ContentView.swift
//  timerApp WatchKit Extension
//
//  Created by Joseph Walder on 06/12/2021.
//

import SwiftUI

// User can choose which time value they want to use
struct ContentView: View {
    @State var secondScreenShown = false
    @State var timerVal = 5
    @State var timer:Timer?
    
    var body: some View {
        VStack{
//            Button(action:{
//
//                if self.timer == nil {
//                    self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true)
//                    { _ in WKInterfaceDevice.current().play(.success)
//                    }
//                } else { self.timer?.invalidate()
//                    self.timer = nil
//                }
//
//            })
//            {
//                Text(timer == nil ? "Start Sound" : "Stop Sound")
//            }
//            HStack{
//                Text(timer == nil ? "Sound off" : "Sound On")
//                Image(systemName:"speaker")
//            }.foregroundColor(timer == nil ? .red : .green)
            Text("Start timer for \(timerVal) seconds")
            Picker(selection: $timerVal, label: Text("")) {
                    /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
                    Text("5").tag(5)
                    Text("10").tag(10)
                    Text("15").tag(15)
                }
            NavigationLink(destination: SecondView(secondScreenShown: $secondScreenShown, timerVal: timerVal), isActive: $secondScreenShown, label: {Text("Go")})
    }
    }
}

// Second screen for the user
struct SecondView: View{
    @Binding var secondScreenShown:Bool
    @State var timerVal: Int
    var body: some View {
        
        VStack{
            if timerVal > 0 {
            Text("Time remaining")
                .font(.system(size: 14))
            Text("\(timerVal)")
                .font(.system(size: 40))
                .onAppear(){
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
                        if self.timerVal > 0 {
                            self.timerVal -= 1
                        }
                    }
                }
            Text("seconds")
                .font(.system(size: 14))
                Button(action: {
                    self.secondScreenShown = false
                }) {
                    Text("Cancel")
                        .foregroundColor(.red)
                }
            
            } else {
                Button(action: {
                    self.secondScreenShown = false
                }) {
                    Text("Done")
                        .foregroundColor(.green)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
