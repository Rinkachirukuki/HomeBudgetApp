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

    contentItem: GridLayout {
        id: settingsLayout

        columns: 2

        CustomText {
            text: "Размер интерфейса:"
        }

        Slider {
            from: 15
            to: 35
            value: 25
            stepSize: 1

            Layout.preferredWidth: 80

            onValueChanged: {
                textScale = value
                imageScale = value + 10
            }
        }

        CustomText {
            text: "Тёмная тема:"
        }

        CheckBox {
            Layout.alignment: Qt.AlignCenter
            onCheckedChanged: {
                colorPalette.darkTheme = checked
            }
        }
    }
}
