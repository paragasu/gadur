import QtQuick 1.1
import com.nokia.meego 1.0
import "../js/UIConstants.js" as Ui

Rectangle {
    id: root

    property alias text: item.text

    height: 70
    border.width: 1
    color: "#00578F"
    opacity: 0.9

    anchors { left: parent.left; right: parent.right; top: parent.top;}


        Rectangle {
            id: spacing
            width:20
        }

        Label {
            id: item
            anchors.left: spacing.left;
            color: "#ffffff"
            anchors.margins: 10
            font.pixelSize: Ui.FONT_XLARGE
            anchors.verticalCenter: parent.verticalCenter
        }

}
