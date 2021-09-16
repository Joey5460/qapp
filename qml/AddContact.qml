import QtQuick 2.12
import QtQuick.Controls 2.12

Page{
    id: root 
    signal friendAdded(string name, string id)
    header: ToolBar{
        ToolButton{
            text:qsTr("Back")
            anchors.left: parent.left
            onClicked: root.StackView.view.pop()
        }
        Label{
            id: pageTitle
            text: qsTr("Add Contact");
            font.pixelSize:20
            anchors.centerIn: parent
        } 
        ToolButton{
            text:qsTr("OK")
            anchors.right: parent.right
            onClicked:{
                friendAdded(form.name.text, form.toxid.text) 
            }
        }
    }

    contentItem: ContactForm{
        id: form
    }
}
