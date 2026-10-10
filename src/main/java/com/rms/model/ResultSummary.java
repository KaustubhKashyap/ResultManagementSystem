package com.rms.model;

public class ResultSummary {

    private int totalStudents;
    private int passStudents;
    private int failStudents;
    private double highestPercentage;
    private double averagePercentage;
    private String topperName;

    public int getTotalStudents() {
        return totalStudents;
    }

    public void setTotalStudents(int totalStudents) {
        this.totalStudents = totalStudents;
    }

    public int getPassStudents() {
        return passStudents;
    }

    public void setPassStudents(int passStudents) {
        this.passStudents = passStudents;
    }

    public int getFailStudents() {
        return failStudents;
    }

    public void setFailStudents(int failStudents) {
        this.failStudents = failStudents;
    }

    public double getHighestPercentage() {
        return highestPercentage;
    }

    public void setHighestPercentage(double highestPercentage) {
        this.highestPercentage = highestPercentage;
    }

    public double getAveragePercentage() {
        return averagePercentage;
    }

    public void setAveragePercentage(double averagePercentage) {
        this.averagePercentage = averagePercentage;
    }

    public String getTopperName() {
        return topperName;
    }

    public void setTopperName(String topperName) {
        this.topperName = topperName;
    }
}