import QtQuick 1.1
import com.nokia.meego 1.0
import "pages"
import "js/core.js" as Core
import "js/UIConstants.js" as Ui

PageStackWindow {
    id: window

    property variant listPage: ListPage {}
    //property variant infoPage: InfoPage {}

    color: Ui.COLOR_BACKGROUND

    ToolBarLayout
    {
        id: commonTools
    }

    Component.onCompleted: {
        Core.openDB()
        pageStack.push(listPage)
    }
}
