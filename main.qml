import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root
    width: 900
    height: 600
    visible: true
    title: "Settings"
    
    color: "#f5f5f5"
    
    // Main layout
    RowLayout {
        anchors.fill: parent
        spacing: 0
        
        // Sidebar
        Rectangle {
            Layout.fillHeight: true
            Layout.preferredWidth: 250
            color: "#ffffff"
            
            // Drop shadow effect
            Rectangle {
                anchors.fill: parent
                anchors.rightMargin: -5
                color: "transparent"
                z: -1
                
                Rectangle {
                    anchors.fill: parent
                    anchors.margins: -2
                    color: "#10000000"
                    radius: 2
                }
            }
            
            ListView {
                id: categoryList
                anchors.fill: parent
                anchors.margins: 10
                
                model: ListModel {
                    ListElement { name: "Test"; icon: "🎨" }
                    ListElement { name: "Display"; icon: "🖥️" }
                    ListElement { name: "Network"; icon: "🌐" }
                    ListElement { name: "Sound"; icon: "🔊" }
                    ListElement { name: "Power"; icon: "🔋" }
                    ListElement { name: "Privacy"; icon: "🔒" }
                }
                
                delegate: ItemDelegate {
                    width: ListView.view.width
                    height: 50
                    
                    background: Rectangle {
                        color: categoryList.currentIndex === index ? "#e3f2fd" : "transparent"
                        radius: 6
                    }
                    
                    contentItem: RowLayout {
                        spacing: 12
                        
                        Text {
                            text: model.icon
                            font.pixelSize: 20
                        }
                        
                        Text {
                            text: model.name
                            font.pixelSize: 14
                            color: "#333333"
                            Layout.fillWidth: true
                        }
                    }
                    
                    onClicked: {
                        categoryList.currentIndex = index
                        contentLoader.source = getCategorySource(model.name)
                    }
                }
                
                Component.onCompleted: {
                    currentIndex = 0
                }
            }
        }
        
        // Content area
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#f5f5f5"
            
            ScrollView {
                anchors.fill: parent
                anchors.margins: 20
                
                Loader {
                    id: contentLoader
                    width: parent.width
                    source: "AppearanceSettings.qml"
                }
            }
        }
    }
    
    function getCategorySource(categoryName) {
        // Map category names to QML files
        var sourceMap = {
            "Appearance": "AppearanceSettings.qml",
            "Display": "DisplaySettings.qml",
            "Network": "NetworkSettings.qml",
            "Sound": "SoundSettings.qml",
            "Power": "PowerSettings.qml",
            "Privacy": "PrivacySettings.qml"
        }
        return sourceMap[categoryName] || "AppearanceSettings.qml"
    }
}