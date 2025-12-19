import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    anchors.fill: parent
    color: palette.active.window

    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: 15
        anchors.topMargin: 30
        spacing: 0

        Text {
            Layout.alignment: Qt.AlignTop
            text: "Display"
            font.pixelSize: 20
            font.bold: true
            color: palette.active.text
        }
    }
}