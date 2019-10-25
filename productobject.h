#ifndef PRODUCTOBJECT_H
#define PRODUCTOBJECT_H

#include <QObject>

class ProductObject : public QObject
{
    Q_OBJECT

    // Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString name READ name NOTIFY nameChanged)
    Q_PROPERTY(QString description READ description)
    Q_PROPERTY(QString prezzo READ prezzo NOTIFY prezzoChanged)

public:
    explicit ProductObject(const QString &name, const QString &desc, const QString &prezzo, QObject *parent = 0);
    ProductObject( ProductObject&);

     QString name() const;
     QString description() const;
     QString prezzo() const;

signals:
     void nameChanged();
     void prezzoChanged();

public slots:

private:
    QString m_name;
    QString m_desc;
    QString m_prezzo;
};

#endif // PRODUCTOBJECT_H
