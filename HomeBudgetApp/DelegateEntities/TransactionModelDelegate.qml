import QtQuick 2.15
import QtQuick.Layouts 1.15

import "qrc:/DefaultElements"

Item {
    height: transactionsDelegateLayout.height + 10

    function unixTimeToText(unixTimestamp) {
        var date = new Date(unixTimestamp * 1000)
        return Qt.formatDate(date, "dd.MM.yyyy")
     }

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

                text: unixTimeToText(datetime)
            }

            ColumnLayout {
                Layout.preferredWidth: parent.width * 0.35
                spacing: -2
                clip: true

                CustomText {
                    additionalSize: -4
                    text: first_name + " " + last_name + " " + patronymic[0] + "."
                }
                CustomText {
                    text: name
                    font.bold: true
                }
            }
            CustomText {
                additionalSize: 4
                text: amount
                color: (parseFloat(amount) > 0) ? colorPalette.positiveColor : colorPalette.negativeColor
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
                        transactionInfoPopup.open()
                        transactionInfoPopup.setData(last_name, first_name, patronymic, amount, name, description, datetime)
                    }
                }
            }
        }
    }
}
