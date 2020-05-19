import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.14
import QtQuick.Layouts 1.14

import "../components"

Item {
    id: productsPage
    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            border.width: 1
            border.color: "#BDBDBD"
            radius: 2
            color: "transparent"
            Layout.fillWidth: true
            Layout.fillHeight: true

            ProductsView {
                anchors.fill: parent
                editable: true
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignRight

            Button {
                id: addProductButton
                icon.source: "qrc:/icons/add.svg"
                text: qsTr("Add product")
                highlighted: true
                Material.elevation: 6
                onClicked: {
                    productDialog.open();
                }
            }
        }
    }

    ProductItemDialog {
        id: productDialog
    }
}
