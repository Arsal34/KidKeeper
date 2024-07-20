import SwiftUI

struct AddChannelView: View {
    @State private var searchText = ""
    
    
    
    @State private var image = false
    var body: some View {
        ZStack{
            VStack{
                /* VStack(alignment: .center, spacing: 10) {
                 SearchBar(text: $searchText)
                 .padding(.horizontal)
                 */
                Spacer()
                Image("pikachu3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400, height: 400)
                    .offset(x: 0, y: 40)
                    .padding(.top,80)
                
                Text("Tap the plus icon to start adding your children's favorite playlist.")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
                    .frame(width: 300, height: 40)
                    .lineLimit(2)
                    .padding(.bottom,20)
                    .padding(.top,80)
                
                Button(action: {
                    image = true
                }) {
                    Text("+ Add channels your child likes now")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .font(.system(size: 15))
                        .padding(.bottom,50)
                }
                .fullScreenCover(isPresented: $image) {
                    AddNewChannels()
                }
                Spacer()
                    .padding(.bottom,100)
                
            }
        }
    }
    
    /* let items: [Item] = [
     Item(imageName: "apple", title: "A"),
     Item(imageName: "apple", title: "B"),
     Item(imageName: "apple", title: "C")
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
     /*  SearchBar(text: $searchText)
      .padding(.horizontal)*/
     
     List(filteredItems) { item in
     VStack(spacing: 4) {
     Image(item.imageName)
     .resizable()
     .frame(height: 100)
     .aspectRatio(contentMode: .fill)
     
     Text(item.title)
     .font(.headline)
     
     }
     }
     .padding()
     }
     }
     }
     */
    struct AddChannelView_Previews: PreviewProvider {
        static var previews: some View {
            AddChannelView()
        }
    }
}
