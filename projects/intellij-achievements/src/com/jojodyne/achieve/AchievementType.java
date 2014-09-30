package com.jojodyne.achieve;

/**
 * @Author Tom Byrne, tom.byrne@apple.com
 * (C) 2012 Apple, Inc
 * "I code not to solve a problem,
 * but because there is code within me, crying to get out."
 */
public enum AchievementType {

    Bronze(1), Silver(10), Gold(25), Platinum(50), Ninja(100);

    private final int _points;
    private AchievementType(int points){
        _points = points;
    }

    int getPoints(){ return _points;}
}
