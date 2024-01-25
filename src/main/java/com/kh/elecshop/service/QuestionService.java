package com.kh.elecshop.service;

import java.util.List;

import com.kh.elecshop.domain.QuestionVO;

public interface QuestionService {
	public List<QuestionVO> getQuestionList();
	public List<QuestionVO> getQuestionTop5();
}
