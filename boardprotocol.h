#ifndef BOARDPROTOCOL_H
#define BOARDPROTOCOL_H

#include <QtCore/QObject>
#include <QJsonDocument>
#include <QJsonObject>
#include <QDebug>


class BoardProtocol : public QObject
{
    Q_OBJECT

public:
    BoardProtocol();

    void DecodeCommand(QString cmd);
};

#endif // BOARDPROTOCOL_H
