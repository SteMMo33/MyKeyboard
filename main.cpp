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

    engine.load(url);

    //SM Come puntare un oggetto QML ed usarlo in C++
    //QObject *object = component.create();
    //QObject *button = object->findChild<QObject *>("button1");    // Il nome usato è un 'objectName:xx' in QML
    //if(button)
    //    button->setProperty("text","c++");


    // - WebSocket
    IoBoard* board = new IoBoard();

    // Run
    return app.exec();
}
