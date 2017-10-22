import QtQuick 2.9
import QtQuick.Layouts 1.3
//import QtQuick.Controls 1.4
import QtQuick.Controls 2.2
//import QtQuick.Controls.Material 2.2
//import QtQuick.Controls.Universal 2.2
import Qt.labs.settings 1.0
import Qt.labs.calendar 1.0
import "controls"

ApplicationWindow {
    id: window
    width:  800
    height: 600
    visible: true
    title: "My Note pad"
    Component.onCompleted: {

    }

    Settings {
        id: settings
        property string style: "Default"
    }

    RowLayout{
        anchors.fill: parent
        spacing: 0
        Rectangle{
            id: leftArea
            color: "#343740"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumWidth: 50
            Layout.preferredWidth: 100
            Layout.maximumWidth: 300
            ColumnLayout{
                anchors.fill: parent
                spacing: 0
                RowLayout{
                    Layout.fillWidth: true
                    Layout.minimumHeight: 30
                    Layout.preferredHeight: 30
                    Layout.maximumHeight: 60
                    Text {
                        id: todayLab
                        text: "31"
                        color: "#FFFFFF"
                        font.pointSize: 24
                    }
                    Text {
                        id: tadayDetailLab
                        Layout.fillWidth: true
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter
                        color: "#FFFFFF"
                        font.pointSize: 10
                        text: "5月31日 周二<br>农历四月初五"
                    }
                    ToolButton{
                        id:addNodeBtn
                        Layout.minimumWidth: 60
                        Layout.maximumWidth: 60
                        contentItem: Rectangle{
                            color: "#CCCCCC"
                            radius: 3
                            Text {
                                anchors.centerIn: parent
                                font.pointSize: 20
                                horizontalAlignment: Text.horizontalCenter
                                color:"white"
                                text: "+"
                            }
                        }
                        onClicked: {
                            console.debug("add note")
                        }
                    }
                }
                RowLayout{
                    width: parent.width
                    Layout.fillWidth: true
                    Layout.minimumHeight: 30
                    Layout.preferredHeight: 30
                    Layout.maximumHeight: 30
                    Rectangle{
                        color:"#2D2f37"
                        anchors.fill: parent
                        Text {
                            anchors.fill: parent
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignLeft
                            color: "#FFFFFF"
                            font.pointSize: 13
                            font.bold: true
                            text: "Calendar"
                        }
                    }
                }
                RowLayout{
                    width: parent.width
                    height: 30
                    Layout.fillHeight: false
                    clip: false
                    transformOrigin: Item.Center
                    spacing: 0
                    Layout.fillWidth: true
                    Layout.minimumHeight: 40
                    Layout.preferredHeight: 40
                    Layout.maximumHeight: 40
                    ToolButton{
                        id:preMonthButton
                        contentItem: Image{
                            source: "qrc:/images/media/images/+material/back.png"
                        }
                        onClicked: {
                            console.debug("pre month");
                            changeMonth(-1);
                        }
                    }
                    Text {
                        id:ymdLab
                        Layout.fillWidth: true
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "#FFFFFF"
                        font.pointSize: 12
                        text: (grid.month +1) + "/" + grid.year
                    }

                    ToolButton{
                        id:nextMonthButton
                        contentItem: Image{
                            source: "qrc:/images/media/images/+material/next.png"
                        }
                        onClicked: {
                            console.debug("next month");
                            changeMonth(1);
                        }
                    }
                }
                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.minimumHeight: 50
                    Layout.preferredHeight: 100
                    Layout.maximumHeight: 200

                    DayOfWeekRow {
                        locale: grid.locale
                        font.pointSize: 10
                        font.bold: true
                        Layout.fillWidth: true
                    }

                    MonthGrid {
                        id: grid
                        visible: true
                        month: Calendar.October
                        year: 2017
                        locale: Qt.locale("en_US")
                        font.pointSize: 10

                        Layout.fillWidth: true
                        Layout.fillHeight: true
                    }
                }
                RowLayout{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
//                    Rectangle{
//                        color:"green"
//                        anchors.fill: parent
//                    }
                }
                RowLayout{
                    Layout.fillWidth: true
                    Layout.minimumHeight: 30
                    Layout.preferredHeight: 30
                    Layout.maximumHeight: 40
                    Rectangle{
                        color:"#2D2F37"
                        anchors.fill: parent
                        Text {
                            anchors.fill: parent
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignLeft
                            color: "#FFFFFF"
                            font.pointSize: 10
                            text: "Alignment Note Pad"
                        }
                    }
                }
            }
        }
        Rectangle{
            id:rightArea
            clip: true
            color:"#CCCCCC"
            Layout.fillWidth: true
            Layout.fillHeight: true
            PanePage1{}
        }
    }
    //js
    function changeMonth(def)
    {
        var currendMonth = grid.month + def;
        if(currendMonth > 11)
        {
            grid.year += 1;
            grid.month = Calendar.January;
        }
        else if(currendMonth < 0)
        {
            grid.year -= 1;
            grid.month = Calendar.November;
        }
        else
        {
            grid.month = currendMonth;
        }
    }

}
