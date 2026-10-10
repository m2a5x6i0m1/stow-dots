import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.Modules

Repeater {
  model: 10

  Rectangle {
    Layout.preferredWidth: 20
    Layout.preferredHeight: parent.height
    color: "transparent"

    property var workspace: Hyprland.workspaces.values.find(ws => ws.id === index + 1) ?? null
    property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
    property bool hasWindows: workspace !== null

    Text {
      text: index + 1
      color: parent.isActive ? Colors.cyan : (parent.hasWindows ? Colors.cyan : Colors.muted)
      font.pixelSize: root.fontSize
      font.family: root.fontFamily
      font.bold: true
      anchors.centerIn: parent
    }

    Rectangle {
      width: 20
      height: 2
      color: parent.isActive ? Colors.purple : Colors.bg
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.bottom: parent.bottom
    }

    MouseArea {
      anchors.fill: parent
      onClicked: Hyprland.usingLua ? Hyprland.dispatch("hl.dsp.focus({ workspace = " + (index + 1) + "})") : Hyprland.dispatch("workspace " + (index + 1))
    }
  }
}
