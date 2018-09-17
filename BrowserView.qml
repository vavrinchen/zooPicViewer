import QtQuick 2.0
import "./"

Item {
    id: root


    Image {
        id: backgroundImg
        anchors.fill: parent
        cache: false
    }

    PreviousBtn {
        id: previousBtn
    }

    NextBtn {
        id: nextBtn
    }


    ViewModel {
        id: viewModel

        height: mainRoot.height / 10
        Model{
            id: model
        }
        onIndexChanged: {
            viewModel.changeBackgroundPic();
            console.log("viewModel.newIndex: ", viewModel.newIndex)
        }
    }
}

