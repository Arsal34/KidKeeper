//
//  AddChild.swift
//  KidKeeper
//
//  Created by Izzat Zaidi on 05/07/2024.
//

/*import Foundation
import SwiftUI


struct AddChild: View {
    @State private var ChildName: String = ""
    @State private var ChildAge: Int?
    @State private var currentInput: String = ""
    // @State private var FavChannels: [String] = []
    
    var FavChannels = ["pinkfong", "officialalphablocks", "rocknlearn", "BabyEinstein", "TED-Ed","CoComelon"]
    
    
    var body: some View {
        NavigationView {
            
            ZStack{
                Color.AddChildScreen.edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    HStack{
                        Text("Child's Name")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom,3)
                        Text("Child's Age")
                        //.font(.system(size: 14))
                        //.textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading,80)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom,3)
                    }
                    .padding(.horizontal)
                    HStack{
                        
                        TextField("Enter Child's Name", text: $ChildName)
                            .font(.system(size: 14))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading,5)
                            .padding(.trailing,25)
                        
                        
                        
                        TextField("Enter Child's Age", value: $ChildAge, formatter: NumberFormatter())
                            .font(.system(size: 14))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.trailing, 15)
                        
                    }
                    Text("Select Channels")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom,5)
                        .padding(.leading,15)
                    TextField("Add Channels your Child Likes", text: $currentInput)
                        .font(.system(size: 14))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading,5)
                        .padding(.trailing,15)
                    
                    Button(action: {
                        if !currentInput.isEmpty {
                           // FavChannels.append(currentInput)
                            currentInput = "" }})
                    {
                        Image(systemName: "plus")
                            .padding()
                    }
                }
                ScrollView{
                    VStack {
                        ForEach(FavChannels, id: \.self) { input in
                            HStack {
                                Text(input)
                                Spacer()
                                Button(action: {
                                    if let index = FavChannels.firstIndex(of: input) {
                                     //   FavChannels.remove(at: index)
                                    }
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
                    Spacer()
                }
                .navigationTitle("Child's Profile")
            }
        }
    }
    
    struct ContentView_Previews2: PreviewProvider {
        static var previews: some View {
            AddChild()
        }
    }
    
}
*/
