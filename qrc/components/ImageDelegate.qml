import QtQuick 2.14
import QtQuick.Controls 2.14

ItemDelegate {
    property int contentSize
    property alias itemText: productLabel.text
    property alias itemImage: image.source

    Item {
        width: contentSize
        height: contentSize
        anchors.centerIn: parent

        Image {
            //TODO
            id: image
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
            color: "#212121"
        }
    }
}
