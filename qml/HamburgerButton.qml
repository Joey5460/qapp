import QtQuick 2.5
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
Button{
  id: root
  implicitWidth: 24
  implicitHeight: 24
  //palette{ button: "green" }
  ColumnLayout{
  spacing: 2
  anchors.fill: parent
  anchors.topMargin: 12
  anchors.bottomMargin: 12
  Rectangle {
  id: bar1
  Layout.alignment: Qt.AlignCenter
  Layout.minimumWidth: 20
  Layout.minimumHeight: 2
  color: "green"
  antialiasing: true
  }
  Rectangle {
  id: bar2
  implicitWidth: 20
  implicitHeight:2
  Layout.alignment: Qt.AlignCenter
  color: "green"
  antialiasing: true
  }
  Rectangle {
  id: bar3
  //implicitWidth: 20
  //implicitHeight: 2
  Layout.minimumWidth: 20
  Layout.minimumHeight: 2
  Layout.alignment: Qt.AlignCenter
  color: "green"
  antialiasing: true
  }
  }
}
