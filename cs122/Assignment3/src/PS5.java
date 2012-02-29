import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.TreeSet;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class PS5 {
    public PS5() {
        partOne();
        partTwo();
        partThree();
    }

    public void partTwo() {
        LinkedHashSet<Integer> intSet = new LinkedHashSet<Integer>();
        intSet.add(1);
        intSet.add(19);
        intSet.add(2);
        intSet.add(20);
        intSet.add(-1);

        intSet.add(1);
        System.out.println("Size of LinkedHashSet:" + intSet.size());
        System.out.println(intSet);

        intSet.remove(2);
        System.out.println("Size of LinkedHashSet:" + intSet.size());
    }

    public void partThree() {
        TreeSet<String> stringSet = new TreeSet<String>(){{
            add("D");
            add("A");
            add("F");
            add("E");
            add("B");
            add("C");
            add("C");
        }};
        System.out.println("First item:"+stringSet.first());
        System.out.println("Last item:"+stringSet.last());
        System.out.println("TreeSet: "+stringSet);
        stringSet.remove("C");
        System.out.println("TreeSet: "+stringSet);
    }

    public void partOne() {
        HashSet<Integer> intSet = new HashSet<Integer>();
        intSet.add(1);
        intSet.add(19);
        intSet.add(2);
        intSet.add(20);
        intSet.add(-1);
        intSet.add(1);
        System.out.println("Size of Set:" + intSet.size());
        System.out.println(intSet);

        intSet.remove(2);
        System.out.println("Size of Set:" + intSet.size());
    }

    public static void main(String[] args) {
        new PS5();
    }
}
