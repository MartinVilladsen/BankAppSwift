import SwiftUI

struct AccountRowView: View {
    let account: Account
    
    var body: some View {
        VStack {
            HStack() {
                Text(account.name)
                    .font(.headline)
                    .bold()
                Spacer()
                Text("$\(account.balance)")
                    .bold()
            }
            HStack {
                Text("\(account.kind)")
                    .font(.subheadline)
                Spacer()
            }
            HStack {
                Text("\(account.iban)")
                    .font(.subheadline)
                Spacer()
            }
        }
    }
}
    


#Preview {
    AccountRowView(account: TestData().accounts[1])
}
