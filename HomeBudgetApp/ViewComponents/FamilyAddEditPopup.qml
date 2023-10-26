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

    property int familyId: -1

    onOpened: {
        familyIconButton.image = FileReader.readAsImage("://Icons/missing.png")
        familyPopupFileDialog.savedImageByteArray = ""

        familyId = -1
        lastNameField.text = ""
        firstNameField.text = ""
        patronymicField.text = ""

    }

    function setData(id, lastName, firstName, patronymic, icon) {
        familyId = id

        lastNameField.text = lastName
        firstNameField.text = firstName
        patronymicField.text = patronymic

        familyIconButton.image = icon
    }

    FileDialog {
        id: familyPopupFileDialog

        property variant savedImageByteArray;

        title: "Выберите картинку для члена семьи"
        folder: shortcuts.home

        onAccepted: {
            familyIconButton.image = FileReader.readAsImage(fileUrl)
            savedImageByteArray = FileReader.read(fileUrl)
        }
        onRejected: {

        }
    }

    contentItem: ColumnLayout {

        spacing: 20

        CustomText {
            Layout.alignment: Qt.AlignHCenter
            text: (familyId >= 0) ? "Редактирование члена семьи" : "Добавление члена семьи"
        }
        RowLayout {
            BlobImage {
                id: familyIconButton

                Layout.preferredHeight: 75
                Layout.preferredWidth: 75

                image: FileReader.readAsImage("://Icons/missing.png")

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        familyPopupFileDialog.open()
                    }
                }
            }
            ColumnLayout {
                Layout.fillWidth: true

                TextField {
                     id: lastNameField
                     Layout.fillWidth: true
                     placeholderText: "Фамилия"
                }
                 TextField {
                     id: firstNameField
                     Layout.fillWidth: true
                     placeholderText: "Имя"

                }
                 TextField {
                     id: patronymicField
                    Layout.fillWidth: true
                    placeholderText: "Отчество"
                }
            }
        }
        CustomTextButton {
            border {
                color: colorPalette.textColor
                width: 2
            }

            Layout.alignment: Qt.AlignRight

            displayText: (familyId >= 0) ? "Редактировать" : "Добавить запись"
            isActive: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (familyId >= 0)
                        FamilyRepository.editItem(familyId, lastNameField.text , firstNameField.text, patronymicField.text, familyPopupFileDialog.savedImageByteArray)
                    else
                        FamilyRepository.addItem(lastNameField.text , firstNameField.text, patronymicField.text, familyPopupFileDialog.savedImageByteArray)
                    close()
                }
            }
        }
    }
}
