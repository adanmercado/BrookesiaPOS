#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "ticket/ticketmodel.h"
#include "ticket/ticketitemlist.h"
#include "products/productmodel.h"

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
    qmlRegisterType<Product>("brookesiapos.structs", 1, 0, "Product");
    qmlRegisterUncreatableType<TicketItemList>("brookesiapos.models", 1, 0, "TicketItemList", QStringLiteral("TicketItemList cannot be created in QML"));
    qmlRegisterUncreatableType<TicketItemList>("brookesiapos.models", 1, 0, "ProductModel", QStringLiteral("ProductModel cannot be created in QML"));
    TicketItemList ticketItemList;

    ProductModel productModel;
    //Temp test
    Product *product = new Product;
    product->setProductId(1);
    product->setBarcode("123");
    product->setDescription("Test product");
    product->setPurchasePrice(30);
    product->setSalePrice(45);
    product->setProfitPercent(50);
    product->setCashProfit(15);
    product->setStock(30);
    product->setMinStock(3);
    product->setCategory(1);
    product->setProvider(1);
    product->setTax(1);
    product->setMeasure(1);
    product->setPicture("qrc:/img/picture.jpg");
    productModel.append(product);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("ticketItemList", &ticketItemList);
    engine.rootContext()->setContextProperty("productsModel", &productModel);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
