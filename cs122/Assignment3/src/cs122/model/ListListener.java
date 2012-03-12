package cs122.model;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public interface ListListener {
    public enum Action { ADDED, DELETED, MODIFIED}
    public void listChanged(Action type, Employee employeeChanged);
}
