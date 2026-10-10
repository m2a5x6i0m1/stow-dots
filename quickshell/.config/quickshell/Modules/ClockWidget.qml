import QtQuick
import QtQuick.Layouts
import qs.Modules

Text {
  id: clockText
  text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
  color: Colors.cyan
  font.pixelSize: root.fontSize
  font.family: root.fontFamily
  font.bold: true
  Layout.rightMargin: 6

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: clockText.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
  }
}
