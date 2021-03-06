package com.ynyes.shwsc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.shwsc.entity.TdPayType;
import com.ynyes.shwsc.repository.TdPayTypeRepo;

/**
 * TdPayType 服务类
 * 
 * @author Sharon
 *
 */

@Service
@Transactional
public class TdPayTypeService {
    @Autowired
    TdPayTypeRepo repository;
    
    /**
     * 删除
     * 
     * @param id 菜单项ID
     */
    public void delete(Long id)
    {
        if (null != id)
        {
            repository.delete(id);
        }
    }
    
    /**
     * 删除
     * 
     * @param e 菜单项
     */
    public void delete(TdPayType e)
    {
        if (null != e)
        {
            repository.delete(e);
        }
    }
    
    public void delete(List<TdPayType> entities)
    {
        if (null != entities)
        {
            repository.delete(entities);
        }
    }
    
    /**
     * 查找
     * 
     * @param id ID
     * @return
     */
    public TdPayType findOne(Long id)
    {
        if (null == id)
        {
            return null;
        }
        
        return repository.findOne(id);
    }
    
    /**
     * 查找
     * 
     * @param ids
     * @return
     */
    public List<TdPayType> findAll(Iterable<Long> ids)
    {
        return (List<TdPayType>) repository.findAll(ids);
    }
    
    public List<TdPayType> findAll()
    {
        return (List<TdPayType>) repository.findAll();
    }
    
    public Page<TdPayType> findAllOrderBySortIdAsc(int page, int size)
    {
        PageRequest pageRequest = new PageRequest(page, size, new Sort(Direction.ASC, "sortId"));
        
        return repository.findAll(pageRequest);
    }
    
    public Page<TdPayType> searchAllOrderBySortIdAsc(String keywords, int page, int size)
    {
        PageRequest pageRequest = new PageRequest(page, size);
        
        return repository.findByTitleContainingOrderBySortIdAsc(keywords, pageRequest);
    }
    
    public List<TdPayType> findByIsEnableTrue()
    {
        return repository.findByIsEnableTrue();
    }
    
    /**
     * 保存
     * 
     * @param e
     * @return
     */
    public TdPayType save(TdPayType e)
    {
        
        return repository.save(e);
    }
    
    public List<TdPayType> save(List<TdPayType> entities)
    {
        
        return (List<TdPayType>) repository.save(entities);
    }
}
