package com.kh.elecshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.elecshop.domain.QuestionVO;
import com.kh.elecshop.mapper.QuestionMapper;

@Service
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private QuestionMapper questionMapper;

	@Override
	public List<QuestionVO> getQuestionList() {
		List<QuestionVO> list = questionMapper.selectQuestionList();
		return list;
	}

	@Override
	public List<QuestionVO> getQuestionTop5() {
		List<QuestionVO> list = questionMapper.selectQuestionTop5();
		return list;
	}
	
}
