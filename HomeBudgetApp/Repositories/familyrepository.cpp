#include "familyrepository.h"

FamilyRepository::FamilyRepository(QObject *parent)
    : QObject{parent}
{
    sqlQueryModel = new SqlQueryModelTemplate();
    sqlQueryModel->setMissingImagePath("://Icons/missing.png");
    sqlQueryModel->setQuery("SELECT * FROM " FAMILY_TABLE " WHERE is_deleted=0;", database);
}

void FamilyRepository::getList()
{
    QSqlQuery query(database);

    query.prepare("SELECT * FROM " FAMILY_TABLE " WHERE is_deleted = :isDeleted;");
    query.bindValue(":isDeleted", 1);

    sqlQueryModel->updateModel(query);
}

void FamilyRepository::addItem(const QString &firstName, const QString &lastName, const QString &patronymic, const QByteArray &image)
{
    QSqlQuery query(database);
    QImage img;

    if (img.loadFromData(image)) {
        query.prepare("INSERT INTO " FAMILY_TABLE " (first_name, last_name, patronymic, icon) VALUES (:firstName, :lastName, :patronymic, :image)");
        query.bindValue(":image", image);
    }
    else {
        query.prepare("INSERT INTO " FAMILY_TABLE " (first_name, last_name, patronymic) VALUES (:firstName, :lastName, :patronymic)");
    }
    query.bindValue(":firstName", firstName);
    query.bindValue(":lastName", lastName);
    query.bindValue(":patronymic", patronymic);

    if (!query.exec())
        qDebug() << "Ошибка выполнения запроса: " + query.lastError().text();

    sqlQueryModel->updateModel();
}

void FamilyRepository::deleteItem(const QString &id)
{
    QSqlQuery query(database);
    query.prepare("UPDATE " FAMILY_TABLE " SET is_deleted=1 WHERE id=:id");
    query.bindValue(":id", id);

    if (!query.exec())
        qDebug() << "Ошибка выполнения запроса: " + query.lastError().text();

    sqlQueryModel->updateModel();
}

void FamilyRepository::editItem(const QString &id, const QString &firstName, const QString &lastName, const QString &patronymic, const QByteArray &image)
{
    QSqlQuery query(database);
    QImage img;

    if (img.loadFromData(image)) {
        query.prepare("UPDATE " FAMILY_TABLE " SET first_name=:firstName, last_name=:lastName, patronymic=:patronymic, icon=:image WHERE id=:id");
        query.bindValue(":image", image);
    }
    else {
        query.prepare("UPDATE " FAMILY_TABLE " SET first_name=:firstName, last_name=:lastName, patronymic=:patronymic WHERE id=:id");
    }
    query.bindValue(":firstName", firstName);
    query.bindValue(":lastName", lastName);
    query.bindValue(":patronymic", patronymic);
    query.bindValue(":id", id);

    if (!query.exec())
        qDebug() << "Ошибка выполнения запроса: " + query.lastError().text();

    sqlQueryModel->updateModel();
}

SqlQueryModelTemplate *FamilyRepository::getModel()
{
    return sqlQueryModel;
}
