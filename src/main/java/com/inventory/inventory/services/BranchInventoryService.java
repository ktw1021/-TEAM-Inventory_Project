package com.inventory.services;

import java.util.List;

import com.inventory.repositories.vo.BranchInventoryVo;
public interface BranchInventoryService {

	
    BranchInventoryVo findBranchById(int branchId);

	void addBranch(BranchInventoryVo branchInventoryVo);

	void deleteBranch(String branchId, String bookCode);

	void deleteBranch(int branchId);

	BranchInventoryVo getBranch(String branchId, String bookCode);

	List<BranchInventoryVo> getAllBranches();





    // Additional methods as needed
}