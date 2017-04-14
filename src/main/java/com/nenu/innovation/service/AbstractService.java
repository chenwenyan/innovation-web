package com.nenu.innovation.service;

import java.util.List;

/**
 * AbstractService
 *
 * @author: wychen
 * @time: 2017/4/14 20:33
 */
public interface AbstractService {
    /**
     * 根据页码显示列表
     *
     * @param offset
     * @param pageSize
     * @return
     */
    public List listByPage(int offset, int pageSize)throws Exception;
}
