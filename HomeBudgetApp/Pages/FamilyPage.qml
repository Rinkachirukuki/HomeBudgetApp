import QtQuick 2.15
import QtQuick.Controls 2.15

import "qrc:/DefaultElements"
import "qrc:/DelegateEntities"

Item {
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
        }

        ScrollView {
            id: familyPageScrollView

            anchors.fill: parent
            anchors.margins: 5

            ScrollBar.horizontal.interactive: false
            ScrollBar.vertical.interactive: true
            ScrollBar.vertical.policy: ScrollBar.AlwaysOn

            clip: true
            width: parent.width

            ListView {
                id: familyPageList
                width: familyPageScrollView.width

                spacing: 5

                delegate: FamilyModelDelegate { width: familyPageList.width - 15 }

                footer:
                    Item {
                        height: footerText.height + 25
                        width: familyPageList.width - 15

                        CustomText {
                            id: footerText
                            anchors.centerIn: parent
                            text: familyPageList.count ? "Конец списка" : "Cписок пуст"
                        }
                    }

                model:
                    ListModel {
                        ListElement {
                            firstName:  "Валерий"
                            lastName:   "Жмышенко"
                            patronymic: "Альбертович"
                        }
                        ListElement {
                            firstName:  "Валерий1"
                            lastName:   "Жмышенко1"
                            patronymic: "Альбертович1"
                        }
                        ListElement {
                            firstName:  "Валерий"
                            lastName:   "Жмышенко"
                            patronymic: "Альбертович"
                        }
                        ListElement {
                            firstName:  "Валерий1"
                            lastName:   "Жмышенко1"
                            patronymic: "Альбертович1"
                        }
                        ListElement {
                            firstName:  "Валерий"
                            lastName:   "Жмышенко"
                            patronymic: "Альбертович"
                        }
                        ListElement {
                            firstName:  "Валерий1"
                            lastName:   "Жмышенко1"
                            patronymic: "Альбертович1"
                        }
                        ListElement {
                            firstName:  "Валерий"
                            lastName:   "Жмышенко"
                            patronymic: "Альбертович"
                        }
                        ListElement {
                            firstName:  "Валерий1"
                            lastName:   "Жмышенко1"
                            patronymic: "Альбертович1"
                        }
                    }
            }
        }
    }
}
