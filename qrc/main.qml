import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.14

import QtQuick.Layouts 1.12

import "components"
import "pages"

ApplicationWindow {
    id: brookesiaPOS
    visible: true
    minimumWidth: 1100
    minimumHeight: 650
    visibility: "Maximized"
    title: Qt.application.name

    property bool userLogged: false

    ListModel {
        id: menuModel
        ListElement {text: qsTr("Sales"); icon: "qrc:/icons/shopping-cart.svg"; source: "qrc:/pages/SalesPage.qml"}
        ListElement {text: qsTr("Products"); icon: "qrc:/icons/products.svg"; source: "qrc:/pages/ProductsPage.qml"}
        ListElement {text: qsTr("Clients"); icon: "qrc:/icons/users.svg"; source: "qrc:/pages/ClientsPage.qml"}
        ListElement {text: qsTr("Providers"); icon: "qrc:/icons/providers.svg"; source: "qrc:/pages/ProvidersPage.qml"}
        ListElement {text: qsTr("Drawer"); icon: "qrc:/icons/chart.svg"; source: "qrc:/pages/DrawerPage.qml"}
        ListElement {text: qsTr("Settings"); icon: "qrc:/icons/settings.svg"; source: "qrc:/pages/SettingsPage.qml"}
    }

    LoginDialog {
        id: loginDialog
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            id: pane
            width: showFullPane ? 200 : 60
            Layout.fillHeight: true
            color: Material.color(Material.LightBlue)
            z: 1

            property bool showFullPane: false

            Column {
                anchors.fill: parent
                spacing: 0

                Repeater {
                    id: menuIcons
                    model: menuModel

                    delegate: ItemDelegate {
                        width: pane.width
                        height: 60
                        icon.source: model.icon
                        icon.color: "white"
                        text: model.text
                        display: pane.showFullPane ? "TextBesideIcon" : "IconOnly"
                        Material.foreground: "white"

                        onHoveredChanged: {
                            pane.showFullPane = hovered;
                        }
                        onClicked: {
                            //appLoader.source = model.source;
                            stack.currentIndex = index;
                            pane.showFullPane = false;
                        }
                    }
                }
            }
        }

        StackLayout {
            id: stack
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 4
            currentIndex: 0

            SalesPage { }
            ProductsPage { }
            ClientsPage { }
            ProvidersPage { }
            DrawerPage { }
            SettingsPage { }
        }

        /*Loader {
            id: appLoader
            source: "qrc:/pages/SalesPage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 4
        }*/
    }
}
