#include "categoryrepository.h"

CategoryRepository::CategoryRepository(QObject *parent)
    : QObject{parent}
{
    sqlQueryModel = new SqlQueryModelTemplate();
    sqlQueryModel->setMissingImagePath("://Icons/missing_category.png");
    sqlQueryModel->setQuery("SELECT * FROM " CATEGORIES_TABLE "", database);
}

void CategoryRepository::getList()
{
    QSqlQuery query(database);

    query.prepare("SELECT * FROM " CATEGORIES_TABLE "");

    sqlQueryModel->updateModel(query);
}

void CategoryRepository::addItem(const QString &name, const QByteArray &image)
{
    QSqlQuery query(database);
    QImage img;

    if (img.loadFromData(image)) {
        query.prepare("INSERT INTO " CATEGORIES_TABLE " (name, icon) VALUES (:name, :image)");
        query.bindValue(":image", image);
    }
    else {
        query.prepare("INSERT INTO " CATEGORIES_TABLE " (name) VALUES (:name)");
    }
    query.bindValue(":name", name);

    if (!query.exec())
        qDebug() << "Ошибка выполнения запроса: " + query.lastError().text();

    sqlQueryModel->updateModel();
}

void CategoryRepository::deleteItem(const QString &id)
{
    QSqlQuery query(database);
    query.prepare("DELETE FROM " CATEGORIES_TABLE " WHERE id=:id");
    query.bindValue(":id", id);

    if (!query.exec())
        qDebug() << "Ошибка выполнения запроса: " + query.lastError().text();

    sqlQueryModel->updateModel();
}

void CategoryRepository::editItem(const QString &id, const QString &name, const QByteArray &image)
{
    QSqlQuery query(database);
    QImage img;

    if (img.loadFromData(image)) {
        query.prepare("UPDATE " CATEGORIES_TABLE " SET name=:name, icon=:image WHERE id=:id");
        query.bindValue(":image", image);
    }
    else {
        query.prepare("UPDATE " CATEGORIES_TABLE " SET name=:name WHERE id=:id");
    }
    query.bindValue(":name", name);
    query.bindValue(":id", id);

    if (!query.exec())
        qDebug() << "Ошибка выполнения запроса: " + query.lastError().text();

    sqlQueryModel->updateModel();
}

SqlQueryModelTemplate *CategoryRepository::getModel()
{
    return sqlQueryModel;
}
