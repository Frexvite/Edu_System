package com.demo.service.impl;

import com.demo.dao.CourseDAO;
import com.demo.dao.impl.CourseDAOImpl;
import com.demo.service.CourseService;
import com.demo.vo.Course;

import java.io.Serializable;
import java.util.Map;

/**
 * 课程模块的Service层（业务层）的具体实现类，对CourseService接口中定义的抽象方法作出具体的功能实现
 */
public class CourseServiceImpl implements CourseService {
    //@Override
    public void add(Course vo) {
        CourseDAO courseDAO = new CourseDAOImpl();
        courseDAO.add(vo);
    }

    //@Override
    public void delete(long id) {
        CourseDAO courseDAO = new CourseDAOImpl();
        courseDAO.delete(id);
    }

    //@Override
    public void update(Course vo) {
        CourseDAO courseDAO = new CourseDAOImpl();
        courseDAO.update(vo);
    }

    //@Override
    public Course get(Serializable id) {
        CourseDAO courseDAO = new CourseDAOImpl();
        return courseDAO.get(id);
    }

    //@Override
    public Map<String, Object> list(Map<String, Object> params) {
        CourseDAO courseDAO = new CourseDAOImpl();
        return courseDAO.list(params);
    }
}
