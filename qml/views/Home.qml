import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ColumnLayout {
    spacing: 0
    
    Item {
        Layout.fillWidth: true
        Layout.fillHeight: true
        
        Grid {
            id: buttonsGrid
            property var settingsButtonWidth: 275
            property var buttonLeftRightMargins: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottomMargin: 10
            spacing: 10
            
            columns: Math.max(1, Math.floor((parent.width - buttonsGrid.buttonLeftRightMargins) / (buttonsGrid.settingsButtonWidth + buttonsGrid.spacing)))
            horizontalItemAlignment: Grid.AlignHCenter
            
            Repeater {
                model: ListModel {
                    ListElement { name: "System"; description: "Display, sound, notifications, power"; icon: "\udb80\udf22"; pageLink: "SystemSettings.qml" }
                    ListElement { name: "Devices"; description: "Bluetooth, printers, mouse"; icon: "\uf11c"; pageLink: "" }
                    ListElement { name: "Network/Internet"; description: "Wi-Fi, airplane mode, VPN"; icon: "\ueb01"; pageLink: "" }
                    ListElement { name: "Personalization"; description: "Background, lock screen, colors"; icon: "\uf1fc"; pageLink: "" }
                    ListElement { name: "Apps"; description: "Uninstall, defaults, optional features"; icon: "\udb83\uddd0"; pageLink: "" }
                }
                
                Button {
                    id: settingsButton
                    implicitWidth: buttonsGrid.settingsButtonWidth
                    implicitHeight: 75
                    
                    background: Rectangle {
                        anchors.fill: parent
                        color: "transparent"
                        border.color: settingsButton.hovered ? palette.active.highlight : "transparent"
                        border.width: 2
                    }
                    
                    contentItem: RowLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 20
                        
                        Text {
                            Layout.alignment: Qt.AlignTop
                            text: model.icon
                            color: palette.active.accent
                            font.pixelSize: 35
                        }
                        
                        ColumnLayout {
                            Layout.fillWidth: true
                            Layout.alignment: Qt.AlignTop
                            spacing: 2
                            
                            Text {
                                text: model.name
                                color: palette.active.text
                                font.pixelSize: 15
                                font.bold: true
                            }
                            
                            Text {
                                Layout.fillWidth: true
                                text: model.description
                                color: palette.inactive.text
                                font.pixelSize: 10
                                wrapMode: Text.WordWrap
                            }
                        }
                    }
                    
                    text: model.icon + " " + model.name
                    
                    onClicked: {
                            rootStack.push(model.pageLink)
                    }
                }
            }
        }
    }
}