package com.jojodyne.achieve;

import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.roots.ProjectRootManager;
import com.intellij.openapi.ui.Messages;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.openapi.vfs.VirtualFileAdapter;
import com.intellij.openapi.vfs.VirtualFileEvent;
import org.jetbrains.annotations.NotNull;

/**
 * @Author Tom Byrne, tom.byrne@apple.com
 * (C) 2012 Apple, Inc
 * "I code not to solve a problem,
 * but because there is code within me, crying to get out."
 */
public class AchievementProjectInspector implements ProjectComponent {
    private final Project _project;

    public AchievementProjectInspector(Project project){
        _project = project;
    }

    public void projectClosed() {

    }

    public void projectOpened() {
        ProjectRootManager projectRootManager = ProjectRootManager.getInstance(_project);
        VirtualFile[] sourceRoots = projectRootManager.getContentSourceRoots();

    }

    public void initComponent() {

    }

    public void disposeComponent() {

    }

    @NotNull
    public String getComponentName() {
        return "AchievementProjectInspector";
    }
    private static class MyVfsListener extends VirtualFileAdapter {
        public void fileCreated(VirtualFileEvent event) {
            /*if (updateCount(event.getFile(), +1)) {
                Messages.showMessageDialog("A new Java file added. Now " + String.valueOf(ourJavaFilesCount) +
                        " Java files in this project.", "Notification", Messages.getInformationIcon());
            } */
        }

        public void fileDeleted(VirtualFileEvent event) {
            /*if (updateCount(event.getFile(), -1)) {
                Messages.showMessageDialog("A Java file deleted. Now " + String.valueOf(ourJavaFilesCount) +
                        " Java files in this project.", "Notification", Messages.getInformationIcon());
            }  */
        }
    }
}
