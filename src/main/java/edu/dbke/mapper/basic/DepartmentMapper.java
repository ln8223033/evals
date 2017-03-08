package edu.dbke.mapper.basic;


import edu.dbke.model.basic.Department;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;
@Repository
public interface DepartmentMapper extends Mapper<Department> {
}