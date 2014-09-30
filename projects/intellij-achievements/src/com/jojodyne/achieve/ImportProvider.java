package com.jojodyne.achieve;

import com.intellij.codeInspection.InspectionToolProvider;

/**
 * @Author Tom Byrne, tom.byrne@apple.com
 * (C) 2011 Apple, Inc
 * "I code not to solve a problem,
 * but because there is code within me, crying to get out."
 */
public class ImportProvider implements InspectionToolProvider {
    public Class[] getInspectionClasses() {
        return new Class[]{ImportInspector.class};
    }
}
