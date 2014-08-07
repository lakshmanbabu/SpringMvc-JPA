package com.admin.portal.Service;

import java.util.List;

import com.admin.portal.Model.Promotions;

public interface PromotionService {

	public void savePromotion(Promotions promotions);

	public List<Promotions> getPromotionsById(Integer userId);

	public Promotions getPromotion(Integer promotionId);

}
