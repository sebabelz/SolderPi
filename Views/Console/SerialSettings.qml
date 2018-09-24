import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2

ColumnLayout {
    id:rootLayout
    Layout.fillHeight: true
    spacing: 4

    ComboBox {
           Layout.preferredHeight: 15
           Layout.fillHeight: true
           Layout.fillWidth: true
    }

    GridLayout {
        id: gridLayout
        Layout.fillHeight: true
        Layout.fillWidth:  true
        Layout.preferredHeight: 70

        columns: 2
        rows: 0

        Label {
            text: "Baudrate: "
            font.pointSize: 18
            fontSizeMode: Text.Fit

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            Layout.preferredWidth: 40
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        ComboBox {
            font.pointSize: 18

            Layout.preferredWidth: 60
            Layout.fillHeight: true
            Layout.fillWidth: true

            textRole: "text"
            model: ListModel {
                id: baudItems
                ListElement { text: "9600"; value: "9600" }
                ListElement { text: "19200"; value: "19200" }
                ListElement { text: "38400"; value: "38400" }
                ListElement { text: "115200"; value: "115200" }
            }

            delegate: comboDelegate
        }

        Label {
            text: "Data bits: "
            font.pointSize: 18
            fontSizeMode: Text.Fit

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            Layout.preferredWidth: 40
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        ComboBox {
            font.pointSize: 18

            Layout.preferredWidth: 60
            Layout.fillHeight: true
            Layout.fillWidth: true

            textRole: "text"
            model: ListModel {
                id: dataItems
                ListElement { text: "No Control"; value: "0"}
                ListElement { text: "Hardware"; value: "2"}
                ListElement { text: "Software"; value: "3" }
            }

            delegate: comboDelegate
        }

        Label {
            text: "Parity: "
            font.pointSize: 18
            fontSizeMode: Text.Fit

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            Layout.preferredWidth: 40
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        ComboBox {
            font.pointSize: 18

            Layout.preferredWidth: 60
            Layout.fillHeight: true
            Layout.fillWidth: true

            textRole: "text"

            model: ListModel {
                id: parityItems
                ListElement { text: "None"; value: "0"}
                ListElement { text: "Even"; value: "2"}
                ListElement { text: "Odd"; value: "3" }
                ListElement { text: "Mark"; value: "5" }
                ListElement { text: "Space"; value: "4" }
            }

            delegate: comboDelegate
        }

        Label {
            text: "Stop bits: "
            font.pointSize: 18
            fontSizeMode: Text.Fit

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            Layout.preferredWidth: 40
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        ComboBox {
            font.pointSize: 18

            Layout.preferredWidth: 60
            Layout.fillHeight: true
            Layout.fillWidth: true

            textRole: "text"
            model: ListModel {
                id: stopItems
                ListElement { text: "No Control"; value: "0"}
                ListElement { text: "Hardware"; value: "2"}
                ListElement { text: "Software"; value: "3" }
            }

            delegate: comboDelegate
        }

        Label {
            text: "Flow Control: "
            font.pointSize: 18
            fontSizeMode: Text.Fit

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            Layout.preferredWidth: 40
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        ComboBox {
            id:combo
            font.pointSize: 18

            Layout.preferredWidth: 60
            Layout.fillHeight: true
            Layout.fillWidth: true

            textRole: "text"
            model: ListModel {
                id: flowItems
                ListElement { text: "No Control"; value: "0"}
                ListElement { text: "Hardware"; value: "2"}
                ListElement { text: "Software"; value: "3" }
            }

            delegate: comboDelegate
        }
    }
    RowLayout {
        spacing: 4

        Layout.preferredHeight: 20
        Layout.fillHeight: true
        Layout.fillWidth: true

        Button {
            Layout.preferredHeight: 40
            Layout.fillHeight: true
            Layout.fillWidth: true
            text: "Connect"

            font.pointSize: 18

            onClicked: {
                gridLayout.enabled = false
            }
        }
        Button {
            Layout.preferredHeight: 60
            Layout.fillHeight: true
            Layout.fillWidth: true
            text: "Disconnect"

            font.pointSize: 18

            onClicked: {
                gridLayout.enabled = true
            }
        }
    }

    Component {
        id: comboDelegate
        MenuItem {
        width: parent.width
        text: combo.textRole ? (Array.isArray(combo.model) ? modelData[combo.textRole] : model[combo.textRole]) : modelData
        Material.foreground: combo.currentIndex === index ? parent.Material.accent : parent.Material.foreground
        highlighted: combo.highlightedIndex === index
        hoverEnabled: combo.hoverEnabled
        height: 60
        font.pointSize: 24
        }
    }
}
