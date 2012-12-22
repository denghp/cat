/*
 * Copyright 2012 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package net.noday.cat.service;

import java.util.Map;

import javax.annotation.Resource;

import net.noday.cat.dao.SettingsDao;
import net.noday.core.model.App;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * cat SettingsService
 *
 * @author <a href="http://www.noday.net">Noday</a>
 * @version , 2012-12-20
 * @since 
 */
@Service
public class SettingsService {
	
	@Autowired private SettingsDao dao;
	@Resource private Map<String, Object> appCache;

	public void modifyWebInfo(App app) {
		dao.updateWebInfo(app);
		getCfgs().setWebTitle(app.getWebTitle()).setSubTitle(app.getSubTitle())
			.setHostUrl(app.getHostUrl()).setMetaKeywords(app.getMetaKeywords())
			.setMetaDescription(app.getMetaDescription()).setBoardSource(app.getBoardSource())
			.setHiddenSource(app.getHiddenSource());
	}
	
	public void modifyWebSetting(App app) {
		
	}
	
	public void modifyWebSkin(App app) {
		
	}
	
	public void modifyUserSign(App app) {
		
	}
	
	protected App getCfgs() {
		return (App) appCache.get("cfg");
	}
}