
import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.1
import "../delegates"
import "../js/core.js" as Core
import "../js/UIConstants.js" as Ui


Sheet {
    id: root

    signal rowInserted (variant item);

    property alias name: nameField.text
    property alias info: infoField.text
    property alias amount: amountField.text
    property int   catid;


    acceptButtonText: "Save"
    rejectButtonText: "Cancel"

    onAccepted: saveExpenses();

    function saveExpenses()
    {
        var item = {}
        item.catid = catid;
        item.cat_id = catid;
        item.name = nameField.text;
        item.info = infoField.text;
        item.amount = amountField.text;
        item.date = dateField.text;

        root.rowInserted(item);
        Core.createExpenses(item)

        name = ""
        info = ""
        amount = ""
    }

    function setCategoryText()
    {
        var model = tcategory.model;
        var selectedData = model.get(tcategory.selectedIndex);
        catid = selectedData.id;

        categoryField.text = selectedData.name;
    }

    function setDateText()
    {
        var d = new Date();
        d.setDate(tdate.day);
        d.setMonth(tdate.month);
        d.setFullYear(tdate.year);
        dateField.text = d.toISOString().split('T')[0];
    }

    function showDateDialog()
    {
        var d = new Date();
        tdate.year = d.getFullYear();
        tdate.month = d.getMonth();
        tdate.day = d.getDate();
        tdate.open();
    }

    content: Item {
            anchors.fill: parent

            Rectangle {
                id: spacing
                height: 10
            }

            TextField {
                id: nameField
                placeholderText: "Name"
                font.pixelSize: Ui.FONT_DEFAULT
                anchors.top: spacing.bottom
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.margins: 10   
            }

            TextField {
                id: infoField
                placeholderText: "Description"
                font.pixelSize: Ui.FONT_DEFAULT_SIZE
                anchors.top: nameField.bottom
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.margins: 10
            }

            TextField {
                id: amountField
                placeholderText: "Amount"

                font.pixelSize: Ui.FONT_DEFAULT
                anchors.top: infoField.bottom
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.margins:10
                validator: DoubleValidator {
                    bottom: 0
                    top: 50000
                }
            }

            TextField {
                id: categoryField
                placeholderText: "Category"
                anchors.top: amountField.bottom
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.margins: 10
                onActiveFocusChanged: tcategory.open();
                enableSoftwareInputPanel: false
            }

            TextField {
                id: dateField
                placeholderText: "Date"
                anchors.top: categoryField.bottom
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.margins: 10
                enableSoftwareInputPanel: false
                onActiveFocusChanged:  showDateDialog()
                text: { new Date().toISOString().split('T')[0];}
            }


            DatePickerDialog
            {
                id: tdate
                titleText: "Date"
                acceptButtonText: "Done"
                rejectButtonText: "Cancel"
                onAccepted: setDateText();
            }

            CategoryPicker
            {
                id: tcategory
                onAccepted: setCategoryText();
            }

        }

}

