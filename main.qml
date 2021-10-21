import QtQuick 2.12
import QtQuick.Controls 2.12
import "./qml"
ApplicationWindow{
  id:app
  width: 540
  height: 960
  visible: true
 
  Stocqt{
      id: initPage
  }
  AddContact{
  id: addContact
  }
 
  header: ToolBar{
  id : tooBar
  HamburgerButton{
  id: menuBtn
  height: parent.height
  width: parent.height
  anchors.verticalCenter:parent.verticalCenter
  onClicked: {
  if(drawer){
  drawer.visible = !drawer.visible
  }
  }
  }
  Label{
  padding: 10
  text: qsTr("QApp")
  font.pixelSize: 20
  anchors.centerIn: parent
  }
  }
 
  Drawer {
  id: drawer
  y: tooBar.height
  width: initPage.width / 2
  //height: initPage.height - tooBar.height
  height: initPage.height
 
  ListModel{
  id: menuItems
  ListElement {
  name: "Calc"
  cont: 0
  }
  ListElement {
  name: "Extra"
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
  //source: "qrc:/qapp/images/qt-logo.png"
  source: "./qml/images/qt-logo.png"
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
 
  StackView{
  id: stackView
  anchors.fill:parent
  initialItem: initPage
  }
 
  onClosing:{
  }
 
  Component.onCompleted: {
  //contactPage.pushChatPage.connect(onPushChatPage);
  //contactPage.menuItemClicked.connect(onMenuItemClicked);
  //chat.friendMessageReceived.connect(conversationPage.onMsgReceived)
  addContact.friendAdded.connect(onFriendAdded);
  //chat.start();
  //MyApi.doSomething()
  }
  Component.onDestruction:
  {
  console.log("destruction");
  }
  function onPushChatPage(name) {
  //stackView.push("./ConversationPage.qml", {inConversationWith: name});
  stackView.push(conversationPage, {inConversationWith: name});
  }
  function onMenuItemClicked(id)
  {
  if (0 === id){
  console.log(id);
  stackView.push(addContact);
  }
  }
  function onFriendAdded(name, toxid)
  {
  }
}
