import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "qrc:/DefaultElements"

Popup {
    modal: true

    background: Rectangle {
        radius: 10
        color: colorPalette.accentBackgroundColor
        opacity: 0.9

        border {
            color: colorPalette.textColor
            width: 2
        }
    }

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    contentItem: CustomTextArea {
        text: "Богданов Матвей\nТестовое задание 26.10.23\nВерсия 0.1"
    }
}
