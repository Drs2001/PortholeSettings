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
            anchors.fill: parent
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
            }
            
            Text {
                Layout.leftMargin: 5
                text: "System"
                font.pixelSize: 14
                font.bold: true
                color: palette.active.text
            }

            ScrollView {
                id: sidePanelScroller
                clip: true
                Layout.fillHeight: true
                Layout.fillWidth: true
                ScrollBar.vertical.policy: ScrollBar.AlwaysOn

                ListView {
                    spacing: 15
                    model: ListModel {
                        ListElement { name: "Display"; glyph: "\udb80\udf79"; pageLink: "" }
                        ListElement { name: "Sound"; glyph: "\udb81\udd7e"; pageLink: "" }
                        ListElement { name: "Power and Sleep"; glyph: "\udb81\udc25"; pageLink: "" }
                        ListElement { name: "Storage"; glyph: "\uf0a0"; pageLink: "" }
                    }
                    delegate: SidePanelButton {
                        width: sidePanelScroller.width
                        height: 40
                    }
                }
            }

            // Spacer
            Item {
                Layout.fillHeight: true  
            }
        }
    }
}