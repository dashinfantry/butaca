import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {

    property bool noContent: true //gridModel ? gridModel.count > 0 : true
//    property bool showFavs: true
//    property ListModel gridModel: null

    Image {
        id: backGroundImg
        visible: noContent
        anchors.verticalCenterOffset: - 2 * Theme.paddingLarge
        anchors.centerIn: parent
        source: "qrc:/resources/icon-bg-cinema.png"
        opacity: 0.4
        width: parent.width - 2 * Theme.paddingLarge
        fillMode: Image.PreserveAspectFit
    }

    Label {
        id: backGroundLabel
        visible: noContent
        anchors.top: backGroundImg.bottom
        anchors.topMargin: Theme.paddingMedium
        anchors.horizontalCenter: parent.horizontalCenter
        text: 'Butaca'
    }

//    Grid {
//        id: gridView
//        width: parent.width
//        columns: 2
//        visible: showFavs
//        Repeater {
//            id: rep
//            model: Math.min(4, gridModel)
//            delegate: Image {
//                width: parent.width / 2
//                height: 1.5 * width
//                source: icon ? icon :
//                               (type == Util.MOVIE ?
//                                    'qrc:/resources/movie-placeholder.svg' :
//                                    'qrc:/resources/person-placeholder.svg')
//            }
//        }
//    }
}
