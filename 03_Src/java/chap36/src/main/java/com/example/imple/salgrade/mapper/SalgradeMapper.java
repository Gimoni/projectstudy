package com.example.imple.salgrade.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.imple.dept.model.Dept;
import com.example.imple.emp.model.Emp;
import com.example.imple.salgrade.model.Salgrade;

@Mapper
public interface SalgradeMapper {
	
	@Select("""
			select * 
			  from dept, 
			 where deptno
			""")
	Dept selectDept(int depntno);
	
	@Select("select * from emp")
	List<Emp> selectAll();
	
	@Select("select count(*) from salgrade")
	int countsalgradeAll();
	
	@Select("select * from salgrade")
	List<Salgrade> selectSalgradeAll();

	Object selectSalgradeAll(Integer key);
		

}
