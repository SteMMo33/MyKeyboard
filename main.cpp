#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>      //SM +
#include <QQmlComponent>    //SM +

#include <QtSql>            //SM +

#include "label.h"
#include "ioboard.h"
#include "productobject.h"


/**
    Punto ingresso
*/
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


    // Apertura databse MySql
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
       db.setHostName("10.191.40.232");
       db.setDatabaseName("kiosk");
       db.setUserName("root");
       db.setPassword("amtek");
       bool ok = db.open();

    if (ok){
       QSqlQuery query;
       query.exec("SELECT name, salary FROM employee WHERE salary > 50000");
       while (query.next()) {
        QString name = query.value(0).toString();
        int salary = query.value(1).toInt();
        qDebug() << name << salary;
       }

       QSqlQueryModel model;
       model.setQuery("SELECT * FROM settings");
       for (int i = 0; i < model.rowCount(); ++i) {
        int id = model.record(i).value("id").toInt();
        QString name = model.record(i).value("name").toString();
        qDebug() << id << name;
       }

      db.close();
    }

    // Dati inseriti da codice C++ - diventerà lettura da DB
    /* Con semplice lista di stringhe
    QStringList dataList;
    dataList.append("Item 1");
    dataList.append("Item 2");
    dataList.append("Item 3");
    dataList.append("Item 4");
    context->setContextProperty("myProductModel", QVariant::fromValue(dataList));
    */

    // Con lista oggetti ProductObject
    QList<QObject*> dataList;
       dataList.append(new ProductObject(QString("Easy 12"), QString("red"), "5.50"));
       dataList.append(new ProductObject("Signs 12", "green", "4.50"));
       dataList.append(new ProductObject("Cerotti buoni", "blue", "10.00"));
       dataList.append(new ProductObject("Gel Mediterranean", "yellow", "9.00"));
       dataList.append(new ProductObject("XLUBE", "orange", "12.00"));

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
