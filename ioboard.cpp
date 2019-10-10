#include "ioboard.h"


/**
 * @brief IoBoard::IoBoard - Csotruttore - Viene aperto il websocket verso la scheda di IO
 * @param url
 */
IoBoard::IoBoard(QUrl url, QQmlContext* context) : m_debug(true), m_url(url), m_pQmlContext(context)
{
    qDebug() << "++ IoBoard Constructor to " << url;

    // non serve? m_pWebSocket = new QWebSocket();

    // In caso di connessione richiama la funzione membro
    connect(&m_webSocket, &QWebSocket::connected, this, &IoBoard::onConnected);
    //connect(&m_webSocket, &QWebSocket::errorString, this, &IoBoard::onError);
    //connect(&m_webSocket, &QWebSocket::error, this, &IoBoard::onError);

    // In caso di disconnessione genera il signal 'closed'
    connect(&m_webSocket, &QWebSocket::disconnected, this, &IoBoard::closed);
    connect(&m_webSocket, &QWebSocket::disconnected, this, &IoBoard::onDisconnected);

    connect( &m_protocol, &BoardProtocol::creditChanged, this, &IoBoard::onCreditChanged);

    m_webSocket.open(url);
    //m_webSocket.open(QUrl(url));

    qDebug() << "-- IoBoard Constructor";
}



void IoBoard::onConnected()
{
    if (m_debug)
        qDebug() << "[IoBoard] WebSocket connected";

    // In caso di ricezione dati richiama la funzione membro
    connect(&m_webSocket, &QWebSocket::textMessageReceived, this, &IoBoard::onTextMessageReceived);

    //statusChanged("Connected");
    // m_webSocket.sendTextMessage(QStringLiteral("Hello, world!"));
}


void IoBoard::onDisconnected()
{
    if (m_debug)
        qDebug() << "[IoBoard] WebSocket disconnected";
    // onStatusChanged("Not Connected");
}


void IoBoard::onError()
{
    qDebug() << "[IoBoard] onError - State: " + m_webSocket.errorString();
};


/**
 * @brief IoBoard::onTextMessageReceived
 * @param message
 */
void IoBoard::onTextMessageReceived(QString message)
{
    if (m_debug)
        qDebug() << "[IoBoard] Message received:" << message;
    //? m_webSocket.close();
    m_protocol.DecodeCommand(message);
}


void IoBoard::boardDebug()
{
    qDebug() << "[IoBoard] boardDebug - State: " + m_webSocket.state();
};


void IoBoard::doSomething(const QString &text) {
 qDebug() << "[IoBoard] doSomething called with" << text;
}


void IoBoard::doOpen() {
 qDebug() << "[] doOpen @ " << m_url;
 m_webSocket.open(m_url);
}

void IoBoard::doClose() {
 qDebug() << "[] doClose";
 m_webSocket.close();
}

QString IoBoard::getState() {
 qDebug() << "[] getState - State: " << m_webSocket.state();
 return m_webSocket.state()==QAbstractSocket::ConnectedState ? "Connected": "Not connected";
}

void IoBoard::sendCmd(QString cmd) {
 qDebug() << "[IoBoard] sendCmd : " << cmd;
 /* int bytes = */ m_webSocket.sendTextMessage(cmd);
 // qDebug() << "[IoBoard] sent " << bytes << " bytes";
}


void IoBoard::onCreditChanged(float credit)
{
    qDebug() << "[IoBoard::onCreditChanged]";
    m_pQmlContext->setContextProperty("credit", QString::number( credit, 'g', 2));
}

void IoBoard::onBancChanged(int val)
{
    qDebug() << "[IoBoard::onBancChanged] val: " << val;
    m_pQmlContext->setContextProperty("credit", QString::number(val, 'g', 2));
}
