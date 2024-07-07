import SwiftUI

/*struct Item: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var description: String?
}*/

/*struct SearchBar: View {
    @State private var searchText = ""
    @Binding var text: String
    
    var body: some View {
        /*Stack {
            Button(action: {
                self.text = ""
            }) {
                Image( "search")
                    .foregroundColor(.gray)
                    .padding(8)
            }
            
            TextField("Search", text: $text)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)*/
        
        ZStack(alignment: .leading) {
            
            TextField("Search", text: $text)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
            
            Button(action: {
                // Action when button is tapped
                self.text=" "
            }) {
                Image("search")
                    .foregroundColor(.gray)
                    .padding(8)
            }
            .padding(.trailing)
            .opacity(searchText.isEmpty ? 1 : 0) // Hide button when text is not empty
            
        }
           
        }
    
}*/
struct VideoView: View
{
    @State private var searchText = ""
    @State private var image = false
    var body: some View {
        ZStack{
           
            VStack{
           /* VStack(alignment: .center, spacing: 10) {
                SearchBar(text: $searchText)
                .padding(.horizontal)
                */
               
                Image("pikachuu")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400, height: 500)
                    .offset(x: 0, y: 40)
                    .padding(.top,80)
                    
                    Text("Tap the plus icon to start adding your children's favorite playlist.")
                        .font(.system(size: 15))
                        
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 40)
                        .lineLimit(2)
                        .padding(.bottom,20)
                    
                
                
                
                Button(action: {
                    image = true
                }) {
                    Text("+ Add videos your child likes now")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .font(.system(size: 15))
                    
                }
                .fullScreenCover(isPresented: $image) {
                    AddNewChannels()
                }
               
                
                Spacer()
                    .padding(.bottom,100)
            }
            
        }
        
    }
        
}
    /*struct ChannelView: View{
     @State private var searchText = ""
     
     let items: [Item] = [
     Item(imageName: "apple", title: "A", description: "Description for Item 1"),
     Item(imageName: "apple", title: "B", description: "Description for Item 2"),
     Item(imageName: "apple", title: "C", description: "Description for Item 3"),
     Item(imageName: "apple", title: "CC", description: "Description for Item 4"),
     Item(imageName: "apple", title: "D", description: "Description for Item 5")
     ]
     
     var filteredItems: [Item] {
     if searchText.isEmpty {
     return items
     } else {
     return items.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
     }
     }
     
     var body: some View {
     VStack {
     SearchBar(text: $searchText)
     .padding(.horizontal)
     
     List(filteredItems) { item in
     HStack(spacing: 16) {
     Image(item.imageName)
     .resizable()
     .frame(width: 60, height: 60)
     .aspectRatio(contentMode: .fill)
     
     VStack(alignment: .leading, spacing: 4) {
     Text(item.title)
     .font(.headline)
     Text(item.description ?? "")
     .font(.subheadline)
     .foregroundColor(.gray)
     }
     
     Button(action: {
     }) {
     Image(systemName: "plus.circle")
     .resizable()
     .frame(width: 20, height: 20)
     .aspectRatio(contentMode: .fill)
     .foregroundColor(.green)
     }
     .padding()
     //                    .fullScreenCover(isPresented:) {
     //                        Login()
     //                    }
     
     
     }
     }
     .padding()
     }
     }
     }
     */


    struct ChannelView_Previews: PreviewProvider {
        static var previews: some View {
           VideoView()
            
        }
    }
    
/*struct Searchbarview: PreviewProvider
{
    static var previews: some View {
        SearchBar(text: $searchText)
    }
}*/

