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
    @State private var AvailableChannels = false
    
    // @State private var FavChannels: [String] = []
    
    let FavChannels = ["pinkfong", "officialalphablocks", "rocknlearn", "BabyEinstein", "TED-Ed","CoComelon"]
    
    
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
                    TextField("Add Channels your Child Likes", text: $currentInput, onEditingChanged: { isEditing in
                        withAnimation {
                            AvailableChannels = isEditing
                        }
                    })
                    .font(.system(size: 14))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading,5)
                    .padding(.trailing,15)
                    
                    
                    
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
}*/
import SwiftUI

struct AddChild: View {
    @State private var ChildName: String = ""
    @State private var ChildAge: String = ""
    @State private var currentInput: String = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    @State private var AvailableChannels: [String] = ["Cocomelon", "Blippi", "Peppa Pig", "Sesame Street", "Ryan's World", "Cocomelon", "Blippi", "Peppa Pig", "Sesame Street", "Ryan's World"]
    @State private var selectedChannels: [String] = []
    @State private var showDropdown = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.AddChildScreen
                    .edgesIgnoringSafeArea(.all)

                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Child's Name")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            
                            .padding(.trailing, 60)
                        Spacer()
                        Text("Child's Age")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            
                            
                    }
                    .padding(.horizontal)
                    .padding(.trailing, 60)
                    
                    HStack {
                        TextField("Enter Child's Name", text: $ChildName)
                            .font(.system(size: 14))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading, 5)
                            .padding(.trailing, 25)

                        TextField("Enter Child's Age", text: $ChildAge)
                            .font(.system(size: 14))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.trailing, 15)
                            .keyboardType(.numberPad)
                    }

                    VStack(alignment: .leading) {
                        Text("Select Channels that your kids like")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)

                        Button(action: {
                            showDropdown.toggle()
                        }) {
                            HStack {
                                Text("Select channels")
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.black)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                        }
                        
                        Spacer()
                        
                        if showDropdown {
                            ScrollView {
                                VStack(alignment: .leading) {
                                    ForEach(AvailableChannels, id: \.self) { channel in
                                        MultipleSelectionRow(title: channel, isSelected: selectedChannels.contains(channel)) {
                                            if selectedChannels.contains(channel) {
                                                deselectChannel(channel)
                                            } else {
                                                selectChannel(channel)
                                            }
                                        }
                                        .background(Color.white)
                                        .cornerRadius(8)
                                        .padding(.vertical, 2)
                                    }
                                }
                            }
                            .frame(maxHeight: 150)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            saveData()
                        }) {
                            Text("Save")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.gray)
                                .cornerRadius(8)
                                //.frame(width: 180,height: 40)
                                    }
                       
                        .padding(.bottom, 150)
                        .padding(.leading, 140)
                        .alert(isPresented: $showAlert) {
                                                   Alert(title: Text("Validation Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                                               }
                    }
                }
                .padding()
                .navigationBarTitle("Child's Profile")
            }
        }
    }

    private func selectChannel(_ channel: String) {
        if !selectedChannels.contains(channel) {
            selectedChannels.append(channel)
        }
    }

    private func deselectChannel(_ channel: String) {
        if let index = selectedChannels.firstIndex(of: channel) {
            selectedChannels.remove(at: index)
        }
    }

    private func saveData() {
        // Implement save logic here
        if ChildName.isEmpty {
                    alertMessage = "Child's Name cannot be empty."
                    showAlert = true
                    return
                }
                
                if !ValidAge(ChildAge) {
                    alertMessage = "Please enter a valid age between 2 to 13."
                    showAlert = true
                    return
                }

        print("Child's Name: \(ChildName)")
        print("Child's Age: \(ChildAge)")
        print("Selected Channels: \(selectedChannels)")
       
    }
    private func ValidAge(_ ChildAge: String) -> Bool {
        guard let age = Int(ChildAge) else { return false }
        return age >= 2 && age <= 13
        
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                    .foregroundColor(.black)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.green)
                }
            }
            .padding()
            .background(isSelected ? Color.gray.opacity(0.3) : Color.white)
            .cornerRadius(8)
        }
    }
}

struct AddChild_Previews: PreviewProvider {
    static var previews: some View {
        AddChild()
    }
}
