import QtQuick 1.1
import com.nokia.meego 1.0
import "../js/core.js" as Core
import "../delegates"
import "../js/UIConstants.js" as UI

Page {
    id: root

    TitleHeader {
        id: header
        text: "Gadur"
    }

    ListModel {
        id: expensesModel
    }

    ListView {
        id: view
        anchors {
            left: root.left; right: root.right
            top: header.bottom; bottom: parent.bottom
        }

        clip: true
        model: expensesModel
        delegate: ExpensesDelegate {
            id: expDelegate
            text: model.name
            description: model.info
            date: model.date
            amount: model.amount
            catid: model.cat_id
            onClicked: {
                addexpenses.open();
                addexpenses.setCategoryId(model.cat_id);
                addexpenses.name = model.name;
                addexpenses.pid = model.id;
                addexpenses.amount = model.amount;
                addexpenses.date = model.date;
                addexpenses.info = model.info;
            }
        }
    }

    AddExpenses {
        id: addexpenses
        onRowInserted: {
            console.log(item.name)
            expensesModel.insert(0, item)
        }
    }

    tools: ToolBarLayout {
        ToolIcon { iconId : "toolbar-add"; onClicked: addexpenses.open(); }
        ToolIcon { iconId : "toolbar-list"; }
        ToolIcon { iconId : "toolbar-alarm"; }
        ToolIcon { iconId:  "toolbar-settings"; onClicked: menu.open(); }
    }

    Menu {
        id: menu

        MenuLayout {
            MenuItem { text: "Quit"; onClicked: Qt.quit();}
        }
    }

    onStatusChanged: {
        if(status == PageStatus.Activating) {
            view.model = 0
            Core.readExpenses(expensesModel)
            view.model = expensesModel
        }

        updateUi()
    }

    function updateUi() {

        view.model = 0
        Core.readExpenses(expensesModel)
        view.model = expensesModel
    }
}
