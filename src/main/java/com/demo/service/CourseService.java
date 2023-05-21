package com.demo.service;

import com.demo.vo.Course;

import java.io.Serializable;
import java.util.Map;

/**
 * 课程模块的Service层（业务层）接口，提供业务方法的抽象
 */
public interface CourseService {
    /**
     * 增加课程
     *
     * @param vo
     * @return
     */
    void add(Course vo);

    /**
     * 删除课程
     *
     * @param id
     * @return
     */
    void delete(long id);

    /**
     * 修改课程
     *
     * @param vo
     * @return
     */
    void update(Course vo);

    /**
     * 根据主键Id查询课程详情
     *
     * @param id
     * @return
     */
    Course get(Serializable id);

    /**
     * 根据条件查询课程的列表与数量
     *
     * @param params
     * @return
     */
    Map<String, Object> list(Map<String, Object> params);
}
