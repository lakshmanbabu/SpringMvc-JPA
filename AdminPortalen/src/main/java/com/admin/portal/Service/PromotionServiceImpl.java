package com.admin.portal.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.admin.portal.Model.Promotions;
import com.admin.portal.Repository.PromotionRepository;

@Service
@Transactional
public class PromotionServiceImpl implements PromotionService {

	@Autowired
	public PromotionRepository promotionRepository;
	
	@Override
	public void savePromotion(Promotions promotions) {
		promotionRepository.save(promotions);		
	}

	@Override
	public List<Promotions> getPromotionsById(Integer userId) {
		
		return promotionRepository.findPromotionsById(userId);
	}

	@Override
	public Promotions getPromotion(Integer promotionId) {
		
		return promotionRepository.findOne(promotionId);
	}

}
