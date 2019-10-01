#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>      //SM +
#include <QQmlComponent>    //SM +

#include "label.h"
#include "ioboard.h"



int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
                &engine,
                &QQmlApplicationEngine::objectCreated,
                &app,
                [url](QObject *obj, const QUrl &objUrl) {
                    if (!obj && url == objUrl)
                        QCoreApplication::exit(-1);
                },
                Qt::QueuedConnection
    );

    //SM Collegamento tra C++ e QML
    QQmlContext *context = engine.rootContext();
    Label label("Pippo");

    context->setContextProperty("label",&label);
    // Il QML può far riferimento al nome 'label' e al valore 'label.name'


    // Dati inseriti da codice C++ - diventerà lettura da DB
    QStringList dataList;
    dataList.append("Item 1");
    dataList.append("Item 2");
    dataList.append("Item 3");
    dataList.append("Item 4");
    context->setContextProperty("myProductModel", QVariant::fromValue(dataList));


    engine.load(url);

    //SM Come puntare un oggetto QML ed usarlo in C++
    //QObject *object = component.create();
    //QObject *button = object->findChild<QObject *>("button1");    // Il nome usato è un 'objectName:xx' in QML
    //if(button)
    //    button->setProperty("text","c++");


    // - WebSocket
    IoBoard board();

    // Collega il signal della classe alla chiusura della app
    // QObject::connect(&client, &EchoClient::closed, &a, &QCoreApplication::quit);

    // Run
    return app.exec();
}
