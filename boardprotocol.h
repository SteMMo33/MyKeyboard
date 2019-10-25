#ifndef BOARDPROTOCOL_H
#define BOARDPROTOCOL_H

#include <QtCore/QObject>
#include <QJsonDocument>
#include <QJsonObject>
#include <QDebug>

//#include "ioboard.h"
#include "banconote.h"
#include "productobject.h"



class BoardProtocol : public QObject
{
    Q_OBJECT

Q_SIGNALS:
    void bancChanged(int val);
    void coinChanged(float val);
    void creditChanged(float credit);
    void newProductData(ProductObject *product);

public slots:
    // void onCreditChanged(float nEuroCents);

public:
    BoardProtocol(/*IoBoard* board*/);

    void DecodeCommand(QString cmd);


private:
    Banconote m_banconote;
};

#endif // BOARDPROTOCOL_H
