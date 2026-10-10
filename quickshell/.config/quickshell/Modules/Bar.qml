import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Modules

Scope {
  id: root

  // Font
  readonly property string fontFamily: "JetBrainsMono Nerd Font"
  readonly property int fontSize: 14

  Variants {
    model: Quickshell.screens
    delegate: PanelWindow {

      required property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      margins {
        top: 2
        bottom: 0
        left: 2
        right: 2
      }

      implicitHeight: 23
      color: "transparent"

      Rectangle {
        anchors.fill: parent
        color: Colors.bg
        radius: 4

        RowLayout {
          anchors.fill: parent
          spacing: 0

          Item {
            Layout.rightMargin: 5
          }

          WorkspacesWidget {
            fontFamily: root.fontFamily
            fontSize: root.fontSize
          }

          Item {
            Layout.fillWidth: true
          }

          ClockWidget {
            fontFamily: root.fontFamily
            fontSize: root.fontSize
          }

          Item {
            Layout.rightMargin: 5
          }
        }
      }
    }
  }
}
