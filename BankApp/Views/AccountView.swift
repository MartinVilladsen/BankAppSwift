import SwiftUI

struct AccountView: View {
    @Environment(StateController.self) private var viewModel: StateController
    
    var allAccounts: [Account] {
        viewModel.accounts
    }
    @State private var deleteOffsets: IndexSet = []
    @State private var isShowingDeleteConfirmation = false
    @State private var isShowingAddNewAccountSheet = false

    
    var body: some View {

        NavigationStack {
            List {
                ForEach(allAccounts, id: \.id) {
                    account in
                    NavigationLink {
                        AccountDetailView(account: account)
                    } label: {
                        AccountRowView(account: account)
                    }
                }
            }
            .navigationTitle("Accounts")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
            Spacer()
            Button("Add Account") {
                isShowingAddNewAccountSheet = true
            }
            .sheet(isPresented: $isShowingAddNewAccountSheet) {
                AddNewAccountView()
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

#Preview {
    AccountView().environment(StateController())
}
