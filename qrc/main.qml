import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.14

ApplicationWindow {
    id: brookesiaPOS
    visible: true
    width: 640
    height: 480
    visibility: "Maximized"
    title: Qt.application.name

    header: ToolBar {
        contentHeight: menuButton.implicitHeight

        ToolButton {
            id: menuButton
            icon.source: "qrc:/icons/bars.svg"
            onClicked: {
                menuDrawer.open();
            }
        }

        Label {
            text: brookesiaPOS.title
            anchors.centerIn: parent
            font.pixelSize: 20
        }

        ToolButton {
            id: minimizeButton
            anchors.right: exitButton.left
            icon.source: "qrc:/icons/window-minimize.svg"
            onClicked: {
            }
        }

        ToolButton {
            id: exitButton
            anchors.right: parent.right
            icon.source: "qrc:/icons/sign-out.svg"
            onClicked: {
            }
        }
    }

    Drawer {
        id: menuDrawer
        width: brookesiaPOS.width * 0.24
        height: brookesiaPOS.height

        Column {
            anchors.fill: parent

            Repeater {
                model: ListModel {
                    ListElement {text: qsTr("Sales"); icon: "qrc:/icons/shopping-cart.svg"}
                    ListElement {text: qsTr("Products"); icon: "qrc:/icons/products.svg"}
                    ListElement {text: qsTr("Clients"); icon: "qrc:/icons/users.svg"}
                    ListElement {text: qsTr("Providers"); icon: "qrc:/icons/providers.svg"}
                    ListElement {text: qsTr("Drawer"); icon: "qrc:/icons/chart.svg"}
                    ListElement {text: qsTr("Settings"); icon: "qrc:/icons/settings.svg"}
                }

                delegate: ItemDelegate {
                    width: parent.width
                    height: 100
                    text: model.text
                    Material.foreground: "#212121"
                    font.pixelSize: 16
                    icon.source: model.icon
                    icon.width: 32
                    icon.height: 32
                    display: AbstractButton.TextUnderIcon
                    onClicked: {
                        console.log("Menu buton clicked:", text);
                        menuDrawer.close();
                    }
                }
            }
        }
    }

    Loader {
        id: appLoader
        source: "qrc:/views/sales.qml"
        anchors.fill: parent
    }
}
