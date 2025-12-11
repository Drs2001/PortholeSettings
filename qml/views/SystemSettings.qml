import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import components

RowLayout {
    Rectangle {
        Layout.fillHeight: true
        implicitWidth: 250
        color: palette.active.alternateBase
        
        ColumnLayout {
            spacing: 20

            RowLayout {
                Layout.margins: 5
                spacing: 10
                Button {
                    id: backButton
                    implicitHeight: 35
                    implicitWidth: 40
                    background: Rectangle {
                        color: backButton.hovered ? palette.active.accent : "transparent"
                        radius: 10
                    }
                    contentItem: Text {
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        text: "\uf060"
                        color: palette.active.text
                    }
                    onClicked: {
                        rootStack.pop()
                    }
                }

                Text {
                    text: "Settings"
                    color: palette.active.text
                    font.pixelSize: 12
                }

                SidePanelButton {

                }
            }
            
            Text {
                Layout.leftMargin: 20
                text: "System"
                font.pixelSize: 14
                font.bold: true
                color: palette.active.text
            }
        }
    }
}