package edu.dbke.service.groupEval;


import edu.dbke.mapper.groupEval.EvalCheckItemMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by hp on 2016/12/24.
 */
@Service
public class EvalCheckItemService {
    @Resource
    private EvalCheckItemMapper evalCheckItemMapper;
}