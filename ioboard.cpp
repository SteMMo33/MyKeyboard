#include "ioboard.h"


IoBoard::IoBoard(QUrl url) : m_debug(true)
{
    qDebug() << "++ IoBoard Constructor to " << url;

    // non serve? m_pWebSocket = new QWebSocket();

    // In caso di connessione richiama la funzione membro
    connect(&m_webSocket, &QWebSocket::connected, this, &IoBoard::onConnected);
    //connect(&m_webSocket, &QWebSocket::errorString, this, &IoBoard::onError);
    //connect(&m_webSocket, &QWebSocket::error, this, &IoBoard::onError);

    // In caso di disconnessione genera il signal 'closed'
    connect(&m_webSocket, &QWebSocket::disconnected, this, &IoBoard::closed);

    m_webSocket.open(QUrl(url));

    qDebug() << "-- IoBoard Constructor";
}



void IoBoard::onConnected()
{
    if (m_debug)
        qDebug() << "[IoBoard] WebSocket connected";

    // In caso di ricezione dati richiama la funzione membro
    connect(&m_webSocket, &QWebSocket::textMessageReceived, this, &IoBoard::onTextMessageReceived);

    m_webSocket.sendTextMessage(QStringLiteral("Hello, world!"));
}


void IoBoard::onError()
{
    qDebug() << "[IoBoard] onError - State: " + m_webSocket.errorString();
};


void IoBoard::onTextMessageReceived(QString message)
{
    if (m_debug)
        qDebug() << "[IoBoard] Message received:" << message;
    m_webSocket.close();
}

void IoBoard::boardDebug()
{
    qDebug() << "[IoBoard] boardDebug - State: " + m_webSocket.state();
};
