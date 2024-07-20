//
//  TimeLimit.swift
//  KidKeeper
//
//  Created by Izzat Zaidi on 19/07/2024.
//

import SwiftUI

struct SetScreenTime: View {
    @State private var selectedTime: TimeInterval = 0
    @State private var startTime: Date?
    @State private var isTimeLimitReached = false
    @State private var image = false

    var body: some View {
        ZStack {
            Color.lightgray.opacity(0.6)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack{
                    Button(action: {
                        image = true
                    }) {
                        Image("back")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                    }
                    .fullScreenCover(isPresented: $image) {
                       Home()
                    }
                    .padding(.leading,0)
                    Spacer()
                    
                    if isTimeLimitReached {
                        Text("Time limit ⌛️")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .padding()
                            .padding(.trailing,70)
                    } else {
                        
                        Text("Set Screen Time")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()
                            .padding(.trailing,45)
                    }
                }
                VStack {
                        Button(action: {
                            selectedTime = 30 * 60 // 30 minutes
                        }) {
                            Text("30 mins")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(8)
                                .padding(.bottom,10)
                        }

                        Button(action: {
                            selectedTime = 60 * 60 // 1 hour
                        }) {
                            Text("1 hour")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.green)
                                .cornerRadius(8)
                                .padding(.bottom,10)
                        }

                        Button(action: {
                            selectedTime = 2 * 60 * 60 // 2 hours
                        }) {
                            Text("2 hours")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.red)
                                .cornerRadius(8)
                                .padding(.bottom,10)
                        }
                        Button(action: {
                            selectedTime = 1 * 60  // 2 hours
                        }) {
                            Text("1 minute")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.black)
                                .cornerRadius(8)
                                .padding(.bottom,10)
                        }

                        Spacer()

                        if selectedTime > 0 {
                            Text("Selected Time: \(Int(selectedTime / 60)) minutes")
                                .font(.headline)
                                .padding()
                        }

                        Spacer()

                        Button(action: startTracking) {
                            Text("Start Using App")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.pink)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    .onAppear(perform: startTimer)
                }
            }
        }
    

    private func startTracking() {
        startTime = Date()
        isTimeLimitReached = false
    }

    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if let startTime = startTime {
                let elapsedTime = Date().timeIntervalSince(startTime)
                if elapsedTime >= selectedTime {
                    isTimeLimitReached = true
                    
                }
            }
        }
    }
}

struct SetScreenTime_Previews: PreviewProvider {
    static var previews: some View {
        SetScreenTime()
    }
}
