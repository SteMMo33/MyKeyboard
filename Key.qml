import QtQuick 2.0

Item {
    id: element1
    width: 80
    height: 80

    property alias text: element.text

    signal clicked()

    Rectangle {
        id: rectBtn
        radius: 3
        border.width: 2
        border.color: "#fc7f15"
        anchors.fill: parent
        Text {
            id: element
            text: qsTr("Text")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 20
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: element1.clicked()
            onPressed: rectBtn.color = "red"
            onReleased: parent.color = "white"
        }
    }

}

/*##^##
Designer {
    D{i:0;height:60;width:60}D{i:3;anchors_height:100;anchors_width:100;anchors_x:10;anchors_y:8}
}
##^##*/
