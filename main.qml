import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2

ApplicationWindow {
    id: window
    visible: true
    width: 1024
    height: 600
    title: qsTr("SolderPi")

    header: ToolBar {
        contentHeight: toolButton.implicitHeight + 20

        ToolButton {
            id: toolButton
            height: parent.height
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 3
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
            font.pixelSize: Qt.application.font.pixelSize * 3
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.30
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Console")
                width: parent.width
                font.pointSize: 26
                onClicked: {
                    stackView.push("Views/ConsolePage.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Settings")
                width: parent.width
                font.pointSize: 26
                onClicked: {
                    stackView.push("Views/SettingsPage.qml")
                    drawer.close()
                }
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "Views/HomePage.qml"
        //initialItem: "Views/SettingsPage.qml"
        //initialItem: "Views/Console/ConsolePage.qml"
        anchors.fill: parent
    }
}
