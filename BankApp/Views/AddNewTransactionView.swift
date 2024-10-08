import SwiftUI

struct AddNewTransactionView: View {
    @Environment(StateController.self) private var viewModel: StateController
    @State var account: Account
    @Binding var isPresented: Bool

    @State private var beneficiaryName = ""
    @State private var amount = 0
    
    var body: some View {
        NavigationStack {
            Form {
                HStack {
                    Text("Amount")
                        .bold()
                    TextField("$0.0", value: $amount, format: .number)

                }
                TextField("Beneficiary name", text: $beneficiaryName)
                
            }
            .navigationTitle("New Transaction")
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .primaryAction) {
                    Button("Send") {
                        viewModel.addTransaction(withAmount: amount, beneficiary: beneficiaryName, to: account)
                        isPresented = false
                    }
                }
            }
        }
    }
}

#Preview {
    AddNewTransactionView(account: TestData().accounts[0], isPresented: .constant(true)).environment(StateController())
}
