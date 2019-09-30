import QtQuick 2.5


Item {
    id: container
    property alias detailTitle: detailTitle
    property alias detailFotoProd: detailFotoProd

    Rectangle {
        id: background
        color: "#80000000"
        anchors.fill: parent

        Rectangle {
            id: rectangle
            color: "#ffffff"
            anchors.rightMargin: 100
            anchors.leftMargin: 100
            anchors.bottomMargin: 100
            anchors.topMargin: 100
            anchors.fill: parent

            Text {
                id: text1
                x: 40
                y: 49
                text: qsTr("Text")
                font.pixelSize: 12
            }

            Text {
                id: detailTitle
                x: 40
                y: 85
                text: qsTr("Text")
                font.pixelSize: 20
            }

            Image {
                id: detailFotoProd
                x: 246
                width: 186
                height: 180
                anchors.right: parent.right
                anchors.rightMargin: 15
                anchors.top: parent.top
                anchors.topMargin: 15
                fillMode: Image.PreserveAspectFit
                source: "images/gel_madagascar.png"
            }

            Rectangle {
                id: btnRitorna
                x: 60
                y: 201
                width: 146
                height: 54
                color: "#fdafaf"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 25

                Text {
                    id: txtRitorna
                    text: qsTr("Ritorna")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                    font.pixelSize: 12
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    onClicked: container.visible = false
                }
            }

            Rectangle {
                id: btnAcquista
                x: 228
                y: 201
                width: 146
                height: 54
                color: "#a6f9a2"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 25

                Text {
                    id: txtAcquista
                    text: qsTr("Acquista")
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 12
                }

                MouseArea {
                    id: mouseArea1
                    anchors.fill: parent
                    onClicked: container.visible = false
                }
            }
        }
    }

}
