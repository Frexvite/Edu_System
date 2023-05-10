package com.demo.vo;

import java.io.Serializable;

/**
 * 课程（t_course表对应的Java实体类）
 */
public class Course implements Serializable {
    private Long id;//主键
    private String courseName;//课程名
    private String courseTime;//开课时间
    private String courseRoom;//开课地址
    private String courseWeek;//学时
    private String courseCollege;//所属院系
    private String courseScore;//学分
    private String courseText;//备注

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
    public String getCourseTime() {
        return courseTime;
    }

    public void setCourseTime(String courseTime) {
        this.courseTime = courseTime;
    }
    public String getCourseRoom() {
        return courseRoom;
    }

    public void setCourseRoom(String courseRoom) {
        this.courseRoom = courseRoom;
    }
    public String getCourseWeek() {
        return courseWeek;
    }

    public void setCourseWeek(String courseWeek) {
        this.courseWeek = courseWeek;
    }
    public String getCourseCollege() {
        return courseCollege;
    }

    public void setCourseCollege(String courseCollege) {
        this.courseCollege = courseCollege;
    }
    public String getCourseScore() {
        return courseScore;
    }

    public void setCourseScore(String courseScore) {
        this.courseScore = courseScore;
    }
    public String getCourseText() {
        return courseText;
    }

    public void setCourseText(String courseText) {
        this.courseText = courseText;
    }
}
