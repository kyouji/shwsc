package com.ynyes.shwsc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.shwsc.entity.TdUserMessage;
import com.ynyes.shwsc.entity.TdOrder;
import com.ynyes.shwsc.repository.TdUserMessageRepo;


/**
 * TdUserMessage 服务类
 * @author Zhangji
 *
 */

@Service
@Transactional
public class TdUserMessageService {
	@Autowired
	TdUserMessageRepo repository;

	public List<TdUserMessage> findAll(){
	        return (List<TdUserMessage>) repository.findAll();
	}
	
	public List<TdUserMessage> findByNameOrderByTimeDesc(){
		
		return (List<TdUserMessage>) repository.findAll();		
	}
	

    /**
     * 查找企业未读信息
     * @param enterpriseId
     * @param statusE
     * @param page
     * @param size
     * @return
     */
    public List<TdUserMessage> findByUserIdAndStatusOrderByTimeAsc(Long userId , Long status )
    {
        return repository.findByUserIdAndStatusOrderByTimeDesc(userId , status );
    }
    
    public List<TdUserMessage> findByUserIdOrderByTimeAsc(Long userId )
    {
        return repository.findByUserIdOrderByTimeDesc(userId  );
    }
    
	
    public List<TdUserMessage> findBystatus(Long status){
    	return repository.findByStatus(status);
    }

    public Page<TdUserMessage> findBystatusOrderByIdDesc(long status, int page, int size)
    {
        PageRequest pageRequest = new PageRequest(page, size);
        
        return repository.findByStatusOrderByIdDesc(status, pageRequest);
    }
    


 
    
    public Page<TdUserMessage> findAllOrderByIdDesc(int page, int size)
    {
        PageRequest pageRequest = new PageRequest(page, size, new Sort(Direction.DESC, "id"));
        
        return repository.findAll(pageRequest);
    }
	
	//筛选statusE为1L的
    public List<TdUserMessage> findByStatusEAndIsShowable()
    {

       
        
        return repository.findByStatusOrderByIdDesc(1L);
    }
    

	public TdUserMessage findOne(Long id)
    {
		if(null == id)
		{
			return null;
		}
		
        return repository.findOne(id);
    }
	
	public Page<TdUserMessage> findAllOrderByTimeDesc(int page,int size){

		PageRequest pageRequest = new PageRequest(page,size,new Sort(Direction.DESC,"time"));
		return repository.findAll(pageRequest);
	}
	



	/**
	 * 添加
	 */

	public void save(TdUserMessage e){
		repository.save(e);
	}
	
	 public List<TdUserMessage> save(List<TdUserMessage> entities)
	 {
	        
	     return (List<TdUserMessage>) repository.save(entities);
  }
	/**
	 * 删除
	 */
    public void delete(Long id)
    {
        if (null != id)
        {
            repository.delete(id);
        }
    }



}
