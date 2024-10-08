import SwiftUI

struct AccountDetailView: View {
    var account: Account
    @State private var isShowingAddNewTransactionSheet = false
    
    var body: some View {
        List {
            ForEach(account.transactions, id: \.id) {
                transaction in TransactionRowView(transaction: transaction)
            }
        }
        Spacer()
        Button("Create Transaction") {
            isShowingAddNewTransactionSheet = true
        }
        .sheet(isPresented: $isShowingAddNewTransactionSheet) {
            AddNewTransactionView(account: account, isPresented: $isShowingAddNewTransactionSheet)
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    AccountDetailView(account: TestData().accounts[1])
}
