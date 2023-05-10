package com.demo.vo;

import java.io.Serializable;

/**
 * 教师（t_teacher表对应的Java实体类）
 */
public class Teacher implements Serializable {
    private Long id;//主键
    private String teacherName;//姓名
    private String teacherSex;//性别:男/女
    private String teacherDegree;//学历
    private String teacherPotition;//职位
    private String teacherCollege;//院系
    private String teacherPhone;//联系电话

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }
    public String getTeacherSex() {
        return teacherSex;
    }

    public void setTeacherSex(String teacherSex) {
        this.teacherSex = teacherSex;
    }
    public String getTeacherDegree() {
        return teacherDegree;
    }

    public void setTeacherDegree(String teacherDegree) {
        this.teacherDegree = teacherDegree;
    }
    public String getTeacherPotition() {
        return teacherPotition;
    }

    public void setTeacherPotition(String teacherPotition) {
        this.teacherPotition = teacherPotition;
    }
    public String getTeacherCollege() {
        return teacherCollege;
    }

    public void setTeacherCollege(String teacherCollege) {
        this.teacherCollege = teacherCollege;
    }
    public String getTeacherPhone() {
        return teacherPhone;
    }

    public void setTeacherPhone(String teacherPhone) {
        this.teacherPhone = teacherPhone;
    }
}
