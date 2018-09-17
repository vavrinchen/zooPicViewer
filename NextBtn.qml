import QtQuick 2.0
import "./"

Image {
    id: nextBtn
    anchors {
        right: parent.right
        verticalCenter: parent.verticalCenter
    }
    source: "./model/btn_next.svg"
    // button 不知道外部 viewModel object
    visible: viewModel.nextVisible()
    MouseArea{
        anchors.fill: parent
        onClicked: {
            viewModel.next()
        }
    }
}
