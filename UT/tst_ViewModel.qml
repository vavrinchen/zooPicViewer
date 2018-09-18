import QtQuick 2.7
import QtTest 1.0
import QtQuick.Window 2.2
import "../"

Item {

    width: 800
    height: 500

    property var testItem: viewModelLoader.active ? viewModelLoader.item : null

    Loader {
        id: viewModelLoader
        active: false
        sourceComponent: ViewModel{}
    }

    TestCase {
        name: "ViewModel"
        when: windowShown

        function init()
        {
            viewModelLoader.active = true;
            waitForRendering(viewModelLoader.item);
        }

        function cleanup()
        {
            viewModelLoader.active = false;
        }


        function test_previousBtn_disappear_when_no_img()
        {
            testItem.imgCount = 0;
            compare(testItem.previousVisible(), false);
        }

        function test_previousBtn_and_nextBtn_disappear_when_1_img()
        {
            testItem.imgCount = 1;
            compare(testItem.previousVisible(), false);
            compare(testItem.nextVisible(), false);
        }

        function test_previousBtn_show_when_not_first_img()
        {
            testItem.next();
            compare(testItem.previousVisible(), true);
        }

        function test_nextBtn_disappear_when_last_img()
        {
            testItem.imgCount = 2;
            testItem.next();
            compare(testItem.nextVisible(), false);
        }

        function test_second_img_indexIndicatorText_show_2_over_5()
        {
            testItem.imgCount = 5;
            testItem.next();
            compare(testItem.getIndicatorText(), "2/5");
        }


    }
}
