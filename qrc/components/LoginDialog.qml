import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls.Material 2.14

Dialog {
    id: loginDialog
    width: 300
    x: Math.round((brookesiaPOS.width - width) / 2)
    y: Math.round((brookesiaPOS.height - height) / 2)
    modal: true
    focus: true
    padding: 6
    topPadding: 6
    title: qsTr("Login")

    onRejected: clearFields();

    contentItem: ColumnLayout {
        id: loginColumn

        Keys.onPressed: {
            switch(event.key) {
                case Qt.Key_Enter:
                case Qt.Key_Return:
                    login();
                    break;
            }
        }

        TextField {
            id: usernameTextField
            placeholderText: qsTr("Enter a username")
            Layout.fillWidth: true
            focus: true
        }

        TextField {
            id: passwordTextField
            placeholderText: qsTr("Enter the password")
            echoMode: TextField.Password
            Layout.fillWidth: true
        }

        Rectangle {
            id: rectError
            visible: false;
            color: Material.color(Material.Red)
            Layout.fillWidth: true
            height: 40
            radius: 2

            Label {
                id: errorLabel
                anchors.fill: parent
                anchors.margins: 4
                color: "#F5F5F5"
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter

            Button {
                id: cancelButton
                icon.source: "qrc:/icons/cancel.svg"
                text: qsTr("Cancel")
                highlighted: true
                Material.elevation: 6
                onClicked: {
                    clearFields();
                    close();
                }
            }

            Button {
                id: acceptButton
                icon.source: "qrc:/icons/check.svg"
                text: qsTr("Accept")
                highlighted: true
                Material.elevation: 6
                onClicked: login();
            }
        }
    }

    Timer {
        id: messageTimer
        interval: 2200
        running: false
        repeat: false
        onTriggered: hideMessage();
    }

    function showError(message) {
        var lastMessage = errorLabel.text;
        rectError.visible = true;
        errorLabel.text = message;

        if(lastMessage) messageTimer.restart();
        else messageTimer.start();
    }

    function hideMessage() {
        rectError.visible = false;
        errorLabel.text = "";
    }

    function clearFields() {
        usernameTextField.clear();
        passwordTextField.clear();
        usernameTextField.focus = true;
    }

    function login() {
        var username = usernameTextField.text.trim();
        var password = passwordTextField.text.trim();

        if(!username) {
            showError(qsTr("Enter a valid username"));
            return;
        }

        if(!password) {
            showError(qsTr("Enter a valid password"));
            return;
        }

        //Fixme: login validations
        brookesiaPOS.userLogged = true;
        close();
    }
}
