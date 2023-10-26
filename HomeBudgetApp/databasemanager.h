#ifndef DATABASEMANAGER_H
#define DATABASEMANAGER_H

#include <QObject>
#include <QtSql>


#define DATABASE_HOSTNAME "DatabaseHostname"
#define DATABASE_NAME     "database.db"

#define FAMILY_TABLE             "FamilyTable"
#define TRANSACTIONS_TABLE       "TransactionsTable"
#define CATEGORIES_TABLE         "CategoriesTable"
#define GOODS_TABLE              "GoodsTable"
#define GOODS_TRANSACTIONS_TABLE "GoodsTransactionsTable"

class DatabaseManager : public QObject
{
    Q_OBJECT
public:
    explicit DatabaseManager(QObject *parent = nullptr);

private:
    QSqlDatabase database;

    bool createTables();
    bool initializeDB(QString dbFilePath);
    bool connectToDB(QString dbFilePath);
};

#endif // DATABASEMANAGER_H
