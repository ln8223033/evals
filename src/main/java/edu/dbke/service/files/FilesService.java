package edu.dbke.service.files;


import edu.dbke.mapper.files.FilesMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;


@Service
public class FilesService {
	@Resource
	private FilesMapper filesMapper;
	
	private Map<String, Object> session;
	


}
