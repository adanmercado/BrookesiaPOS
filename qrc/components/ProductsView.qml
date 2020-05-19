import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

Item {
    id: productsRect
    property bool editable: false

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
            delegate: ImageDelegate {
                width: productsGridView.cellSize + productsGridView.cellSpacing
                height: productsGridView.cellSize + productsGridView.cellSpacing
                contentSize: productsGridView.cellSize
                //itemText:
                //itemImage:
            }
        }
    }
}
