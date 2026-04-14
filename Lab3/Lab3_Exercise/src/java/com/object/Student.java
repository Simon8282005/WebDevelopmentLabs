package com.object;

public class Student {
    private String name;
    private String matricNum;
    private String club;
    
    public Student(String name, String matricNum, String club) {
        this.name = name;
        this.matricNum = matricNum;
        this.club = club;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMatricNum() {
        return matricNum;
    }

    public void setMatricNum(String matricNum) {
        this.matricNum = matricNum;
    }

    public String getClub() {
        return club;
    }

    public void setClub(String club) {
        this.club = club;
    }
}
