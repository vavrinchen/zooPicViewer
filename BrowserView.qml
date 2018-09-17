import QtQuick 2.0
import "./"

Item {
    id: root

    property var id_background: id_background
    property var id_previous: id_previous
    property var id_next: id_next
    property var id_indexArea: id_indexArea

    Image {
        id: id_background
        anchors.fill: parent
        cache: false
    }

    Image {
        id: id_previous
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }
        source: "./model/btn_prev.svg"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                id_indexArea.previous()
            }
        }
    }

    Image {
        id: id_next
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        source: "./model/btn_next.svg"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                id_indexArea.next()
            }
        }
    }

    IndicatorView {
        id: id_indicator
        anchors {
            horizontalCenter: parent.horizontalCenter

        }
    }

    ViewModel {
        id: id_indexArea

        height: mainRoot.height / 10
        Model{
            id: model
        }
        onIndexChanged: {
            id_background.source = "model/" + model.imageList[id_indexArea.newIndex]
            console.log("id_indexArea.newIndex: ", id_indexArea.newIndex)
        }
    }
}

