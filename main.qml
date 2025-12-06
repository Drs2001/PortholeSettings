import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root
    width: 900
    height: 600
    visible: true
    title: "Settings"
    
    color: "black"
    StackView {
        id: rootStack
        initialItem: "Home.qml" // We initialize with the file directly as QML automatically wraps seperate files as components
        anchors.fill: parent
    }
}