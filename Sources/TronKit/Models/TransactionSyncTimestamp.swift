import GRDB

class TransactionSyncTimestamp: Record {
    let apiPath: String
    let lastTransactionTimestamp: Int

    init(apiPath: String, lastTransactionTimestamp: Int) {
        self.apiPath = apiPath
        self.lastTransactionTimestamp = lastTransactionTimestamp

        super.init()
    }

    public override class var databaseTableName: String {
        "transaction_sync_timestamps"
    }

    enum Columns: String, ColumnExpression, CaseIterable {
        case apiPath
        case lastTransactionTimestamp
    }

    required init(row: Row) {
        apiPath = row[Columns.apiPath]
        lastTransactionTimestamp = row[Columns.lastTransactionTimestamp]

        super.init(row: row)
    }

    public override func encode(to container: inout PersistenceContainer) {
        container[Columns.apiPath] = apiPath
        container[Columns.lastTransactionTimestamp] = lastTransactionTimestamp
    }

}
