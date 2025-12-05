import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ColumnLayout {
    spacing: 20
    
    // Page title
    Text {
        text: backend.theme
        font.pixelSize: 28
        font.bold: true
        color: "#333333"
    }
    
    // Theme section
    Rectangle {
        Layout.fillWidth: true
        Layout.preferredHeight: childrenRect.height + 40
        color: "#ffffff"
        radius: 8
        
        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 15
            
            Text {
                text: "Theme"
                font.pixelSize: 16
                font.bold: true
                color: "#333333"
            }
            
            RowLayout {
                spacing: 10
                
                Repeater {
                    model: ["Light", "Dark", "Auto"]
                    
                    delegate: Button {
                        text: modelData
                        Layout.preferredWidth: 100
                        Layout.preferredHeight: 40
                        
                        background: Rectangle {
                            color: "grey"
                            radius: 6
                        }
                        
                        contentItem: Text {
                            text: parent.text
                            color: "white"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        
                        onClicked: {
                            
                        }
                    }
                }
            }
        }
    }
    
    Item {
        Layout.fillHeight: true
    }
}