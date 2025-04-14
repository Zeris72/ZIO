#!/bin/bash
mkdir -p out
javac -d out -cp .:junit-4.13.2.jar src/Hello.java test/HelloTest.java
java -cp out:.:junit-4.13.2.jar:hamcrest-core-1.3.jar org.junit.runner.JUnitCore HelloTest
