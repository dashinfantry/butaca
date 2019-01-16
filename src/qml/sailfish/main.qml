/**************************************************************************
 *   Butaca
 *   Copyright (C) 2011 - 2012 Simon Pena <spena@igalia.com>
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

import QtQuick 2.0
import Sailfish.Silica 1.0

ApplicationWindow {
    id: appWindow
    property bool largeScreen: Screen.width > 1080
    property bool mediumScreen: (Screen.width > 720 && Screen.width <= 1080)
    property bool smallScreen: (Screen.width  >= 720 && Screen.width < 1080)
    property bool smallestScreen: Screen.width  < 720
    property int sizeRatio: smallestScreen ? 1 : smallScreen ? 1.5 : 2

    allowedOrientations: Orientation.Portrait | Orientation.Landscape
                         | Orientation.LandscapeInverted

    _defaultPageOrientations: Orientation.Portrait | Orientation.Landscape
    | Orientation.LandscapeInverted

    initialPage: mainPage

    cover: appCover

    CoverPage { id: appCover }

    WelcomeView { id: mainPage }
}
