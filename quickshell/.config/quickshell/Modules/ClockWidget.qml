import QtQuick
import QtQuick.Layouts
import qs.Modules

Text {
  id: clockText
  required property string fontFamily
  required property int fontSize
  text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
  color: Colors.cyan
  font.pixelSize: fontSize
  font.family: fontFamily
  font.bold: true
  Layout.rightMargin: 6

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: clockText.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
  }
}
