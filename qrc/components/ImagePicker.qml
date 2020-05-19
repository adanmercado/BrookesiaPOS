import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls.Material 2.14
import QtQuick.Dialogs 1.2

Item {
    id: imagePicker
    width: 160
    height: imagePickerColumn.height
    property alias image: image.source

    ColumnLayout {
        id: imagePickerColumn
        width: parent.width
        spacing: 0

        Image {
            id: image
            fillMode: Image.PreserveAspectFit
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: parent.width
        }
        Button {
            id: acceptButton
            icon.source: "qrc:/icons/image.svg"
            text: qsTr("Pick image")
            highlighted: true
            Material.elevation: 6
            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
            onClicked: {
                fileDialog.open();
            }
        }
    }

    FileDialog {
        id: fileDialog
        title: qsTr("Please choose a image")
        folder: shortcuts.pictures

        onAccepted: {
            image.source = fileUrl
        }
        onRejected: {
            image.source = "";
        }
    }
}
