import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml.Models 2.2
import "./stockpage"
Page {
  id: portfolios
  property string currentContact : ""
 
  signal pushPage(int idx)
  signal menuItemClicked(int id)
  signal updateStockModel(var model)
 
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
  StockListModel{
      id: portfolioListModel
  }
  ListView {
      id: listView
      anchors.fill: parent
      topMargin: 24
      leftMargin: 24
      bottomMargin: 24
      rightMargin: 24
      spacing:20
      model: ListModel{
          ListElement{
              name:"Internet"
              changePercentage:-1
          }
          ListElement{
              name:"Ernest Hemingway"
              changePercentage:-1
          }
      }
 
  delegate: ItemDelegate {
  text: model.name
  font.pointSize: 20
  font.weight: Font.Bold
  width: listView.width - listView.leftMargin - listView.rightMargin
  //height: avatar.implicitHeight
  height: 48
  //leftPadding: avatar.implicitWidth + 32
  onClicked: {
  pushPage(index);
  updateStockModel(portfolioListModel);
  }
  onPressAndHold: {
  }
  Text{
      text: model.changePercentage.toFixed(2)
      anchors.right: parent.right
      anchors.verticalCenter: parent.verticalCenter
      horizontalAlignment: Text.AlignVCenter
  }
  }
  Component.onCompleted: {
      portfolioListModel.name = "Internet"
      portfolioListModel.updateEvaluation.connect(onEvaluationUpdated)
  }
  function onEvaluationUpdated(name, eval)
  {
  for(let i=0; i< model.count;++i){
  if (model.get(i).name === name)
  model.setProperty(i, "changePercentage", eval);
  }
  }
  }
}
