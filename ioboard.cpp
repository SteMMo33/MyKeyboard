#include "ioboard.h"


IoBoard::IoBoard() : m_debug(true)
{
    qDebug() << "++ IoBoard Constructor";

    // non serve? m_pWebSocket = new QWebSocket();

    // In caso di connessione richiama la funzione membro
    connect(&m_webSocket, &QWebSocket::connected, this, &IoBoard::onConnected);

    // In caso di disconnessione genera il signal 'closed'
    connect(&m_webSocket, &QWebSocket::disconnected, this, &IoBoard::closed);

    m_webSocket.open(QUrl("ws://localhost:7681"));

    qDebug() << "-- IoBoard Constructor";
}



void IoBoard::onConnected()
{
    if (m_debug)
        qDebug() << "WebSocket connected";

    // In caso di ricezione dati richiama la funzione membro
    connect(&m_webSocket, &QWebSocket::textMessageReceived, this, &IoBoard::onTextMessageReceived);

    m_webSocket.sendTextMessage(QStringLiteral("Hello, world!"));
}




void IoBoard::onTextMessageReceived(QString message)
{
    if (m_debug)
        qDebug() << "Message received:" << message;
    m_webSocket.close();
}
