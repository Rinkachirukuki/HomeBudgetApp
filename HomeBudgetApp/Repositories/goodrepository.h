#ifndef GOODREPOSITORY_H
#define GOODREPOSITORY_H

#include <QObject>
#include <QtSql>

#include "sqlquerymodeltemplate.h"
#include "databasemanager.h"

class GoodRepository : public QObject
{
    Q_OBJECT
public:
    explicit GoodRepository(QObject *parent = nullptr);


    Q_INVOKABLE void addItem(const QString &categoryId, const QString &name, const QByteArray &image);
    Q_INVOKABLE void deleteItem(const QString &id);
    Q_INVOKABLE void editItem(const QString &id, const QString &categoryId, const QString &name, const QByteArray &image);

    Q_PROPERTY(QString selectedCategoryId READ getSelectedCategoryId WRITE setSelectedCategoryId NOTIFY selectedCategoryIdChanged)

    void setSelectedCategoryId(QString id);
    QString getSelectedCategoryId();
    SqlQueryModelTemplate* getModel();

signals:
    void selectedCategoryIdChanged();

private:
    void getList(const QString &categoryId);

    QSqlDatabase           database = QSqlDatabase();
    SqlQueryModelTemplate* sqlQueryModel;
    QString                selectedCategoryId = "";
};

#endif // GOODREPOSITORY_H
