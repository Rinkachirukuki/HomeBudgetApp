import QtQuick 2.15
import QtQuick.Layouts 1.15

Rectangle {
    property bool   isActive: false
    property string displayText: ""

    color: isActive ? colorPalette.accentBackgroundColor : colorPalette.backgroundColor

    Layout.preferredHeight: buttonText.height + 15
    Layout.preferredWidth: buttonText.width + 30
    height: buttonText.height + 15
    width: buttonText.width + 30

    radius: 10

    CustomText {
        id: buttonText
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter:  parent.verticalCenter
        }
        text: displayText
    }
}

