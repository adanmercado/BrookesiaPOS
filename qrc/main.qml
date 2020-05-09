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
        }

        Label {
            text: brookesiaPOS.title
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: menuDrawer
        width: brookesiaPOS.width * 0.66
        height: brookesiaPOS.height

        Column {
            anchors.fill: parent
        }
    }

    Loader {
        id: appLoader
        anchors.fill: parent
    }
}
