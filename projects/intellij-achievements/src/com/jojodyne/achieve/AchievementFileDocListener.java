package com.jojodyne.achieve;

import com.intellij.util.messages.MessageBus;
import com.intellij.util.messages.Topic;

/**
 * @Author Tom Byrne, tom.byrne@apple.com
 * (C) 2012 Apple, Inc
 * "I code not to solve a problem,
 * but because there is code within me, crying to get out."
 */
public class AchievementFileDocListener {

    final Topic<ChangeActionNotifier> CHANGE_ACTION_TOPIC = Topic.create("AchievementChangeNotifier", ChangeActionNotifier.class);


    public void init(MessageBus bus){
        bus.connect().subscribe(CHANGE_ACTION_TOPIC, new ChangeActionNotifier() {
            @Override
            public void beforeAction(Object context) {
                // Process 'before action' event.
            }
            @Override
            public void afterAction(Object context) {
                // Process 'after action' event.
            }
        });
    }

    public interface ChangeActionNotifier {
        void beforeAction(Object context);
        void afterAction(Object context);
    }

}
