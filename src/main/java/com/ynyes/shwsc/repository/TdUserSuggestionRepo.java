package com.ynyes.shwsc.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.shwsc.entity.TdUserSuggestion;
/**
 * TdUserSuggestion  实体数据库操作接口
 * @author Zhangji
 *
 */
public interface TdUserSuggestionRepo extends 
           PagingAndSortingRepository<TdUserSuggestion, Long>,
           JpaSpecificationExecutor<TdUserSuggestion> 
{
	// 根据查找
}
