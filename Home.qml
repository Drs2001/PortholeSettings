import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// Main layout
Flow {
    width: parent.width
    height: parent.height
    topPadding: 10
    leftPadding: 10
    rightPadding: 10
    bottomPadding: 10
    spacing: 10
    
    Repeater {
        model: ListModel {
            ListElement { name: "System"; icon: "🎨" }
            ListElement { name: "Display"; icon: "🖥️" }
            ListElement { name: "Test 3"; icon: "🌐" }
            ListElement { name: "Test 4"; icon: "🔊" }
        }
        
        Button {
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