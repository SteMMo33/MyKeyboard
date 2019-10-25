#include "boardprotocol.h"
#include "productobject.h"


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
            // qDebug() << "Comando: " << cmd;

            if (cmd.compare("firmware")==0){        // Keep alive
                // qDebug() << "alive!";
            }
            else if (cmd.compare("banc")==0){       // Banconota
                QString v = obj["v"].toString();
                QStringList elem = v.split("=");
                int index = elem[0].toInt();
                int num = elem[1].toInt();
                m_banconote.update(index, num);

                float fCredit = m_banconote.val();
                emit creditChanged(fCredit);
            }
            else if (cmd.compare("GetProduct")==0){ // Lettura prodotto
                // Controllo esito
                QString v = obj["v"].toString();
                if (v.compare("ok")==0){
                    QJsonObject jData = obj["data"].toObject();
                    // Prodotto
                    // qDebug() << jData;
                    ProductObject *product = new ProductObject( jData["name"].toString(), jData["desc"].toString(), jData["price"].toString());
                    // qDebug() << product;
                    emit newProductData(product);
                }
            }
            else {
                qDebug() << "cmd not handled";
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
