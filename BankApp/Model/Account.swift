import Foundation
import SwiftUI


struct Transaction: Identifiable {
var id = UUID()
let amount: Int
let beneficiary: String
let date: Date
}

struct Account: Identifiable {
    let name: String
    let iban: String
    let kind: Kind
    private(set) var transactions: [Transaction]
    var id: String { iban }
    var balance: Int {
        var sum = 0;
        for transaction in transactions {
            sum += transaction.amount
        }
        return sum;
    }
    init(name: String, iban: String, kind: Kind) {
    self.name = name
    self.kind = kind
    self.iban = iban
    transactions = [ Transaction(
    amount: 200000,
    beneficiary: "Initial Balance",
    date: Date()),
                     Transaction(
                     amount: -85000,
                     beneficiary: "Darwizzy",
                     date: Date())]
    }
    
    mutating func add(_ transaction: Transaction) {
    transactions.append(transaction)
    }
}


@Observable
class StateController {
    var accounts: [Account] = TestData().accounts
    
func addAccount(named name: String, withKind kind: Account.Kind){
    accounts.append(Account(name: name, iban: UUID().uuidString, kind: kind))
    
}
func addTransaction(withAmount amount: Int, beneficiary: String, to account: Account) {
    let index = accounts.firstIndex {account.id == $0.id}
    if let index {
    accounts[index].add(Transaction(amount: amount, beneficiary: beneficiary, date: Date()))
    }
    }
}

extension Date {
    var transactionFormat: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}

// anvendelse: transaction.date.transactionFormat
extension String {
    var ibanFormat: String {
        var remaining = Substring(self)
        var chunks: [Substring] = []
        while !remaining.isEmpty {
            chunks.append(remaining.prefix(4))
            remaining = remaining.dropFirst(4)
        }
        return chunks.joined(separator: " ")
    }
}
/// anvendelse: account.iban.ibanFormat
    
extension Account {
    enum Kind: String, CaseIterable, Identifiable {
        var id: Self {self}
        
        case checking
        case savings
        case investment
    }
}

struct TestData {
     var accounts = [
        Account(name: "Personal",
                iban: "DK1750518663516651",
                kind: .checking
        ),
        Account(name: "Savings",
                iban: "DK1650516937156259",
                kind: .savings
        ),
        Account(name: "John Henry - Fenway Sports Group",
                iban: "COUTINHOMONEY",
                kind: .investment
        )
    ]
}


