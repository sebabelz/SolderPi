import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2

Page {
    id: consolePage
    title: qsTr("Console")

    RowLayout {
        id: rowLayout
        anchors.fill: parent
        visible: true

        SerialSettings {
            id: serialSettings

            Layout.preferredWidth: 40
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        ScrollView {
            id: scrollView

            Layout.preferredWidth: 60
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
