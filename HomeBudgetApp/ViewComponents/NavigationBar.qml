import QtQuick 2.15
import QtQuick.Layouts 1.15

import "qrc:/DefaultElements"

Item {
    height: pagesLayout.height + 10

    SettingsPopup {
        id: settingsPopup

        x: mainWindow.width - settingsPopup.width - 25
        y: pagesLayout.height
    }

    InfoPopup {
        id: infoPopup

        x: mainWindow.width - infoPopup.width - 25
        y: pagesLayout.height
    }

    RowLayout {
        id: pagesLayout
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            leftMargin: 5
        }
        spacing: 5

        CustomTextButton {
            id: transactionsButton
            displayText: "Транзакции"

            isActive: (appRouter.state === "TRANSACTIONS_PAGE")

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    appRouter.state = "TRANSACTIONS_PAGE"
                }
            }
        }

        CustomTextButton {
            id: familyButton
            displayText: "Семья"

            isActive: (appRouter.state === "FAMILY_PAGE")

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    appRouter.state = "FAMILY_PAGE"
                }
            }
        }

        CustomTextButton {
            id: goodsButton
            displayText: "Товары"

            isActive: (appRouter.state === "GOODS_PAGE")

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    appRouter.state = "GOODS_PAGE"
                }
            }
        }

        CustomTextButton {
            id: reportsButton
            displayText: "Отчёты"

            isActive: (appRouter.state === "REPORTS_PAGE")

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    appRouter.state = "REPORTS_PAGE"
                }
            }
        }
    }

    RowLayout {
        id: settingsInfoLayout

        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
            rightMargin: 5
        }

        CustomImageButton {
            source: "qrc:/Icons/INFO.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    infoPopup.open()
                }
            }
        }

        CustomImageButton {
            source: "qrc:/Icons/SETTINGS.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    settingsPopup.open()
                }
            }
        }
    }
}
