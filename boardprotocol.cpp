#include "boardprotocol.h"


BoardProtocol::BoardProtocol()
{

}



void BoardProtocol::DecodeCommand(QString cmd)
{
    qDebug() << "[Protocol] " << cmd;

    QJsonDocument doc = QJsonDocument::fromJson(cmd);
    QJsonObject obj = doc.object();
    if (obj.contains("")){
        qDebug() << "OO";
    }
}
