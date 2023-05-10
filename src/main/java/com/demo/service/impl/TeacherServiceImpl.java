package com.demo.service.impl;

import com.demo.dao.TeacherDAO;
import com.demo.dao.impl.TeacherDAOImpl;
import com.demo.service.TeacherService;
import com.demo.vo.Teacher;

import java.io.Serializable;
import java.util.Map;

/**
 * 教师模块的Service层（业务层）的具体实现类，对TeacherService接口中定义的抽象方法作出具体的功能实现
 */
public class TeacherServiceImpl implements TeacherService {
    //@Override
    public void add(Teacher vo) {
        TeacherDAO teacherDAO = new TeacherDAOImpl();
        teacherDAO.add(vo);
    }

    //@Override
    public void delete(long id) {
        TeacherDAO teacherDAO = new TeacherDAOImpl();
        teacherDAO.delete(id);
    }

    //@Override
    public void update(Teacher vo) {
        TeacherDAO teacherDAO = new TeacherDAOImpl();
        teacherDAO.update(vo);
    }

    //@Override
    public Teacher get(Serializable id) {
        TeacherDAO teacherDAO = new TeacherDAOImpl();
        return teacherDAO.get(id);
    }

    //@Override
    public Map<String, Object> list(Map<String, Object> params) {
        TeacherDAO teacherDAO = new TeacherDAOImpl();
        return teacherDAO.list(params);
    }
}
