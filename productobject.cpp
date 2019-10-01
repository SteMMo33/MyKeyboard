#include "productobject.h"


// Costruttore
ProductObject::ProductObject(const QString &name, const QString &color, const QString &prezzo, QObject *parent)
    : QObject(parent), m_name(name), m_color(color), m_prezzo(prezzo)
{
}


QString ProductObject::name() const
{
    return m_name;
}

QString ProductObject::color() const
{
    return m_color;
}

QString ProductObject::prezzo() const
{
    return m_prezzo;
}
