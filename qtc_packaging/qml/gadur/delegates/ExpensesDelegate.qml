import QtQuick 1.1
import com.nokia.meego 1.0
import "../js/UIConstants.js" as Ui

Item {
    id: root

    property alias text: textField.text
    property alias color: icon.color
    property alias description: descriptionField.text
    property alias date: dateField.text
    property alias amount: amountField.text
    property int catid

    signal clicked

    height: 100
    anchors.left: parent.left
    anchors.right: parent.right

    Rectangle {
        id: background
        anchors.fill: parent
        color: Ui.COLOR_SELECT
        opacity: 0.0
    }

    Row {
        id: row
        anchors.fill: parent
        spacing: 15

        Rectangle {
            id: spacing
            anchors.leftMargin: 10
            height: 30
            width: 1
            opacity: 0.7
            color: Ui.COLOR_SELECT
        }

        Rectangle {
            id: icon
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            height: 50
            width: 50
            opacity: 0.8
            radius: 5
            color: set_icon_color()
        }


        Column {
            id: column
            anchors.verticalCenter: parent.verticalCenter

            Text {
                id: textField
                color: Ui.COLOR_FOREGROUND
                font.pixelSize: Ui.FONT_DEFAULT

            }

            Text {
                id: descriptionField
                font.pixelSize: Ui.FONT_SMALL
                color: "#333"
            }

            Row {
                spacing: 10

                Text {
                    id: dateField
                    font.pixelSize: Ui.FONT_SMALL
                    color: "#444"
                }

                Text {
                    id: separator
                    font.pixelSize: Ui.FONT_SMALL
                    color: "#666"
                    text: "|"
                }

                Text {
                    id: amountField
                    font.pixelSize: Ui.FONT_SMALL
                    color: "#666"

                }
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.clicked();
            clickAnimation.start();
        }
    }


    SequentialAnimation {
        id: clickAnimation
        PropertyAnimation{target: background; properties:"opacity";to: 1.0; duration:75}
        PropertyAnimation{target: background; properties:"opacity";to: 0.0; duration:75}

    }

    function set_icon_color()
    {
        return Ui.ICON_COLOR[catid]
    }
}


