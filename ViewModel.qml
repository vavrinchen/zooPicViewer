import QtQuick 2.0

Item {
    id: root
    signal indexChanged
    property int newIndex: 0
    property var model: Model{}
    property int imgCount: model.imgCount


    function next() {
        root.newIndex = (root.newIndex + 1) % imgCount;
        console.log("next, index: ", root.newIndex)
    }

    function previous() {
        if(root.newIndex == 0)
        {
            root.newIndex = imgCount - 1;
        }
        else
        {
//            root.newIndex++;
            root.newIndex = root.newIndex - 1;
        }
        console.log("previous, index: ", root.newIndex)
    }

    function previousVisible()
    {
        console.log("root.newIndex, imgCount: ", root.newIndex, imgCount)
        return  imgCount !== 1;
    }

    function nextVisible() {
        return imgCount !== 1;
    }

    function getIndicatorText() {
        return (root.newIndex+1) + "/" + imgCount;
    }

}
