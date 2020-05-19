#include "ticketmodel.h"

#include "ticketitemlist.h"

#include <QDebug>

TicketModel::TicketModel(QObject *parent)
    : QAbstractListModel(parent),
      m_list(nullptr)
{
}

int TicketModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid() || !m_list)
        return 0;

    return m_list->items().size();
}

QVariant TicketModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || !m_list)
        return QVariant();

    const TicketItem item = m_list->items().at(index.row());
    switch(role) {
        case IdRole:
            return QVariant(item.id);
        case BarcodeRole:
            return QVariant(item.barcode);
        case DescriptionRole:
            return QVariant(item.description);
        case QtyRole:
            return QVariant(item.qty);
        case PriceRole:
            return QVariant(item.price);
        case AmountRole:
            return QVariant(item.amount);
    }

    return QVariant();
}

bool TicketModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(!m_list)
        return false;

    qDebug() << "TicketModel::setData";

    TicketItem item = m_list->items().at(index.row());
    switch(role) {
        case IdRole:
            item.id = value.toInt();
            break;
        case BarcodeRole:
            item.barcode = value.toString();
            break;
        case DescriptionRole:
            item.description = value.toString();
            break;
        case QtyRole:
            item.qty = value.toDouble();
            break;
        case PriceRole:
            item.price = value.toDouble();
            break;
        case AmountRole:
            item.amount = value.toDouble();
    }

    if(m_list->setItemAt(index.row(), item)) {
        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }
    return false;
}

Qt::ItemFlags TicketModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable;
}

QHash<int, QByteArray> TicketModel::roleNames() const
{
    QHash<int, QByteArray> names;
    names[IdRole] = "id";
    names[BarcodeRole] = "barcode";
    names[DescriptionRole] = "description";
    names[QtyRole] = "qty";
    names[PriceRole] = "price";
    names[AmountRole] = "amount";
    return names;
}

TicketItemList *TicketModel::list() const
{
    return m_list;
}

void TicketModel::setList(TicketItemList *list)
{
    beginResetModel();
    m_list = list;
    endResetModel();
}

QVariantMap TicketModel::get(const int &row)
{
    QHash<int, QByteArray> names = roleNames();
    QHashIterator<int, QByteArray> i(names);
    QVariantMap res;
    while(i.hasNext()) {
        i.next();
        QModelIndex idx = index(row, 0);
        QVariant data = idx.data(i.key());
        res[i.value()] = data;
    }
    return res;
}

bool TicketModel::increaseItemQty(const int &index, const double &qty)
{
    if(index < 0 || index > m_list->items().size())
        return false;

    TicketItem item = m_list->items().at(index);
    item.qty += qty;
    item.amount = item.qty * item.price;
    if(m_list->setItemAt(index, item)) {
        emit dataChanged(this->index(index, 0), this->index(index, 0), QVector<int>() << QtyRole << AmountRole);
        return true;
    }
    return false;
}

bool TicketModel::decreaseItemQty(const int &index, const double &qty)
{
    if(index < 0 || index > m_list->items().size())
        return false;

    TicketItem item = m_list->items().at(index);
    if(qty > item.qty)
        return false;

    item.qty -= qty;
    item.amount = item.qty * item.price;
    if(m_list->setItemAt(index, item)) {
        emit dataChanged(this->index(index, 0), this->index(index, 0), QVector<int>() << QtyRole << AmountRole);
        return true;
    }
    return false;
}

bool TicketModel::removeItem(const int &row)
{
    if(row < 0 || row > m_list->items().size())
        return false;

    beginRemoveRows(QModelIndex(), row, row);
    m_list->items().removeAt(row);
    endRemoveRows();
    return true;
}

bool TicketModel::clear()
{
    if(m_list->items().isEmpty())
        return false;

    beginResetModel();
    m_list->items().clear();
    endResetModel();
    return true;
}
