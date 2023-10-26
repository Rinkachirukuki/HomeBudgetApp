#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "databasemanager.h"
#include "Repositories/familyrepository.h"
#include "Repositories/categoryrepository.h"
#include "Repositories/goodrepository.h"
#include "Repositories/transactionsrepository.h"

#include "filereader.h"
#include "blobimage.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQmlContext* pContext = engine.rootContext();
    qmlRegisterType<BlobImage>("ImageConnector", 1, 0,"BlobImage");

    const QUrl url(QStringLiteral("qrc:/main.qml"));

    DatabaseManager databaseManager = DatabaseManager();
    FamilyRepository* familyRepository = new FamilyRepository(QCoreApplication::instance());
    CategoryRepository* categoryRepository = new CategoryRepository(QCoreApplication::instance());
    GoodRepository* goodRepository = new GoodRepository(QCoreApplication::instance());
    TransactionsRepository* transactionsRepository = new TransactionsRepository(QCoreApplication::instance());

    FileReader * fileReader = new FileReader(QCoreApplication::instance());

    pContext->setContextProperty("FileReader", fileReader);

    pContext->setContextProperty("FamilyModel", familyRepository->getModel());
    pContext->setContextProperty("FamilyRepository", familyRepository);

    pContext->setContextProperty("CategoryModel", categoryRepository->getModel());
    pContext->setContextProperty("CategoryRepository", categoryRepository);

    pContext->setContextProperty("GoodModel", goodRepository->getModel());
    pContext->setContextProperty("GoodRepository", goodRepository);

    pContext->setContextProperty("TransactionsModel", transactionsRepository->getModel());
    pContext->setContextProperty("TransactionsRepository", transactionsRepository);

    app.setOrganizationName("Rinkachirukuki Inc.");
    app.setApplicationName("HomeBudgetApp");

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
