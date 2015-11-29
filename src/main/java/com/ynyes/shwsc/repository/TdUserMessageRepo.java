package com.ynyes.shwsc.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.shwsc.entity.TdUserMessage;
import com.ynyes.shwsc.entity.TdOrder;
/**
 * TdUserMessage  实体数据库操作接口
 * @author Zhangji
 *
 */ 
public interface TdUserMessageRepo extends 
           PagingAndSortingRepository<TdUserMessage, Long>,
           JpaSpecificationExecutor<TdUserMessage> 
{
   List<TdUserMessage> findByStatus(Long status);
   List<TdUserMessage> findByStatusOrderByIdDesc(Long status);
   List<TdUserMessage> findByUserIdOrderByTimeDesc(Long status);
   List<TdUserMessage> findByUserIdAndStatusOrderByTimeDesc(Long userId,Long status);
   
   Page<TdUserMessage> findByStatusOrderByIdDesc(Long status, Pageable page);
} 
