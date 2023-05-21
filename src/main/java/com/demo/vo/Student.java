package com.demo.vo;

import java.io.Serializable;

/**
 * 学生（t_student表对应的Java实体类）
 */
public class Student implements Serializable {
    private Long id;//主键
    private String studentName;//姓名
    private String studentAge;//年龄
    private String studentSex;//性别:男/女
    private String studentNumber;//学号
    private String studentClass;//班级
    private String studentPhone;//联系电话
    private String studentText;//备注

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }
    public String getStudentAge() {
        return studentAge;
    }

    public void setStudentAge(String studentAge) {
        this.studentAge = studentAge;
    }
    public String getStudentSex() {
        return studentSex;
    }

    public void setStudentSex(String studentSex) {
        this.studentSex = studentSex;
    }
    public String getStudentNumber() {
        return studentNumber;
    }

    public void setStudentNumber(String studentNumber) {
        this.studentNumber = studentNumber;
    }
    public String getStudentClass() {
        return studentClass;
    }

    public void setStudentClass(String studentClass) {
        this.studentClass = studentClass;
    }
    public String getStudentPhone() {
        return studentPhone;
    }

    public void setStudentPhone(String studentPhone) {
        this.studentPhone = studentPhone;
    }
    public String getStudentText() {
        return studentText;
    }

    public void setStudentText(String studentText) {
        this.studentText = studentText;
    }
}
