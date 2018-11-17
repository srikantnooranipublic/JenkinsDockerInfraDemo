-- appmap
DROP TABLE IF EXISTS appmap_id_mappings, appmap_vertices, appmap_attribs, appmap_edges, appmap_settings,
					 appmap_model_vertices CASCADE;
DROP TABLE IF EXISTS appmap_api_keys;
DROP TABLE IF EXISTS apm_secure_store;
-- /appmap


-- ACA
DROP TABLE aca_audit;
DROP TABLE aca_acl;
DROP TABLE aca_user_group;
DROP TABLE aca_user;
DROP TABLE aca_group;

DROP SEQUENCE sq_aca_acl;

-- /ACA
DROP TABLE IF EXISTS appmap_audit;
