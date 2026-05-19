package com.lab.bean;

/**
 *
 * @author user
 */

import java.io.Serializable;

public class subjectBean implements Serializable {
    private String matricNo;
    private String subjectName;
    private String subjectCode;
    
    public subjectBean(String matricNo, String subjectName, String subjectCode) {
        this.matricNo = matricNo;
        this.subjectCode = subjectCode;
        this.subjectName = subjectName;
    }

    public String getMatricNo() {
        return matricNo;
    }

    public void setMatricNo(String matricNo) {
        this.matricNo = matricNo;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getSubjectCode() {
        return subjectCode;
    }

    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }
    
    
}
