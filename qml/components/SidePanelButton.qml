import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Button {
    id: sidePanelButton
    required property string name
    required property string glyph
    required property string pageLink

    background: Rectangle {
        anchors.fill: parent
        color: sidePanelButton.hovered ? palette.active.highlight : "transparent"
    }

    contentItem: Row {
        anchors.centerIn: parent
        spacing: 15
        Text {
            anchors.verticalCenter: parent.verticalCenter
            text: glyph
            font.pixelSize: 20
            color: palette.active.text
        }
        Text {
            anchors.verticalCenter: parent.verticalCenter
            text: name
            font.pixelSize: 12
            font.bold: true
            color: palette.active.text
        }
    }
}