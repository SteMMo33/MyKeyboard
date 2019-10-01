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

Q_SIGNALS:
    void closed();

private Q_SLOTS:
    void onConnected();
    void onTextMessageReceived(QString message);
    void onError();

private:
    QWebSocket m_webSocket;
    bool m_debug;
};

#endif // IOBOARD_H
