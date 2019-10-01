#include "productobject.h"


// Costruttore
ProductObject::ProductObject(const QString &name, const QString &color, QObject *parent) : QObject(parent), m_name(name), m_color(color)
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

