import QtQuick 2.0

Item {
    id: root
    signal indexChanged
    property int newIndex: 0
    property var model: Model{}
    property int imgCount: model.imgCount


    function next() {
        root.newIndex = (root.newIndex + 1) % imgCount
        console.log("next, index: ", root.newIndex)
    }

    function previous() {
        root.newIndex = root.newIndex - 1
        console.log("previous, index: ", root.newIndex)
    }

    function previousVisible()
    {
        console.log("root.newIndex, imgCount: ", root.newIndex, imgCount)
        return (root.newIndex !==0 && imgCount !== 1 ) ? true : false;
    }

    function nextVisible() {
        return (root.newIndex !== imgCount - 1 && imgCount !== 1) ? true : false;
    }


}
