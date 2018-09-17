import QtQuick 2.9
import QtQuick.Window 2.2
import "./"

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Zoo")
    property var mainRoot: root

    Rectangle {

        id: root
        anchors.fill: parent

        Component.onCompleted: {
            for(var i=0; i<model.imageList.length; i++){
                browserView.id_indexArea.addItem(i)
            }
            browserView.id_indexArea.next()
        }

        Model{
            id:model
        }

        BrowserView{
            id:browserView
            anchors.fill: parent
        }

    }


}
