import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import "../Icons/Icon.js" as MdiFont

Page
{
    id: settingsPage
    title: qsTr("Settings")

    ColumnLayout
    {
        width: 300

        ComboBox
        {
            id: terminalSelect
            implicitHeight: 80
            font.pixelSize: 24
            Layout.fillWidth: true

            model: SerialPort.getSerialPortInfo()

            delegate: Component
            {
                MenuItem
                {
                width: parent.width
                text: terminalSelect.textRole ? (Array.isArray(parent.model) ? modelData[parent.textRole] : model[terminalSelect.textRole]) : modelData
                Material.foreground: terminalSelect.currentIndex === index ? terminalSelect.Material.accent : terminalSelect.Material.foreground
                highlighted: terminalSelect.highlightedIndex === index
                hoverEnabled: terminalSelect.hoverEnabled
                font.pointSize: 30
                }
            }

            Component.onCompleted:
            {
                if (SerialPort.getSerialPortInfo())
                {

                }
                else
                {
//                   gridLayout.enabled = false
//                   conButton.enabled = false
//                   discoButton.enabled = false
                }
            }
        }

        RowLayout
        {
            id: rowLayout
            Layout.fillWidth: true
            Button
            {
                implicitHeight: 80
                implicitWidth: 80
                font.pointSize: 48
                font.family: "Material Design Icons"

                text: MdiFont.Icon.squareEditOutline

                onClicked:
                {
                    consoleSettingsDialog.open()
                }
            }

            Button
            {
                id: connectButton
                implicitHeight: 80
                implicitWidth: 80
                font.pointSize: 48
                font.family: "Material Design Icons"

                Layout.alignment: Qt.AlignRight

                checkable: true

                text: MdiFont.Icon.lanConnect
                //text: MdiFont.Icon.lanDisconnect
                onToggled:
                {
                    if(connectButton.text === MdiFont.Icon.lanConnect)
                    {
                        connectButton.text = MdiFont.Icon.lanDisconnect
                    }
                    else
                    {
                        connectButton.text = MdiFont.Icon.lanConnect
                    }
                }
            }
        }
    }

    Dialog
    {
        width: parent.width * 0.4
        height: parent.height * 0.7
        id: consoleSettingsDialog

        property int baudRate: 115200
        property int dataBits: 8
        property int stopBits: 0
        property int parity: 0
        property int flowControl: 1

        contentItem: GridLayout
        {
            id: gridLayout
            Layout.fillHeight: true
            Layout.fillWidth:  true
            Layout.preferredHeight: 70

            columns: 2
            rows: 0

            Label
            {
                text: "Baudrate: "
                font.pointSize: 18
                fontSizeMode: Text.Fit

                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                Layout.preferredWidth: 40
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            ComboBox
            {
                id: baudSelect
                font.pointSize: 18

                Layout.preferredWidth: 60
                Layout.fillHeight: true
                Layout.fillWidth: true

                textRole: "text"
                model: ListModel
                {
                    id: baudItems
                    ListElement { text: "9600"; value: 9600 }
                    ListElement { text: "19200"; value: 19200 }
                    ListElement { text: "38400"; value: 38400 }
                    ListElement { text: "115200"; value: 115200 }
                }

                delegate: Component
                {
                    MenuItem
                    {
                    width: parent.width
                    text: baudSelect.textRole ? (Array.isArray(parent.model) ? modelData[parent.textRole] : model[baudSelect.textRole]) : modelData
                    Material.foreground: baudSelect.currentIndex === index ? baudSelect.Material.accent : baudSelect.Material.foreground
                    highlighted: baudSelect.highlightedIndex === index
                    hoverEnabled: baudSelect.hoverEnabled
                    height: 60
                    font.pointSize: 24
                    }
                }

                onCurrentIndexChanged:
                {
                    console.log("log: Baudrate:", baudItems.get(currentIndex).value)
                }
            }

            Label
            {
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
                id: dataBitsSelect
                font.pointSize: 18

                Layout.preferredWidth: 60
                Layout.fillHeight: true
                Layout.fillWidth: true

                textRole: "text"
                model: ListModel
                {
                    id: dataItems
                    ListElement { text: "5"; value: 5 }
                    ListElement { text: "6"; value: 6 }
                    ListElement { text: "7"; value: 7 }
                    ListElement { text: "8"; value: 8 }
                }

                delegate: Component
                {
                    MenuItem
                    {
                    width: parent.width
                    text: dataBitsSelect.textRole ? (Array.isArray(parent.model) ? modelData[parent.textRole] : model[dataBitsSelect.textRole]) : modelData
                    Material.foreground: dataBitsSelect.currentIndex === index ? dataBitsSelect.Material.accent : dataBitsSelect.Material.foreground
                    highlighted: dataBitsSelect.highlightedIndex === index
                    hoverEnabled: dataBitsSelect.hoverEnabled
                    height: 60
                    font.pointSize: 24
                    }
                }
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
                id: paritySelect
                font.pointSize: 18

                Layout.preferredWidth: 60
                Layout.fillHeight: true
                Layout.fillWidth: true

                textRole: "text"

                model: ListModel {
                    id: parityItems
                    ListElement { text: "None"; value: 0}
                    ListElement { text: "Even"; value: 2}
                    ListElement { text: "Odd"; value: 3}
                    ListElement { text: "Mark"; value: 5}
                    ListElement { text: "Space"; value: 4}
                }

                delegate: Component
                {
                    MenuItem
                    {
                    width: parent.width
                    text: paritySelect.textRole ? (Array.isArray(parent.model) ? modelData[parent.textRole] : model[paritySelect.textRole]) : modelData
                    Material.foreground: paritySelect.currentIndex === index ? paritySelect.Material.accent : paritySelect.Material.foreground
                    highlighted: paritySelect.highlightedIndex === index
                    hoverEnabled: paritySelect.hoverEnabled
                    height: 60
                    font.pointSize: 24
                    }
                }
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
                id: stopBitsSelect
                font.pointSize: 18

                Layout.preferredWidth: 60
                Layout.fillHeight: true
                Layout.fillWidth: true

                textRole: "text"
                model: ListModel {
                    id: stopItems
                    ListElement { text: "1"; value: 1 }
                    ListElement { text: "2"; value: 2 }
                    ListElement { text: "1.5"; value: 3 }
                }

                delegate: Component
                {
                    MenuItem
                    {
                    width: parent.width
                    text: stopBitsSelect.textRole ? (Array.isArray(parent.model) ? modelData[parent.textRole] : model[stopBitsSelect.textRole]) : modelData
                    Material.foreground: stopBitsSelect.currentIndex === index ? stopBitsSelect.Material.accent : stopBitsSelect.Material.foreground
                    highlighted: stopBitsSelect.highlightedIndex === index
                    hoverEnabled: stopBitsSelect.hoverEnabled
                    height: 60
                    font.pointSize: 24
                    }
                }
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
                id: flowSelect
                font.pointSize: 18

                Layout.preferredWidth: 60
                Layout.fillHeight: true
                Layout.fillWidth: true

                textRole: "text"
                model: ListModel {
                    id: flowItems
                    ListElement { text: "No Control"; value: 0}
                    ListElement { text: "Hardware"; value: 2}
                    ListElement { text: "Software"; value: 3}
                }

                delegate: Component
                {
                    MenuItem
                    {
                    width: parent.width
                    text: flowSelect.textRole ? (Array.isArray(parent.model) ? modelData[parent.textRole] : model[flowSelect.textRole]) : modelData
                    Material.foreground: flowSelect.currentIndex === index ? flowSelect.Material.accent : flowSelect.Material.foreground
                    highlighted: flowSelect.highlightedIndex === index
                    hoverEnabled: flowSelect.hoverEnabled
                    height: 60
                    font.pointSize: 24
                    }
                }
            }
        }


        standardButtons:  Dialog.Ok | Dialog.Cancel
    }
}
