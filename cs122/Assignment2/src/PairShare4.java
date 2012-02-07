import java.util.ArrayList;
import java.util.Arrays;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class PairShare4 {
    public static void main(String[] args) {
        String[] stringArray = new String[5];
        System.out.println("Size of array:" + stringArray.length);
        stringArray[0] = "Jones";
        stringArray[1] = "Smith";
        stringArray[2] = "Henderson";
        stringArray[3] = "Griffin";
        stringArray[4] = "Simpson";
        System.out.println("Array Contents:");
        for (String s : stringArray) {
            System.out.println(s);
        }

        for (int i = 0; i < stringArray.length; i++) {
            if ("Smith".equals(stringArray[i])) {
                System.out.println("Found Smith at array index: " + i);
            }
        }

        System.out.println("3rd Element of Array:" + stringArray[2]);

        System.out.println("Size of array:" + stringArray.length);
        System.out.println("");
        System.out.println("");


        ArrayList<String> stringArrayList = new ArrayList<String>();
        System.out.println("Size of arrayList before:" + stringArrayList.size());
        stringArrayList.add("Simpson");
        stringArrayList.add("Griffin");
        stringArrayList.add("Henderson");
        stringArrayList.add("Smith");
        stringArrayList.add("Jones");
        System.out.println("ArrayList Contents:");
        for (String s : stringArrayList) {
            System.out.println(s);
        }
        System.out.println("Size of arrayList after:" + stringArrayList.size());

        System.out.println("3rd Element of array:"+stringArrayList.get(2));

        int smithIndex = stringArrayList.indexOf("Smith");
        System.out.println("Found Smith at array index: " + stringArrayList.indexOf("Smith"));
        stringArrayList.set(smithIndex, "smithreplacement");

    }
}
