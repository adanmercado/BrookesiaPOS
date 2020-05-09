import QtQuick 2.14
import QtQuick.Controls 2.14

ApplicationWindow {
    id: brookesiaPOS
    visible: true
    width: 640
    height: 480
    visibility: "Maximized"
    title: qsTr("Brookeisa POS")

    header: ToolBar {
        contentHeight: menuButton.implicitHeight

        ToolButton {
            id: menuButton
            text: "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                menuDrawer.open();
            }
        }

        Label {
            text: brookesiaPOS.title
            anchors.centerIn: parent
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
                    ListElement {text: qsTr("Sales")}
                    ListElement {text: qsTr("Products")}
                    ListElement {text: qsTr("Clients")}
                    ListElement {text: qsTr("Providers")}
                    ListElement {text: qsTr("Drawer")}
                    ListElement {text: qsTr("Settings")}
                }

                delegate: ItemDelegate {
                    width: parent.width
                    height: 60
                    text: model.text
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
        anchors.fill: parent
    }
}
