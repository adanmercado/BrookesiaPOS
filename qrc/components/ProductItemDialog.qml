import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls.Material 2.14

Dialog {
    id: productItemDialog
    width: 600
    x: Math.round((brookesiaPOS.width - width) / 2)
    modal: true
    focus: true
    padding: 6
    topPadding: 6
    title: qsTr("New product")

    property bool isEditing: false

    contentItem: ColumnLayout {
        id: productItemColumn
        spacing: 0

        Keys.onPressed: {
            switch(event.key) {
                case Qt.Key_Enter:
                case Qt.Key_Return:
                    acceptProduct();
                    break;
                case Qt.Key_Escape:
                    close();
            }
        }

        GridLayout {
            columns: 2
            columnSpacing: 2
            rowSpacing: 0

            Label {
                text: qsTr("Barcode:")
            }

            TextField {
                id: barcodeTextField
                placeholderText: qsTr("Enter a barcode")
                Layout.fillWidth: true
                focus: true
            }

            Label {
                text: qsTr("Description:")
            }

            TextField {
                id: descriptionTextArea
                placeholderText: qsTr("Enter a product description")
                Layout.fillWidth: true
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 0

            GridLayout {
                columns: 2
                rowSpacing: 0
                columnSpacing: 2

                Label {
                    text: qsTr("Purchase price:")
                }

                TextField {
                    id: purchasePriceTextField
                    Layout.fillWidth: true
                    validator: DoubleValidator {bottom: 0; top: 10000}
                    text: "0.00"
                }

                Label {
                    text: qsTr("Sale price:")
                }

                TextField {
                    id: salePriceTextField
                    Layout.fillWidth: true
                    validator: DoubleValidator {bottom: 0; top: 10000}
                    text: "0.00"
                }

                Label {
                    text: qsTr("Profit percent:")
                }

                TextField {
                    id: profitTextField
                    Layout.fillWidth: true
                    validator: DoubleValidator {bottom: 0; top: 10000}
                    text: "0.00"
                }

                Label {
                    text: qsTr("Cash profit:")
                }

                TextField {
                    id: cashProfitTextField
                    Layout.fillWidth: true
                    //enabled: false
                    validator: DoubleValidator {bottom: 0; top: 10000}
                    text: "0.00"
                }

                Label {
                    text: qsTr("Current stock:")
                }

                TextField {
                    id: stockTextField
                    Layout.fillWidth: true
                    validator: DoubleValidator {bottom: 0; top: 10000}
                    text: "0.00"
                }

                Label {
                    text: qsTr("Minimum stock:")
                }

                TextField {
                    id: minStockTextField
                    Layout.fillWidth: true
                    validator: DoubleValidator {bottom: 0; top: 10000}
                    text: "0.00"
                }
            }

            ImagePicker {
                id: imgPicker
            }
        }

        GridLayout {
            columns: 4
            columnSpacing: 2
            rowSpacing: 0

            Label {
                text: qsTr("Category:")
            }

            ComboBox {
                id: categoriesComboBox
                model: ["General"]
                Layout.fillWidth: true
            }

            Label {
                text: qsTr("Provider:")
            }

            ComboBox {
                id: providersComboBox
                model: ["General"]
                Layout.fillWidth: true
            }

            Label {
                text: qsTr("Tax:")
            }

            ComboBox {
                id: taxesComboBox
                model: ["None"]
                Layout.fillWidth: true
            }

            Label {
                text: qsTr("Measure:")
            }

            ComboBox {
                id: measuresComboBox
                model: ["Piece"]
                Layout.fillWidth: true
            }
        }

        Rectangle {
            id: rectError
            visible: false;
            color: Material.color(Material.Red)
            Layout.fillWidth: true
            height: 40
            radius: 2

            Label {
                id: errorLabel
                anchors.fill: parent
                anchors.margins: 4
                color: "#F5F5F5"
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter

            Button {
                id: cancelButton
                icon.source: "qrc:/icons/cancel.svg"
                text: qsTr("Cancel")
                highlighted: true
                Material.elevation: 6
                onClicked: close();
            }

            Button {
                id: acceptButton
                icon.source: "qrc:/icons/check.svg"
                text: qsTr("Accept")
                highlighted: true
                Material.elevation: 6
                onClicked: acceptProduct();
            }
        }
    }

    Timer {
        id: messageTimer
        interval: 2200
        running: false
        repeat: false
        onTriggered: hideMessage();
    }

    function showError(message) {
        rectError.visible = true;
        errorLabel.text = message;
        messageTimer.start();
    }

    function hideMessage() {
        rectError.visible = false;
        errorLabel.text = "";
    }

    function acceptProduct() {
        var barcode = barcodeTextField.text.trim();
        var description = descriptionTextArea.text.trim();

        if(!barcode || !description) {
            showError(qsTr("Check that there are no empty fields"))
            return;
        }

        //Fix
        var purchasePrice = parseFloat(purchasePriceTextField.text.trim());
        var salePrice = parseFloat(salePriceTextField.text.trim());
        var profitPercent = parseFloat(profitTextField.text.trim());
        var cashProfit = parseFloat(profitTextField.text.trim());
        var stock = parseFloat(stockTextField.text.trim());
        var minStock = parseFloat(minStockTextField.text.trim());
        var category = parseInt(categoriesComboBox.currentIndex);
        var provider = parseInt(providersComboBox.currentIndex);
        var tax = parseInt(taxesComboBox.currentIndex);
        var measure = parseInt(measuresComboBox.currentIndex);
        var picture = imgPicker.image;
        //Temp
        if(picture == "") picture = "qrc:/img/picture.jpg";

        var str = "import brookesiapos.structs 1.0; " +
                "Product {" +
                "productId: 1; " +
                "barcode: \""+ barcode + "\"; " +
                "description: \"" + description + "\"; " +
                "purchasePrice: " + purchasePrice + ";"  +
                "salePrice: " + salePrice + "; " +
                "profitPercent: " + profitPercent + "; " +
                "cashProfit: " + cashProfit + "; " +
                "stock: " + stock + "; " +
                "minStock: " + minStock + "; " +
                "category: " + category + "; " +
                "provider: " + provider + "; " +
                "tax: " + tax + "; " +
                "measure: " + measure + "; " +
                "picture: \"" + picture + "\"}";
        var product = Qt.createQmlObject(str, parent);
        productsModel.append(product);
    }
}
