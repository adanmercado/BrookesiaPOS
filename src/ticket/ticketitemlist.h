#ifndef TICKETITEMLIST_H
#define TICKETITEMLIST_H

#include <QObject>
#include <QVector>

class TicketItem
{
public:
    int id;
    QString barcode;
    QString description;
    double qty;
    double price;
    double amount;
};

class TicketItemList : public QObject
{
    Q_OBJECT
public:
    explicit TicketItemList(QObject *parent = nullptr);

    bool setItemAt(const int &index, const TicketItem &item);
    QVector<TicketItem> items() const;

public slots:
    void appendItem(const TicketItem &item);
    bool isItemInTicket(const QString &barcode) const;

signals:
    void itemAppended();
    void itemUpdated(const int &index);

private:
    QVector<TicketItem> m_items;
};

#endif // TICKETITEMLIST_H
