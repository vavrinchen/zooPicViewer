import QtQuick 2.0

Item {
    id: root
    signal indexChanged
    property int newIndex: -1
    property int imgCount: 0



    function addItem() {
        imgCount++;
    }

    function next() {
        root.newIndex = (root.newIndex + 1) % imgCount
        console.log("next, index: ", root.newIndex)
        root.indexChanged()
    }

    function previous() {
        root.newIndex = root.newIndex - 1
        console.log("previous, index: ", root.newIndex)
        root.indexChanged()
    }

    function previousVisible()
    {
        console.log("root.newIndex: ", root.newIndex, " ,imgCount: ", imgCount);
        return (root.newIndex !==0 && imgCount !== 1 && imgCount !== 0) ? true : false;
    }

    function nextVisible() {
        console.log("root.newIndex: ", root.newIndex, " ,imgCount: ", imgCount);
        return (root.newIndex !== imgCount - 1 && imgCount !== 1) ? true : false;

    }

    function changeBackgroundPic() {
        backgroundImg.source = "model/" + model.imageList[root.newIndex]
    }

}
