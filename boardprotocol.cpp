#include "boardprotocol.h"


/**
 * @brief BoardProtocol::BoardProtocol
 */
BoardProtocol::BoardProtocol()
{

}


/**
 * @brief BoardProtocol::DecodeCommand
 * @param cmd
 */
void BoardProtocol::DecodeCommand(QString cmd)
{
    qDebug() << "[Protocol] " << cmd;

    QJsonDocument doc = QJsonDocument::fromJson(cmd.toUtf8());

    QJsonObject obj = doc.object();
    if (obj.contains("cmd")){
        qDebug() << "Comando!\r\n";
    }
    else {
        qDebug() << "OO\r\n";
    }
}
