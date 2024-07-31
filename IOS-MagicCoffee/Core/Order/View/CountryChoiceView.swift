import SwiftUI
struct CountryChoiceView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel : AssemblageViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment : .leading){
                Text("Select country and sort of coffee")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                VStack{
                    ForEach(viewModel.countrySelected.cities){ city in
                        Button {
                            viewModel.citySelected = city
                            dismiss()
                        } label: {
                            VStack{
                                HStack{
                                    Text(city.name)
                                        .foregroundStyle(viewModel.citySelected.name == city.name ? .blue : .black)
                                    Spacer()
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
            }
        }
    }
}

#Preview{
    CountryChoiceView(viewModel: AssemblageViewModel())
}
