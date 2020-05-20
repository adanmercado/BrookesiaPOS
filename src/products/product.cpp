#include "product.h"

Product::Product(QObject *parent) : QObject(parent)
{
}

int Product::productId() const
{
    return m_id;
}

void Product::setProductId(const int &id)
{
    if(m_id != id) {
        m_id = id;
        emit productIdChanged();
    }
}

QString Product::barcode() const
{
    return m_barcode;
}

void Product::setBarcode(const QString &barcode)
{
    if(m_barcode != barcode) {
        m_barcode = barcode;
        emit barcodeChanged();
    }
}

QString Product::description() const
{
    return m_description;
}

void Product::setDescription(const QString &description)
{
    if(m_description != description) {
        m_description = description;
        emit descriptionChanged();
    }
}

double Product::purchasePrice() const
{
    return m_purchasePrice;
}

void Product::setPurchasePrice(const double &purchasePrice)
{
    if(m_purchasePrice != purchasePrice) {
        m_purchasePrice = purchasePrice;
        emit purchasePriceChanged();
    }
}

double Product::salePrice() const
{
    return m_salePrice;
}

void Product::setSalePrice(const double &salePrice)
{
    if(m_salePrice != salePrice) {
        m_salePrice = salePrice;
        emit salePriceChanged();
    }
}

double Product::profitPercent() const
{
    return m_profitPercent;
}

void Product::setProfitPercent(const double &profitPercent)
{
    if(m_profitPercent != profitPercent) {
        m_profitPercent = profitPercent;
        emit profitPercentChanged();
    }
}

double Product::cashProfit() const
{
    return m_cashProfit;
}

void Product::setCashProfit(const double &cashProfit)
{
    if(m_cashProfit != cashProfit) {
        m_cashProfit = cashProfit;
        emit cashProfitChanged();
    }
}

double Product::stock() const
{
    return m_stock;
}

void Product::setStock(const double &stock)
{
    if(m_stock != stock) {
        m_stock = stock;
        emit stockChanged();
    }
}

double Product::minStock() const
{
    return m_minStock;
}

void Product::setMinStock(const double &minStock)
{
    if(m_minStock != minStock) {
        m_minStock = minStock;
        emit minStockChanged();
    }
}

int Product::category() const
{
    return m_categoryId;
}

void Product::setCategory(const int &categoryId)
{
    if(m_categoryId != categoryId) {
        m_categoryId = categoryId;
        emit categoryChanged();
    }
}

int Product::provider() const
{
    return m_providerId;
}

void Product::setProvider(const int &providerId)
{
    if(m_providerId != providerId) {
        m_providerId = providerId;
        emit providerChanged();
    }
}

int Product::tax() const
{
    return m_taxId;
}

void Product::setTax(const int &taxId)
{
    if(m_taxId != taxId) {
        m_taxId = taxId;
        emit taxChanged();
    }
}

int Product::measure() const
{
    return m_measureId;
}

void Product::setMeasure(const int &measureId)
{
    if(m_measureId != measureId) {
        m_measureId = measureId;
        emit measureChanged();
    }
}

QString Product::picture() const
{
    return m_picture;
}

void Product::setPicture(const QString &picture)
{
    if(m_picture != picture) {
        m_picture = picture;
        emit pictureChanged();
    }
}
