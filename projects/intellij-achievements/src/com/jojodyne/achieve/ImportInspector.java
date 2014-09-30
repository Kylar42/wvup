package com.jojodyne.achieve;

import com.intellij.codeInspection.BaseJavaLocalInspectionTool;
import com.intellij.codeInspection.ProblemsHolder;
import com.intellij.psi.JavaElementVisitor;
import com.intellij.psi.PsiElementVisitor;
import com.intellij.psi.PsiImportStatement;
import org.jetbrains.annotations.Nls;
import org.jetbrains.annotations.NotNull;

/**
 * @Author Tom Byrne, kylar42@gmail.com
 * "I code not to solve a problem,
 * but because there is code within me, crying to get out."
 */
public class ImportInspector extends BaseJavaLocalInspectionTool {
    public ImportInspector() {
        super();
    }

    @Nls
    @NotNull
    @Override
    public String getDisplayName() {
        return "Detect And Record All Achievements";
    }

    @Nls
    @NotNull
    @Override
    public String getGroupDisplayName() {
        return "Achievements";
    }

    @NotNull
    @Override
    public String getShortName() {
        return "AllAchievements";
    }

    @NotNull
    @Override
    public PsiElementVisitor buildVisitor(@NotNull ProblemsHolder holder, boolean isOnTheFly) {
        return new JavaElementVisitor() {


            @Override
            public void visitImportStatement(PsiImportStatement statement) {
                String qName = statement.getQualifiedName();
                if(null == qName){
                    return;
                }

                if(qName.startsWith("org.apache.commons")){
                    AchievementCoordinator.getInstance().checkAchievementAndAdd(Achievement.COMMON_MAN);
                }
                if(qName.startsWith("com.ibm")){
                    AchievementCoordinator.getInstance().checkAchievementAndAdd(Achievement.BIG_BLUE);
                }
            }
        }   ;
    }
}
