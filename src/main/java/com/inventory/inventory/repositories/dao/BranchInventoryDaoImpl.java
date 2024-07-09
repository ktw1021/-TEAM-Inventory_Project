package com.inventory.repositories.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.repositories.vo.BranchInventoryVo;

@Repository
public class BranchInventoryDaoImpl implements BranchInventoryDao {

	private final SqlSession sqlSession;
    private static final String namespace = "branch";

    @Autowired
    public BranchInventoryDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
    
    @Override
    public BranchInventoryVo getBranch(String branchId, String bookCode) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("branchId", branchId);
        parameters.put("bookCode", bookCode);
        
        return sqlSession.selectOne("branch.getBranch", parameters);
    }

    @Override
    public void insertBranch(BranchInventoryVo branch) {
        sqlSession.insert(namespace + ".insertBranch", branch);
    }

    @Override
    public BranchInventoryVo getBranchById(int branchId) {
        return sqlSession.selectOne(namespace + ".getBranchById", branchId);
    }

    @Override
    public void updateBranch(BranchInventoryVo branch) {
        sqlSession.update(namespace + ".updateBranch", branch);
    }


    @Override
    public List<BranchInventoryVo> getAllBranches() {
        return sqlSession.selectList(namespace + ".getAllBranches");
    }

    @Override
    public void addBranch(BranchInventoryVo branchInventoryVo) {
        sqlSession.insert("branch.insertBranch", branchInventoryVo);
    }

    @Override
    public void deleteBranch(String branchId, String bookCode) {
        sqlSession.delete("branch.deleteBranch");
    }


	@Override
    public void deleteBranch(int branchId) {
        sqlSession.delete("branch.deleteBranch", branchId);
    }
}