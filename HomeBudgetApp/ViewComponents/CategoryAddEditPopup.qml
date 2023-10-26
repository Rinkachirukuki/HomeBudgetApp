import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.3
import ImageConnector 1.0

import "qrc:/DefaultElements"

Popup {
    modal: true

    anchors.centerIn: parent

    background: Rectangle {
        radius: 10
        color: colorPalette.accentBackgroundColor
        opacity: 0.9

        border {
            color: colorPalette.textColor
            width: 2
        }
    }

    padding: 15

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    property int categoryId: -1

    onOpened: {
        categoryIconButton.image = FileReader.readAsImage("://Icons/missing_category.png")
        categoryPopupFileDialog.savedImageByteArray = ""

        categoryId = -1
        nameField.text = ""
    }

    function setData(id, name, icon) {
        categoryId = id

        nameField.text = name

        categoryIconButton.image = icon
    }

    FileDialog {
        id: categoryPopupFileDialog

        property variant savedImageByteArray;

        title: "Выберите картинку для категории"
        folder: shortcuts.home

        onAccepted: {
            categoryIconButton.image = FileReader.readAsImage(fileUrl)
            savedImageByteArray = FileReader.read(fileUrl)
        }
        onRejected: {

        }
    }

    contentItem: ColumnLayout {

        spacing: 20

        CustomText {
            Layout.alignment: Qt.AlignHCenter
            text: (categoryId >= 0) ? "Редактирование категории" : "Добавление категории"
        }
        RowLayout {
            BlobImage {
                id: categoryIconButton

                Layout.preferredHeight: 75
                Layout.preferredWidth: 75

                image: FileReader.readAsImage("://Icons/missing.png")

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        categoryPopupFileDialog.open()
                    }
                }
            }
            TextField {
                 id: nameField
                 Layout.fillWidth: true
                 Layout.alignment: Qt.AlignTop

                 placeholderText: "Название"
            }
        }
        CustomTextButton {
            border {
                color: colorPalette.textColor
                width: 2
            }

            Layout.alignment: Qt.AlignRight

            displayText: (categoryId >= 0) ? "Редактировать" : "Добавить запись"
            isActive: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (categoryId >= 0)
                        CategoryRepository.editItem(categoryId, nameField.text, categoryPopupFileDialog.savedImageByteArray)
                    else
                        CategoryRepository.addItem(nameField.text, categoryPopupFileDialog.savedImageByteArray)
                    close()
                }
            }
        }
    }
}
