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

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

    contentItem: CustomTextArea {
        text: "1. Тык туда\n2. Тык сюда"
    }
}
