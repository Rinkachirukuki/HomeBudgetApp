#ifndef CATEGORYREPOSITORY_H
#define CATEGORYREPOSITORY_H

#include <QObject>
#include <QtSql>

#include "sqlquerymodeltemplate.h"
#include "databasemanager.h"

class CategoryRepository : public QObject
{
    Q_OBJECT
public:
    explicit CategoryRepository(QObject *parent = nullptr);

    Q_INVOKABLE void getList();
    Q_INVOKABLE void addItem(const QString &name, const QByteArray &image);
    Q_INVOKABLE void deleteItem(const QString &id);
    Q_INVOKABLE void editItem(const QString &id, const QString &name, const QByteArray &image);

    SqlQueryModelTemplate* getModel();

private:
    QSqlDatabase           database = QSqlDatabase();
    SqlQueryModelTemplate* sqlQueryModel;
};

#endif // CATEGORYREPOSITORY_H
