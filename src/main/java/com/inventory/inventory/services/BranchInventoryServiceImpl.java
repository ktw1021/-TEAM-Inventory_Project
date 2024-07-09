package com.inventory.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.inventory.repositories.dao.BranchInventoryDao;
import com.inventory.repositories.vo.BranchInventoryVo;

@Service
@Transactional
public class BranchInventoryServiceImpl implements BranchInventoryService {

    private final BranchInventoryDao branchInventoryDao;

    @Autowired
    public BranchInventoryServiceImpl(BranchInventoryDao branchInventoryDao) {
        this.branchInventoryDao = branchInventoryDao;
    }
    
    @Override
    public BranchInventoryVo getBranch(String branchId, String bookCode) {
        return branchInventoryDao.getBranch(branchId, bookCode);
    }
    
    @Override
    public void addBranch(BranchInventoryVo branchInventoryVo) {
        branchInventoryDao.insertBranch(branchInventoryVo); // corrected method name
    }
  
   

    @Override
    public void deleteBranch(String branchId, String bookCode) {
        branchInventoryDao.deleteBranch(branchId, bookCode);
    }

    @Override
    public void deleteBranch(int branchId) {
        branchInventoryDao.deleteBranch(branchId); // method overload for deletion by int branchId
    }

	@Override
	public BranchInventoryVo findBranchById(int branchId) {
	    // Call the DAO method to fetch the branch by its ID
	    return branchInventoryDao.getBranchById(branchId);
	}

	@Override
	public List<BranchInventoryVo> getAllBranches() {
		// TODO Auto-generated method stub
		return branchInventoryDao.getAllBranches();
	}
}
