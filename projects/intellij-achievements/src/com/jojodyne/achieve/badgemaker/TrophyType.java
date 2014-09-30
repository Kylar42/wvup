package com.jojodyne.achieve.badgemaker;

import com.sun.istack.internal.Nullable;

/**
 * Created by Brendan A. McCarthy (brendan@apple.com)
 * Date: 7/19/12
 * Time: 11:12 PM
 */
public enum TrophyType {
        TROPHY                ("trophy",          "images/left_border.png");  // default
        //ICLOUD                ("icloud",          "images/left_border.png");  //TODO make a new image

        private final String _name;
        private final String _imageName;


        TrophyType(final String name, final String imageName) {
            this._name = name;
            this._imageName = imageName;
        }

        public String imageName() {
            return this._imageName;
        }


        @Nullable
        public static TrophyType trophyFromName(final String name) {
            final String lowerName = name.toLowerCase();
            for (final TrophyType one : TrophyType.values()) {
                if (one._name.equals(lowerName)) {
                    return one;
                }
            }
            return null;
        }

        public String toString() {
            return this.name();
        }

}
