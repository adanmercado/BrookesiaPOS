import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

Item {
    id: productsRect

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 4

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

            //Set model
            //model:
            delegate: ItemDelegate {
                width: productsGridView.cellSize + productsGridView.cellSpacing
                height: productsGridView.cellSize + productsGridView.cellSpacing

                Item {
                    width: productsGridView.cellSize
                    height: productsGridView.cellSize
                    anchors.centerIn: parent

                    Image {
                        //TODO
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
                        color: "#212121"
                    }
                }
            }
        }
    }
}
