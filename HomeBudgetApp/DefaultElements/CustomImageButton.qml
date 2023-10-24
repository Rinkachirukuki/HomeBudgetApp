import QtQuick 2.15
import QtQuick.Layouts 1.15

Image {
    property real imageSize: imageScale

    Layout.preferredWidth: imageSize
    Layout.preferredHeight: imageSize

    width: imageSize
    height: imageSize
}
