#include "productobject.h"


// Costruttore
ProductObject::ProductObject(const QString &name, const QString &desc, const QString &prezzo, QObject *parent)
    : QObject(parent), m_name(name), m_desc(desc), m_prezzo(prezzo)
{
}

ProductObject::ProductObject( ProductObject& product)
{
    m_name = product.name();
    m_desc = product.description();
    m_prezzo = product.prezzo();
};


QString ProductObject::name() const
{
    return m_name;
}

QString ProductObject::description() const
{
    return m_desc;
}

QString ProductObject::prezzo() const
{
    return m_prezzo;
}
