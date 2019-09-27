/**
  Classe di interfaccia tra QML e C++
*/

#include "label.h"

Label::Label(QString name, QObject *parent) : QObject(parent)
{
    setName(name);
}
