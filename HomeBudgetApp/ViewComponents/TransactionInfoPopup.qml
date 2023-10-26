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

    function unixTimeToText(unixTimestamp) {
        var date = new Date(unixTimestamp * 1000)
        return date.toLocaleString(Locale.ShortFormat)
     }

    onOpened: {
        amountField.text = ""
        descriptionArea.text = ""
        dateField.text = ""
        lastNameField.text = ""
        firstNameField.text = ""
        patronymicField.text = ""
    }

    function setData(lastName, firstName, patronymic, amount, name, description, datetime) {

        lastNameField.text = lastName
        firstNameField.text = firstName
        patronymicField.text = patronymic
        amountField.text = amount
        categoryField.text = name
        descriptionArea.text = description
        dateField.text = unixTimeToText(datetime)
    }

    contentItem:
    ColumnLayout {
        spacing: 20

        CustomText {
            Layout.alignment: Qt.AlignLeft
            text: "Информация о транзакции"
            font.bold: true
        }

        GridLayout {
            Layout.fillWidth: true

        columns: 2
        columnSpacing: 10

        CustomText {
            Layout.alignment: Qt.AlignLeft
            text: "Дата:"
        }
        CustomText {
             id: dateField
             Layout.fillWidth: true

        }

        CustomText {
            Layout.alignment: Qt.AlignLeft
            text: "Категория:"
        }
        CustomText {
             id: categoryField
             Layout.fillWidth: true
        }

        CustomText {
            Layout.alignment: Qt.AlignLeft
            text: "Фамилия:"
        }
        CustomText {
             id: lastNameField
             Layout.fillWidth: true
        }

        CustomText {
            Layout.alignment: Qt.AlignLeft
            text: "Имя:"
        }
        CustomText {
             id: firstNameField
             Layout.fillWidth: true
        }

        CustomText {
            Layout.alignment: Qt.AlignLeft
            text: "Отчество:"
        }

        CustomText {
             id: patronymicField
             Layout.fillWidth: true

        }

        CustomText {
            Layout.alignment: Qt.AlignLeft
            text: "Сумма:"
        }
        CustomText {
             id: amountField
             Layout.fillWidth: true
        }
    }
        CustomText {
            text: "Комментарий:"
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
    }
}
