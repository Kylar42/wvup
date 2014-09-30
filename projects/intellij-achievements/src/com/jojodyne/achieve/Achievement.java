package com.jojodyne.achieve;

/**
 * @Author Tom Byrne, kylar42@gmail.com
 * "I code not to solve a problem,
 * but because there is code within me, crying to get out."
 */
public enum Achievement {

    YO_CLASS_SO_FAT("Yo Class So Fat", "Created a class with more than 2000 lines.", AchievementType.Bronze),
    BIG_BLUE("Big Blue", "Imported an IBM Class", AchievementType.Bronze),
    COMMON_MAN("Common Man", "Imported an Apache Commons Class", AchievementType.Bronze);


    private final String _name;
    private final String _description;
    private final AchievementType   _type;
    private final int    _points;


    private Achievement(final String achievementName, final String description, final AchievementType type){
        this(achievementName, description, type, type.getPoints());
    }
    private Achievement(final String achievementName, final String description, final AchievementType type, final int points){
        _name = achievementName;
        _description = description;
        _type = type;
        _points = points;
    }

    public String getName(){ return _name;}
    public String getDescription(){ return _description;}
    public int getPoints(){return _points;}
    public AchievementType getType(){return _type;}

    public String getStringForDialog(){
        StringBuilder sb = new StringBuilder();
        sb.append(_name).append(" - ").append(_description);
        return sb.toString();
    }
}
