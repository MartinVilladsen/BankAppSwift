import SwiftUI

struct TransactionRowView: View {
    let transaction: Transaction
    
  
    
    var body: some View {
        VStack {
            HStack() {
                Text(transaction.beneficiary)
                    .font(.headline)
                    .bold()
                Spacer()
                Text("$\(transaction.amount)")
                    .bold()
            }
            HStack {
                    Text("\(transaction.date.transactionFormat)")
                        .font(.subheadline)
                Spacer()
            }
        }
    }
}

#Preview {
    TransactionRowView(transaction: TestData().accounts[0].transactions[0])
}
