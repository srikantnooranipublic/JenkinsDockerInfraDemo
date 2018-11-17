CREATE TABLE APM_AGENT
(
  ID bigserial NOT NULL,
  NAME character varying(200) NOT NULL,
  HOST_NAME character varying(200),
  PROCESS_NAME character varying(200),
  FULLY_QUALIFIED_HOST_NAME character varying(200),
  CREATION_DATE timestamp without time zone NOT NULL,
  UPDATE_DATE timestamp without time zone NOT NULL,
  USER_NAME character varying(200),
  CONSTRAINT AGENT_PKEY PRIMARY KEY (ID)
);

CREATE TABLE APM_EDGE
(
  ID bigserial NOT NULL,
  HEAD_VERTEX_ID bigint NOT NULL,
  TAIL_VERTEX_ID bigint NOT NULL,
  OWNER_ID bigint NOT NULL,
  HEAD_OWNER_ID bigint, 
  TAIL_OWNER_ID bigint,
  TYPE char(2) NOT NULL, 
  PROPERTIES bytea,
  CREATION_DATE timestamp without time zone NOT NULL,
  UPDATE_DATE timestamp without time zone NOT NULL,
  USER_NAME character varying(200) NOT NULL,
  CONSTRAINT EDGE_PKEY PRIMARY KEY (ID)
 
);

CREATE TABLE APM_GEOLOCATION
(
  ip_start numeric(20) NOT NULL,
  ip_end numeric(20) NOT NULL,
  country varchar(100) NOT NULL,
  stateprov varchar(100),
  city varchar(100),
  version numeric(10) NOT NULL,
  PRIMARY KEY (ip_start)
);

CREATE TABLE APM_GEOLOCATION_METADATA
(
  version numeric(10) NOT NULL,
  import_start_time timestamp with time zone NOT NULL,
  import_end_time timestamp with time zone,
  imported_file_name VARCHAR(100),
  processed_rows numeric(10),
  valid_rows numeric(10),
  invalid_rows numeric(10),
  import_successful bool NOT NULL,
  PRIMARY KEY (version)
);

CREATE TABLE APM_METRIC_PATH
(
  ID bigserial NOT NULL,
  METRIC_PATH character varying(2000) NOT NULL,
  VERTEX_ID bigint NOT NULL,
  CREATION_DATE timestamp without time zone NOT NULL,
  UPDATE_DATE timestamp without time zone NOT NULL,
  USER_NAME character varying(200) NOT NULL,
  CONSTRAINT METRIC_PATH_PKEY PRIMARY KEY (ID)
  
);


CREATE TABLE APM_OWNER
(
  ID bigserial NOT NULL,
  NAME character varying(200) NOT NULL,
  TRANSACTION_ID numeric,
  TYPE character varying(30) NOT NULL, 
  CREATION_DATE timestamp without time zone NOT NULL,
  UPDATE_DATE timestamp without time zone NOT NULL,
  USER_NAME character varying(200) NOT NULL,
  CONSTRAINT ID PRIMARY KEY (ID)
);


CREATE TABLE APM_VERTEX
(
  ID bigserial NOT NULL,
  NAME character varying(2000) NOT NULL,
  ABSTRACTION_LEVEL character(1) NOT NULL,
  HIERARCHY_LEVEL character varying(200) NOT NULL,
  PROPERTIES bytea,
  CREATION_DATE timestamp without time zone NOT NULL,
  UPDATE_DATE timestamp without time zone NOT NULL,
  USER_NAME character varying(200) NOT NULL,
  PARENT_ID bigint,
  AGENT_ID bigint,
  VERTEX_TYPE_ID integer NOT NULL,
  CONSTRAINT VERTEX_PKEY PRIMARY KEY (ID)
);


CREATE TABLE APM_VERTEX_TYPE
(
  ID serial NOT NULL,
  NAME character varying(200) NOT NULL,
  CREATION_DATE timestamp without time zone NOT NULL,
  UPDATE_DATE timestamp without time zone NOT NULL,
  USER_NAME character varying(200) NOT NULL,
  CONSTRAINT VERTEX_TYPE_PKEY PRIMARY KEY (ID)
);


CREATE TABLE APM_VERTEX_LOGICAL_EQUIVALENCE
(
  FROM_VERTEX_ID bigint NOT NULL,
  TO_VERTEX_ID bigint NOT NULL,
  CREATION_DATE timestamp without time zone NOT NULL,
  UPDATE_DATE timestamp without time zone NOT NULL,
  USER_NAME character varying(200) NOT NULL
);

