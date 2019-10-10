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

    if (cmd[0]=='{'){   // Formato JSON

        QJsonDocument doc = QJsonDocument::fromJson(cmd.toUtf8());
        QJsonObject obj = doc.object();

        if (obj.contains("cmd")){
            QString cmd = obj["cmd"].toString();
            qDebug() << "Comando: " << cmd;

            if (cmd.compare("firmware")==0){
                // qDebug() << "alive!";
            }
            else if (cmd.compare("banc")==0){
                QString v = obj["v"].toString();
                QStringList elem = v.split("=");
                int index = elem[0].toInt();
                int num = elem[1].toInt();
                m_banconote.update(index, num);

                float fCredit = m_banconote.val();
                emit creditChanged(fCredit);
            }
        }
        else {
            qDebug() << "ERR JSON senza 'cmd'";
        }
    }
    else {  // Formato non JSON
        qDebug() << " comando non-JSON non gestito!";
    }
}
