import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.3

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

    onOpened: {
        amountField.text = ""
        descriptionArea.text = ""
        familyComboBox.currentIndex = 0
        categoryComboBox.currentIndex = 0

    }

    contentItem: ColumnLayout {

        spacing: 20

        CustomText {
            Layout.alignment: Qt.AlignHCenter
            text: "Добавление транзакции"
        }

        ComboBox {
            id: familyComboBox
            Layout.fillWidth: true

            property variant selectedFamilyId

            model: FamilyModel
            textRole: "last_name"
            displayText: model.getItemByIndexName(currentIndex, "first_name") + " " + model.getItemByIndexName(currentIndex, "last_name")

            Component.onCompleted: {
                selectedFamilyId = model.getItemByIndexName(currentIndex, "id")
            }

            onActivated: {
                if (currentIndex >= 0)
                {
                    selectedFamilyId  = model.getItemByIndexName(currentIndex, "id")
                }
            }
        }

        ComboBox {
            id: categoryComboBox
            Layout.fillWidth: true

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

        TextField {
             id: amountField
             Layout.fillWidth: true

             placeholderText: "Сумма"

             validator: IntValidator {
                 bottom: -99999999
                 top:     99999999
             }
        }

        TextArea {
             id: descriptionArea
             Layout.fillWidth: true

             wrapMode: TextArea.Wrap

             placeholderText: "Комментарий"

             background: Rectangle {
                 radius: 5
                 color: colorPalette.accentBackgroundColor
                 opacity: 0.9

                 border {
                     color: colorPalette.backgroundColor
                     width: 1
                 }
             }
        }

        CustomTextButton {
            border {
                color: colorPalette.textColor
                width: 2
            }

            Layout.alignment: Qt.AlignRight

            displayText: "Добавить запись"
            isActive: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    TransactionsRepository.addItem(familyComboBox.selectedFamilyId, categoryComboBox.selectedCategoryId, amountField.text, descriptionArea.text)
                    close()
                }
            }
        }
    }
}
