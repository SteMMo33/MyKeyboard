#include "ioboard.h"

IoBoard::IoBoard()
{

    qDebug() << "Constructor";

    m_pWebSocket = new QWebSocket("ws://localhost:7681");

}
