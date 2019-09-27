#ifndef LABEL_H
#define LABEL_H

#include <QObject>

class Label : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)

public:
    explicit Label(QString name, QObject *parent = nullptr);

    QString name(){return m_name;}

    void setName(QString newName){
        m_name=newName;
        emit nameChanged();
    }

signals:
    void nameChanged();

public slots:

private:
    QString m_name;
};

#endif // LABEL_H
