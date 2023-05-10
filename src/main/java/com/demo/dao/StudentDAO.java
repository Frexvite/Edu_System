package com.demo.dao;

import com.demo.vo.Student;

import java.io.Serializable;
import java.util.Map;

/**
 * 学生模块的DAO层（数据层）接口，提供增删改查等数据库操作的方法抽象
 */
public interface StudentDAO {
    /**
     * 增加学生表记录
     *
     * @param vo
     * @return
     */
    void add(Student vo);

    /**
     * 根据主键id，删除对应的学生表记录
     *
     * @param id
     * @return
     */
    boolean delete(long id);

    /**
     * 更新学生表记录
     *
     * @param vo
     * @return
     */
    void update(Student vo);

    /**
     * 根据主键id获取学生表记录的详情
     *
     * @param id
     * @return
     */
    Student get(Serializable id);

    /**
     * 根据条件查询学生的列表与数量
     *
     * @param params
     * @return
     */
    Map<String, Object> list(Map<String, Object> params);
}
