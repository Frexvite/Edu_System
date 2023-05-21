package com.demo.service;

import com.demo.vo.Teacher;

import java.io.Serializable;
import java.util.Map;

/**
 * 教师模块的Service层（业务层）接口，提供业务方法的抽象
 */
public interface TeacherService {
    /**
     * 增加教师
     *
     * @param vo
     * @return
     */
    void add(Teacher vo);

    /**
     * 删除教师
     *
     * @param id
     * @return
     */
    void delete(long id);

    /**
     * 修改教师
     *
     * @param vo
     * @return
     */
    void update(Teacher vo);

    /**
     * 根据主键Id查询教师详情
     *
     * @param id
     * @return
     */
    Teacher get(Serializable id);

    /**
     * 根据条件查询教师的列表与数量
     *
     * @param params
     * @return
     */
    Map<String, Object> list(Map<String, Object> params);
}
