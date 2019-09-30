#ifndef IOBOARD_H
#define IOBOARD_H

#include <QtWebSockets/QWebSocket>


class IoBoard
{
public:
    IoBoard();


private:
    QWebSocket* m_pWebSocket;
};

#endif // IOBOARD_H
