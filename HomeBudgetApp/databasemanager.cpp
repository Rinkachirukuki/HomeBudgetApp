#include "databasemanager.h"

DatabaseManager::DatabaseManager(QObject *parent)
    : QObject{parent}
{
    connectToDB(QDir::homePath() + "/" + DATABASE_NAME);
}

bool DatabaseManager::connectToDB(QString dbFilePath)
{
    if (QFile(dbFilePath).exists()) {
        initializeDB(dbFilePath);
        return true;
    }
    if (initializeDB(dbFilePath) && createTables()) {
        return true;
    }
    return false;
}

bool DatabaseManager::initializeDB(QString dbFilePath)
{
    database = QSqlDatabase::addDatabase("QSQLITE");
    database.setDatabaseName(dbFilePath);

    if (database.open()) {
        QSqlQuery query(database);
        query.exec("PRAGMA foreign_keys = ON;");

        qDebug() << "Успешное подключение к БД";
        return true;
    }
    else {
        qDebug() << "Ошибка открытия БД: " + database.lastError().text();
        return false;
    }
}

bool DatabaseManager::createTables()
{
    QSqlQuery query(database);
    if (
!query.exec(
"CREATE TABLE " FAMILY_TABLE " ("
    "id INTEGER PRIMARY KEY AUTOINCREMENT,"
    "last_name"     " VARCHAR(255) NOT NULL,"
    "first_name"    " VARCHAR(255) NOT NULL,"
    "patronymic"    " VARCHAR(255) NOT NULL,"
    "icon"          " BLOB,"
    "is_deleted"    " BOOLEAN  DEFAULT 0 NOT NULL"
" )"
) ||
!query.exec(
"CREATE TABLE " CATEGORIES_TABLE " ("
    "id INTEGER PRIMARY KEY AUTOINCREMENT,"
    "name"          " VARCHAR(255) NOT NULL,"
    "icon"          " BLOB"
" )"
) ||
!query.exec(
"CREATE TABLE " GOODS_TABLE " ("
    "id INTEGER PRIMARY KEY AUTOINCREMENT,"
    "category_id"   " INTEGER NOT NULL,"
    "name"          " VARCHAR(255) NOT NULL,"
    "icon"          " BLOB,"
    "FOREIGN KEY(category_id) REFERENCES " CATEGORIES_TABLE "(id)"
    "ON DELETE CASCADE"
" )"
) ||
!query.exec(
"CREATE TABLE " TRANSACTIONS_TABLE " ("
    "id INTEGER PRIMARY KEY AUTOINCREMENT,"
    "family_id"     " INTEGER NOT NULL,"
    "category_id"   " INTEGER NOT NULL,"
    "amount"        " REAL    NOT NULL,"
    "description"   " TEXT,"
    "datetime"      " INTEGER NOT NULL,"
    "FOREIGN KEY(family_id) REFERENCES  " FAMILY_TABLE "(id)"
" )"
) ||
!query.exec(
"CREATE TABLE " GOODS_TRANSACTIONS_TABLE " ("
    "id INTEGER PRIMARY KEY AUTOINCREMENT,"
    "good_id"        " INTEGER NOT NULL,"
    "transaction_id" " INTEGER NOT NULL,"
    "FOREIGN KEY(good_id) REFERENCES        " GOODS_TABLE "(id),"
    "FOREIGN KEY(transaction_id) REFERENCES " TRANSACTIONS_TABLE "(id)"
" )"
)
)
    {
        qDebug() << "Ошибка создания таблиц в БД: " + database.lastError().text();
        return false;
    }
    else {
        return true;
    }
}
