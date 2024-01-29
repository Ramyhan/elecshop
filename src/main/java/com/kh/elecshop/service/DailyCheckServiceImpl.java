package com.kh.elecshop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.elecshop.domain.DailyCheckVO;
import com.kh.elecshop.domain.PointVO;
import com.kh.elecshop.mapper.DailyCheckMapper;
import com.kh.elecshop.mapper.MemberMapper;
import com.kh.elecshop.mapper.PointMapper;

@Service
public class DailyCheckServiceImpl implements DailyCheckService {

	@Autowired
	private DailyCheckMapper dailyCheckMapper;
	
	@Autowired
	private PointMapper pointMapper;
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	@Transactional
	public boolean insertDailyCheck(String mid) {
		Map<String, Object> map = new HashMap<>();
		
		int count = dailyCheckMapper.insertDailyCheck(mid);
		
		PointVO pointVO = PointVO.builder()
				.mid(mid)
				.point_code("AC")
				.ppoint(500)
				.build();
		
		map.put("mid", mid);
		map.put("ppoint", pointVO.getPpoint());
		
		int count2 = pointMapper.insertPoint(pointVO);
		int count3 = memberMapper.updatePoint(map);
		return (count + count2 + count3 == 3) ? true : false;
	}

	@Override
	public List<DailyCheckVO> selectDailyCheck(String mid) {
		List<DailyCheckVO> list = dailyCheckMapper.selectDailyCheck(mid);
	
		return list;
	}

	@Override
	public DailyCheckVO checkDaily(String mid) {
		DailyCheckVO vo = dailyCheckMapper.checkDaily(mid);
		return vo;
	}

}
