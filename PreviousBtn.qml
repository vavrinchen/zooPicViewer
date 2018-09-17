import QtQuick 2.0
import "./"

Image {
    id: previousBtn
    anchors {
        left: parent.left
        verticalCenter: parent.verticalCenter
    }
    source: "./model/btn_prev.svg"
    // ViewModel object 不能直接用
    visible: viewModel.previousVisible()
    MouseArea{
        anchors.fill: parent
        onClicked: {
            viewModel.previous()
        }
    }
}
