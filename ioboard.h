#ifndef IOBOARD_H
#define IOBOARD_H

#include <QtCore/QObject>
#include <QtWebSockets/QWebSocket>
#include <QQmlContext>

#include "boardprotocol.h"
#include "productobject.h"


class IoBoard : public QObject
{
    Q_OBJECT

public:
    explicit IoBoard(QUrl url, QQmlContext* pContext);
    void boardDebug();

public slots:   // slots are public methods available in QML
    void doSomething(const QString &text);
    void doOpen();
    void doClose();
    QString getState();
    void sendCmd(QString cmd);


Q_SIGNALS:
    void closed();
    void statusChanged(QString msg);


private Q_SLOTS:
    void onConnected();
    void onDisconnected();
    void onTextMessageReceived(QString message);
    void onError();
    void onBancChanged(int);
    void onCreditChanged(float);
    void onNewProduct(ProductObject *product);

private:
    QWebSocket m_webSocket;
    bool m_debug;
    QUrl m_url;
    BoardProtocol m_protocol;
    QQmlContext* m_pQmlContext;
    QList<ProductObject*> m_products;
    int m_idxNewProduct;
};

#endif // IOBOARD_H
