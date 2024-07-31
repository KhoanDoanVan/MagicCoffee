import SwiftUI
struct SortView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel : AssemblageViewModel
    @State private var goToCart = false
    
    var body: some View {
        NavigationStack{
                        
            VStack(alignment : .leading){
                Text("Select country and sort of coffee")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                VStack{
                    ForEach(viewModel.countries){ country in
                        Button {
                            viewModel.countrySelected = country
                            goToCart.toggle()
                        } label: {
                            VStack{
                                HStack{
                                    Text(country.name)
                                        .foregroundStyle(viewModel.countrySelected.name == country.name ? .blue : .black)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(viewModel.countrySelected.name == country.name ? .blue : .black)
                                }
                                Divider()
                            }
                            .padding(.vertical, 10)
                        }
                    }
                }
                .padding(.top)
                Spacer()
            }
            .padding(20)
            .navigationTitle("Coffee lover assemblage")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement : .topBarLeading){
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .padding()
                    }
                    .foregroundStyle(.black)
                }
                ToolbarItem(placement : .topBarTrailing){
                    Button {
                        goToCart.toggle()
                    } label: {
                        Image(systemName: "cart")
                            .padding()
                    }
                    .foregroundStyle(.black)
                }
            }
        }
        .navigationDestination(isPresented: $goToCart) {
            CountryChoiceView(viewModel: viewModel)
        }
    }
}


#Preview{
    SortView(viewModel: AssemblageViewModel())
}
