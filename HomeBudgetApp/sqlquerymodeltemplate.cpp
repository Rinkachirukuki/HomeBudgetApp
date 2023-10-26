#include "sqlquerymodeltemplate.h"

SqlQueryModelTemplate::SqlQueryModelTemplate(QObject *parent)
    : QSqlQueryModel{parent}
{

}

void SqlQueryModelTemplate::setQuery(const QString &query, const QSqlDatabase &database)
{
    QSqlQueryModel::setQuery(query, database);
    generateRoleNames();

    lastQuery = query;
}

void SqlQueryModelTemplate::setMissingImagePath(QString path)
{
    missingImagePath = path;
}

QVariant SqlQueryModelTemplate::getItemByIndexName(int index, QByteArray roleName)
{
    int role = m_roleNames.key(roleName);
    int columnIdx = role - Qt::UserRole - 1;

    QModelIndex modelIndex = this->index(index, columnIdx);
    QVariant value = QSqlQueryModel::data(modelIndex, Qt::DisplayRole);

    return value;
}

void SqlQueryModelTemplate::generateRoleNames()
{
    m_roleNames.clear();
    for (int i = 0; i < record().count(); i ++) {
        m_roleNames.insert(Qt::UserRole + i + 1, record().fieldName(i).toUtf8());
    }
}

QVariant SqlQueryModelTemplate::data(const QModelIndex &index, int role) const
{
    if(role < Qt::UserRole) {
        return QSqlQueryModel::data(index, role);
    }

    QVariant value;

    int columnIdx = role - Qt::UserRole - 1;
    QModelIndex modelIndex = this->index(index.row(), columnIdx);
    value = QSqlQueryModel::data(modelIndex, Qt::DisplayRole);

    if (roleNames().value(role) == "icon") {
        QImage img;
        if (img.loadFromData(value.toByteArray()))
            return img;
        else {
            img.load(missingImagePath);
            return img;
        }
    }
    return value;
}

void SqlQueryModelTemplate::updateModel()
{
    QSqlQueryModel::setQuery(lastQuery);
    generateRoleNames();
}

void SqlQueryModelTemplate::updateModel(QSqlQuery query)
{
    QSqlQueryModel::setQuery(query);
    generateRoleNames();
}
