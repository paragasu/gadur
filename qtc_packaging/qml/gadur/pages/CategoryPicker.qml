import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.1
import "../delegates"
import "../js/core.js" as Core
import "../js/UIConstants.js" as Ui


SelectionDialog {
    id: root
    titleText: "Select Category"
    model: categoryModel

    ListModel {
        id: categoryModel
    }

    onStatusChanged: {
        root.model = 0;
        Core.readCategory(categoryModel);
        root.model = categoryModel;
    }
}
