package com.kh.elecshop.service;

import java.util.Date;

public interface VisitCountService {
	
	public boolean isDateExist(String vdate);
	
	public boolean increasedCount(String vdate);

}
