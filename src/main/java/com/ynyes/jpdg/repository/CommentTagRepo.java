package com.ynyes.jpdg.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.jpdg.entity.CommentTag;

/**
 * CommentTag 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface CommentTagRepo extends
		PagingAndSortingRepository<CommentTag, Long>,
		JpaSpecificationExecutor<CommentTag> 
{
}
