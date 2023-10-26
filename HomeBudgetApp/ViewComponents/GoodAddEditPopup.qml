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

    property int goodId: -1

    onOpened: {
        goodIconButton.image = FileReader.readAsImage("://Icons/missing_category.png")
        goodPopupFileDialog.savedImageByteArray = ""

        goodId = -1
        nameField.text = ""
    }

    function setData(id, сategoryId, name, icon) {
        goodId = id
        categoryComboBox.selectedCategoryId = сategoryId

        nameField.text = name

        goodIconButton.image = icon
    }

    function setCategory(сategoryId) {
        categoryComboBox.selectedCategoryId = сategoryId
    }

    FileDialog {
        id: goodPopupFileDialog

        property variant savedImageByteArray;

        title: "Выберите картинку для категории"
        folder: shortcuts.home

        onAccepted: {
            goodIconButton.image = FileReader.readAsImage(fileUrl)
            savedImageByteArray = FileReader.read(fileUrl)
        }
        onRejected: {

        }
    }

    contentItem: ColumnLayout {

        spacing: 20

        CustomText {
            Layout.alignment: Qt.AlignHCenter
            text: (goodId >= 0) ? "Редактирование товара" : "Добавление товара"
        }
        RowLayout {
            BlobImage {
                id: goodIconButton

                Layout.preferredHeight: 75
                Layout.preferredWidth: 75

                image: FileReader.readAsImage("://Icons/missing.png")

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        goodPopupFileDialog.open()
                    }
                }
            }
            ColumnLayout {
                Layout.fillWidth: true

                TextField {
                     id: nameField
                     Layout.fillWidth: true
                     Layout.alignment: Qt.AlignTop

                     placeholderText: "Название"
                }

                ComboBox {
                    id: categoryComboBox
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop

                    property variant selectedCategoryId

                    model: CategoryModel
                    textRole: "name"

                    Component.onCompleted: {
                        selectedCategoryId = model.getItemByIndexName(currentIndex, "id")
                    }

                    onActivated: {
                        if (currentIndex >= 0)
                        {
                            selectedCategoryId  = model.getItemByIndexName(currentIndex, "id")
                        }
                    }
                }
            }
        }
        CustomTextButton {
            border {
                color: colorPalette.textColor
                width: 2
            }

            Layout.alignment: Qt.AlignRight

            displayText: (goodId >= 0) ? "Редактировать" : "Добавить товар"
            isActive: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (goodId >= 0)
                        GoodRepository.editItem(goodId, categoryComboBox.selectedCategoryId, nameField.text, goodPopupFileDialog.savedImageByteArray)
                    else
                        GoodRepository.addItem(categoryComboBox.selectedCategoryId, nameField.text, goodPopupFileDialog.savedImageByteArray)
                    close()
                }
            }
        }
    }
}
