#ifndef SQLQUERYMODELTEMPLATE_H
#define SQLQUERYMODELTEMPLATE_H

#include <QSqlQueryModel>
#include <QSqlRecord>
#include <QImage>
#include <QSqlQuery>

class SqlQueryModelTemplate : public QSqlQueryModel
{
    Q_OBJECT

public:
    explicit SqlQueryModelTemplate(QObject *parent = nullptr);

    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const { return m_roleNames; }

    void setQuery(const QString &query, const QSqlDatabase &database = QSqlDatabase());
    void setMissingImagePath(QString path);
    void updateModel();
    void updateModel(QSqlQuery query);

    Q_INVOKABLE QVariant getItemByIndexName(int index, QByteArray roleName);


private:
    void generateRoleNames();

    QHash<int, QByteArray> m_roleNames;
    QString lastQuery;
    QString missingImagePath = "://Icons/missing.png";
};

#endif // SQLQUERYMODELTEMPLATE_H
