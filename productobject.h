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

public:
    explicit ProductObject(const QString &name, const QString &color, QObject *parent = 0);

     QString name() const;
     QString color() const;

signals:

public slots:

private:
    QString m_name;
    QString m_color;
};

#endif // PRODUCTOBJECT_H
