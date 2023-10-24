import QtQuick 2.15
import QtQuick.Window 2.15

import "qrc:/ViewComponents"

Window {
    id: mainWindow

    width: 800
    height: 600
    minimumWidth: 800
    minimumHeight: 600

    visible: true
    title: qsTr("Домашний бюджет")

    property var  colorPalette: Palette {}
    property int textScale: 25
    property int imageScale: 35

    color: colorPalette.backgroundColor

    NavigationBar {
        id: navigationBar
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }

    Loader {
        id: appRouter
        anchors {
            top: navigationBar.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right

            bottomMargin: 5
            leftMargin: 5
            rightMargin: 5
        }

        states: [
            State {
                name: "TRANSACTIONS_PAGE"
                PropertyChanges { target: appRouter; source: "qrc:/Pages/TransactionsPage.qml";}
            },
            State {
                name: "FAMILY_PAGE"
                PropertyChanges { target: appRouter; source: "qrc:/Pages/FamilyPage.qml";}
            },
            State {
                name: "GOODS_PAGE"
                PropertyChanges { target: appRouter; source: "qrc:/Pages/GoodsPage.qml";}
            },
            State {
                name: "REPORTS_PAGE"
                PropertyChanges { target: appRouter; source: "qrc:/Pages/ReportsPage.qml";}
            }
        ]
        Component.onCompleted: { state = "TRANSACTIONS_PAGE" }
    }
}
