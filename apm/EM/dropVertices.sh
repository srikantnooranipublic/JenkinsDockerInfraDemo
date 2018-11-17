/opt/PostgreSQL-9.2.20/bin]./psql -U admin cemdb
delete from appmap_id_mappings where vertex_id > 0;
delete from appmap_model_vertices;
