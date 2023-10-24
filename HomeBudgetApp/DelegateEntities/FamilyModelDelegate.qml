import QtQuick 2.15
import QtQuick.Layouts 1.15

import "qrc:/DefaultElements"

Item {
    height: familyDelegateLayout.height + 10

    Rectangle {
        height: parent.height
        width: parent.width

        color: colorPalette.backgroundColor

        radius: 10

        RowLayout {
            id: familyDelegateLayout
            anchors {
                left: parent.left
                right: familyDelegateOptionsLayout.left
                verticalCenter: parent.verticalCenter
                margins: 5
                leftMargin: 10
            }
            spacing: 10

            Image {
                source: "qrc:/Icons/DELETE.png"
                Layout.fillHeight: true
                Layout.preferredWidth: height
            }

            ColumnLayout {
                CustomText {
                    text: lastName
                    font.bold: true
                }
                RowLayout {
                    CustomText {
                        text: firstName
                    }
                    CustomText {
                        text: patronymic
                    }
                }
            }
            Item { Layout.fillWidth: true }
        }

        RowLayout {
            id: familyDelegateOptionsLayout
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
                margins: 5
                rightMargin: 15
            }

            CustomImageButton {
                source: "qrc:/Icons/EDIT.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                    }
                }
            }

            CustomImageButton {
                source: "qrc:/Icons/DELETE.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                    }
                }
            }
        }
    }
}
