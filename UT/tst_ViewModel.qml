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


        function test_second_img_indexIndicatorText_show_2_over_5()
        {
            testItem.imgCount = 5;
            testItem.next();
            compare(testItem.getIndicatorText(), "2/5");
        }

        function test_first_img_click_previousBtn_change_to_last_img()
        {
            testItem.imgCount = 5;
            compare(testItem.previousVisible(), true);
            testItem.previous();
            compare(testItem.getIndicatorText(), "5/5");
        }

        function test_last_img_click_nextBtn_change_to_first_img()
        {
            testItem.imgCount = 2;
            testItem.next();
            compare(testItem.nextVisible(), true);
            testItem.next();
            compare(testItem.getIndicatorText(), "1/2");
        }


    }
}
