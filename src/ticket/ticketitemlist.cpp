#include "ticketitemlist.h"
#include <QDebug>

TicketItemList::TicketItemList(QObject *parent) : QObject(parent)
{
    //Test
    m_items.append({1, "123", "Test product 1", 5, 10, 50});
    m_items.append({2, "1234", "Test product 2", 15, 3, 45});
    m_items.append({3, "12345", "Test product 3", 6, 8, 48});
    m_items.append({4, "123456", "Test product 4", 10, 9, 90});
    m_items.append({5, "1234567", "Test product 5", 8, 8, 64});
}

bool TicketItemList::setItemAt(const int &index, const TicketItem &item)
{
    if(index < 0 || index > m_items.size())
        return false;

    m_items[index] = item;
    emit itemUpdated(index);
    return true;
}

QVector<TicketItem> TicketItemList::items() const
{
    return m_items;
}

void TicketItemList::appendItem(const TicketItem &item)
{
    m_items.append(item);
    emit itemAppended();
}

bool TicketItemList::isItemInTicket(const QString &barcode) const
{
    if(barcode.isEmpty())
        return false;

    foreach(TicketItem item, m_items) {
        if(item.barcode == barcode)
            return true;
    }
    return false;
}
