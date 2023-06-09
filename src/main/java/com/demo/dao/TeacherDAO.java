package com.demo.dao;

import com.demo.vo.Teacher;

import java.io.Serializable;
import java.util.Map;

/**
 * 教师模块的DAO层（数据层）接口，提供增删改查等数据库操作的方法抽象
 */
public interface TeacherDAO {
    /**
     * 增加教师表记录
     *
     * @param vo
     * @return
     */
    void add(Teacher vo);

    /**
     * 根据主键id，删除对应的教师表记录
     *
     * @param id
     * @return
     */
    boolean delete(long id);

    /**
     * 更新教师表记录
     *
     * @param vo
     * @return
     */
    void update(Teacher vo);

    /**
     * 根据主键id获取教师表记录的详情
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
