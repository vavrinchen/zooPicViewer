import QtQuick 2.9
import QtQuick.Window 2.2
import "./"

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Zoo")
//    property var mainRoot: root
//    property var viewModel: ViewModel{}
    Rectangle {

        id: root
        anchors.fill: parent

        // 為什麼會有這段 ?
//        Component.onCompleted: {
//            for(var i=0; i<model.imageList.length; i++){
//                viewModel.addItem()
//            }
//            viewModel.next()
//        }

//        Model{
//            id:model
//        }

        BrowserView{ //BrowserView {
            id:browserView  //id: browserView
            anchors.fill: parent
        }

    }


}
