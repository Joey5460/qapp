import QtQuick 2.12
import QtQuick.Controls 2.12

import "../jdenticon/jdenticon.js" as Jdenticon

Page {
    id: page 
    property string currentContact : "" 

    signal pushChatPage(string name)
    signal menuItemClicked(int id)
    header: ToolBar{
        id : tooBar
        Button{
            id: menuBtn
            text : "M"
            onClicked: {
                drawer.visible = !drawer.visible
            }
        }
        Label{ 
            padding: 10
            text: qsTr("Contacts")
            font.pixelSize: 20
            anchors.centerIn: parent
        } 
    }
      
	Drawer {
		id: drawer
		y: tooBar.height
		width: page.width / 2
		height: page.height - tooBar.height

		//modal: inPortrait
		//interactive: inPortrait
		//position: inPortrait ? 0 : 1
		//visible: !inPortrait

        ListModel{
            id: menuItems
			ListElement {
				name: "New Friend"
                cont: 0  
			}
			ListElement {
				name: "John Brown"
				number: "555 8426"
			}
			ListElement {
				name: "Sam Wise"
				number: "555 0473"
			}
        }
		ListView {
			id: drawerListView
			anchors.fill: parent

			headerPositioning: ListView.OverlayHeader
			delegate: ItemDelegate {
				text: model.name  
				width: parent.width
                onClicked: {
                    menuItemClicked(model.cont);
                    drawer.visible = !drawer.visible
                }

			}
			header: Pane {
				id: header
				z: 2
				width: parent.width

				contentHeight: logo.height

				Image {
					id: logo
					width: parent.width
					source: "../images/qt-logo.png"
					fillMode: implicitWidth > width ? Image.PreserveAspectFit : Image.Pad
				}

				MenuSeparator {
					parent: header
					width: parent.width
					anchors.verticalCenter: parent.bottom
					//visible: !drawerListView.atYBeginning
					visible: true 
				}
			}

			footer: ItemDelegate {
				id: footer
				text: qsTr("Footer")
				width: parent.width

				MenuSeparator {
					parent: footer
					width: parent.width
					anchors.verticalCenter: parent.top
				}
			}

            model: menuItems
            

			ScrollIndicator.vertical: ScrollIndicator { }
		}
	}

	Menu {
        id: contactMenu
        x: parent.width / 2 - width / 2
        y: parent.height / 2 - height / 2
        modal: true

        MenuItem {
            Label{
                text: currentContact
				horizontalAlignment: Qt.AlignHCenter
            }
            text: qsTr("Remove")
            onTriggered: listView.model.removeFriend(currentContact)
        }
    }
	FakeImage{
		id: fakeAvatar
	}
    ListView {
        id: listView
        anchors.fill: parent
		topMargin: 24
        leftMargin: 24
        bottomMargin: 24
        rightMargin: 24
        spacing:20
        //model: ["Albert Einstein", "Ernest Hemingway", "Hans Gude"]
        model: contactModel
        delegate: ItemDelegate {
            text: model.name
            width: listView.width - listView.leftMargin - listView.rightMargin
            //height: avatar.implicitHeight
            height: 48
            //leftPadding: avatar.implicitWidth + 32

            onClicked: {
                pushChatPage(model.name)
            }
            onPressAndHold: {
                //console.log(model.display)
                //currentContact = model.display
                currentContact = model.name
                console.log(index)
				contactMenu.open()
            }
            /*
            Image {
                id: avatar
                width: 48
                height: width
                source: "../shared/" + modelData.replace(" ", "_") + ".png"
            }
            */
        }
    }
    function addFriend(name, id)
    {
    }
}
