package com.inventory.services;

import java.util.List;
import java.util.Map;

import com.inventory.repositories.vo.BookInventoryVo;

public interface BookInventoryService {
//	성민 사용중
	public List <BookInventoryVo> getList (String id);
	
	public List <BookInventoryVo> search (String id, String keyword);
	
	public int getInventory(BookInventoryVo vo);
//=======================================
	
	public List <BookInventoryVo> invenList (Map<String, Object> params);
	
	public String getBranchName (String branchId);
}