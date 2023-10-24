import QtQuick 2.15

import "qrc:/DefaultElements"

Item {
    Rectangle {
        anchors.fill: parent
        color: colorPalette.accentBackgroundColor

        radius: 10

        CustomText {
            anchors.centerIn: parent

            text: "Отчёты"
        }
    }
}
