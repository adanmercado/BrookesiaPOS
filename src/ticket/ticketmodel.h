#ifndef TICKETMODEL_H
#define TICKETMODEL_H

#include <QAbstractListModel>

class TicketItemList;

class TicketModel : public QAbstractListModel
{
    Q_OBJECT

    Q_PROPERTY(TicketItemList *list READ list WRITE setList)

public:
    explicit TicketModel(QObject *parent = nullptr);

    enum {
        IdRole = Qt::UserRole,
        BarcodeRole,
        DescriptionRole,
        QtyRole,
        PriceRole,
        AmountRole
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole) override;
    Qt::ItemFlags flags(const QModelIndex& index) const override;
    virtual QHash<int, QByteArray> roleNames() const override;

    TicketItemList *list() const;
    void setList(TicketItemList *list);

public slots:
    QVariantMap get(const int &row);
    bool increaseItemQty(const int &index, const double &qty);
    bool decreaseItemQty(const int &index, const double &qty);
    bool removeItem(const int &row);
    bool clear();

private:
    TicketItemList *m_list;
};

#endif // TICKETMODEL_H
