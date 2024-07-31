import SwiftUI

struct QRCodeGenerate: View {
    @StateObject var viewModel : ProfileViewModel
    
    var body: some View {
        viewModel.generateQRCodeImage()
            .interpolation(.none)
            .resizable()
            .frame(width: 250, height: 250)
            .onAppear{
                viewModel.userInformationQR()
            }
    }
    
}

#Preview {
    QRCodeGenerate(viewModel: ProfileViewModel())
}
