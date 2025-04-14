#!/bin/bash
mkdir -p out
javac -d out -cp lib/junit-4.13.2.jar:lib/hamcrest-core-1.3.jar src/Hello.java test/HelloTest.java
java -cp out:lib/junit-4.13.2.jar:lib/hamcrest-core-1.3.jar org.junit.runner.JUnitCore HelloTest
