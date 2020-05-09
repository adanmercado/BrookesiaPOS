import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls.Material 2.14

import "../components"

Item {
    id: salesView

    Keys.onReturnPressed: console.log("Barcode:", barcodeTextField.text)

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 6
        spacing: 0

        TextField {
            id: barcodeTextField
            Layout.fillWidth: true
            placeholderText: qsTr("Scan or enter a product barcode and press enter")
            Material.accent: Material.Red
            font.pixelSize: 16
        }

        RowLayout {
            id: productsLayout
            Layout.fillWidth: true
            Layout.fillHeight: true

            ListView {
                id: categoriesListView
                Layout.maximumWidth: 120
                Layout.minimumWidth: 120
                Layout.fillHeight: true
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                spacing: 1

                model: 15
                delegate: Rectangle {
                    width: 120
                    height: 120
                    color: Material.color(Material.Blue)
                    radius: 2

                    Text {
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                        text: qsTr("Category test delegate %1").arg(model.index)
                    }
                }
            }

            Rectangle {
                id: productsRect
                Layout.fillWidth: true
                Layout.fillHeight: true
                border.color: "#BDBDBD"
                border.width: 1
                radius: 2

                GridView {
                    id: productsGridView
                    anchors.fill: parent
                    anchors.margins: 6
                    boundsBehavior: Flickable.StopAtBounds
                    clip: true

                    cellWidth: 120
                    cellHeight: 120

                    model: 30
                    delegate: Rectangle {
                        width: 120
                        height: 120
                        Text {
                            anchors.fill: parent
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                            text: qsTr("Test product delegate %1").arg(model.index)
                        }
                    }
                }
            }

            Rectangle {
                id: ticketRect
                Layout.minimumWidth: 320
                Layout.maximumWidth: 320
                Layout.fillHeight: true
                border.color: "#BDBDBD"
                border.width: 1
                radius: 2

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 6

                    Label {
                        text: qsTr("SALE TICKET")
                        Layout.fillWidth: true
                        horizontalAlignment: Label.AlignHCenter
                        Material.foreground: Material.Blue
                        font.bold: true
                        font.pixelSize: 16
                    }

                    Rectangle {
                        Layout.minimumWidth: parent.width * 0.9
                        Layout.maximumWidth: parent.width * 0.9
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
                        spacing: 12

                        //TODO
                        model: ListModel {
                            id: ticketTestModel

                            ListElement {
                                barcode: "123"
                                description: "Producto de prueba"
                                qty: 3
                                salePrice: 32
                            }

                            ListElement {
                                barcode: "1234"
                                description: "Producto de prueba 2"
                                qty: 5
                                salePrice: 25
                            }

                            ListElement {
                                barcode: "12345"
                                description: "Producto de prueba 3"
                                qty: 1
                                salePrice: 46
                            }

                            ListElement {
                                barcode: "123456"
                                description: "Producto de prueba 4"
                                qty: 4
                                salePrice: 12
                            }

                            ListElement {
                                barcode: "123457"
                                description: "Producto de prueba 5"
                                qty: 8
                                salePrice: 22
                            }
                        }

                        delegate: ItemDelegate {
                            width: parent.width
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: rowLayout.height

                            RowLayout {
                                id: rowLayout
                                width: parent.width

                                Text {
                                    id: productData
                                    text: "Barcode: " + model.barcode + "\nDescription: " + model.description + "\nQty:" +
                                          model.qty + "\nPrice: $" + model.salePrice + "\nAmount: $" +
                                          model.qty * model.salePrice
                                    color: "#212121"
                                    font.pixelSize: 16
                                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                                    Layout.fillWidth: true
                                    Layout.leftMargin: parent.width * 0.05
                                }

                                ColumnLayout {
                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                    Layout.rightMargin: parent.width * 0.05
                                    spacing: 0

                                    RoundButton {
                                        Layout.maximumWidth: 40
                                        Layout.maximumHeight: 40
                                        icon.source: "qrc:/icons/add.svg"
                                        icon.color: "#FFF"
                                        Material.elevation: 6
                                        Material.background: Material.Red
                                    }
                                    RoundButton {
                                        Layout.maximumWidth: 40
                                        Layout.maximumHeight: 40
                                        icon.source: "qrc:/icons/minus.svg"
                                        icon.color: "#FFF"
                                        Material.elevation: 6
                                        Material.background: Material.Red
                                    }
                                    RoundButton {
                                        Layout.maximumWidth: 40
                                        Layout.maximumHeight: 40
                                        icon.source: "qrc:/icons/remove.svg"
                                        icon.color: "#FFF"
                                        Material.elevation: 6
                                        Material.background: Material.Red
                                    }
                                }
                            }
                        }
                    }

                    Rectangle {
                        Layout.minimumWidth: parent.width * 0.9
                        Layout.maximumWidth: parent.width * 0.9
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
                }
            }
        }
    }

    /*RoundButton {
        id: finishSaleButton
        width: 80
        height: 80
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        Material.elevation: 6
        Material.background: Material.Red
        icon.source: "qrc:/icons/cash-register.svg"
        icon.width: 32
        icon.height: 32
        icon.color: "#FFF"
    }*/
}
