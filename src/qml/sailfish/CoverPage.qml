import QtQuick 2.0
import Sailfish.Silica 1.0
import "storage.js" as Storage

CoverBackground {

    property bool noContent: favoritesModel.count > 0 ? false : true
    property bool showFavs: true

    ListModel {
        id: favoritesModel
    }

    Component.onCompleted: {
        loadFavorites()
    }

    function loadFavorites() {
        favoritesModel.clear()
        var favorites = Storage.getFavorites()
        for (var i = 0; i < favorites.length; i++) {
            favoritesModel.append(favorites[i])
            if ( i === 3 ) break
        }
    }

    onStatusChanged: {
        switch (status) {
            case PageStatus.Activating:
            // reload favorites
            loadFavorites()
            break
        }
    }

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

    Grid {
        id: gridView
        width: parent.width
        columns: 2
        visible: showFavs
        Repeater {
            id: rep
            model: favoritesModel
            delegate: Image {
                width: parent.width / 2
                height: 1.5 * width
                source: icon ? icon : 'qrc:/resources/movie-placeholder.svg'
            }
        }
    }
    Label {
        visible: !noContent
        anchors.bottomMargin: 0
        anchors.bottom: parent.bottom
        font.pixelSize: Theme.fontSizeTiny
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Butaca"
    }
}
