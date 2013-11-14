import QtQuick 1.1
import com.nokia.meego 1.0
import "../js/core.js" as Core
import "../delegates"
import "../js/UIConstants.js" as UI

Page {
    id: root

    property int transid: 0
    property string title

    TitleHeader {
        id: header
        text: root.title
    }

    tools: ToolBarLayout {
        ToolIcon { iconId : "icon-m-toolbar-back"; }
        ToolIcon { iconId:  "icon-m-toolbar-edit";}
    }
}
