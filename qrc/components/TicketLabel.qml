import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

RowLayout {
    id: ticketLabel
    width: parent.width

    property alias label: label.text
    property alias labelValue: labelValue.text
    property color textColor: "#212121"

    Label {
        id: label
        Layout.fillWidth: true
        Layout.leftMargin: 12
        color: textColor
    }

    Label {
        id: labelValue
        Layout.maximumWidth: parent.width / 2
        Layout.rightMargin: 12
        color: textColor
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    }
}
