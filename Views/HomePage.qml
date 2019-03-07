import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.3
import "../Icons/Icon.js" as MdiFont

Page {
    id: homePage

    title: qsTr("Home")

    Dialog {
        id: comboDialog
        title: "Select Parameter"

        property int aint: 3

        contentItem: ComboBox {
            id: combo

            textRole: "text"
            model: ListModel {
                id: myList
                ListElement { text: "Hans"; value: 0}
                ListElement { text: "peter"; value: 1}
                ListElement { text: "harald"; value: 2}
                ListElement { text: "peterchen"; value: 3}
            }
            currentIndex: comboDialog.aint
//            onCurrentIndexChanged: {
//                comboDialog.aint = myList.get(currentIndex).value
//                console.log(myList.get(currentIndex).value)
//                console.log(comboDialog.aint)
//            }
        }
        standardButtons:  Dialog.Ok | Dialog.Cancel | Dialog.Close

        onAccepted: {
            comboDialog.aint = myList.get(combo.currentIndex).value
        }
    }
    RowLayout{

        Button
        {
            implicitHeight: 48
            implicitWidth: 48
            font.pointSize: 24
            font.family: "Material Design Icons"

            text: MdiFont.Icon.squareEditOutline

            onClicked:
            {
                comboDialog.open()
                comboDialog.x = 20
                comboDialog.y = 300
            }
        }

        TextField {
            id:foobar
            text: comboDialog.aint

        }
    }
}
