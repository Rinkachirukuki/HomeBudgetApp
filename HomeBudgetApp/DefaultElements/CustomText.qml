import QtQuick 2.15

Text {
    property int additionalSize: 0

    color: colorPalette.textColor
    font.pixelSize: textScale + additionalSize
}
