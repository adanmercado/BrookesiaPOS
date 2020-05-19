#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "ticket/ticketmodel.h"
#include "ticket/ticketitemlist.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);

    QGuiApplication app(argc, argv);
    app.setApplicationName("Brookesia POS");
    app.setApplicationDisplayName("Brookesia POS");
    app.setDesktopFileName("Brookesia POS");
    app.setApplicationVersion("1.0.0");
    app.setOrganizationName("Mercader Software");
    app.setOrganizationDomain("mercadersoftware.com.mx");

    qmlRegisterType<TicketModel>("brookesiapos.models", 1, 0, "TicketModel");
    qmlRegisterUncreatableType<TicketItemList>("brookesiapos.models", 1, 0, "TicketItemList", QStringLiteral("TicketItemList should not be created in QML"));
    TicketItemList ticketItemList;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("ticketItemList", &ticketItemList);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
