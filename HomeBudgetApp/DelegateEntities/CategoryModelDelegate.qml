import QtQuick 2.15
import QtQuick.Layouts 1.15
import ImageConnector 1.0

import "qrc:/DefaultElements"
import "qrc:/Pages"

Item {
    height: categoryDelegateLayout.height + 10

    Rectangle {
        height: parent.height
        width: parent.width

        color: colorPalette.backgroundColor

        radius: 10

        MouseArea {
            anchors.fill: parent
            onClicked: {
                GoodRepository.selectedCategoryId = id
            }
        }

        border {
            color: colorPalette.textColor;
            width: (GoodRepository.selectedCategoryId == id) ? 4 : 0
        }


        RowLayout {
            id: categoryDelegateLayout
            anchors {
                left: parent.left
                right: categoryDelegateOptionsLayout.left
                verticalCenter: parent.verticalCenter
                margins: 5
                leftMargin: 10
            }
            spacing: 10

            clip: true

            BlobImage {
                id: categoryIconButton

                Layout.preferredHeight: 75
                Layout.preferredWidth: 75

                height: 75
                width: 75

                image: icon
            }

            ColumnLayout {
                CustomText {
                    text: name
                    font.bold: true
                    clip: true
                }
            }
            Item { Layout.fillWidth: true }
        }

        RowLayout {
            id: categoryDelegateOptionsLayout
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
                        categoryAddEditPopup.open()
                        categoryAddEditPopup.setData(id, name, icon)
                    }
                }
            }

            CustomImageButton {
                source: "qrc:/Icons/DELETE.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (GoodRepository.selectedCategoryId == id){
                            GoodRepository.selectedCategoryId = ""
                        }

                        CategoryRepository.deleteItem(id)
                    }
                }
            }
        }
    }
}
