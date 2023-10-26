#ifndef TRANSACTIONSREPOSITORY_H
#define TRANSACTIONSREPOSITORY_H

#include <QObject>
#include <QtSql>

#include "sqlquerymodeltemplate.h"
#include "databasemanager.h"

class TransactionsRepository : public QObject
{
    Q_OBJECT
public:
    explicit TransactionsRepository(QObject *parent = nullptr);

    Q_INVOKABLE void getList();
    Q_INVOKABLE void addItem(const QString &familyId, const QString &categoryId, const QString &amount, const QString &description);

    SqlQueryModelTemplate* getModel();

private:
    QSqlDatabase           database = QSqlDatabase();
    SqlQueryModelTemplate* sqlQueryModel;
};

#endif // TRANSACTIONSREPOSITORY_H
