#ifndef BOARDPROTOCOL_H
#define BOARDPROTOCOL_H

#include <QtCore/QObject>
#include <QJsonDocument>


class BoardProtocol
{
    Q_OBJECT

public:
    BoardProtocol();

    void DecodeCommand(QString cmd);
};

#endif // BOARDPROTOCOL_H
