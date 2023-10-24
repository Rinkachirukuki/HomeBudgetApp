import QtQuick 2.15
import QtQuick.Layouts 1.15

import "qrc:/DefaultElements"

Item {
    height: transactionsDelegateLayout.height + 10

    Rectangle {
        height: parent.height
        width: parent.width

        color: colorPalette.backgroundColor

        radius: 10

        RowLayout {
            id: transactionsDelegateLayout
            anchors {
                left: parent.left
                right: transactionsDelegateOptionsLayout.left
                verticalCenter: parent.verticalCenter
                margins: 5
                leftMargin: 10
            }
            spacing: 25

            CustomText {
                Layout.preferredWidth: parent.width * 0.25
                additionalSize: 4
                clip: true

                text: dateTime
            }

            ColumnLayout {
                Layout.preferredWidth: parent.width * 0.35
                spacing: -2
                clip: true

                CustomText {
                    additionalSize: -4
                    text: firstName + " " + lastName + " " + patronymic[0] + "."
                }
                CustomText {
                    text: transactionCategory
                    font.bold: true
                }
            }
            CustomText {
                additionalSize: 4
                text: ((transactionType === "начисление") ? "+" + transactionAmount : "-" + transactionAmount) + " р."
                color: (transactionType === "начисление") ? colorPalette.positiveColor : colorPalette.negativeColor
            }
            Item { Layout.fillWidth: true }
        }

        RowLayout {
            id: transactionsDelegateOptionsLayout
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
                margins: 5
                rightMargin: 15
            }

            CustomImageButton {
                source: "qrc:/Icons/INFO.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                    }
                }
            }

            CustomImageButton {
                source: "qrc:/Icons/EDIT.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                    }
                }
            }
        }
    }
}
