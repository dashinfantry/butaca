/**************************************************************************
 *    Butaca
 *    Copyright (C) 2011 Simon Pena <spena@igalia.com>
 *
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 **************************************************************************/

import QtQuick 1.1
import com.meego 1.0
import "butacautils.js" as BUTACA

Component {
    id: singleMovieView

    Page {
        property string movieId

        function currentItem() {
            return list.model.get(list.currentIndex)
        }

        tools: ToolBarLayout {

            ToolIcon {
                iconId: "toolbar-back"; onClicked: pageStack.pop();
            }

            ToolIcon {
                id: favoriteIcon
                anchors.horizontalCenter: parent.horizontalCenter
                iconId: "toolbar-favorite-unmark"
                enabled: false
                onClicked: {
                    iconId = iconId == "toolbar-favorite-mark" ? "toolbar-favorite-unmark" : "toolbar-favorite-mark"

                    var content = BUTACA.favoriteFromMovie(currentItem())
                    var idx = welcomeView.indexOf(content)

                    if (idx >= 0) {
                        welcomeView.removeFavoriteAt(idx)
                    } else {
                        welcomeView.addFavorite(content)
                    }
                }
            }
        }
        width: parent.width; height: parent.height

        Item {
            id: content
            anchors.fill: parent

            SingleMovieModel {
                id: moviesModel
                params: movieId
                onStatusChanged: {
                    if (status == XmlListModel.Ready) {
                        content.state = 'Ready'
                    }
                }
            }

            ListView {
                id: list
                anchors.fill: parent
                model:  moviesModel
                interactive: false
                delegate: SingleMovieDelegate {}
            }

            BusyIndicator {
                id: busyIndicator
                visible: true
                running: true
                platformStyle: BusyIndicatorStyle { size: 'large' }
                anchors.centerIn: parent
            }

            states: [
                State {
                    name: 'Ready'
                    PropertyChanges  { target: busyIndicator; running: false; visible: false }
                    PropertyChanges  { target: list; visible: true }
                    PropertyChanges { target: favoriteIcon;
                        iconId: welcomeView.indexOf(BUTACA.favoriteFromMovie(currentItem())) >= 0 ?
                                                  "toolbar-favorite-mark" : "toolbar-favorite-unmark";
                        enabled: true
                    }
                }
            ]
        }
    }
}
