import QtQuick 2.0
import "./"

Item {
    id: root


    Image {
        id: backgroundImg
        anchors.fill: parent
        cache: false
    }

    // PreviousBtn, NextBtn 為同一個 component 就好, 把可變得提出來
    PreviousBtn {
        id: previousBtn
    }

    NextBtn {
        id: nextBtn
    }


    ViewModel {
        id: viewModel

        // 不要直接 access parent id
        height: mainRoot.height / 10

        // 外面的人不需要知道 model 是什麼
        Model{
            id: model
        }

        // 裡面決定現在的 image 要如何
        onIndexChanged: {
            viewModel.changeBackgroundPic();
            console.log("viewModel.newIndex: ", viewModel.newIndex)
        }
    }
}

