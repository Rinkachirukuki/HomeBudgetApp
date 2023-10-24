import QtQuick 2.15

QtObject {
    property bool darkTheme: false

    property color backgroundColor: darkTheme ? "#1E1E1E" : "#A7A7A7"
    property color accentBackgroundColor: darkTheme ? "#2C2C2C" : "#D9D9D9"

    property color textColor: darkTheme ? "#FFFFFF" : "#000000"

    property color positiveColor: darkTheme ? "#DAFFC9" : "#236C00"
    property color negativeColor: darkTheme ? "#FFC9C9" : "#6C0000"
}
