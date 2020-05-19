import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.14

import "components"

ApplicationWindow {
    id: brookesiaPOS
    visible: true
    minimumWidth: 1000
    minimumHeight: 600
    visibility: "Maximized"
    title: Qt.application.name

    property bool userLogged: false

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
            anchors.right: sessionButton.left
            icon.source: "qrc:/icons/window-minimize.svg"
            onClicked: {
            }
        }

        ToolButton {
            id: sessionButton
            anchors.right: parent.right
            icon.source: brookesiaPOS.userLogged ? "qrc:/icons/sign-out.svg" : "qrc:/icons/sign-in.svg"
            text: brookesiaPOS.userLogged ? qsTr("Exit") : qsTr("Start operations")
            onClicked: {
                if(brookesiaPOS.userLogged) {
                } else {
                    loginDialog.open();
                }
            }
        }
    }

    Drawer {
        id: menuDrawer
        width: brookesiaPOS.width * 0.24
        height: brookesiaPOS.height
        enabled: brookesiaPOS.userLogged

        Column {
            anchors.fill: parent

            Repeater {
                id: menuRepeater
                model: ListModel {
                    ListElement {text: qsTr("Sales"); icon: "qrc:/icons/shopping-cart.svg"; source: "qrc:/pages/SalesPage.qml"}
                    ListElement {text: qsTr("Products"); icon: "qrc:/icons/products.svg"; source: "qrc:/pages/ProductsPage.qml"}
                    ListElement {text: qsTr("Clients"); icon: "qrc:/icons/users.svg"; source: "qrc:/pages/ClientsPage.qml"}
                    ListElement {text: qsTr("Providers"); icon: "qrc:/icons/providers.svg"; source: "qrc:/pages/ProvidersPage.qml"}
                    ListElement {text: qsTr("Drawer"); icon: "qrc:/icons/chart.svg"; source: "qrc:/pages/DrawerPage.qml"}
                    ListElement {text: qsTr("Settings"); icon: "qrc:/icons/settings.svg"; source: "qrc:/pages/SettingsPage.qml"}
                }

                delegate: ItemDelegate {
                    width: parent.width
                    height: 100
                    text: model.text
                    font.pixelSize: 18
                    font.bold: true
                    icon.source: model.icon
                    icon.width: 42
                    icon.height: 42
                    Material.foreground: Material.accentColor
                    display: AbstractButton.TextUnderIcon

                    onClicked: {
                        appLoader.source = model.source;
                        menuDrawer.close();
                    }
                }
            }
        }
    }

    LoginDialog {
        id: loginDialog
    }

    Loader {
        id: appLoader
        source: "qrc:/pages/SalesPage.qml"
        anchors.fill: parent
    }
}
