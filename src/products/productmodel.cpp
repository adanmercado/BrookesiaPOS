#include "productmodel.h"
#include "product.h"

ProductModel::ProductModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

int ProductModel::rowCount(const QModelIndex &parent) const
{
    if(parent.isValid() || m_data.isEmpty())
        return 0;

    return m_data.size();
}

QVariant ProductModel::data(const QModelIndex &index, int role) const
{
    if(index.row() >= 0 && index.row() < m_data.size()) {
        if(role == ProductRole) {
            Product *item = m_data.at(index.row());
            return QVariant::fromValue(item);
        }
    }
    return QVariant();
}

QHash<int, QByteArray> ProductModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[ProductRole] = "product";
    return roles;
}

void ProductModel::append(Product *product)
{
    if(product) {
        beginInsertRows(QModelIndex(), rowCount(), rowCount());
        m_data.append(product);
        endInsertRows();
    }
}

bool ProductModel::clear()
{
    if(m_data.isEmpty())
        return false;

    beginResetModel();
    m_data.clear();
    endResetModel();
    return true;
}
