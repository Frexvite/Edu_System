package com.demo.dao.impl;

import com.demo.util.Util;
import com.demo.dao.StudentDAO;
import com.demo.vo.Student;

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
 * 学生模块的DAO层（数据层）的具体实现类，对StudentDAO接口中定义的增删改查等抽象方法作出具体的功能实现
 */
public class StudentDAOImpl implements StudentDAO {

    //@Override
    public void add(Student vo) {
        String sql = "insert into `t_student` (`student_name`,`student_age`,`student_sex`,`student_number`,`student_class`,`student_phone`,`student_text`) values(?,?,?,?,?,?,?)";
        try {
            Connection c = Util.getConnection();
            PreparedStatement ps = c.prepareStatement(sql);
            
            ps.setString(1, vo.getStudentName());
            ps.setString(2, vo.getStudentAge());
            ps.setString(3, vo.getStudentSex());
            ps.setString(4, vo.getStudentNumber());
            ps.setString(5, vo.getStudentClass());
            ps.setString(6, vo.getStudentPhone());
            ps.setString(7, vo.getStudentText());
            ps.execute();
            ps.close();
            c.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //@Override
    public void update(Student vo) {
        String sql = "update `t_student` set `student_name` = ? ,`student_age` = ? ,`student_sex` = ? ,`student_number` = ? ,`student_class` = ? ,`student_phone` = ? ,`student_text` = ?  where `id` = ?";
        try {
            Connection c = Util.getConnection();
            PreparedStatement ps = c.prepareStatement(sql);
            
            ps.setString(1, vo.getStudentName());
            ps.setString(2, vo.getStudentAge());
            ps.setString(3, vo.getStudentSex());
            ps.setString(4, vo.getStudentNumber());
            ps.setString(5, vo.getStudentClass());
            ps.setString(6, vo.getStudentPhone());
            ps.setString(7, vo.getStudentText());
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
            String sql = "delete from `t_student` where id = " + id;
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
    public Student get(Serializable id) {
        Student vo = null;
        try {
            Connection c = Util.getConnection();
            Statement s = c.createStatement();
            String sql = "select * from `t_student` where id = " + id;
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                vo = new Student();
                vo.setId(rs.getLong("id"));
                vo.setStudentName(rs.getString("student_name"));
                vo.setStudentAge(rs.getString("student_age"));
                vo.setStudentSex(rs.getString("student_sex"));
                vo.setStudentNumber(rs.getString("student_number"));
                vo.setStudentClass(rs.getString("student_class"));
                vo.setStudentPhone(rs.getString("student_phone"));
                vo.setStudentText(rs.getString("student_text"));
            }
            c.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vo;
    }

    //@Override
    public Map<String, Object> list(Map<String, Object> params) {
        List<Student> list = new ArrayList();
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
                sqlList = "select * from `t_student` where 1=1 " + condition + " order by id asc " + limit + ";";
                ps = c.prepareStatement(sqlList);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Student vo = new Student();
                    vo.setId(rs.getLong("id"));
                    vo.setStudentName(rs.getString("student_name"));
                    vo.setStudentAge(rs.getString("student_age"));
                    vo.setStudentSex(rs.getString("student_sex"));
                    vo.setStudentNumber(rs.getString("student_number"));
                    vo.setStudentClass(rs.getString("student_class"));
                    vo.setStudentPhone(rs.getString("student_phone"));
                    vo.setStudentText(rs.getString("student_text"));
                    list.add(vo);
                }
            String sqlCount = "select count(*) from `t_student` where 1=1 " + condition;
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
