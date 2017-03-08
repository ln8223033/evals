package edu.dbke.service.babic;


import edu.dbke.mapper.basic.ClassMapper;
import edu.dbke.model.basic.Class;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hp on 2016/12/24.
 */
@Service
public class ClassService {
    @Resource
    private ClassMapper classMapper;

    public List<Class> getClassList() {
        return classMapper.selectAll();

    }
    public void insert(Class c){
        classMapper.insertSelective(c);
    }
}

