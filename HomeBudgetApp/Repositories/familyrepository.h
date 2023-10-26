#ifndef FAMILYREPOSITORY_H
#define FAMILYREPOSITORY_H

#include <QObject>
#include <QtSql>

#include "sqlquerymodeltemplate.h"
#include "databasemanager.h"

class FamilyRepository : public QObject
{
    Q_OBJECT
public:
    explicit FamilyRepository(QObject *parent = nullptr);

    Q_INVOKABLE void getList();
    Q_INVOKABLE void addItem(const QString &firstName, const QString &lastName, const QString &patronymic, const QByteArray &image);
    Q_INVOKABLE void deleteItem(const QString &id);
    Q_INVOKABLE void editItem(const QString &id, const QString &firstName, const QString &lastName, const QString &patronymic, const QByteArray &image);

    SqlQueryModelTemplate* getModel();

private:
    QSqlDatabase           database = QSqlDatabase();
    SqlQueryModelTemplate* sqlQueryModel;
};

#endif // FAMILYREPOSITORY_H
