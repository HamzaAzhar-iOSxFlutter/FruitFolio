import SwiftUI

struct VegetableDetailView: View {
    
    @State var vegetable: Vegetable
    @ObservedObject var favouriteManager: FavouriteManager
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    //HEADER
                    
                    VegetableHeaderView(vegetable: vegetable)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        //TITLE
                        
                        HStack {
                            Text(self.vegetable.title)
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(vegetable.gradientColors[1])
                            Spacer()
                            Button(action: {
                                if self.vegetable.isFavourite {
                                    if let index = self.favouriteManager.favouriteVegetables.firstIndex(where: { $0.id == self.vegetable.id }) {
                                        self.favouriteManager.favouriteVegetables.remove(at: index)
                                    }
                                } else {
                                    self.favouriteManager.favouriteVegetables.append(self.vegetable)
                                }
                                
                                self.vegetable.isFavourite.toggle()
                            }, label: {
                                switch self.vegetable.isFavourite {
                                case true:
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.red)
                                        .font(.title)
                                case false:
                                    Image(systemName: "heart")
                                        .foregroundColor(.secondary)
                                        .font(.title)
                                }
                            })
                        }
                        //HEADLINE
                        Text(self.vegetable.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        //NUTRIENTS
                       NutrientVegetableView(vegetable: vegetable)
                        
                        VegetableAllergenView(vegetable: self.vegetable)
                            
                        //SUBHEADLINE
                        Text("Learn more about \(self.vegetable.title)".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(self.vegetable.gradientColors[1])
                        
                        
                        //DESCRIPTION
                        Text(self.vegetable.description)
                            .multilineTextAlignment(.leading)
                        
                        //LINK
                        SourceLinkView()
                            .padding(.top, 10)
                            .padding(.bottom, 40)
                    }//: VSTACK
                    .padding(20)
                    .frame(maxWidth: 640, alignment: .center)
                }//: VSTACK
                .navigationBarTitle(self.vegetable.title, displayMode: .inline)
                .navigationBarHidden(true)
            }//: SCROLLVIEW
            .edgesIgnoringSafeArea(.top)
        }//: NAVIGATIONVIEW
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
