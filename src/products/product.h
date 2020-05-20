#ifndef PRODUCT_H
#define PRODUCT_H

#include <QObject>

class Product : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int productId READ productId WRITE setProductId NOTIFY productIdChanged)
    Q_PROPERTY(QString barcode READ barcode WRITE setBarcode NOTIFY barcodeChanged)
    Q_PROPERTY(QString description READ description WRITE setDescription NOTIFY descriptionChanged)
    Q_PROPERTY(double purchasePrice READ purchasePrice WRITE setPurchasePrice NOTIFY purchasePriceChanged)
    Q_PROPERTY(double salePrice READ salePrice WRITE setSalePrice NOTIFY salePriceChanged)
    Q_PROPERTY(double profitPercent READ profitPercent WRITE setProfitPercent NOTIFY profitPercentChanged)
    Q_PROPERTY(double cashProfit READ cashProfit WRITE setCashProfit NOTIFY cashProfitChanged)
    Q_PROPERTY(double stock READ stock WRITE setStock NOTIFY stockChanged)
    Q_PROPERTY(double minStock READ minStock WRITE setMinStock NOTIFY minStockChanged)
    Q_PROPERTY(int category READ category WRITE setCategory NOTIFY categoryChanged)
    Q_PROPERTY(int provider READ provider WRITE setProvider NOTIFY providerChanged)
    Q_PROPERTY(int tax READ tax WRITE setTax NOTIFY taxChanged)
    Q_PROPERTY(int measure READ measure WRITE setMeasure NOTIFY measureChanged)
    Q_PROPERTY(QString picture READ picture WRITE setPicture NOTIFY pictureChanged)

public:
    explicit Product(QObject *parent = nullptr);

public:
    int productId() const;
    void setProductId(const int &id);

    QString barcode() const;
    void setBarcode(const QString &barcode);

    QString description() const;
    void setDescription(const QString &description);

    double purchasePrice() const;
    void setPurchasePrice(const double &purchasePrice);

    double salePrice() const;
    void setSalePrice(const double &salePrice);

    double profitPercent() const;
    void setProfitPercent(const double &profitPercent);

    double cashProfit() const;
    void setCashProfit(const double &cashProfit);

    double stock() const;
    void setStock(const double &stock);

    double minStock() const;
    void setMinStock(const double &minStock);

    int category() const;
    void setCategory(const int &categoryId);

    int provider() const;
    void setProvider(const int &providerId);

    int tax() const;
    void setTax(const int &taxId);

    int measure() const;
    void setMeasure(const int &measureId);

    QString picture() const;
    void setPicture(const QString &picture);

signals:
    void productIdChanged();
    void barcodeChanged();
    void descriptionChanged();
    void purchasePriceChanged();
    void salePriceChanged();
    void profitPercentChanged();
    void cashProfitChanged();
    void stockChanged();
    void minStockChanged();
    void categoryChanged();
    void providerChanged();
    void taxChanged();
    void measureChanged();
    void pictureChanged();

private:
    int m_id;
    QString m_barcode;
    QString m_description;
    double m_purchasePrice;
    double m_salePrice;
    double m_profitPercent;
    double m_cashProfit;
    double m_stock;
    double m_minStock;
    int m_categoryId;
    int m_providerId;
    int m_taxId;
    int m_measureId;
    QString m_picture;
};

#endif // PRODUCT_H
