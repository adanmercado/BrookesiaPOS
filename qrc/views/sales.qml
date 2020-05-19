import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls.Material 2.14

import brookesiapos.models 1.0

import "../components"

Item {
    id: salesView

    Keys.onReturnPressed: {
        var barcode = barcodeTextField.text.trim();
        if(barcode) {
            console.log("Barcode:", barcodeTextField.text)
            barcodeTextField.clear();
        }
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 4
        spacing: 6

        Rectangle {
            id: productsRect
            Layout.fillWidth: true
            Layout.fillHeight: true
            border.width: 1
            border.color: "#BDBDBD"
            radius: 2
            color: "transparent"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 4

                TextField {
                    id: barcodeTextField
                    Layout.fillWidth: true
                    placeholderText: qsTr("Barcode: Scan or enter a product barcode and press enter")
                }

                RowLayout {
                    Layout.alignment: Qt.AlignHCenter

                    Label {
                        text: qsTr("View products by")
                    }

                    ButtonGroup {
                        id: filterGroup
                    }

                    RadioButton {
                        id: categoryButton
                        text: qsTr("Category")
                        ButtonGroup.group: filterGroup
                    }

                    RadioButton {
                        id: providerButton
                        text: qsTr("Provider")
                        ButtonGroup.group: filterGroup
                    }

                    ComboBox {
                        id: filterModel
                        Layout.preferredWidth: 300
                        model: 30
                    }
                }

                TextField {
                    id: productSearchTextField
                    Layout.fillWidth: true
                    Layout.maximumWidth: parent.width
                    placeholderText: qsTr("Product search: Enter the product description to search")
                }

                GridView {
                    id: productsGridView
                    Layout.preferredWidth: Math.trunc(productsRect.width / (cellSize + cellSpacing)) * (cellSize + cellSpacing)
                    Layout.fillHeight: true
                    Layout.leftMargin: (productsRect.width - productsGridView.width) / 2
                    boundsBehavior: Flickable.StopAtBounds
                    clip: true

                    property int cellSize: 140
                    property int cellSpacing: 10

                    cellWidth: cellSize + cellSpacing
                    cellHeight: cellSize + cellSpacing

                    model: 2000
                    delegate: ItemDelegate {
                        width: productsGridView.cellSize + productsGridView.cellSpacing
                        height: productsGridView.cellSize + productsGridView.cellSpacing

                        Item {
                            width: productsGridView.cellSize
                            height: productsGridView.cellSize
                            anchors.centerIn: parent

                            Image {
                                //TODO
                                source: "qrc:/img/picture.jpg"
                                anchors.fill: parent
                            }

                            Rectangle {
                                width: parent.width
                                height: productLabel.contentHeight
                                anchors.bottom: parent.bottom
                                opacity: 0.6
                            }

                            Label {
                                id: productLabel
                                width: parent.width
                                anchors.bottom: parent.bottom
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                                text: qsTr("Test product delegate %1").arg(model.index)
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            Layout.minimumWidth: 320
            Layout.maximumWidth: 320
            Layout.fillHeight: true
            border.width: 1
            border.color: "#BDBDBD"
            radius: 2
            color: "transparent"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 4

                Label {
                    text: qsTr("SALE TICKET")
                    Layout.fillWidth: true
                    Layout.topMargin: 6
                    horizontalAlignment: Label.AlignHCenter
                    Material.foreground: Material.Blue
                    font.bold: true
                    font.pixelSize: 18
                }

                Rectangle {
                    Layout.minimumWidth: parent.width
                    Layout.maximumWidth: parent.width
                    Layout.minimumHeight: 1
                    Layout.maximumHeight: 1
                    Layout.alignment: Qt.AlignHCenter
                    color: "#BDBDBD"
                }

                ListView {
                    id: ticketListView
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    boundsBehavior: Flickable.StopAtBounds
                    clip: true
                    spacing: 4

                    model: TicketModel {
                        id: ticketModel
                        list: ticketItemList
                    }

                    delegate: Item {
                        width: parent.width
                        height: productDelegateRow.height

                        RowLayout {
                            id: productDelegateRow
                            width: parent.width

                            Label {
                                id: productData
                                text: qsTr("Barcode: %1\nDescription: %2\nQty: %3\nPrice: $%4\nAmount: $%5")
                                .arg(model.barcode).arg(model.description).arg(model.qty).arg(model.price).arg(model.amount)
                                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                                Layout.fillWidth: true
                                Layout.leftMargin: 4
                            }

                            ColumnLayout {
                                id: buttonsLayout
                                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                spacing: 0

                                RoundButton {
                                    Layout.maximumWidth: 40
                                    Layout.maximumHeight: 40
                                    icon.source: "qrc:/icons/add.svg"
                                    highlighted: true

                                    onClicked: {
                                        ticketModel.increaseItemQty(index, 1);
                                    }
                                }
                                RoundButton {
                                    Layout.maximumWidth: 40
                                    Layout.maximumHeight: 40
                                    icon.source: "qrc:/icons/minus.svg"
                                    enabled: model.qty > 1
                                    highlighted: true

                                    onClicked: {
                                        ticketModel.decreaseItemQty(index, 1);
                                    }
                                }
                                RoundButton {
                                    Layout.maximumWidth: 40
                                    Layout.maximumHeight: 40
                                    icon.source: "qrc:/icons/remove.svg"
                                    highlighted: true

                                    onClicked: {
                                        ticketModel.removeItem(index);
                                    }
                                }
                            }
                        }
                    }
                }

                Rectangle {
                    Layout.minimumWidth: parent.width
                    Layout.maximumWidth: parent.width
                    Layout.minimumHeight: 1
                    Layout.maximumHeight: 1
                    Layout.alignment: Qt.AlignHCenter
                    color: "#BDBDBD"
                }

                TicketLabel {
                    label: qsTr("Client:")
                    labelValue: "General"
                    textColor: Material.color(Material.Orange)
                }

                TicketLabel {
                    label: qsTr("Qty products:")
                    labelValue: "0"
                    textColor: Material.color(Material.Orange)
                }

                TicketLabel {
                    label: qsTr("Subtotal:")
                    labelValue: "$0.00"
                    textColor: Material.color(Material.Orange)
                }

                TicketLabel {
                    label: qsTr("Taxes:")
                    labelValue: "$0.00"
                    textColor: Material.color(Material.Orange)
                }

                TicketLabel {
                    label: qsTr("Total:")
                    labelValue: "$0.00"
                    textColor: Material.color(Material.Orange)
                }

                TicketLabel {
                    Layout.fillWidth: true
                    label: qsTr("Change:")
                    labelValue: "$0.00"
                    textColor: Material.color(Material.Orange)
                }

                RowLayout {
                    Layout.alignment: Qt.AlignHCenter

                    Button {
                        id: clearTicketButton
                        icon.source: "qrc:/icons/remove.svg"
                        text: qsTr("Clear ticket")
                        highlighted: true
                        Material.elevation: 6
                        onClicked: {
                            console.log("Clear ticket button clicked");
                            ticketModel.clear();
                        }
                    }

                    Button {
                        id: chargeButton
                        icon.source: "qrc:/icons/cash-register.svg"
                        text: qsTr("Charge")
                        highlighted: true
                        Material.elevation: 6
                        onClicked: {
                            console.log("Charge button clicked");
                        }
                    }
                }
            }
        }
    }
}
