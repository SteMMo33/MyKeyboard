#ifndef IOBOARD_H
#define IOBOARD_H

#include <QtCore/QObject>
#include <QtWebSockets/QWebSocket>


class IoBoard : public QObject
{
    Q_OBJECT

public:
    explicit IoBoard(QUrl url);
    void boardDebug();

public slots:   // slots are public methods available in QML
    void doSomething(const QString &text);
    void doOpen();
    void doClose();
    void getState();
    void sendCmd(QString cmd);



Q_SIGNALS:
    void closed();

private Q_SLOTS:
    void onConnected();
    void onDisconnected();
    void onTextMessageReceived(QString message);
    void onError();

private:
    QWebSocket m_webSocket;
    bool m_debug;
    QUrl m_url;
};

#endif // IOBOARD_H
