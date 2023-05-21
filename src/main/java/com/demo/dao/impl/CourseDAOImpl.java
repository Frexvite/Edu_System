package com.demo.dao.impl;

import com.demo.util.Util;
import com.demo.dao.CourseDAO;
import com.demo.vo.Course;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 课程模块的DAO层（数据层）的具体实现类，对CourseDAO接口中定义的增删改查等抽象方法作出具体的功能实现
 */
public class CourseDAOImpl implements CourseDAO {

    //@Override
    public void add(Course vo) {
        String sql = "insert into `t_course` (`course_name`,`course_time`,`course_room`,`course_week`,`course_college`,`course_score`,`course_text`) values(?,?,?,?,?,?,?)";
        try {
            Connection c = Util.getConnection();
            PreparedStatement ps = c.prepareStatement(sql);
            
            ps.setString(1, vo.getCourseName());
            ps.setString(2, vo.getCourseTime());
            ps.setString(3, vo.getCourseRoom());
            ps.setString(4, vo.getCourseWeek());
            ps.setString(5, vo.getCourseCollege());
            ps.setString(6, vo.getCourseScore());
            ps.setString(7, vo.getCourseText());
            ps.execute();
            ps.close();
            c.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //@Override
    public void update(Course vo) {
        String sql = "update `t_course` set `course_name` = ? ,`course_time` = ? ,`course_room` = ? ,`course_week` = ? ,`course_college` = ? ,`course_score` = ? ,`course_text` = ?  where `id` = ?";
        try {
            Connection c = Util.getConnection();
            PreparedStatement ps = c.prepareStatement(sql);
            
            ps.setString(1, vo.getCourseName());
            ps.setString(2, vo.getCourseTime());
            ps.setString(3, vo.getCourseRoom());
            ps.setString(4, vo.getCourseWeek());
            ps.setString(5, vo.getCourseCollege());
            ps.setString(6, vo.getCourseScore());
            ps.setString(7, vo.getCourseText());
            ps.setLong(8, vo.getId());
            ps.execute();
            ps.close();
            c.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //@Override
    public boolean delete(long id) {
        try {
            Connection c = Util.getConnection();
            Statement s = c.createStatement();
            String sql = "delete from `t_course` where id = " + id;
            s.execute(sql);
            s.close();
            c.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    //@Override
    public Course get(Serializable id) {
        Course vo = null;
        try {
            Connection c = Util.getConnection();
            Statement s = c.createStatement();
            String sql = "select * from `t_course` where id = " + id;
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                vo = new Course();
                vo.setId(rs.getLong("id"));
                vo.setCourseName(rs.getString("course_name"));
                vo.setCourseTime(rs.getString("course_time"));
                vo.setCourseRoom(rs.getString("course_room"));
                vo.setCourseWeek(rs.getString("course_week"));
                vo.setCourseCollege(rs.getString("course_college"));
                vo.setCourseScore(rs.getString("course_score"));
                vo.setCourseText(rs.getString("course_text"));
            }
            c.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vo;
    }

    //@Override
    public Map<String, Object> list(Map<String, Object> params) {
        List<Course> list = new ArrayList();
        int totalCount = 0;
        String condition = "";
        String sqlList;
        if (params.get("searchColumn") != null && !"".equals(params.get("searchColumn"))) {
            condition += " and `" + params.get("searchColumn") + "` like '%" + params.get("keyword") + "%'";
        }
        try {
            Connection c = Util.getConnection();
            PreparedStatement ps;
            ResultSet rs;
            String limit = (params.get("startIndex") != null && params.get("pageSize") != null) ? " limit " + params.get("startIndex") + "," + params.get("pageSize") : "";
                sqlList = "select * from `t_course` where 1=1 " + condition + " order by id asc " + limit + ";";
                ps = c.prepareStatement(sqlList);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Course vo = new Course();
                    vo.setId(rs.getLong("id"));
                    vo.setCourseName(rs.getString("course_name"));
                    vo.setCourseTime(rs.getString("course_time"));
                    vo.setCourseRoom(rs.getString("course_room"));
                    vo.setCourseWeek(rs.getString("course_week"));
                    vo.setCourseCollege(rs.getString("course_college"));
                    vo.setCourseScore(rs.getString("course_score"));
                    vo.setCourseText(rs.getString("course_text"));
                    list.add(vo);
                }
            String sqlCount = "select count(*) from `t_course` where 1=1 " + condition;
            ps = c.prepareStatement(sqlCount);
            rs = ps.executeQuery();
            if (rs.next()) {
                totalCount = rs.getInt(1);
            }
            rs.close();
            ps.close();
            c.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Map<String, Object> result = new HashMap();
        result.put("list", list);
        result.put("totalCount", totalCount);
        return result;
    }
}
