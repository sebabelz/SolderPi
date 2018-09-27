import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.2

Page {
    id: consolePage
    title: qsTr("Console")

    RowLayout {
        id: rowLayout
        anchors.fill: parent
        visible: true

        ListView {
            id: consoleList

            Layout.preferredWidth: 20
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        ScrollView {
            id: scrollView

            Layout.preferredWidth: 80
            Layout.fillHeight: true
            Layout.fillWidth: true

            TextArea {
                id: textArea
                text: qsTr("Text Area")
                font.pointSize: 20
            }
        }
    }
}
