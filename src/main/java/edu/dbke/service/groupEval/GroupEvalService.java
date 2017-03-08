package edu.dbke.service.groupEval;


import edu.dbke.mapper.groupEval.GroupEvalMapper;
import edu.dbke.model.groupEval.GroupEval;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hp on 2016/12/24.
 */
@Service
public class GroupEvalService {

    @Resource
    private GroupEvalMapper groupEvalMapper;

    public List<GroupEval> selectAllT() {

        Example example = new Example(GroupEval.class);
        example.createCriteria()
                .andCondition(" group_eval_question_id is not null")
                .andCondition("status = 1");
        example.setOrderByClause("start_time,end_time desc");
        return groupEvalMapper.selectByExample(example);
    }

    public void insertGroupEval(GroupEval groupEval) {
        groupEvalMapper.insertSelective(groupEval);
    }
}
