/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class Pairshare1 {


    public Pairshare1(){
        try{
            throw new NullPointerException("NullPointer 1");
        }catch(NullPointerException npe){
            System.out.println(npe.getMessage());
            npe.printStackTrace();
        }
        try{
            throw new IndexOutOfBoundsException("Your Index was OOB 1");
        }catch(IndexOutOfBoundsException ioe){
            System.out.println(ioe.getMessage());
            ioe.printStackTrace();
        }
        try{
            throwNPE();
        }catch(NullPointerException npe){
            System.out.println(npe.getMessage());
            npe.printStackTrace();
        }
        try{
            throwIndexOOBoundsException();
        }catch(IndexOutOfBoundsException ioe){
            System.out.println(ioe.getMessage());
            ioe.printStackTrace();
        }

    }

    public void throwNPE(){
        throw new NullPointerException("A null pointer occurred.");
    }

    public void throwIndexOOBoundsException(){
        throw new IndexOutOfBoundsException("Your Index was Out Of Bounds.");
    }

    public static void main(String[] args) {
        new Pairshare1();
    }
}
