#ifndef PRODUCTOBJECT_H
#define PRODUCTOBJECT_H

#include <QObject>

class ProductObject : public QObject
{
    Q_OBJECT

    // Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    // Q_PROPERTY(QString color READ color WRITE setColor NOTIFY colorChanged)
    Q_PROPERTY(QString name READ name)
    Q_PROPERTY(QString color READ color)
    Q_PROPERTY(QString prezzo READ prezzo)

public:
    explicit ProductObject(const QString &name, const QString &color, const QString &prezzo, QObject *parent = 0);

     QString name() const;
     QString color() const;
     QString prezzo() const;

signals:

public slots:

private:
    QString m_name;
    QString m_color;
    QString m_prezzo;
};

#endif // PRODUCTOBJECT_H
