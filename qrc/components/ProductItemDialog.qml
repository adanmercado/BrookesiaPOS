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

                DecimalSpinBox {
                    id: purchasePriceSpinBox
                    Layout.fillWidth: true
                }

                Label {
                    text: qsTr("Sale price:")
                }

                DecimalSpinBox {
                    id: salePriceSpinBox
                    Layout.fillWidth: true
                }

                Label {
                    text: qsTr("Profit percent:")
                }

                DecimalSpinBox {
                    id: profiSpinBox
                    Layout.fillWidth: true
                }

                Label {
                    text: qsTr("Cash profit:")
                }

                DecimalSpinBox {
                    id: cashProfitSpinBox
                    Layout.fillWidth: true
                    enabled: false
                }

                Label {
                    text: qsTr("Current stock:")
                }

                DecimalSpinBox {
                    id: stockSpinBox
                    Layout.fillWidth: true
                }

                Label {
                    text: qsTr("Minimum stock:")
                }

                DecimalSpinBox {
                    id: minStockSpinBox
                    Layout.fillWidth: true
                }
            }

            ImagePicker {
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
                Layout.fillWidth: true
            }

            Label {
                text: qsTr("Provider:")
            }

            ComboBox {
                id: providersComboBox
                Layout.fillWidth: true
            }

            Label {
                text: qsTr("Tax:")
            }

            ComboBox {
                id: taxesComboBox
                Layout.fillWidth: true
            }

            Label {
                text: qsTr("Measure:")
            }

            ComboBox {
                id: measuresComboBox
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
                onClicked: {
                    close();
                }
            }

            Button {
                id: acceptButton
                icon.source: "qrc:/icons/check.svg"
                text: qsTr("Accept")
                highlighted: true
                Material.elevation: 6
                onClicked: {
                }
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
}
