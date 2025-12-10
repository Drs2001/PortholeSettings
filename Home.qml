import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ColumnLayout{
    Flow {
        Layout.fillWidth: true
        Layout.fillHeight: true
        topPadding: 10
        leftPadding: 10
        rightPadding: 10
        bottomPadding: 10
        spacing: 10
        
        Repeater {
            model: ListModel {
                ListElement { name: "System"; description: "Display, sound, notifications, power"; icon: "\udb80\udf22" }
                ListElement { name: "Devices"; description: "Bluetooth, printers, mouse"; icon: "\uf11c" }
                ListElement { name: "Network/Internet"; description: "Wi-Fi, airplane mode, VPN"; icon: "\ueb01" }
                ListElement { name: "Personalization"; description: "Background, lock screen, colors"; icon: "\uf1fc" }
                ListElement { name: "Apps"; description: "Uninstall, defaults, optional features"; icon: "\udb83\uddd0" }
            }
            
            Button {
                id: settingsButton
                implicitWidth: 275
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
                        Text {
                            text: model.name
                            color: palette.active.text
                            font.pixelSize: 15
                            font.bold: true
                        }
                        Text {
                            Layout.fillWidth: true
                            text: model.description
                            color: palette.active.text
                            font.pixelSize: 10
                            wrapMode: Text.WordWrap
                        }
                    }

                }
                text: model.icon + " " + model.name
                onClicked: {
                    var source = getCategorySource(model.name)
                    if(source != ""){
                        rootStack.push(source)
                    }
                }
            }
        }

        function getCategorySource(categoryName) {
            // Map category names to QML files
            var sourceMap = {
                "System": "SettingMenus/SystemSettings.qml",
            }
            return sourceMap[categoryName] || ""
        }
    }
}