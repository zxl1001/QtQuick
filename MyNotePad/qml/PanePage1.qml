import QtQuick 2.0
import QtQuick.Controls 1.4

TableView {
    id : tableView
    anchors.fill: parent
    headerVisible: true

    selectionMode: SelectionMode.SingleSelection
    headerDelegate: headerDelegate
    rowDelegate: rowDelegate
    itemDelegate: itemDelegate

    TableViewColumn{
        role: "date"
        title: "Date"
        width: 100
    }
    TableViewColumn {
        role: "title"
        title: "Title"
        width: 100
    }
    TableViewColumn {
        role: "author"
        title: "Detail"
        width: 300
    }
    model: libraryModel



    ListModel {
        id: libraryModel
        ListElement {
            date:  "2017-08-03"
            title: "A Masterpiece"
            author: "StackView provides a stack-based navigation model which can be used with a set of interlinked pages. \
Items are pushed onto the stack as the user navigates deeper into the material, and popped off again  \
when he chooses to go back."
        }
        ListElement {
            date:  "2017-08-04"
            title: "Brilliance"
            author: "StackView provides a stack-based navigation model which can be used with a set of interlinked pages. \
Items are pushed onto the stack as the user navigates deeper into the material, and popped off again  \
when he chooses to go back."
        }
        ListElement {
            date:  "2017-08-05"
            title: "Outstanding"
            author: "StackView provides a stack-based navigation model which can be used with a set of interlinked pages. \
Items are pushed onto the stack as the user navigates deeper into the material, and popped off again  \
when he chooses to go back."
        }
        ListElement {
            date:  "2017-08-03"
            title: "A Masterpiece"
            author: "StackView provides a stack-based navigation model which can be used with a set of interlinked pages. \
Items are pushed onto the stack as the user navigates deeper into the material, and popped off again  \
when he chooses to go back."
        }
        ListElement {
            date:  "2017-08-04"
            title: "Brilliance"
            author: "StackView provides a stack-based navigation model which can be used with a set of interlinked pages. \
Items are pushed onto the stack as the user navigates deeper into the material, and popped off again  \
when he chooses to go back."
        }
        ListElement {
            date:  "2017-08-05"
            title: "Outstanding"
            author: "StackView provides a stack-based navigation model which can be used with a set of interlinked pages. \
Items are pushed onto the stack as the user navigates deeper into the material, and popped off again  \
when he chooses to go back."
        }
        ListElement {
            date:  "2017-08-03"
            title: "A Masterpiece"
            author: "StackView provides a stack-based navigation model which can be used with a set of interlinked pages. \
Items are pushed onto the stack as the user navigates deeper into the material, and popped off again  \
when he chooses to go back."
        }
        ListElement {
            date:  "2017-08-04"
            title: "Brilliance"
            author: "StackView provides a stack-based navigation model which can be used with a set of interlinked pages. \
Items are pushed onto the stack as the user navigates deeper into the material, and popped off again  \
when he chooses to go back."
        }
        ListElement {
            date:  "2017-08-05"
            title: "Outstanding"
            author: "StackView provides a stack-based navigation model which can be used with a set of interlinked pages. \
Items are pushed onto the stack as the user navigates deeper into the material, and popped off again  \
when he chooses to go back."
        }
        ListElement {
            date:  "2017-08-03"
            title: "A Masterpiece"
            author: "StackView provides a stack-based navigation model which can be used with a set of interlinked pages. \
Items are pushed onto the stack as the user navigates deeper into the material, and popped off again  \
when he chooses to go back."
        }
        ListElement {
            date:  "2017-08-04"
            title: "Brilliance"
            author: "StackView provides a stack-based navigation model which can be used with a set of interlinked pages. \
Items are pushed onto the stack as the user navigates deeper into the material, and popped off again  \
when he chooses to go back."
        }
        ListElement {
            date:  "2017-08-05"
            title: "Outstanding"
            author: "StackView provides a stack-based navigation model which can be used with a set of interlinked pages. \
Items are pushed onto the stack as the user navigates deeper into the material, and popped off again  \
when he chooses to go back."
        }
        ListElement {
            date:  "2017-08-03"
            title: "A Masterpiece"
            author: "StackView provides a stack-based navigation model which can be used with a set of interlinked pages. \
  Items are pushed onto the stack as the user navigates deeper into the material, and popped off again  \
when he chooses to go back."
        }
        ListElement {
            date:  "2017-08-04"
            title: "Brilliance"
            author: "StackView provides a stack-based navigation model which can be used with a set of interlinked pages. \
Items are pushed onto the stack as the user navigates deeper into the material, and popped off again  \
when he chooses to go back."
        }
        ListElement {
            date:  "2017-08-05"
            title: "Outstanding"
            author: "StackView provides a stack-based navigation model which can be used with a set of interlinked pages. \
Items are pushed onto the stack as the user navigates deeper into the material, and popped off again  \
when he chooses to go back."
        }
    }

    //header delegate
    Component {
        id: headerDelegate
        Rectangle {
            width: 300
            height: 30
            color:  "#2d2d2d"
            border.width: 1
            border.color: "#838383"
            Text {
                id: headerTextInput
                anchors.centerIn: parent
                text: styleData.value
                color: "#e5e5e5"

            }
        }
    }

    //TableView row代理
    Component {
        id: rowDelegate
        Rectangle {
            anchors.leftMargin: 3
            color: styleData.selected?"#CCEEFF":(styleData.alternate?"#EEEEEE":"white")
//            border.color: "black"
//            border.width: 1
            width: tableView.width
            height: 70
        }
    }

    //item delegate
    Component{
        id: itemDelegate
        Item {
              anchors.fill: parent
              Text {
                  anchors.fill: parent
                  wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                  color: styleData.textColor
                  elide: styleData.elideMode
                  text: styleData.value

              }
          }

    }

}
