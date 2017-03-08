package edu.dbke.mapper.basic;


import edu.dbke.model.basic.Student;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;
@Repository
public interface StudentMapper extends Mapper<Student> {
}