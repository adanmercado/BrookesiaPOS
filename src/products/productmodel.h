#ifndef PRODUCTMODEL_H
#define PRODUCTMODEL_H

#include <QAbstractListModel>
#include "product.h"

//class Product;

class ProductModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit ProductModel(QObject *parent = nullptr);

    enum {
        ProductRole = Qt::UserRole
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    virtual QHash<int, QByteArray> roleNames() const override;

public slots:
    void append(Product * product);
    bool clear();

private:
    QList<Product*> m_data;
};

#endif // PRODUCTMODEL_H
