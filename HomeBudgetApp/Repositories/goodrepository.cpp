#include "goodrepository.h"

GoodRepository::GoodRepository(QObject *parent)
    : QObject{parent}
{
    sqlQueryModel = new SqlQueryModelTemplate();
    sqlQueryModel->setMissingImagePath("://Icons/missing_category.png");
    getList("");
}


void GoodRepository::setSelectedCategoryId(QString id) {
    selectedCategoryId = id;
    getList(id);
    selectedCategoryIdChanged();
}

QString GoodRepository::getSelectedCategoryId()
{
    return selectedCategoryId;
}

void GoodRepository::getList(const QString &categoryId)
{
    QSqlQuery query(database);

    query.prepare("SELECT * FROM " GOODS_TABLE " WHERE category_id = :categoryId");
    query.bindValue(":categoryId", categoryId);

    if (!query.exec())
        qDebug() << "Ошибка выполнения запроса: " + query.lastError().text();

    sqlQueryModel->updateModel(query);
}

void GoodRepository::addItem(const QString &categoryId, const QString &name, const QByteArray &image)
{
    QSqlQuery query(database);
    QImage img;

    if (img.loadFromData(image)) {
        query.prepare("INSERT INTO " GOODS_TABLE " (name, category_id, icon) VALUES (:name, :categoryId, :image)");
        query.bindValue(":image", image);
    }
    else {
        query.prepare("INSERT INTO " GOODS_TABLE " (name, category_id) VALUES (:name, :categoryId)");
    }
    query.bindValue(":name", name);
    query.bindValue(":categoryId", categoryId);

    if (!query.exec())
        qDebug() << "Ошибка выполнения запроса: " + query.lastError().text();

    getList(selectedCategoryId);
}

void GoodRepository::deleteItem(const QString &id)
{
    QSqlQuery query(database);
    query.prepare("DELETE FROM " GOODS_TABLE " WHERE id=:id");
    query.bindValue(":id", id);

    if (!query.exec())
        qDebug() << "Ошибка выполнения запроса: " + query.lastError().text();

    getList(selectedCategoryId);
}

void GoodRepository::editItem(const QString &id, const QString &categoryId , const QString &name, const QByteArray &image)
{
    QSqlQuery query(database);
    QImage img;

    if (img.loadFromData(image)) {
        query.prepare("UPDATE " GOODS_TABLE " SET name=:name, category_id=:categoryId, icon=:image WHERE id=:id");
        query.bindValue(":image", image);
    }
    else {
        query.prepare("UPDATE " GOODS_TABLE " SET name=:name, category_id=:categoryId WHERE id=:id");
    }
    query.bindValue(":name", name);
    query.bindValue(":categoryId", categoryId);
    query.bindValue(":id", id);

    if (!query.exec())
        qDebug() << "Ошибка выполнения запроса: " + query.lastError().text();

    getList(selectedCategoryId);
}

SqlQueryModelTemplate *GoodRepository::getModel()
{
    return sqlQueryModel;
}
