import QtQuick 2.15
import QtQuick.Layouts 1.15
import ImageConnector 1.0

import "qrc:/DefaultElements"
import "qrc:/Pages"

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

            clip: true

            BlobImage {
                id: familyIconButton

                Layout.preferredHeight: 75
                Layout.preferredWidth: 75

                height: 75
                width: 75

                image: icon
            }

            ColumnLayout {
                CustomText {
                    text: last_name
                    font.bold: true
                    clip: true
                }
                RowLayout {
                    CustomText {
                        text: first_name
                        clip: true
                    }
                    CustomText {
                        text: patronymic
                        clip: true
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
                        familyAddEditPopup.open()
                        familyAddEditPopup.setData(id, last_name, first_name, patronymic, icon)
                    }
                }
            }

            CustomImageButton {
                source: "qrc:/Icons/DELETE.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        FamilyRepository.deleteItem(id)
                    }
                }
            }
        }
    }
}
