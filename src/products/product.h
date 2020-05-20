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
    Q_PROPERTY(int categoryId READ categoryId WRITE setCategoryId NOTIFY categoryIdChanged)
    Q_PROPERTY(int providerId READ providerId WRITE setProviderId NOTIFY providerIdChanged)
    Q_PROPERTY(int taxId READ taxId WRITE setTaxId NOTIFY taxIdChanged)
    Q_PROPERTY(int measureId READ measureId WRITE setMeasureId NOTIFY measureIdChanged)

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

    int categoryId() const;
    void setCategoryId(const int &categoryId);

    int providerId() const;
    void setProviderId(const int &providerId);

    int taxId() const;
    void setTaxId(const int &taxId);

    int measureId() const;
    void setMeasureId(const int &measureId);

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
    void categoryIdChanged();
    void providerIdChanged();
    void taxIdChanged();
    void measureIdChanged();

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
};

#endif // PRODUCT_H
