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

        Rectangle {
            id: categoriesHeadlineRectangle
            anchors {
                top: parent.top
                right: parent.horizontalCenter
                left: parent.left

                margins: 5
            }

            height: categoriesHeadline.height + 10
            radius: 10

            color: colorPalette.backgroundColor

            CustomText {
                id: categoriesHeadline
                anchors.centerIn: parent
                text: "Категории"
            }
        }

        ScrollView {
            id: categoriesPageScrollView

            anchors {
                top: categoriesHeadlineRectangle.bottom
                bottom: parent.bottom
                right: parent.horizontalCenter
                left: parent.left

                margins: 5
            }

            ScrollBar.horizontal.interactive: false
            ScrollBar.vertical.interactive: true
            ScrollBar.vertical.policy: ScrollBar.AlwaysOn

            clip: true
            width: parent.width

            ListView {
                id: categoriesPageList
                width: categoriesPageScrollView.width

                spacing: 5

                delegate: CategoryGoodsModelDelegate { width: categoriesPageList.width - 15 }

                footer:
                    Item {
                        height: categoriesFooterText.height + 25
                        width: categoriesPageList.width - 15

                        CustomText {
                            id: categoriesFooterText
                            anchors.centerIn: parent
                            text: categoriesPageList.count ? "Конец списка" : "Cписок пуст"
                        }
                    }

                model:
                    ListModel {
                        ListElement {
                            name:  "Категория 1"
                        }
                        ListElement {
                            name:  "Категория 2"
                        }
                        ListElement {
                            name:  "Категория 3"
                        }
                        ListElement {
                            name:  "Категория 1"
                        }
                        ListElement {
                            name:  "Категория 2"
                        }
                        ListElement {
                            name:  "Категория 3"
                        }
                        ListElement {
                            name:  "Категория 1"
                        }
                        ListElement {
                            name:  "Категория 2"
                        }
                        ListElement {
                            name:  "Категория 3"
                        }
                    }
            }
        }

        CustomTextButton {
            anchors {
                right: parent.horizontalCenter
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

        Rectangle {
            id: goodsHeadlineRectangle
            anchors {
                top: parent.top
                right: parent.right
                left: parent.horizontalCenter

                margins: 5
            }

            height: goodsHeadline.height + 10
            radius: 10

            color: colorPalette.backgroundColor

            CustomText {
                id: goodsHeadline
                anchors.centerIn: parent
                text: "Товары"
            }
        }

        ScrollView {
            id: goodsPageScrollView

            anchors {
                top: goodsHeadlineRectangle.bottom
                bottom: parent.bottom
                right: parent.right
                left: parent.horizontalCenter

                margins: 5
            }

            ScrollBar.horizontal.interactive: false
            ScrollBar.vertical.interactive: true
            ScrollBar.vertical.policy: ScrollBar.AlwaysOn

            clip: true
            width: parent.width

            ListView {
                id: goodsPageList
                width: categoriesPageScrollView.width

                spacing: 5

                delegate: CategoryGoodsModelDelegate { width: goodsPageList.width - 15 }

                footer:
                    Item {
                        height: footerText.height + 25
                        width: goodsPageList.width - 15

                        CustomText {
                            id: footerText
                            anchors.centerIn: parent
                            text: goodsPageList.count ? "Конец списка" : "Cписок пуст"
                        }
                    }

                model:
                    ListModel {
                        ListElement {
                            name:  "Товар 1"
                        }
                        ListElement {
                            name:  "Товар 2"
                        }
                        ListElement {
                            name:  "Товар 3"
                        }
                        ListElement {
                            name:  "Товар 1"
                        }
                        ListElement {
                            name:  "Товар 2"
                        }
                        ListElement {
                            name:  "Товар 3"
                        }
                        ListElement {
                            name:  "Товар 1"
                        }
                        ListElement {
                            name:  "Товар 2"
                        }
                        ListElement {
                            name:  "Товар 3"
                        }
                    }
            }
        }
    }
}
