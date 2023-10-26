#include "transactionsrepository.h"

TransactionsRepository::TransactionsRepository(QObject *parent)
    : QObject{parent}
{
    sqlQueryModel = new SqlQueryModelTemplate();
    sqlQueryModel->setQuery("SELECT * FROM " TRANSACTIONS_TABLE
                            " LEFT JOIN " FAMILY_TABLE     " ON " TRANSACTIONS_TABLE".family_id   = " FAMILY_TABLE".id"
                            " LEFT JOIN " CATEGORIES_TABLE " ON " TRANSACTIONS_TABLE".category_id = " CATEGORIES_TABLE".id",
                            database);
}

void TransactionsRepository::getList()
{
    sqlQueryModel->updateModel();
}

void TransactionsRepository::addItem(const QString &familyId, const QString &categoryId, const QString &amount, const QString &description)
{
    QSqlQuery query(database);

    query.prepare("INSERT INTO " TRANSACTIONS_TABLE " (family_id, category_id, amount, description, datetime) "
                                               " VALUES (:familyId, :categoryId, :amount, :description, :datetime) ");
    query.bindValue(":familyId", familyId);
    query.bindValue(":categoryId", categoryId);
    query.bindValue(":amount", amount);
    query.bindValue(":description", description);
    query.bindValue(":datetime", QDateTime::currentDateTime().toSecsSinceEpoch());

    if (!query.exec())
        qDebug() << "Ошибка выполнения запроса: " + query.lastError().text();

    sqlQueryModel->updateModel();
}

SqlQueryModelTemplate *TransactionsRepository::getModel()
{
    return sqlQueryModel;
}
