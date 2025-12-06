import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// Content area
Rectangle {
    color: "blue"
    
    ColumnLayout {
        spacing: 20
        
        // Page title
        Text {
            text: "APPEARANCE"
            font.pixelSize: 28
            font.bold: true
            color: "white"
        }

        Button {
            text: "Back"
            onClicked: {
                rootStack.pop()
            }
        }
    }
}