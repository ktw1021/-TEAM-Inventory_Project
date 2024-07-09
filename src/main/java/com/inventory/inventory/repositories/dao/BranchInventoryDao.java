package com.inventory.repositories.dao;

import java.util.List;

import com.inventory.repositories.vo.BranchInventoryVo;

public interface BranchInventoryDao {

	 void insertBranch(BranchInventoryVo branch);

	    BranchInventoryVo getBranchById(int branchId);

	    void updateBranch(BranchInventoryVo branch);

	    void deleteBranch(int branchId);

	    List<BranchInventoryVo> getAllBranches();

		BranchInventoryVo getBranch(String branchId, String bookCode);

		void addBranch(BranchInventoryVo branchInventoryVo);

		void deleteBranch(String branchId, String bookCode);
}