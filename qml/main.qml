import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root
    width: 900
    height: 600
    visible: true
    title: "Settings"
    
    color: palette.active.window
    StackView {
        id: rootStack
        initialItem: "views/Home.qml"
        anchors.fill: parent
    }
}