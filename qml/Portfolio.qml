import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQml.Models 2.15
import QtQuick.Layouts 1.1
import "./stockpage"

Page {
  id: portfolio
  width: parent.width
  height: 700
  //anchors.fill: parent
  property alias currentIndex: root.currentIndex
 
  header: ToolBar {
      ToolButton {
          text: qsTr("<Back")
          font.pointSize: 20
          anchors.left: parent.left
          //anchors.leftMargin: 10
          anchors.verticalCenter: parent.verticalCenter
          onClicked: portfolio.StackView.view.pop()
      }
 
      Label {
          id: pageTitle
          text: qsTr("Portflio")
          font.pixelSize: 20
          anchors.centerIn: parent
      }
  }
  ColumnLayout {
  anchors.fill: parent
 
  ListView {
      id: root
      Layout.fillHeight: true
      Layout.fillWidth: true
      snapMode: ListView.SnapOneItem
      highlightRangeMode: ListView.StrictlyEnforceRange
      highlightMoveDuration: 250
      focus: false
      orientation: ListView.Horizontal
      boundsBehavior: Flickable.StopAtBounds
 
      model: ObjectModel {
          StockListView {
              id: listView
              width: root.width
              height: root.height
          }
      }
  }
  }
  function onUpdateStockModel(model){
      listView.updateModel(model);
  }
}
