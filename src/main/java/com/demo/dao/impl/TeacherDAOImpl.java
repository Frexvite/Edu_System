package com.demo.dao.impl;

import com.demo.util.Util;
import com.demo.dao.TeacherDAO;
import com.demo.vo.Teacher;

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
 * 教师模块的DAO层（数据层）的具体实现类，对TeacherDAO接口中定义的增删改查等抽象方法作出具体的功能实现
 */
public class TeacherDAOImpl implements TeacherDAO {

    //@Override
    public void add(Teacher vo) {
        String sql = "insert into `t_teacher` (`teacher_name`,`teacher_sex`,`teacher_degree`,`teacher_potition`,`teacher_college`,`teacher_phone`) values(?,?,?,?,?,?)";
        try {
            Connection c = Util.getConnection();
            PreparedStatement ps = c.prepareStatement(sql);
            
            ps.setString(1, vo.getTeacherName());
            ps.setString(2, vo.getTeacherSex());
            ps.setString(3, vo.getTeacherDegree());
            ps.setString(4, vo.getTeacherPotition());
            ps.setString(5, vo.getTeacherCollege());
            ps.setString(6, vo.getTeacherPhone());
            ps.execute();
            ps.close();
            c.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //@Override
    public void update(Teacher vo) {
        String sql = "update `t_teacher` set `teacher_name` = ? ,`teacher_sex` = ? ,`teacher_degree` = ? ,`teacher_potition` = ? ,`teacher_college` = ? ,`teacher_phone` = ?  where `id` = ?";
        try {
            Connection c = Util.getConnection();
            PreparedStatement ps = c.prepareStatement(sql);
            
            ps.setString(1, vo.getTeacherName());
            ps.setString(2, vo.getTeacherSex());
            ps.setString(3, vo.getTeacherDegree());
            ps.setString(4, vo.getTeacherPotition());
            ps.setString(5, vo.getTeacherCollege());
            ps.setString(6, vo.getTeacherPhone());
            ps.setLong(7, vo.getId());
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
            String sql = "delete from `t_teacher` where id = " + id;
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
    public Teacher get(Serializable id) {
        Teacher vo = null;
        try {
            Connection c = Util.getConnection();
            Statement s = c.createStatement();
            String sql = "select * from `t_teacher` where id = " + id;
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                vo = new Teacher();
                vo.setId(rs.getLong("id"));
                vo.setTeacherName(rs.getString("teacher_name"));
                vo.setTeacherSex(rs.getString("teacher_sex"));
                vo.setTeacherDegree(rs.getString("teacher_degree"));
                vo.setTeacherPotition(rs.getString("teacher_potition"));
                vo.setTeacherCollege(rs.getString("teacher_college"));
                vo.setTeacherPhone(rs.getString("teacher_phone"));
            }
            c.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vo;
    }

    //@Override
    public Map<String, Object> list(Map<String, Object> params) {
        List<Teacher> list = new ArrayList();
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
                sqlList = "select * from `t_teacher` where 1=1 " + condition + " order by id asc " + limit + ";";
                ps = c.prepareStatement(sqlList);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Teacher vo = new Teacher();
                    vo.setId(rs.getLong("id"));
                    vo.setTeacherName(rs.getString("teacher_name"));
                    vo.setTeacherSex(rs.getString("teacher_sex"));
                    vo.setTeacherDegree(rs.getString("teacher_degree"));
                    vo.setTeacherPotition(rs.getString("teacher_potition"));
                    vo.setTeacherCollege(rs.getString("teacher_college"));
                    vo.setTeacherPhone(rs.getString("teacher_phone"));
                    list.add(vo);
                }
            String sqlCount = "select count(*) from `t_teacher` where 1=1 " + condition;
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
