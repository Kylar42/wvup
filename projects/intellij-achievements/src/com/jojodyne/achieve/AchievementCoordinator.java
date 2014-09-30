package com.jojodyne.achieve;

import com.intellij.AppTopics;
import com.intellij.notification.Notification;
import com.intellij.notification.NotificationType;
import com.intellij.notification.Notifications;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.fileEditor.FileDocumentManagerAdapter;
import com.intellij.openapi.ui.Messages;
import com.intellij.util.containers.ConcurrentHashSet;
import com.intellij.util.messages.MessageBus;
import com.intellij.util.messages.MessageBusConnection;
import com.jojodyne.achieve.badgemaker.BadgeMaker;
import org.jetbrains.annotations.NotNull;
import com.intellij.openapi.editor.Document;


import javax.swing.*;
import java.awt.image.BufferedImage;
import java.util.HashSet;
import java.util.Set;

/**
 * @Author Tom Byrne, tom.byrne@apple.com
 * (C) 2012 Apple, Inc
 * "I code not to solve a problem,
 * but because there is code within me, crying to get out."
 */
public class AchievementCoordinator implements ApplicationComponent {
    Set<Achievement> _achievements = new ConcurrentHashSet<Achievement>();


    private static AchievementCoordinator INSTANCE;
    BadgeMaker _badgeMaker = new BadgeMaker();

    public AchievementCoordinator(){
        //Dear ${DEITY} - I hate doing this.
        //But since it's instantiated via that thing with the thing...
        if(null == INSTANCE){
            INSTANCE=this;
        }
    }

    @Override
    public void disposeComponent() {

    }

    @Override
    public void initComponent() {
        MessageBus bus = ApplicationManager.getApplication().getMessageBus();

        MessageBusConnection connection = bus.connect();

        connection.subscribe(AppTopics.FILE_DOCUMENT_SYNC,
                new FileDocumentManagerAdapter() {
                    @Override
                    public void beforeDocumentSaving(Document document) {
                        int lineCount = document.getLineCount();
                        if(2000 < lineCount){
                            AchievementCoordinator.getInstance().checkAchievementAndAdd(Achievement.YO_CLASS_SO_FAT);
                        }
                    }
                });
    }

    @NotNull
    @Override
    public String getComponentName() {
        return "AchievementCoordinator";
    }

    public static final AchievementCoordinator getInstance(){
        return INSTANCE;
    }

    public void checkAchievementAndAdd(Achievement achievement){
        if(!_achievements.contains(achievement)){
            //make an imageIcon for the new achievement
            final BufferedImage bufferedImage = _badgeMaker.generateBadgeImage("Achievment Unlocked", achievement.getStringForDialog());

            Notification n = new Notification("ACO-1", "", "", NotificationType.INFORMATION){
                @Override
                public Icon getIcon() {
                    return new ImageIcon(bufferedImage);
                }
            };
            Notifications.Bus.notify(n);
            _achievements.add(achievement);
        }
    }
}
