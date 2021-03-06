--
-- The Archetype is configured with "hibernate.hbm2ddl.auto" value="create-drop" in "persistence.xml".
--
-- This will cause hibernate to populate the database when the application is started by processing the files that
-- were configured in the hibernate.hbm2ddl.import_files property.
--
-- This file loads some sample content pages and structured content data.
--

-----------------------------------------------------------------------------------------------------------------------------------
-- SAMPLE STRUCTURED CONTENT DATA  - would typically be entered via the admin
-----------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------
-- 首页幻灯
---------------------------------------------------
-- Content Item
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (100, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, '全新上线', FALSE, FALSE, 1, 'zh_CN', 1);
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (101, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, '史上最强', FALSE, FALSE, 2, 'zh_CN', 1);
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (102, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, '会员尊享 - 满50打9折', FALSE, FALSE, 3, 'zh_CN', 1);

-- Fields
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (1, CURRENT_TIMESTAMP, 'imageUrl', 1, 100, '/cmsstatic/img/slides/buy-one-get-one-home-banner.jpg');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (2, CURRENT_TIMESTAMP, 'targetUrl', 1, 100, '/hot-sauces');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (3, CURRENT_TIMESTAMP, 'imageUrl', 1, 101, '/cmsstatic/img/slides/shirt-special.jpg');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (4, CURRENT_TIMESTAMP, 'targetUrl', 1, 101, '/merchandise');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (5, CURRENT_TIMESTAMP, 'imageUrl', 1, 102, '/cmsstatic/img/slides/member-special.jpg');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (6, CURRENT_TIMESTAMP, 'targetUrl', 1, 102, '/register');

-- Field XREF
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (100, 1, 'imageUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (100, 2, 'targetUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (101, 3, 'imageUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (101, 4, 'targetUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (102, 5, 'imageUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (102, 6, 'targetUrl');


---------------------------------------------------
-- 首页品牌
---------------------------------------------------
-- Content Item
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (110, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, '品牌-统一', FALSE, FALSE, 1, 'zh_CN', 4);
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (111, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, '品牌-康师傅', FALSE, FALSE, 2, 'zh_CN', 4);
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (112, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, '品牌-好丽友', FALSE, FALSE, 3, 'zh_CN', 4);
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (113, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, '品牌-德芙', FALSE, FALSE, 4, 'zh_CN', 4);
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (114, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, '品牌-xxx', FALSE, FALSE, 5, 'zh_CN', 4);
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (115, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, '品牌-yyy', FALSE, FALSE, 6, 'zh_CN', 4);
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (116, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, '品牌-zzz', FALSE, FALSE, 7, 'zh_CN', 4);
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (117, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, '品牌-ttt', FALSE, FALSE, 8, 'zh_CN', 4);

-- Fields
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (11, CURRENT_TIMESTAMP, 'imageUrl' , 1, 110, '/cmsstatic/img/brands/rhs-ad.jpg');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (12, CURRENT_TIMESTAMP, 'targetUrl', 1, 110, '/hot-sauces');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (13, CURRENT_TIMESTAMP, 'imageUrl' , 1, 111, '/cmsstatic/img/brands/rhs-ad.jpg');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (14, CURRENT_TIMESTAMP, 'targetUrl', 1, 111, '/hot-sauces');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (15, CURRENT_TIMESTAMP, 'imageUrl' , 1, 112, '/cmsstatic/img/brands/rhs-ad.jpg');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (16, CURRENT_TIMESTAMP, 'targetUrl', 1, 112, '/hot-sauces');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (17, CURRENT_TIMESTAMP, 'imageUrl' , 1, 113, '/cmsstatic/img/brands/rhs-ad.jpg');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (18, CURRENT_TIMESTAMP, 'targetUrl', 1, 113, '/hot-sauces');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (19, CURRENT_TIMESTAMP, 'imageUrl' , 1, 114, '/cmsstatic/img/brands/rhs-ad.jpg');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (20, CURRENT_TIMESTAMP, 'targetUrl', 1, 114, '/hot-sauces');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (21, CURRENT_TIMESTAMP, 'imageUrl' , 1, 115, '/cmsstatic/img/brands/rhs-ad.jpg');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (22, CURRENT_TIMESTAMP, 'targetUrl', 1, 115, '/hot-sauces');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (23, CURRENT_TIMESTAMP, 'imageUrl' , 1, 116, '/cmsstatic/img/brands/rhs-ad.jpg');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (24, CURRENT_TIMESTAMP, 'targetUrl', 1, 116, '/hot-sauces');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (25, CURRENT_TIMESTAMP, 'imageUrl' , 1, 117, '/cmsstatic/img/brands/rhs-ad.jpg');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (26, CURRENT_TIMESTAMP, 'targetUrl', 1, 117, '/hot-sauces');

-- Field XREF
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (110, 11, 'imageUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (110, 12, 'targetUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (111, 13, 'imageUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (111, 14, 'targetUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (112, 15, 'imageUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (112, 16, 'targetUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (113, 17, 'imageUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (113, 18, 'targetUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (114, 19, 'imageUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (114, 20, 'targetUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (115, 21, 'imageUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (115, 22, 'targetUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (116, 23, 'imageUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (116, 24, 'targetUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (117, 25, 'imageUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (117, 26, 'targetUrl');


------------------------------------------------------------------------------------------------------------------
-- Asset Items (media)
-- ========================================================
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (-101,'image/jpg','FILESYSTEM','/img/slides/buy-one-get-one-home-banner.jpg','买一送一');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (-102,'image/jpg','FILESYSTEM','/img/slides/shirt-special.jpg','衬衣特卖');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (-103,'image/jpg','FILESYSTEM','/img/slides/member-special.jpg','会员尊享');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (-104,'image/jpg','FILESYSTEM','/img/brands/rhs-ad.jpg','右边栏广告');

INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (-100,'/cmsstatic/img/slides/buy-one-get-one-home-banner.jpg','买一送一','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (-101,'/cmsstatic/img/slides/shirt-special.jpg','衬衣特卖','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (-102,'/cmsstatic/img/slides/member-special.jpg','会员尊享','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (-103,'/cmsstatic/img/brands/rhs-ad.jpg','右边栏广告','primary');
