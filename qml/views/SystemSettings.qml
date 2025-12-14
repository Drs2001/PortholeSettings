import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import components

RowLayout {
    spacing: 0
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
                    implicitWidth: 36
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
                Layout.leftMargin: 15 // TODO: Replace hard coded margin with dynamic one
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

                ListView {
                    spacing: 15
                    model: ListModel {
                        ListElement { name: "Display"; glyph: "\udb80\udf79"; pageIndex: 0 }
                        ListElement { name: "Sound"; glyph: "\udb81\udd7e"; pageIndex: 1 }
                        ListElement { name: "Power and Sleep"; glyph: "\udb81\udc25"; pageIndex: 2 }
                        ListElement { name: "Storage"; glyph: "\uf0a0"; pageIndex: 3 }
                    }
                    delegate: SidePanelButton {
                        width: sidePanelScroller.width
                        height: 40

                        onClicked: {
                            systemStackLayout.currentIndex = pageIndex
                        }
                    }
                }
            }

            // Spacer
            Item {
                Layout.fillHeight: true  
            }
        }
    }

    StackLayout {
        id: systemStackLayout
        currentIndex: 0

        Loader { source: "SystemSettingsViews/DisplayView.qml"}
        Loader { source: "SystemSettingsViews/SoundView.qml"}
        Loader { source: "SystemSettingsViews/PowerSleepView.qml"}
        Loader { source: "SystemSettingsViews/StorageView.qml"}
    }
}