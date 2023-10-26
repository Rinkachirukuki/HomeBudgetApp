import QtQuick 2.15
import QtQuick.Controls 2.15

import "qrc:/DefaultElements"
import "qrc:/DelegateEntities"
import "qrc:/ViewComponents"

Item {
    TransactionAddPopup {
        id: transactionAddPopup
    }
    TransactionInfoPopup {
        id: transactionInfoPopup
    }

    Rectangle {
        anchors.fill: parent
        color: colorPalette.accentBackgroundColor

        radius: 10

        CustomTextButton {
            anchors {
                right: parent.right
                bottom: parent.bottom
                rightMargin: 25
                bottomMargin: 10
            }

            border {
                color: colorPalette.textColor
                width: 2
            }

            displayText: "Добавить запись"
            isActive: true

            z: 2
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    transactionAddPopup.open()
                }
            }
        }

        ScrollView {
            id: transactionsPageScrollView

            anchors.fill: parent
            anchors.margins: 5

            ScrollBar.horizontal.interactive: false
            ScrollBar.vertical.interactive: true
            ScrollBar.vertical.policy: ScrollBar.AlwaysOn

            clip: true
            width: parent.width

            ListView {
                id: transactionsPageList
                width: transactionsPageScrollView.width

                spacing: 5

                delegate: TransactionModelDelegate { width: transactionsPageList.width - 15 }

                footer:
                    Item {
                        height: footerText.height + 25
                        width: transactionsPageList.width - 15

                        CustomText {
                            id: footerText
                            anchors.centerIn: parent
                            text: transactionsPageList.count ? "Конец списка" : "Cписок пуст"
                        }
                    }

                model: TransactionsModel
            }
        }
    }
}
