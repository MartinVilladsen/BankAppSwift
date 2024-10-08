import SwiftUI

struct AddNewAccountView: View {
    @Environment(StateController.self) private var viewModel: StateController
    @Environment(\.dismiss) private var dismiss

    @State private var accountName = ""
    @State private var selectedKind = Account.Kind.checking
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Account name", text: $accountName)
                Picker("Kind", selection: $selectedKind) {
                    ForEach(Account.Kind.allCases, id: \.id) {
                        kind in Text(kind.rawValue)
                    }
                }.pickerStyle(.automatic)
            }
            .navigationTitle("New Account")
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .primaryAction) {
                    Button("Create") {
                        viewModel.addAccount(named: accountName, withKind: selectedKind)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddNewAccountView().environment(StateController())
}
