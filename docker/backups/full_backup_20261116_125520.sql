--
-- PostgreSQL database cluster dump
--

\restrict resweu2msv6DrztrnrrajGmFauMkVcac9KIWHYEuEd5edRvnJeYZuAOzH7fEwZT

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE flowable;
ALTER ROLE flowable WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:VGio2TUS70ug4K4xCCnWwQ==$fLSc+br5/D3z0/H3y/8iGUZtV72Jdh3RkMUrln58E6o=:W8IVqeO4vZervHHvlw+bNtKxm+Fbizh2w1z8rqSq9R0=';

--
-- User Configurations
--








\unrestrict resweu2msv6DrztrnrrajGmFauMkVcac9KIWHYEuEd5edRvnJeYZuAOzH7fEwZT

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict bsw67OUcDnrIVkAIPbc5aJIHDefCpz0jTVM5kohV4LVT6mcqI9wQMxl6fD1cbTI

-- Dumped from database version 15.20 (Debian 15.20-1.pgdg13+1)
-- Dumped by pg_dump version 15.20 (Debian 15.20-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict bsw67OUcDnrIVkAIPbc5aJIHDefCpz0jTVM5kohV4LVT6mcqI9wQMxl6fD1cbTI

--
-- Database "flowable" dump
--

--
-- PostgreSQL database dump
--

\restrict aftRDFdLlkPzSTq4RXQhqkGAZ7ePZDyPhJfIlvWbGahHNxhSNNb2nULPp0lZHjJ

-- Dumped from database version 15.20 (Debian 15.20-1.pgdg13+1)
-- Dumped by pg_dump version 15.20 (Debian 15.20-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: flowable; Type: DATABASE; Schema: -; Owner: flowable
--

CREATE DATABASE flowable WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE flowable OWNER TO flowable;

\unrestrict aftRDFdLlkPzSTq4RXQhqkGAZ7ePZDyPhJfIlvWbGahHNxhSNNb2nULPp0lZHjJ
\connect flowable
\restrict aftRDFdLlkPzSTq4RXQhqkGAZ7ePZDyPhJfIlvWbGahHNxhSNNb2nULPp0lZHjJ

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: act_adm_databasechangelog; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_adm_databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.act_adm_databasechangelog OWNER TO flowable;

--
-- Name: act_adm_databasechangeloglock; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_adm_databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.act_adm_databasechangeloglock OWNER TO flowable;

--
-- Name: act_adm_server_config; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_adm_server_config (
    id_ character varying(255) NOT NULL,
    name_ character varying(50),
    description_ character varying(255),
    server_address_ character varying(100),
    port_ integer,
    context_root_ character varying(100),
    rest_root_ character varying(100),
    user_name_ character varying(100),
    password_ character varying(100),
    endpoint_type_ integer,
    tenant_id_ character varying(50)
);


ALTER TABLE public.act_adm_server_config OWNER TO flowable;

--
-- Name: act_app_appdef; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_app_appdef (
    id_ character varying(255) NOT NULL,
    rev_ integer NOT NULL,
    name_ character varying(255),
    key_ character varying(255) NOT NULL,
    version_ integer NOT NULL,
    category_ character varying(255),
    deployment_id_ character varying(255),
    resource_name_ character varying(4000),
    description_ character varying(4000),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.act_app_appdef OWNER TO flowable;

--
-- Name: act_app_databasechangelog; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_app_databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.act_app_databasechangelog OWNER TO flowable;

--
-- Name: act_app_databasechangeloglock; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_app_databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.act_app_databasechangeloglock OWNER TO flowable;

--
-- Name: act_app_deployment; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_app_deployment (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    category_ character varying(255),
    key_ character varying(255),
    deploy_time_ timestamp without time zone,
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.act_app_deployment OWNER TO flowable;

--
-- Name: act_app_deployment_resource; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_app_deployment_resource (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    deployment_id_ character varying(255),
    resource_bytes_ bytea
);


ALTER TABLE public.act_app_deployment_resource OWNER TO flowable;

--
-- Name: act_cmmn_casedef; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_cmmn_casedef (
    id_ character varying(255) NOT NULL,
    rev_ integer NOT NULL,
    name_ character varying(255),
    key_ character varying(255) NOT NULL,
    version_ integer NOT NULL,
    category_ character varying(255),
    deployment_id_ character varying(255),
    resource_name_ character varying(4000),
    description_ character varying(4000),
    has_graphical_notation_ boolean,
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    dgrm_resource_name_ character varying(4000),
    has_start_form_key_ boolean
);


ALTER TABLE public.act_cmmn_casedef OWNER TO flowable;

--
-- Name: act_cmmn_databasechangelog; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_cmmn_databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.act_cmmn_databasechangelog OWNER TO flowable;

--
-- Name: act_cmmn_databasechangeloglock; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_cmmn_databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.act_cmmn_databasechangeloglock OWNER TO flowable;

--
-- Name: act_cmmn_deployment; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_cmmn_deployment (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    category_ character varying(255),
    key_ character varying(255),
    deploy_time_ timestamp without time zone,
    parent_deployment_id_ character varying(255),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.act_cmmn_deployment OWNER TO flowable;

--
-- Name: act_cmmn_deployment_resource; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_cmmn_deployment_resource (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    deployment_id_ character varying(255),
    resource_bytes_ bytea,
    generated_ boolean
);


ALTER TABLE public.act_cmmn_deployment_resource OWNER TO flowable;

--
-- Name: act_cmmn_hi_case_inst; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_cmmn_hi_case_inst (
    id_ character varying(255) NOT NULL,
    rev_ integer NOT NULL,
    business_key_ character varying(255),
    name_ character varying(255),
    parent_id_ character varying(255),
    case_def_id_ character varying(255),
    state_ character varying(255),
    start_time_ timestamp without time zone,
    end_time_ timestamp without time zone,
    start_user_id_ character varying(255),
    callback_id_ character varying(255),
    callback_type_ character varying(255),
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    reference_id_ character varying(255),
    reference_type_ character varying(255),
    last_reactivation_time_ timestamp(3) without time zone,
    last_reactivation_user_id_ character varying(255),
    business_status_ character varying(255)
);


ALTER TABLE public.act_cmmn_hi_case_inst OWNER TO flowable;

--
-- Name: act_cmmn_hi_mil_inst; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_cmmn_hi_mil_inst (
    id_ character varying(255) NOT NULL,
    rev_ integer NOT NULL,
    name_ character varying(255) NOT NULL,
    time_stamp_ timestamp without time zone NOT NULL,
    case_inst_id_ character varying(255) NOT NULL,
    case_def_id_ character varying(255) NOT NULL,
    element_id_ character varying(255) NOT NULL,
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.act_cmmn_hi_mil_inst OWNER TO flowable;

--
-- Name: act_cmmn_hi_plan_item_inst; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_cmmn_hi_plan_item_inst (
    id_ character varying(255) NOT NULL,
    rev_ integer NOT NULL,
    name_ character varying(255),
    state_ character varying(255),
    case_def_id_ character varying(255),
    case_inst_id_ character varying(255),
    stage_inst_id_ character varying(255),
    is_stage_ boolean,
    element_id_ character varying(255),
    item_definition_id_ character varying(255),
    item_definition_type_ character varying(255),
    create_time_ timestamp without time zone,
    last_available_time_ timestamp without time zone,
    last_enabled_time_ timestamp without time zone,
    last_disabled_time_ timestamp without time zone,
    last_started_time_ timestamp without time zone,
    last_suspended_time_ timestamp without time zone,
    completed_time_ timestamp without time zone,
    occurred_time_ timestamp without time zone,
    terminated_time_ timestamp without time zone,
    exit_time_ timestamp without time zone,
    ended_time_ timestamp without time zone,
    last_updated_time_ timestamp without time zone,
    start_user_id_ character varying(255),
    reference_id_ character varying(255),
    reference_type_ character varying(255),
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    entry_criterion_id_ character varying(255),
    exit_criterion_id_ character varying(255),
    show_in_overview_ boolean,
    extra_value_ character varying(255),
    derived_case_def_id_ character varying(255),
    last_unavailable_time_ timestamp(3) without time zone
);


ALTER TABLE public.act_cmmn_hi_plan_item_inst OWNER TO flowable;

--
-- Name: act_cmmn_ru_case_inst; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_cmmn_ru_case_inst (
    id_ character varying(255) NOT NULL,
    rev_ integer NOT NULL,
    business_key_ character varying(255),
    name_ character varying(255),
    parent_id_ character varying(255),
    case_def_id_ character varying(255),
    state_ character varying(255),
    start_time_ timestamp without time zone,
    start_user_id_ character varying(255),
    callback_id_ character varying(255),
    callback_type_ character varying(255),
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    lock_time_ timestamp without time zone,
    is_completeable_ boolean,
    reference_id_ character varying(255),
    reference_type_ character varying(255),
    lock_owner_ character varying(255),
    last_reactivation_time_ timestamp(3) without time zone,
    last_reactivation_user_id_ character varying(255),
    business_status_ character varying(255)
);


ALTER TABLE public.act_cmmn_ru_case_inst OWNER TO flowable;

--
-- Name: act_cmmn_ru_mil_inst; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_cmmn_ru_mil_inst (
    id_ character varying(255) NOT NULL,
    name_ character varying(255) NOT NULL,
    time_stamp_ timestamp without time zone NOT NULL,
    case_inst_id_ character varying(255) NOT NULL,
    case_def_id_ character varying(255) NOT NULL,
    element_id_ character varying(255) NOT NULL,
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.act_cmmn_ru_mil_inst OWNER TO flowable;

--
-- Name: act_cmmn_ru_plan_item_inst; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_cmmn_ru_plan_item_inst (
    id_ character varying(255) NOT NULL,
    rev_ integer NOT NULL,
    case_def_id_ character varying(255),
    case_inst_id_ character varying(255),
    stage_inst_id_ character varying(255),
    is_stage_ boolean,
    element_id_ character varying(255),
    name_ character varying(255),
    state_ character varying(255),
    create_time_ timestamp without time zone,
    start_user_id_ character varying(255),
    reference_id_ character varying(255),
    reference_type_ character varying(255),
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    item_definition_id_ character varying(255),
    item_definition_type_ character varying(255),
    is_completeable_ boolean,
    is_count_enabled_ boolean,
    var_count_ integer,
    sentry_part_inst_count_ integer,
    last_available_time_ timestamp(3) without time zone,
    last_enabled_time_ timestamp(3) without time zone,
    last_disabled_time_ timestamp(3) without time zone,
    last_started_time_ timestamp(3) without time zone,
    last_suspended_time_ timestamp(3) without time zone,
    completed_time_ timestamp(3) without time zone,
    occurred_time_ timestamp(3) without time zone,
    terminated_time_ timestamp(3) without time zone,
    exit_time_ timestamp(3) without time zone,
    ended_time_ timestamp(3) without time zone,
    entry_criterion_id_ character varying(255),
    exit_criterion_id_ character varying(255),
    extra_value_ character varying(255),
    derived_case_def_id_ character varying(255),
    last_unavailable_time_ timestamp(3) without time zone
);


ALTER TABLE public.act_cmmn_ru_plan_item_inst OWNER TO flowable;

--
-- Name: act_cmmn_ru_sentry_part_inst; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_cmmn_ru_sentry_part_inst (
    id_ character varying(255) NOT NULL,
    rev_ integer NOT NULL,
    case_def_id_ character varying(255),
    case_inst_id_ character varying(255),
    plan_item_inst_id_ character varying(255),
    on_part_id_ character varying(255),
    if_part_id_ character varying(255),
    time_stamp_ timestamp without time zone
);


ALTER TABLE public.act_cmmn_ru_sentry_part_inst OWNER TO flowable;

--
-- Name: act_co_content_item; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_co_content_item (
    id_ character varying(255) NOT NULL,
    name_ character varying(255) NOT NULL,
    mime_type_ character varying(255),
    task_id_ character varying(255),
    proc_inst_id_ character varying(255),
    content_store_id_ character varying(255),
    content_store_name_ character varying(255),
    field_ character varying(400),
    content_available_ boolean DEFAULT false,
    created_ timestamp(6) without time zone,
    created_by_ character varying(255),
    last_modified_ timestamp(6) without time zone,
    last_modified_by_ character varying(255),
    content_size_ bigint DEFAULT 0,
    tenant_id_ character varying(255),
    scope_id_ character varying(255),
    scope_type_ character varying(255)
);


ALTER TABLE public.act_co_content_item OWNER TO flowable;

--
-- Name: act_co_databasechangelog; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_co_databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.act_co_databasechangelog OWNER TO flowable;

--
-- Name: act_co_databasechangeloglock; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_co_databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.act_co_databasechangeloglock OWNER TO flowable;

--
-- Name: act_de_databasechangelog; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_de_databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.act_de_databasechangelog OWNER TO flowable;

--
-- Name: act_de_databasechangeloglock; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_de_databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.act_de_databasechangeloglock OWNER TO flowable;

--
-- Name: act_de_model; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_de_model (
    id character varying(255) NOT NULL,
    name character varying(400) NOT NULL,
    model_key character varying(400) NOT NULL,
    description character varying(4000),
    model_comment character varying(4000),
    created timestamp(6) without time zone,
    created_by character varying(255),
    last_updated timestamp(6) without time zone,
    last_updated_by character varying(255),
    version integer,
    model_editor_json text,
    thumbnail bytea,
    model_type integer,
    tenant_id character varying(255)
);


ALTER TABLE public.act_de_model OWNER TO flowable;

--
-- Name: act_de_model_history; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_de_model_history (
    id character varying(255) NOT NULL,
    name character varying(400) NOT NULL,
    model_key character varying(400) NOT NULL,
    description character varying(4000),
    model_comment character varying(4000),
    created timestamp(6) without time zone,
    created_by character varying(255),
    last_updated timestamp(6) without time zone,
    last_updated_by character varying(255),
    removal_date timestamp(6) without time zone,
    version integer,
    model_editor_json text,
    model_id character varying(255) NOT NULL,
    model_type integer,
    tenant_id character varying(255)
);


ALTER TABLE public.act_de_model_history OWNER TO flowable;

--
-- Name: act_de_model_relation; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_de_model_relation (
    id character varying(255) NOT NULL,
    parent_model_id character varying(255),
    model_id character varying(255),
    relation_type character varying(255)
);


ALTER TABLE public.act_de_model_relation OWNER TO flowable;

--
-- Name: act_dmn_databasechangelog; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_dmn_databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.act_dmn_databasechangelog OWNER TO flowable;

--
-- Name: act_dmn_databasechangeloglock; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_dmn_databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.act_dmn_databasechangeloglock OWNER TO flowable;

--
-- Name: act_dmn_decision; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_dmn_decision (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    version_ integer,
    key_ character varying(255),
    category_ character varying(255),
    deployment_id_ character varying(255),
    tenant_id_ character varying(255),
    resource_name_ character varying(255),
    description_ character varying(255),
    decision_type_ character varying(255)
);


ALTER TABLE public.act_dmn_decision OWNER TO flowable;

--
-- Name: act_dmn_deployment; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_dmn_deployment (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    category_ character varying(255),
    deploy_time_ timestamp without time zone,
    tenant_id_ character varying(255),
    parent_deployment_id_ character varying(255)
);


ALTER TABLE public.act_dmn_deployment OWNER TO flowable;

--
-- Name: act_dmn_deployment_resource; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_dmn_deployment_resource (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    deployment_id_ character varying(255),
    resource_bytes_ bytea
);


ALTER TABLE public.act_dmn_deployment_resource OWNER TO flowable;

--
-- Name: act_dmn_hi_decision_execution; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_dmn_hi_decision_execution (
    id_ character varying(255) NOT NULL,
    decision_definition_id_ character varying(255),
    deployment_id_ character varying(255),
    start_time_ timestamp without time zone,
    end_time_ timestamp without time zone,
    instance_id_ character varying(255),
    execution_id_ character varying(255),
    activity_id_ character varying(255),
    failed_ boolean DEFAULT false,
    tenant_id_ character varying(255),
    execution_json_ text,
    scope_type_ character varying(255)
);


ALTER TABLE public.act_dmn_hi_decision_execution OWNER TO flowable;

--
-- Name: act_evt_log; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_evt_log (
    log_nr_ integer NOT NULL,
    type_ character varying(64),
    proc_def_id_ character varying(64),
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    task_id_ character varying(64),
    time_stamp_ timestamp without time zone NOT NULL,
    user_id_ character varying(255),
    data_ bytea,
    lock_owner_ character varying(255),
    lock_time_ timestamp without time zone,
    is_processed_ smallint DEFAULT 0
);


ALTER TABLE public.act_evt_log OWNER TO flowable;

--
-- Name: act_evt_log_log_nr__seq; Type: SEQUENCE; Schema: public; Owner: flowable
--

CREATE SEQUENCE public.act_evt_log_log_nr__seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.act_evt_log_log_nr__seq OWNER TO flowable;

--
-- Name: act_evt_log_log_nr__seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flowable
--

ALTER SEQUENCE public.act_evt_log_log_nr__seq OWNED BY public.act_evt_log.log_nr_;


--
-- Name: act_fo_databasechangelog; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_fo_databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.act_fo_databasechangelog OWNER TO flowable;

--
-- Name: act_fo_databasechangeloglock; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_fo_databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.act_fo_databasechangeloglock OWNER TO flowable;

--
-- Name: act_fo_form_definition; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_fo_form_definition (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    version_ integer,
    key_ character varying(255),
    category_ character varying(255),
    deployment_id_ character varying(255),
    tenant_id_ character varying(255),
    resource_name_ character varying(255),
    description_ character varying(255)
);


ALTER TABLE public.act_fo_form_definition OWNER TO flowable;

--
-- Name: act_fo_form_deployment; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_fo_form_deployment (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    category_ character varying(255),
    deploy_time_ timestamp without time zone,
    tenant_id_ character varying(255),
    parent_deployment_id_ character varying(255)
);


ALTER TABLE public.act_fo_form_deployment OWNER TO flowable;

--
-- Name: act_fo_form_instance; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_fo_form_instance (
    id_ character varying(255) NOT NULL,
    form_definition_id_ character varying(255) NOT NULL,
    task_id_ character varying(255),
    proc_inst_id_ character varying(255),
    proc_def_id_ character varying(255),
    submitted_date_ timestamp without time zone,
    submitted_by_ character varying(255),
    form_values_id_ character varying(255),
    tenant_id_ character varying(255),
    scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255)
);


ALTER TABLE public.act_fo_form_instance OWNER TO flowable;

--
-- Name: act_fo_form_resource; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_fo_form_resource (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    deployment_id_ character varying(255),
    resource_bytes_ bytea
);


ALTER TABLE public.act_fo_form_resource OWNER TO flowable;

--
-- Name: act_ge_bytearray; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_ge_bytearray (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    name_ character varying(255),
    deployment_id_ character varying(64),
    bytes_ bytea,
    generated_ boolean
);


ALTER TABLE public.act_ge_bytearray OWNER TO flowable;

--
-- Name: act_ge_property; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_ge_property (
    name_ character varying(64) NOT NULL,
    value_ character varying(300),
    rev_ integer
);


ALTER TABLE public.act_ge_property OWNER TO flowable;

--
-- Name: act_hi_actinst; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_hi_actinst (
    id_ character varying(64) NOT NULL,
    rev_ integer DEFAULT 1,
    proc_def_id_ character varying(64) NOT NULL,
    proc_inst_id_ character varying(64) NOT NULL,
    execution_id_ character varying(64) NOT NULL,
    act_id_ character varying(255) NOT NULL,
    task_id_ character varying(64),
    call_proc_inst_id_ character varying(64),
    act_name_ character varying(255),
    act_type_ character varying(255) NOT NULL,
    assignee_ character varying(255),
    start_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone,
    transaction_order_ integer,
    duration_ bigint,
    delete_reason_ character varying(4000),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.act_hi_actinst OWNER TO flowable;

--
-- Name: act_hi_attachment; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_hi_attachment (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    user_id_ character varying(255),
    name_ character varying(255),
    description_ character varying(4000),
    type_ character varying(255),
    task_id_ character varying(64),
    proc_inst_id_ character varying(64),
    url_ character varying(4000),
    content_id_ character varying(64),
    time_ timestamp without time zone
);


ALTER TABLE public.act_hi_attachment OWNER TO flowable;

--
-- Name: act_hi_comment; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_hi_comment (
    id_ character varying(64) NOT NULL,
    type_ character varying(255),
    time_ timestamp without time zone NOT NULL,
    user_id_ character varying(255),
    task_id_ character varying(64),
    proc_inst_id_ character varying(64),
    action_ character varying(255),
    message_ character varying(4000),
    full_msg_ bytea
);


ALTER TABLE public.act_hi_comment OWNER TO flowable;

--
-- Name: act_hi_detail; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_hi_detail (
    id_ character varying(64) NOT NULL,
    type_ character varying(255) NOT NULL,
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    task_id_ character varying(64),
    act_inst_id_ character varying(64),
    name_ character varying(255) NOT NULL,
    var_type_ character varying(64),
    rev_ integer,
    time_ timestamp without time zone NOT NULL,
    bytearray_id_ character varying(64),
    double_ double precision,
    long_ bigint,
    text_ character varying(4000),
    text2_ character varying(4000)
);


ALTER TABLE public.act_hi_detail OWNER TO flowable;

--
-- Name: act_hi_entitylink; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_hi_entitylink (
    id_ character varying(64) NOT NULL,
    link_type_ character varying(255),
    create_time_ timestamp without time zone,
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255),
    parent_element_id_ character varying(255),
    ref_scope_id_ character varying(255),
    ref_scope_type_ character varying(255),
    ref_scope_definition_id_ character varying(255),
    root_scope_id_ character varying(255),
    root_scope_type_ character varying(255),
    hierarchy_type_ character varying(255)
);


ALTER TABLE public.act_hi_entitylink OWNER TO flowable;

--
-- Name: act_hi_identitylink; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_hi_identitylink (
    id_ character varying(64) NOT NULL,
    group_id_ character varying(255),
    type_ character varying(255),
    user_id_ character varying(255),
    task_id_ character varying(64),
    create_time_ timestamp without time zone,
    proc_inst_id_ character varying(64),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255)
);


ALTER TABLE public.act_hi_identitylink OWNER TO flowable;

--
-- Name: act_hi_procinst; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_hi_procinst (
    id_ character varying(64) NOT NULL,
    rev_ integer DEFAULT 1,
    proc_inst_id_ character varying(64) NOT NULL,
    business_key_ character varying(255),
    proc_def_id_ character varying(64) NOT NULL,
    start_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone,
    duration_ bigint,
    start_user_id_ character varying(255),
    start_act_id_ character varying(255),
    end_act_id_ character varying(255),
    super_process_instance_id_ character varying(64),
    delete_reason_ character varying(4000),
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    name_ character varying(255),
    callback_id_ character varying(255),
    callback_type_ character varying(255),
    reference_id_ character varying(255),
    reference_type_ character varying(255),
    propagated_stage_inst_id_ character varying(255),
    business_status_ character varying(255)
);


ALTER TABLE public.act_hi_procinst OWNER TO flowable;

--
-- Name: act_hi_taskinst; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_hi_taskinst (
    id_ character varying(64) NOT NULL,
    rev_ integer DEFAULT 1,
    proc_def_id_ character varying(64),
    task_def_id_ character varying(64),
    task_def_key_ character varying(255),
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255),
    propagated_stage_inst_id_ character varying(255),
    name_ character varying(255),
    parent_task_id_ character varying(64),
    description_ character varying(4000),
    owner_ character varying(255),
    assignee_ character varying(255),
    start_time_ timestamp without time zone NOT NULL,
    claim_time_ timestamp without time zone,
    end_time_ timestamp without time zone,
    duration_ bigint,
    delete_reason_ character varying(4000),
    priority_ integer,
    due_date_ timestamp without time zone,
    form_key_ character varying(255),
    category_ character varying(255),
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    last_updated_time_ timestamp without time zone
);


ALTER TABLE public.act_hi_taskinst OWNER TO flowable;

--
-- Name: act_hi_tsk_log; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_hi_tsk_log (
    id_ integer NOT NULL,
    type_ character varying(64),
    task_id_ character varying(64) NOT NULL,
    time_stamp_ timestamp without time zone NOT NULL,
    user_id_ character varying(255),
    data_ character varying(4000),
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    proc_def_id_ character varying(64),
    scope_id_ character varying(255),
    scope_definition_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.act_hi_tsk_log OWNER TO flowable;

--
-- Name: act_hi_tsk_log_id__seq; Type: SEQUENCE; Schema: public; Owner: flowable
--

CREATE SEQUENCE public.act_hi_tsk_log_id__seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.act_hi_tsk_log_id__seq OWNER TO flowable;

--
-- Name: act_hi_tsk_log_id__seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flowable
--

ALTER SEQUENCE public.act_hi_tsk_log_id__seq OWNED BY public.act_hi_tsk_log.id_;


--
-- Name: act_hi_varinst; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_hi_varinst (
    id_ character varying(64) NOT NULL,
    rev_ integer DEFAULT 1,
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    task_id_ character varying(64),
    name_ character varying(255) NOT NULL,
    var_type_ character varying(100),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    bytearray_id_ character varying(64),
    double_ double precision,
    long_ bigint,
    text_ character varying(4000),
    text2_ character varying(4000),
    create_time_ timestamp without time zone,
    last_updated_time_ timestamp without time zone
);


ALTER TABLE public.act_hi_varinst OWNER TO flowable;

--
-- Name: act_id_bytearray; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_id_bytearray (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    name_ character varying(255),
    bytes_ bytea
);


ALTER TABLE public.act_id_bytearray OWNER TO flowable;

--
-- Name: act_id_group; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_id_group (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    name_ character varying(255),
    type_ character varying(255)
);


ALTER TABLE public.act_id_group OWNER TO flowable;

--
-- Name: act_id_info; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_id_info (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    user_id_ character varying(64),
    type_ character varying(64),
    key_ character varying(255),
    value_ character varying(255),
    password_ bytea,
    parent_id_ character varying(255)
);


ALTER TABLE public.act_id_info OWNER TO flowable;

--
-- Name: act_id_membership; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_id_membership (
    user_id_ character varying(64) NOT NULL,
    group_id_ character varying(64) NOT NULL
);


ALTER TABLE public.act_id_membership OWNER TO flowable;

--
-- Name: act_id_priv; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_id_priv (
    id_ character varying(64) NOT NULL,
    name_ character varying(255) NOT NULL
);


ALTER TABLE public.act_id_priv OWNER TO flowable;

--
-- Name: act_id_priv_mapping; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_id_priv_mapping (
    id_ character varying(64) NOT NULL,
    priv_id_ character varying(64) NOT NULL,
    user_id_ character varying(255),
    group_id_ character varying(255)
);


ALTER TABLE public.act_id_priv_mapping OWNER TO flowable;

--
-- Name: act_id_property; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_id_property (
    name_ character varying(64) NOT NULL,
    value_ character varying(300),
    rev_ integer
);


ALTER TABLE public.act_id_property OWNER TO flowable;

--
-- Name: act_id_token; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_id_token (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    token_value_ character varying(255),
    token_date_ timestamp without time zone,
    ip_address_ character varying(255),
    user_agent_ character varying(255),
    user_id_ character varying(255),
    token_data_ character varying(2000)
);


ALTER TABLE public.act_id_token OWNER TO flowable;

--
-- Name: act_id_user; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_id_user (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    first_ character varying(255),
    last_ character varying(255),
    display_name_ character varying(255),
    email_ character varying(255),
    pwd_ character varying(255),
    picture_id_ character varying(64),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.act_id_user OWNER TO flowable;

--
-- Name: act_procdef_info; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_procdef_info (
    id_ character varying(64) NOT NULL,
    proc_def_id_ character varying(64) NOT NULL,
    rev_ integer,
    info_json_id_ character varying(64)
);


ALTER TABLE public.act_procdef_info OWNER TO flowable;

--
-- Name: act_re_deployment; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_re_deployment (
    id_ character varying(64) NOT NULL,
    name_ character varying(255),
    category_ character varying(255),
    key_ character varying(255),
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    deploy_time_ timestamp without time zone,
    derived_from_ character varying(64),
    derived_from_root_ character varying(64),
    parent_deployment_id_ character varying(255),
    engine_version_ character varying(255)
);


ALTER TABLE public.act_re_deployment OWNER TO flowable;

--
-- Name: act_re_model; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_re_model (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    name_ character varying(255),
    key_ character varying(255),
    category_ character varying(255),
    create_time_ timestamp without time zone,
    last_update_time_ timestamp without time zone,
    version_ integer,
    meta_info_ character varying(4000),
    deployment_id_ character varying(64),
    editor_source_value_id_ character varying(64),
    editor_source_extra_value_id_ character varying(64),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.act_re_model OWNER TO flowable;

--
-- Name: act_re_procdef; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_re_procdef (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    name_ character varying(255),
    key_ character varying(255) NOT NULL,
    version_ integer NOT NULL,
    deployment_id_ character varying(64),
    resource_name_ character varying(4000),
    dgrm_resource_name_ character varying(4000),
    description_ character varying(4000),
    has_start_form_key_ boolean,
    has_graphical_notation_ boolean,
    suspension_state_ integer,
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    derived_from_ character varying(64),
    derived_from_root_ character varying(64),
    derived_version_ integer DEFAULT 0 NOT NULL,
    engine_version_ character varying(255)
);


ALTER TABLE public.act_re_procdef OWNER TO flowable;

--
-- Name: act_ru_actinst; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_ru_actinst (
    id_ character varying(64) NOT NULL,
    rev_ integer DEFAULT 1,
    proc_def_id_ character varying(64) NOT NULL,
    proc_inst_id_ character varying(64) NOT NULL,
    execution_id_ character varying(64) NOT NULL,
    act_id_ character varying(255) NOT NULL,
    task_id_ character varying(64),
    call_proc_inst_id_ character varying(64),
    act_name_ character varying(255),
    act_type_ character varying(255) NOT NULL,
    assignee_ character varying(255),
    start_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone,
    duration_ bigint,
    transaction_order_ integer,
    delete_reason_ character varying(4000),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.act_ru_actinst OWNER TO flowable;

--
-- Name: act_ru_deadletter_job; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_ru_deadletter_job (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    type_ character varying(255) NOT NULL,
    exclusive_ boolean,
    execution_id_ character varying(64),
    process_instance_id_ character varying(64),
    proc_def_id_ character varying(64),
    element_id_ character varying(255),
    element_name_ character varying(255),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255),
    correlation_id_ character varying(255),
    exception_stack_id_ character varying(64),
    exception_msg_ character varying(4000),
    duedate_ timestamp without time zone,
    repeat_ character varying(255),
    handler_type_ character varying(255),
    handler_cfg_ character varying(4000),
    custom_values_id_ character varying(64),
    create_time_ timestamp without time zone,
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.act_ru_deadletter_job OWNER TO flowable;

--
-- Name: act_ru_entitylink; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_ru_entitylink (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    create_time_ timestamp without time zone,
    link_type_ character varying(255),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255),
    parent_element_id_ character varying(255),
    ref_scope_id_ character varying(255),
    ref_scope_type_ character varying(255),
    ref_scope_definition_id_ character varying(255),
    root_scope_id_ character varying(255),
    root_scope_type_ character varying(255),
    hierarchy_type_ character varying(255)
);


ALTER TABLE public.act_ru_entitylink OWNER TO flowable;

--
-- Name: act_ru_event_subscr; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_ru_event_subscr (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    event_type_ character varying(255) NOT NULL,
    event_name_ character varying(255),
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    activity_id_ character varying(64),
    configuration_ character varying(255),
    created_ timestamp without time zone NOT NULL,
    proc_def_id_ character varying(64),
    sub_scope_id_ character varying(64),
    scope_id_ character varying(64),
    scope_definition_id_ character varying(64),
    scope_type_ character varying(64),
    lock_time_ timestamp without time zone,
    lock_owner_ character varying(255),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.act_ru_event_subscr OWNER TO flowable;

--
-- Name: act_ru_execution; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_ru_execution (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    proc_inst_id_ character varying(64),
    business_key_ character varying(255),
    parent_id_ character varying(64),
    proc_def_id_ character varying(64),
    super_exec_ character varying(64),
    root_proc_inst_id_ character varying(64),
    act_id_ character varying(255),
    is_active_ boolean,
    is_concurrent_ boolean,
    is_scope_ boolean,
    is_event_scope_ boolean,
    is_mi_root_ boolean,
    suspension_state_ integer,
    cached_ent_state_ integer,
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    name_ character varying(255),
    start_act_id_ character varying(255),
    start_time_ timestamp without time zone,
    start_user_id_ character varying(255),
    lock_time_ timestamp without time zone,
    lock_owner_ character varying(255),
    is_count_enabled_ boolean,
    evt_subscr_count_ integer,
    task_count_ integer,
    job_count_ integer,
    timer_job_count_ integer,
    susp_job_count_ integer,
    deadletter_job_count_ integer,
    external_worker_job_count_ integer,
    var_count_ integer,
    id_link_count_ integer,
    callback_id_ character varying(255),
    callback_type_ character varying(255),
    reference_id_ character varying(255),
    reference_type_ character varying(255),
    propagated_stage_inst_id_ character varying(255),
    business_status_ character varying(255)
);


ALTER TABLE public.act_ru_execution OWNER TO flowable;

--
-- Name: act_ru_external_job; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_ru_external_job (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    type_ character varying(255) NOT NULL,
    lock_exp_time_ timestamp without time zone,
    lock_owner_ character varying(255),
    exclusive_ boolean,
    execution_id_ character varying(64),
    process_instance_id_ character varying(64),
    proc_def_id_ character varying(64),
    element_id_ character varying(255),
    element_name_ character varying(255),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255),
    correlation_id_ character varying(255),
    retries_ integer,
    exception_stack_id_ character varying(64),
    exception_msg_ character varying(4000),
    duedate_ timestamp without time zone,
    repeat_ character varying(255),
    handler_type_ character varying(255),
    handler_cfg_ character varying(4000),
    custom_values_id_ character varying(64),
    create_time_ timestamp without time zone,
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.act_ru_external_job OWNER TO flowable;

--
-- Name: act_ru_history_job; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_ru_history_job (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    lock_exp_time_ timestamp without time zone,
    lock_owner_ character varying(255),
    retries_ integer,
    exception_stack_id_ character varying(64),
    exception_msg_ character varying(4000),
    handler_type_ character varying(255),
    handler_cfg_ character varying(4000),
    custom_values_id_ character varying(64),
    adv_handler_cfg_id_ character varying(64),
    create_time_ timestamp without time zone,
    scope_type_ character varying(255),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.act_ru_history_job OWNER TO flowable;

--
-- Name: act_ru_identitylink; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_ru_identitylink (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    group_id_ character varying(255),
    type_ character varying(255),
    user_id_ character varying(255),
    task_id_ character varying(64),
    proc_inst_id_ character varying(64),
    proc_def_id_ character varying(64),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255)
);


ALTER TABLE public.act_ru_identitylink OWNER TO flowable;

--
-- Name: act_ru_job; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_ru_job (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    type_ character varying(255) NOT NULL,
    lock_exp_time_ timestamp without time zone,
    lock_owner_ character varying(255),
    exclusive_ boolean,
    execution_id_ character varying(64),
    process_instance_id_ character varying(64),
    proc_def_id_ character varying(64),
    element_id_ character varying(255),
    element_name_ character varying(255),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255),
    correlation_id_ character varying(255),
    retries_ integer,
    exception_stack_id_ character varying(64),
    exception_msg_ character varying(4000),
    duedate_ timestamp without time zone,
    repeat_ character varying(255),
    handler_type_ character varying(255),
    handler_cfg_ character varying(4000),
    custom_values_id_ character varying(64),
    create_time_ timestamp without time zone,
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.act_ru_job OWNER TO flowable;

--
-- Name: act_ru_suspended_job; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_ru_suspended_job (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    type_ character varying(255) NOT NULL,
    exclusive_ boolean,
    execution_id_ character varying(64),
    process_instance_id_ character varying(64),
    proc_def_id_ character varying(64),
    element_id_ character varying(255),
    element_name_ character varying(255),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255),
    correlation_id_ character varying(255),
    retries_ integer,
    exception_stack_id_ character varying(64),
    exception_msg_ character varying(4000),
    duedate_ timestamp without time zone,
    repeat_ character varying(255),
    handler_type_ character varying(255),
    handler_cfg_ character varying(4000),
    custom_values_id_ character varying(64),
    create_time_ timestamp without time zone,
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.act_ru_suspended_job OWNER TO flowable;

--
-- Name: act_ru_task; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_ru_task (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    proc_def_id_ character varying(64),
    task_def_id_ character varying(64),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255),
    propagated_stage_inst_id_ character varying(255),
    name_ character varying(255),
    parent_task_id_ character varying(64),
    description_ character varying(4000),
    task_def_key_ character varying(255),
    owner_ character varying(255),
    assignee_ character varying(255),
    delegation_ character varying(64),
    priority_ integer,
    create_time_ timestamp without time zone,
    due_date_ timestamp without time zone,
    category_ character varying(255),
    suspension_state_ integer,
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    form_key_ character varying(255),
    claim_time_ timestamp without time zone,
    is_count_enabled_ boolean,
    var_count_ integer,
    id_link_count_ integer,
    sub_task_count_ integer
);


ALTER TABLE public.act_ru_task OWNER TO flowable;

--
-- Name: act_ru_timer_job; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_ru_timer_job (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    type_ character varying(255) NOT NULL,
    lock_exp_time_ timestamp without time zone,
    lock_owner_ character varying(255),
    exclusive_ boolean,
    execution_id_ character varying(64),
    process_instance_id_ character varying(64),
    proc_def_id_ character varying(64),
    element_id_ character varying(255),
    element_name_ character varying(255),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255),
    correlation_id_ character varying(255),
    retries_ integer,
    exception_stack_id_ character varying(64),
    exception_msg_ character varying(4000),
    duedate_ timestamp without time zone,
    repeat_ character varying(255),
    handler_type_ character varying(255),
    handler_cfg_ character varying(4000),
    custom_values_id_ character varying(64),
    create_time_ timestamp without time zone,
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.act_ru_timer_job OWNER TO flowable;

--
-- Name: act_ru_variable; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.act_ru_variable (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    type_ character varying(255) NOT NULL,
    name_ character varying(255) NOT NULL,
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    task_id_ character varying(64),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    bytearray_id_ character varying(64),
    double_ double precision,
    long_ bigint,
    text_ character varying(4000),
    text2_ character varying(4000)
);


ALTER TABLE public.act_ru_variable OWNER TO flowable;

--
-- Name: flw_channel_definition; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.flw_channel_definition (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    version_ integer,
    key_ character varying(255),
    category_ character varying(255),
    deployment_id_ character varying(255),
    create_time_ timestamp(3) without time zone,
    tenant_id_ character varying(255),
    resource_name_ character varying(255),
    description_ character varying(255),
    type_ character varying(255),
    implementation_ character varying(255)
);


ALTER TABLE public.flw_channel_definition OWNER TO flowable;

--
-- Name: flw_ev_databasechangelog; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.flw_ev_databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.flw_ev_databasechangelog OWNER TO flowable;

--
-- Name: flw_ev_databasechangeloglock; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.flw_ev_databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.flw_ev_databasechangeloglock OWNER TO flowable;

--
-- Name: flw_event_definition; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.flw_event_definition (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    version_ integer,
    key_ character varying(255),
    category_ character varying(255),
    deployment_id_ character varying(255),
    tenant_id_ character varying(255),
    resource_name_ character varying(255),
    description_ character varying(255)
);


ALTER TABLE public.flw_event_definition OWNER TO flowable;

--
-- Name: flw_event_deployment; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.flw_event_deployment (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    category_ character varying(255),
    deploy_time_ timestamp(3) without time zone,
    tenant_id_ character varying(255),
    parent_deployment_id_ character varying(255)
);


ALTER TABLE public.flw_event_deployment OWNER TO flowable;

--
-- Name: flw_event_resource; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.flw_event_resource (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    deployment_id_ character varying(255),
    resource_bytes_ bytea
);


ALTER TABLE public.flw_event_resource OWNER TO flowable;

--
-- Name: flw_ru_batch; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.flw_ru_batch (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    type_ character varying(64) NOT NULL,
    search_key_ character varying(255),
    search_key2_ character varying(255),
    create_time_ timestamp without time zone NOT NULL,
    complete_time_ timestamp without time zone,
    status_ character varying(255),
    batch_doc_id_ character varying(64),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.flw_ru_batch OWNER TO flowable;

--
-- Name: flw_ru_batch_part; Type: TABLE; Schema: public; Owner: flowable
--

CREATE TABLE public.flw_ru_batch_part (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    batch_id_ character varying(64),
    type_ character varying(64) NOT NULL,
    scope_id_ character varying(64),
    sub_scope_id_ character varying(64),
    scope_type_ character varying(64),
    search_key_ character varying(255),
    search_key2_ character varying(255),
    create_time_ timestamp without time zone NOT NULL,
    complete_time_ timestamp without time zone,
    status_ character varying(255),
    result_doc_id_ character varying(64),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.flw_ru_batch_part OWNER TO flowable;

--
-- Name: act_evt_log log_nr_; Type: DEFAULT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_evt_log ALTER COLUMN log_nr_ SET DEFAULT nextval('public.act_evt_log_log_nr__seq'::regclass);


--
-- Name: act_hi_tsk_log id_; Type: DEFAULT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_hi_tsk_log ALTER COLUMN id_ SET DEFAULT nextval('public.act_hi_tsk_log_id__seq'::regclass);


--
-- Data for Name: act_adm_databasechangelog; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_adm_databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	flowable	META-INF/liquibase/flowable-admin-app-db-changelog.xml	2026-11-16 15:54:35.540378	1	EXECUTED	8:655e3bb142f7d051dfc2d641ee0eeebd	createTable tableName=ACT_ADM_SERVER_CONFIG		\N	4.9.0	\N	\N	4844475521
\.


--
-- Data for Name: act_adm_databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_adm_databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: act_adm_server_config; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_adm_server_config (id_, name_, description_, server_address_, port_, context_root_, rest_root_, user_name_, password_, endpoint_type_, tenant_id_) FROM stdin;
06d85e4f-e1d6-11f1-b51a-4227cbba929c	Flowable Process app	Flowable Process REST config	http://localhost	8080	/flowable-ui	process-api	admin	wf088DItMLLPiQIoM5rajQ==	1	\N
06d8ac70-e1d6-11f1-b51a-4227cbba929c	Flowable CMMN app	Flowable CMMN REST config	http://localhost	8080	/flowable-ui	cmmn-api	admin	wf088DItMLLPiQIoM5rajQ==	5	\N
06d8fa91-e1d6-11f1-b51a-4227cbba929c	Flowable App app	Flowable App REST config	http://localhost	8080	/flowable-ui	app-api	admin	wf088DItMLLPiQIoM5rajQ==	6	\N
06d921a2-e1d6-11f1-b51a-4227cbba929c	Flowable DMN app	Flowable DMN REST config	http://localhost	8080	/flowable-ui	dmn-api	admin	wf088DItMLLPiQIoM5rajQ==	2	\N
06d948b3-e1d6-11f1-b51a-4227cbba929c	Flowable Form app	Flowable Form REST config	http://localhost	8080	/flowable-ui	form-api	admin	wf088DItMLLPiQIoM5rajQ==	3	\N
06d96fc4-e1d6-11f1-b51a-4227cbba929c	Flowable Content app	Flowable Content REST config	http://localhost	8080	/flowable-ui	content-api	admin	wf088DItMLLPiQIoM5rajQ==	4	\N
\.


--
-- Data for Name: act_app_appdef; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_app_appdef (id_, rev_, name_, key_, version_, category_, deployment_id_, resource_name_, description_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_app_databasechangelog; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_app_databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	flowable	org/flowable/app/db/liquibase/flowable-app-db-changelog.xml	2026-11-16 15:54:33.897803	1	EXECUTED	8:496fc778bdf2ab13f2e1926d0e63e0a2	createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...		\N	4.9.0	\N	\N	4844473858
3	flowable	org/flowable/app/db/liquibase/flowable-app-db-changelog.xml	2026-11-16 15:54:33.907771	2	EXECUTED	8:f1f8aff320aade831944ebad24355f3d	createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF		\N	4.9.0	\N	\N	4844473858
\.


--
-- Data for Name: act_app_databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_app_databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: act_app_deployment; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_app_deployment (id_, name_, category_, key_, deploy_time_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_app_deployment_resource; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_app_deployment_resource (id_, name_, deployment_id_, resource_bytes_) FROM stdin;
\.


--
-- Data for Name: act_cmmn_casedef; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_cmmn_casedef (id_, rev_, name_, key_, version_, category_, deployment_id_, resource_name_, description_, has_graphical_notation_, tenant_id_, dgrm_resource_name_, has_start_form_key_) FROM stdin;
\.


--
-- Data for Name: act_cmmn_databasechangelog; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_cmmn_databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	flowable	org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml	2026-11-16 15:54:33.570913	1	EXECUTED	8:8b4b922d90b05ff27483abefc9597aa6	createTable tableName=ACT_CMMN_DEPLOYMENT; createTable tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_CMMN_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_CMMN_RSRC_DPL, referencedTableName=ACT_CMMN_DEPLOYMENT; create...		\N	4.9.0	\N	\N	4844473358
2	flowable	org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml	2026-11-16 15:54:33.588496	2	EXECUTED	8:65e39b3d385706bb261cbeffe7533cbe	addColumn tableName=ACT_CMMN_CASEDEF; addColumn tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST		\N	4.9.0	\N	\N	4844473358
3	flowable	org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml	2026-11-16 15:54:33.607769	3	EXECUTED	8:c01f6e802b49436b4489040da3012359	addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_PLAN_ITEM_STAGE_INST, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableNam...		\N	4.9.0	\N	\N	4844473358
4	flowable	org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml	2026-11-16 15:54:33.626465	4	EXECUTED	8:e40d29cb79345b7fb5afd38a7f0ba8fc	createTable tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_MIL_INST; addColumn tableName=ACT_CMMN_HI_MIL_INST		\N	4.9.0	\N	\N	4844473358
6	flowable	org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml	2026-11-16 15:54:33.635464	5	EXECUTED	8:10e82e26a7fee94c32a92099c059c18c	createIndex indexName=ACT_IDX_CASE_DEF_UNIQ, tableName=ACT_CMMN_CASEDEF		\N	4.9.0	\N	\N	4844473358
7	flowable	org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml	2026-11-16 15:54:33.660177	6	EXECUTED	8:530bc81a1e30618ccf4a2da1f7c6c043	renameColumn newColumnName=CREATE_TIME_, oldColumnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; renameColumn newColumnName=CREATE_TIME_, oldColumnName=CREATED_TIME_, tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_P...		\N	4.9.0	\N	\N	4844473358
8	flowable	org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml	2026-11-16 15:54:33.668945	7	EXECUTED	8:e8c2eb1ce28bc301efe07e0e29757781	addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST		\N	4.9.0	\N	\N	4844473358
9	flowable	org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml	2026-11-16 15:54:33.678533	8	EXECUTED	8:4cb4782b9bdec5ced2a64c525aa7b3a0	addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST		\N	4.9.0	\N	\N	4844473358
10	flowable	org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml	2026-11-16 15:54:33.696742	9	EXECUTED	8:341c16be247f5d17badc9809da8691f9	addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_CASE_INST_REF_ID_, tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE...		\N	4.9.0	\N	\N	4844473358
11	flowable	org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml	2026-11-16 15:54:33.706889	10	EXECUTED	8:d7c4da9276bcfffbfb0ebfb25e3f7b05	addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST		\N	4.9.0	\N	\N	4844473358
12	flowable	org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml	2026-11-16 15:54:33.71448	11	EXECUTED	8:adf4ecc45f2aa9a44a5626b02e1d6f98	addColumn tableName=ACT_CMMN_RU_CASE_INST		\N	4.9.0	\N	\N	4844473358
13	flowable	org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml	2026-11-16 15:54:33.724018	12	EXECUTED	8:7550626f964ab5518464709408333ec1	addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST		\N	4.9.0	\N	\N	4844473358
14	flowable	org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml	2026-11-16 15:54:33.737051	13	EXECUTED	8:086b40b3a05596dcc8a8d7479922d494	addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST		\N	4.9.0	\N	\N	4844473358
16	flowable	org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml	2026-11-16 15:54:33.745973	14	EXECUTED	8:a697a222ddd99dd15b36516a252f1c63	addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST		\N	4.9.0	\N	\N	4844473358
17	flowable	org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml	2026-11-16 15:54:33.756773	15	EXECUTED	8:d3706c5813a9b97fd2a59d12a9523946	createIndex indexName=ACT_IDX_HI_CASE_INST_END, tableName=ACT_CMMN_HI_CASE_INST		\N	4.9.0	\N	\N	4844473358
\.


--
-- Data for Name: act_cmmn_databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_cmmn_databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: act_cmmn_deployment; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_cmmn_deployment (id_, name_, category_, key_, deploy_time_, parent_deployment_id_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_cmmn_deployment_resource; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_cmmn_deployment_resource (id_, name_, deployment_id_, resource_bytes_, generated_) FROM stdin;
\.


--
-- Data for Name: act_cmmn_hi_case_inst; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_cmmn_hi_case_inst (id_, rev_, business_key_, name_, parent_id_, case_def_id_, state_, start_time_, end_time_, start_user_id_, callback_id_, callback_type_, tenant_id_, reference_id_, reference_type_, last_reactivation_time_, last_reactivation_user_id_, business_status_) FROM stdin;
\.


--
-- Data for Name: act_cmmn_hi_mil_inst; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_cmmn_hi_mil_inst (id_, rev_, name_, time_stamp_, case_inst_id_, case_def_id_, element_id_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_cmmn_hi_plan_item_inst; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_cmmn_hi_plan_item_inst (id_, rev_, name_, state_, case_def_id_, case_inst_id_, stage_inst_id_, is_stage_, element_id_, item_definition_id_, item_definition_type_, create_time_, last_available_time_, last_enabled_time_, last_disabled_time_, last_started_time_, last_suspended_time_, completed_time_, occurred_time_, terminated_time_, exit_time_, ended_time_, last_updated_time_, start_user_id_, reference_id_, reference_type_, tenant_id_, entry_criterion_id_, exit_criterion_id_, show_in_overview_, extra_value_, derived_case_def_id_, last_unavailable_time_) FROM stdin;
\.


--
-- Data for Name: act_cmmn_ru_case_inst; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_cmmn_ru_case_inst (id_, rev_, business_key_, name_, parent_id_, case_def_id_, state_, start_time_, start_user_id_, callback_id_, callback_type_, tenant_id_, lock_time_, is_completeable_, reference_id_, reference_type_, lock_owner_, last_reactivation_time_, last_reactivation_user_id_, business_status_) FROM stdin;
\.


--
-- Data for Name: act_cmmn_ru_mil_inst; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_cmmn_ru_mil_inst (id_, name_, time_stamp_, case_inst_id_, case_def_id_, element_id_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_cmmn_ru_plan_item_inst; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_cmmn_ru_plan_item_inst (id_, rev_, case_def_id_, case_inst_id_, stage_inst_id_, is_stage_, element_id_, name_, state_, create_time_, start_user_id_, reference_id_, reference_type_, tenant_id_, item_definition_id_, item_definition_type_, is_completeable_, is_count_enabled_, var_count_, sentry_part_inst_count_, last_available_time_, last_enabled_time_, last_disabled_time_, last_started_time_, last_suspended_time_, completed_time_, occurred_time_, terminated_time_, exit_time_, ended_time_, entry_criterion_id_, exit_criterion_id_, extra_value_, derived_case_def_id_, last_unavailable_time_) FROM stdin;
\.


--
-- Data for Name: act_cmmn_ru_sentry_part_inst; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_cmmn_ru_sentry_part_inst (id_, rev_, case_def_id_, case_inst_id_, plan_item_inst_id_, on_part_id_, if_part_id_, time_stamp_) FROM stdin;
\.


--
-- Data for Name: act_co_content_item; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_co_content_item (id_, name_, mime_type_, task_id_, proc_inst_id_, content_store_id_, content_store_name_, field_, content_available_, created_, created_by_, last_modified_, last_modified_by_, content_size_, tenant_id_, scope_id_, scope_type_) FROM stdin;
\.


--
-- Data for Name: act_co_databasechangelog; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_co_databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	activiti	org/flowable/content/db/liquibase/flowable-content-db-changelog.xml	2026-11-16 15:54:33.039557	1	EXECUTED	8:7644d7165cfe799200a2abdd3419e8b6	createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM		\N	4.9.0	\N	\N	4844473011
2	flowable	org/flowable/content/db/liquibase/flowable-content-db-changelog.xml	2026-11-16 15:54:33.056991	2	EXECUTED	8:fe7b11ac7dbbf9c43006b23bbab60bab	addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM		\N	4.9.0	\N	\N	4844473011
\.


--
-- Data for Name: act_co_databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_co_databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: act_de_databasechangelog; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_de_databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	flowable	META-INF/liquibase/flowable-modeler-app-db-changelog.xml	2026-11-16 15:54:36.121338	1	EXECUTED	8:e70d1d9d3899a734296b2514ccc71501	createTable tableName=ACT_DE_MODEL; createIndex indexName=idx_proc_mod_created, tableName=ACT_DE_MODEL; createTable tableName=ACT_DE_MODEL_HISTORY; createIndex indexName=idx_proc_mod_history_proc, tableName=ACT_DE_MODEL_HISTORY; createTable tableN...		\N	4.9.0	\N	\N	4844476067
3	flowable	META-INF/liquibase/flowable-modeler-app-db-changelog.xml	2026-11-16 15:54:36.131698	2	EXECUTED	8:3a9143bef2e45f2316231cc1369138b6	addColumn tableName=ACT_DE_MODEL; addColumn tableName=ACT_DE_MODEL_HISTORY		\N	4.9.0	\N	\N	4844476067
\.


--
-- Data for Name: act_de_databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_de_databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: act_de_model; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_de_model (id, name, model_key, description, model_comment, created, created_by, last_updated, last_updated_by, version, model_editor_json, thumbnail, model_type, tenant_id) FROM stdin;
\.


--
-- Data for Name: act_de_model_history; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_de_model_history (id, name, model_key, description, model_comment, created, created_by, last_updated, last_updated_by, removal_date, version, model_editor_json, model_id, model_type, tenant_id) FROM stdin;
\.


--
-- Data for Name: act_de_model_relation; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_de_model_relation (id, parent_model_id, model_id, relation_type) FROM stdin;
\.


--
-- Data for Name: act_dmn_databasechangelog; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_dmn_databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	activiti	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.535835	1	EXECUTED	8:c8701f1c71018b55029f450b2e9a10a1	createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE		\N	4.9.0	\N	\N	4844472384
2	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.567847	2	EXECUTED	8:47f94b27feb7df8a30d4e338c7bd5fb8	createTable tableName=ACT_DMN_HI_DECISION_EXECUTION		\N	4.9.0	\N	\N	4844472384
3	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.578627	3	EXECUTED	8:ac17eae89fbdccb6e08daf3c7797b579	addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION		\N	4.9.0	\N	\N	4844472384
4	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.587806	4	EXECUTED	8:f73aabc4529e7292c2942073d1cff6f9	dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE		\N	4.9.0	\N	\N	4844472384
6	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.599266	5	EXECUTED	8:646c6a061e0b6e8a62e69844ff96abb0	createIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE		\N	4.9.0	\N	\N	4844472384
7	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.61671	6	EXECUTED	8:215a499ff7ae77685b55355245b8b708	dropIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE; renameTable newTableName=ACT_DMN_DECISION, oldTableName=ACT_DMN_DECISION_TABLE; createIndex indexName=ACT_IDX_DMN_DEC_UNIQ, tableName=ACT_DMN_DECISION		\N	4.9.0	\N	\N	4844472384
8	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.637707	7	EXECUTED	8:5355bee389318afed91a11702f2df032	addColumn tableName=ACT_DMN_DECISION		\N	4.9.0	\N	\N	4844472384
9	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.658754	8	EXECUTED	8:0fe82086431b1953d293f0199f805876	createIndex indexName=ACT_IDX_DMN_INSTANCE_ID, tableName=ACT_DMN_HI_DECISION_EXECUTION		\N	4.9.0	\N	\N	4844472384
\.


--
-- Data for Name: act_dmn_databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_dmn_databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: act_dmn_decision; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_dmn_decision (id_, name_, version_, key_, category_, deployment_id_, tenant_id_, resource_name_, description_, decision_type_) FROM stdin;
\.


--
-- Data for Name: act_dmn_deployment; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_dmn_deployment (id_, name_, category_, deploy_time_, tenant_id_, parent_deployment_id_) FROM stdin;
\.


--
-- Data for Name: act_dmn_deployment_resource; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_dmn_deployment_resource (id_, name_, deployment_id_, resource_bytes_) FROM stdin;
\.


--
-- Data for Name: act_dmn_hi_decision_execution; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_dmn_hi_decision_execution (id_, decision_definition_id_, deployment_id_, start_time_, end_time_, instance_id_, execution_id_, activity_id_, failed_, tenant_id_, execution_json_, scope_type_) FROM stdin;
\.


--
-- Data for Name: act_evt_log; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_evt_log (log_nr_, type_, proc_def_id_, proc_inst_id_, execution_id_, task_id_, time_stamp_, user_id_, data_, lock_owner_, lock_time_, is_processed_) FROM stdin;
\.


--
-- Data for Name: act_fo_databasechangelog; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_fo_databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	activiti	org/flowable/form/db/liquibase/flowable-form-db-changelog.xml	2026-11-16 15:54:32.860558	1	EXECUTED	8:033ebf9380889aed7c453927ecc3250d	createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE		\N	4.9.0	\N	\N	4844472793
2	flowable	org/flowable/form/db/liquibase/flowable-form-db-changelog.xml	2026-11-16 15:54:32.871312	2	EXECUTED	8:986365ceb40445ce3b27a8e6b40f159b	addColumn tableName=ACT_FO_FORM_INSTANCE		\N	4.9.0	\N	\N	4844472793
3	flowable	org/flowable/form/db/liquibase/flowable-form-db-changelog.xml	2026-11-16 15:54:32.878876	3	EXECUTED	8:abf482518ceb09830ef674e52c06bf15	dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION		\N	4.9.0	\N	\N	4844472793
5	flowable	org/flowable/form/db/liquibase/flowable-form-db-changelog.xml	2026-11-16 15:54:32.890141	4	EXECUTED	8:b4be732b89e5ca028bdd520c6ad4d446	createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION		\N	4.9.0	\N	\N	4844472793
6	flowable	org/flowable/form/db/liquibase/flowable-form-db-changelog.xml	2026-11-16 15:54:32.906411	5	EXECUTED	8:384bbd364a649b67c3ca1bcb72fe537f	createIndex indexName=ACT_IDX_FORM_TASK, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_PROC, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_SCOPE, tableName=ACT_FO_FORM_INSTANCE		\N	4.9.0	\N	\N	4844472793
\.


--
-- Data for Name: act_fo_databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_fo_databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: act_fo_form_definition; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_fo_form_definition (id_, name_, version_, key_, category_, deployment_id_, tenant_id_, resource_name_, description_) FROM stdin;
\.


--
-- Data for Name: act_fo_form_deployment; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_fo_form_deployment (id_, name_, category_, deploy_time_, tenant_id_, parent_deployment_id_) FROM stdin;
\.


--
-- Data for Name: act_fo_form_instance; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_fo_form_instance (id_, form_definition_id_, task_id_, proc_inst_id_, proc_def_id_, submitted_date_, submitted_by_, form_values_id_, tenant_id_, scope_id_, scope_type_, scope_definition_id_) FROM stdin;
\.


--
-- Data for Name: act_fo_form_resource; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_fo_form_resource (id_, name_, deployment_id_, resource_bytes_) FROM stdin;
\.


--
-- Data for Name: act_ge_bytearray; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_ge_bytearray (id_, rev_, name_, deployment_id_, bytes_, generated_) FROM stdin;
\.


--
-- Data for Name: act_ge_property; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_ge_property (name_, value_, rev_) FROM stdin;
common.schema.version	6.8.0.0	1
next.dbid	1	1
identitylink.schema.version	6.8.0.0	1
entitylink.schema.version	6.8.0.0	1
eventsubscription.schema.version	6.8.0.0	1
task.schema.version	6.8.0.0	1
variable.schema.version	6.8.0.0	1
job.schema.version	6.8.0.0	1
batch.schema.version	6.8.0.0	1
schema.version	6.8.0.0	1
schema.history	create(6.8.0.0)	1
cfg.execution-related-entities-count	true	1
cfg.task-related-entities-count	true	1
\.


--
-- Data for Name: act_hi_actinst; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_hi_actinst (id_, rev_, proc_def_id_, proc_inst_id_, execution_id_, act_id_, task_id_, call_proc_inst_id_, act_name_, act_type_, assignee_, start_time_, end_time_, transaction_order_, duration_, delete_reason_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_hi_attachment; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_hi_attachment (id_, rev_, user_id_, name_, description_, type_, task_id_, proc_inst_id_, url_, content_id_, time_) FROM stdin;
\.


--
-- Data for Name: act_hi_comment; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_hi_comment (id_, type_, time_, user_id_, task_id_, proc_inst_id_, action_, message_, full_msg_) FROM stdin;
\.


--
-- Data for Name: act_hi_detail; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_hi_detail (id_, type_, proc_inst_id_, execution_id_, task_id_, act_inst_id_, name_, var_type_, rev_, time_, bytearray_id_, double_, long_, text_, text2_) FROM stdin;
\.


--
-- Data for Name: act_hi_entitylink; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_hi_entitylink (id_, link_type_, create_time_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_, parent_element_id_, ref_scope_id_, ref_scope_type_, ref_scope_definition_id_, root_scope_id_, root_scope_type_, hierarchy_type_) FROM stdin;
\.


--
-- Data for Name: act_hi_identitylink; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_hi_identitylink (id_, group_id_, type_, user_id_, task_id_, create_time_, proc_inst_id_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_) FROM stdin;
\.


--
-- Data for Name: act_hi_procinst; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_hi_procinst (id_, rev_, proc_inst_id_, business_key_, proc_def_id_, start_time_, end_time_, duration_, start_user_id_, start_act_id_, end_act_id_, super_process_instance_id_, delete_reason_, tenant_id_, name_, callback_id_, callback_type_, reference_id_, reference_type_, propagated_stage_inst_id_, business_status_) FROM stdin;
\.


--
-- Data for Name: act_hi_taskinst; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_hi_taskinst (id_, rev_, proc_def_id_, task_def_id_, task_def_key_, proc_inst_id_, execution_id_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_, propagated_stage_inst_id_, name_, parent_task_id_, description_, owner_, assignee_, start_time_, claim_time_, end_time_, duration_, delete_reason_, priority_, due_date_, form_key_, category_, tenant_id_, last_updated_time_) FROM stdin;
\.


--
-- Data for Name: act_hi_tsk_log; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_hi_tsk_log (id_, type_, task_id_, time_stamp_, user_id_, data_, execution_id_, proc_inst_id_, proc_def_id_, scope_id_, scope_definition_id_, sub_scope_id_, scope_type_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_hi_varinst; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_hi_varinst (id_, rev_, proc_inst_id_, execution_id_, task_id_, name_, var_type_, scope_id_, sub_scope_id_, scope_type_, bytearray_id_, double_, long_, text_, text2_, create_time_, last_updated_time_) FROM stdin;
\.


--
-- Data for Name: act_id_bytearray; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_id_bytearray (id_, rev_, name_, bytes_) FROM stdin;
\.


--
-- Data for Name: act_id_group; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_id_group (id_, rev_, name_, type_) FROM stdin;
\.


--
-- Data for Name: act_id_info; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_id_info (id_, rev_, user_id_, type_, key_, value_, password_, parent_id_) FROM stdin;
\.


--
-- Data for Name: act_id_membership; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_id_membership (user_id_, group_id_) FROM stdin;
\.


--
-- Data for Name: act_id_priv; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_id_priv (id_, name_) FROM stdin;
06c8a6d5-e1d6-11f1-b51a-4227cbba929c	access-idm
06caa2a7-e1d6-11f1-b51a-4227cbba929c	access-admin
06cbdb29-e1d6-11f1-b51a-4227cbba929c	access-modeler
06cd13ab-e1d6-11f1-b51a-4227cbba929c	access-task
06ce4c2d-e1d6-11f1-b51a-4227cbba929c	access-rest-api
\.


--
-- Data for Name: act_id_priv_mapping; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_id_priv_mapping (id_, priv_id_, user_id_, group_id_) FROM stdin;
06c9b846-e1d6-11f1-b51a-4227cbba929c	06c8a6d5-e1d6-11f1-b51a-4227cbba929c	admin	\N
06cb3ee8-e1d6-11f1-b51a-4227cbba929c	06caa2a7-e1d6-11f1-b51a-4227cbba929c	admin	\N
06cc505a-e1d6-11f1-b51a-4227cbba929c	06cbdb29-e1d6-11f1-b51a-4227cbba929c	admin	\N
06cdd6fc-e1d6-11f1-b51a-4227cbba929c	06cd13ab-e1d6-11f1-b51a-4227cbba929c	admin	\N
06cee86e-e1d6-11f1-b51a-4227cbba929c	06ce4c2d-e1d6-11f1-b51a-4227cbba929c	admin	\N
\.


--
-- Data for Name: act_id_property; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_id_property (name_, value_, rev_) FROM stdin;
schema.version	6.8.0.0	1
\.


--
-- Data for Name: act_id_token; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_id_token (id_, rev_, token_value_, token_date_, ip_address_, user_agent_, user_id_, token_data_) FROM stdin;
\.


--
-- Data for Name: act_id_user; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_id_user (id_, rev_, first_, last_, display_name_, email_, pwd_, picture_id_, tenant_id_) FROM stdin;
admin	1	Test	Administrator	\N	test-admin@example-domain.tld	test	\N	\N
\.


--
-- Data for Name: act_procdef_info; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_procdef_info (id_, proc_def_id_, rev_, info_json_id_) FROM stdin;
\.


--
-- Data for Name: act_re_deployment; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_re_deployment (id_, name_, category_, key_, tenant_id_, deploy_time_, derived_from_, derived_from_root_, parent_deployment_id_, engine_version_) FROM stdin;
\.


--
-- Data for Name: act_re_model; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_re_model (id_, rev_, name_, key_, category_, create_time_, last_update_time_, version_, meta_info_, deployment_id_, editor_source_value_id_, editor_source_extra_value_id_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_re_procdef; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_re_procdef (id_, rev_, category_, name_, key_, version_, deployment_id_, resource_name_, dgrm_resource_name_, description_, has_start_form_key_, has_graphical_notation_, suspension_state_, tenant_id_, derived_from_, derived_from_root_, derived_version_, engine_version_) FROM stdin;
\.


--
-- Data for Name: act_ru_actinst; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_ru_actinst (id_, rev_, proc_def_id_, proc_inst_id_, execution_id_, act_id_, task_id_, call_proc_inst_id_, act_name_, act_type_, assignee_, start_time_, end_time_, duration_, transaction_order_, delete_reason_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_deadletter_job; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_ru_deadletter_job (id_, rev_, category_, type_, exclusive_, execution_id_, process_instance_id_, proc_def_id_, element_id_, element_name_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_, correlation_id_, exception_stack_id_, exception_msg_, duedate_, repeat_, handler_type_, handler_cfg_, custom_values_id_, create_time_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_entitylink; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_ru_entitylink (id_, rev_, create_time_, link_type_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_, parent_element_id_, ref_scope_id_, ref_scope_type_, ref_scope_definition_id_, root_scope_id_, root_scope_type_, hierarchy_type_) FROM stdin;
\.


--
-- Data for Name: act_ru_event_subscr; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_ru_event_subscr (id_, rev_, event_type_, event_name_, execution_id_, proc_inst_id_, activity_id_, configuration_, created_, proc_def_id_, sub_scope_id_, scope_id_, scope_definition_id_, scope_type_, lock_time_, lock_owner_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_execution; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_ru_execution (id_, rev_, proc_inst_id_, business_key_, parent_id_, proc_def_id_, super_exec_, root_proc_inst_id_, act_id_, is_active_, is_concurrent_, is_scope_, is_event_scope_, is_mi_root_, suspension_state_, cached_ent_state_, tenant_id_, name_, start_act_id_, start_time_, start_user_id_, lock_time_, lock_owner_, is_count_enabled_, evt_subscr_count_, task_count_, job_count_, timer_job_count_, susp_job_count_, deadletter_job_count_, external_worker_job_count_, var_count_, id_link_count_, callback_id_, callback_type_, reference_id_, reference_type_, propagated_stage_inst_id_, business_status_) FROM stdin;
\.


--
-- Data for Name: act_ru_external_job; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_ru_external_job (id_, rev_, category_, type_, lock_exp_time_, lock_owner_, exclusive_, execution_id_, process_instance_id_, proc_def_id_, element_id_, element_name_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_, correlation_id_, retries_, exception_stack_id_, exception_msg_, duedate_, repeat_, handler_type_, handler_cfg_, custom_values_id_, create_time_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_history_job; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_ru_history_job (id_, rev_, lock_exp_time_, lock_owner_, retries_, exception_stack_id_, exception_msg_, handler_type_, handler_cfg_, custom_values_id_, adv_handler_cfg_id_, create_time_, scope_type_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_identitylink; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_ru_identitylink (id_, rev_, group_id_, type_, user_id_, task_id_, proc_inst_id_, proc_def_id_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_job; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_ru_job (id_, rev_, category_, type_, lock_exp_time_, lock_owner_, exclusive_, execution_id_, process_instance_id_, proc_def_id_, element_id_, element_name_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_, correlation_id_, retries_, exception_stack_id_, exception_msg_, duedate_, repeat_, handler_type_, handler_cfg_, custom_values_id_, create_time_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_suspended_job; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_ru_suspended_job (id_, rev_, category_, type_, exclusive_, execution_id_, process_instance_id_, proc_def_id_, element_id_, element_name_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_, correlation_id_, retries_, exception_stack_id_, exception_msg_, duedate_, repeat_, handler_type_, handler_cfg_, custom_values_id_, create_time_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_task; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_ru_task (id_, rev_, execution_id_, proc_inst_id_, proc_def_id_, task_def_id_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_, propagated_stage_inst_id_, name_, parent_task_id_, description_, task_def_key_, owner_, assignee_, delegation_, priority_, create_time_, due_date_, category_, suspension_state_, tenant_id_, form_key_, claim_time_, is_count_enabled_, var_count_, id_link_count_, sub_task_count_) FROM stdin;
\.


--
-- Data for Name: act_ru_timer_job; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_ru_timer_job (id_, rev_, category_, type_, lock_exp_time_, lock_owner_, exclusive_, execution_id_, process_instance_id_, proc_def_id_, element_id_, element_name_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_, correlation_id_, retries_, exception_stack_id_, exception_msg_, duedate_, repeat_, handler_type_, handler_cfg_, custom_values_id_, create_time_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_variable; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_ru_variable (id_, rev_, type_, name_, execution_id_, proc_inst_id_, task_id_, scope_id_, sub_scope_id_, scope_type_, bytearray_id_, double_, long_, text_, text2_) FROM stdin;
\.


--
-- Data for Name: flw_channel_definition; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.flw_channel_definition (id_, name_, version_, key_, category_, deployment_id_, create_time_, tenant_id_, resource_name_, description_, type_, implementation_) FROM stdin;
\.


--
-- Data for Name: flw_ev_databasechangelog; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.flw_ev_databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	flowable	org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml	2026-11-16 15:54:32.07744	1	EXECUTED	8:1b0c48c9cf7945be799d868a2626d687	createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...		\N	4.9.0	\N	\N	4844471872
2	flowable	org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml	2026-11-16 15:54:32.100622	2	EXECUTED	8:0ea825feb8e470558f0b5754352b9cda	addColumn tableName=FLW_CHANNEL_DEFINITION; addColumn tableName=FLW_CHANNEL_DEFINITION		\N	4.9.0	\N	\N	4844471872
3	flowable	org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml	2026-11-16 15:54:32.120068	3	EXECUTED	8:3c2bb293350b5cbe6504331980c9dcee	customChange		\N	4.9.0	\N	\N	4844471872
\.


--
-- Data for Name: flw_ev_databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.flw_ev_databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: flw_event_definition; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.flw_event_definition (id_, name_, version_, key_, category_, deployment_id_, tenant_id_, resource_name_, description_) FROM stdin;
\.


--
-- Data for Name: flw_event_deployment; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.flw_event_deployment (id_, name_, category_, deploy_time_, tenant_id_, parent_deployment_id_) FROM stdin;
\.


--
-- Data for Name: flw_event_resource; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.flw_event_resource (id_, name_, deployment_id_, resource_bytes_) FROM stdin;
\.


--
-- Data for Name: flw_ru_batch; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.flw_ru_batch (id_, rev_, type_, search_key_, search_key2_, create_time_, complete_time_, status_, batch_doc_id_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: flw_ru_batch_part; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.flw_ru_batch_part (id_, rev_, batch_id_, type_, scope_id_, sub_scope_id_, scope_type_, search_key_, search_key2_, create_time_, complete_time_, status_, result_doc_id_, tenant_id_) FROM stdin;
\.


--
-- Name: act_evt_log_log_nr__seq; Type: SEQUENCE SET; Schema: public; Owner: flowable
--

SELECT pg_catalog.setval('public.act_evt_log_log_nr__seq', 1, false);


--
-- Name: act_hi_tsk_log_id__seq; Type: SEQUENCE SET; Schema: public; Owner: flowable
--

SELECT pg_catalog.setval('public.act_hi_tsk_log_id__seq', 1, false);


--
-- Name: act_adm_server_config ACT_ADM_SERVER_CONFIG_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_adm_server_config
    ADD CONSTRAINT "ACT_ADM_SERVER_CONFIG_pkey" PRIMARY KEY (id_);


--
-- Name: act_app_appdef ACT_APP_APPDEF_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_app_appdef
    ADD CONSTRAINT "ACT_APP_APPDEF_pkey" PRIMARY KEY (id_);


--
-- Name: act_app_deployment ACT_APP_DEPLOYMENT_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_app_deployment
    ADD CONSTRAINT "ACT_APP_DEPLOYMENT_pkey" PRIMARY KEY (id_);


--
-- Name: act_cmmn_casedef ACT_CMMN_CASEDEF_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_casedef
    ADD CONSTRAINT "ACT_CMMN_CASEDEF_pkey" PRIMARY KEY (id_);


--
-- Name: act_cmmn_deployment ACT_CMMN_DEPLOYMENT_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_deployment
    ADD CONSTRAINT "ACT_CMMN_DEPLOYMENT_pkey" PRIMARY KEY (id_);


--
-- Name: act_cmmn_hi_case_inst ACT_CMMN_HI_CASE_INST_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_hi_case_inst
    ADD CONSTRAINT "ACT_CMMN_HI_CASE_INST_pkey" PRIMARY KEY (id_);


--
-- Name: act_cmmn_hi_mil_inst ACT_CMMN_HI_MIL_INST_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_hi_mil_inst
    ADD CONSTRAINT "ACT_CMMN_HI_MIL_INST_pkey" PRIMARY KEY (id_);


--
-- Name: act_cmmn_hi_plan_item_inst ACT_CMMN_HI_PLAN_ITEM_INST_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_hi_plan_item_inst
    ADD CONSTRAINT "ACT_CMMN_HI_PLAN_ITEM_INST_pkey" PRIMARY KEY (id_);


--
-- Name: act_cmmn_ru_case_inst ACT_CMMN_RU_CASE_INST_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_ru_case_inst
    ADD CONSTRAINT "ACT_CMMN_RU_CASE_INST_pkey" PRIMARY KEY (id_);


--
-- Name: act_cmmn_ru_mil_inst ACT_CMMN_RU_MIL_INST_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_ru_mil_inst
    ADD CONSTRAINT "ACT_CMMN_RU_MIL_INST_pkey" PRIMARY KEY (id_);


--
-- Name: act_co_content_item ACT_CO_CONTENT_ITEM_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_co_content_item
    ADD CONSTRAINT "ACT_CO_CONTENT_ITEM_pkey" PRIMARY KEY (id_);


--
-- Name: act_de_model_history ACT_DE_MODEL_HISTORY_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_de_model_history
    ADD CONSTRAINT "ACT_DE_MODEL_HISTORY_pkey" PRIMARY KEY (id);


--
-- Name: act_de_model_relation ACT_DE_MODEL_RELATION_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_de_model_relation
    ADD CONSTRAINT "ACT_DE_MODEL_RELATION_pkey" PRIMARY KEY (id);


--
-- Name: act_de_model ACT_DE_MODEL_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_de_model
    ADD CONSTRAINT "ACT_DE_MODEL_pkey" PRIMARY KEY (id);


--
-- Name: act_dmn_decision ACT_DMN_DECISION_TABLE_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_dmn_decision
    ADD CONSTRAINT "ACT_DMN_DECISION_TABLE_pkey" PRIMARY KEY (id_);


--
-- Name: act_dmn_deployment_resource ACT_DMN_DEPLOYMENT_RESOURCE_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_dmn_deployment_resource
    ADD CONSTRAINT "ACT_DMN_DEPLOYMENT_RESOURCE_pkey" PRIMARY KEY (id_);


--
-- Name: act_dmn_deployment ACT_DMN_DEPLOYMENT_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_dmn_deployment
    ADD CONSTRAINT "ACT_DMN_DEPLOYMENT_pkey" PRIMARY KEY (id_);


--
-- Name: act_dmn_hi_decision_execution ACT_DMN_HI_DECISION_EXECUTION_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_dmn_hi_decision_execution
    ADD CONSTRAINT "ACT_DMN_HI_DECISION_EXECUTION_pkey" PRIMARY KEY (id_);


--
-- Name: act_fo_form_definition ACT_FO_FORM_DEFINITION_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_fo_form_definition
    ADD CONSTRAINT "ACT_FO_FORM_DEFINITION_pkey" PRIMARY KEY (id_);


--
-- Name: act_fo_form_deployment ACT_FO_FORM_DEPLOYMENT_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_fo_form_deployment
    ADD CONSTRAINT "ACT_FO_FORM_DEPLOYMENT_pkey" PRIMARY KEY (id_);


--
-- Name: act_fo_form_instance ACT_FO_FORM_INSTANCE_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_fo_form_instance
    ADD CONSTRAINT "ACT_FO_FORM_INSTANCE_pkey" PRIMARY KEY (id_);


--
-- Name: act_fo_form_resource ACT_FO_FORM_RESOURCE_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_fo_form_resource
    ADD CONSTRAINT "ACT_FO_FORM_RESOURCE_pkey" PRIMARY KEY (id_);


--
-- Name: flw_channel_definition FLW_CHANNEL_DEFINITION_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.flw_channel_definition
    ADD CONSTRAINT "FLW_CHANNEL_DEFINITION_pkey" PRIMARY KEY (id_);


--
-- Name: flw_event_definition FLW_EVENT_DEFINITION_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.flw_event_definition
    ADD CONSTRAINT "FLW_EVENT_DEFINITION_pkey" PRIMARY KEY (id_);


--
-- Name: flw_event_deployment FLW_EVENT_DEPLOYMENT_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.flw_event_deployment
    ADD CONSTRAINT "FLW_EVENT_DEPLOYMENT_pkey" PRIMARY KEY (id_);


--
-- Name: flw_event_resource FLW_EVENT_RESOURCE_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.flw_event_resource
    ADD CONSTRAINT "FLW_EVENT_RESOURCE_pkey" PRIMARY KEY (id_);


--
-- Name: act_adm_databasechangeloglock act_adm_databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_adm_databasechangeloglock
    ADD CONSTRAINT act_adm_databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: act_app_databasechangeloglock act_app_databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_app_databasechangeloglock
    ADD CONSTRAINT act_app_databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: act_cmmn_databasechangeloglock act_cmmn_databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_databasechangeloglock
    ADD CONSTRAINT act_cmmn_databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: act_co_databasechangeloglock act_co_databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_co_databasechangeloglock
    ADD CONSTRAINT act_co_databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: act_de_databasechangeloglock act_de_databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_de_databasechangeloglock
    ADD CONSTRAINT act_de_databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: act_dmn_databasechangeloglock act_dmn_databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_dmn_databasechangeloglock
    ADD CONSTRAINT act_dmn_databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: act_evt_log act_evt_log_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_evt_log
    ADD CONSTRAINT act_evt_log_pkey PRIMARY KEY (log_nr_);


--
-- Name: act_fo_databasechangeloglock act_fo_databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_fo_databasechangeloglock
    ADD CONSTRAINT act_fo_databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: act_ge_bytearray act_ge_bytearray_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ge_bytearray
    ADD CONSTRAINT act_ge_bytearray_pkey PRIMARY KEY (id_);


--
-- Name: act_ge_property act_ge_property_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ge_property
    ADD CONSTRAINT act_ge_property_pkey PRIMARY KEY (name_);


--
-- Name: act_hi_actinst act_hi_actinst_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_hi_actinst
    ADD CONSTRAINT act_hi_actinst_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_attachment act_hi_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_hi_attachment
    ADD CONSTRAINT act_hi_attachment_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_comment act_hi_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_hi_comment
    ADD CONSTRAINT act_hi_comment_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_detail act_hi_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_hi_detail
    ADD CONSTRAINT act_hi_detail_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_entitylink act_hi_entitylink_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_hi_entitylink
    ADD CONSTRAINT act_hi_entitylink_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_identitylink act_hi_identitylink_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_hi_identitylink
    ADD CONSTRAINT act_hi_identitylink_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_procinst act_hi_procinst_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_hi_procinst
    ADD CONSTRAINT act_hi_procinst_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_procinst act_hi_procinst_proc_inst_id__key; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_hi_procinst
    ADD CONSTRAINT act_hi_procinst_proc_inst_id__key UNIQUE (proc_inst_id_);


--
-- Name: act_hi_taskinst act_hi_taskinst_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_hi_taskinst
    ADD CONSTRAINT act_hi_taskinst_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_tsk_log act_hi_tsk_log_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_hi_tsk_log
    ADD CONSTRAINT act_hi_tsk_log_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_varinst act_hi_varinst_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_hi_varinst
    ADD CONSTRAINT act_hi_varinst_pkey PRIMARY KEY (id_);


--
-- Name: act_id_bytearray act_id_bytearray_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_id_bytearray
    ADD CONSTRAINT act_id_bytearray_pkey PRIMARY KEY (id_);


--
-- Name: act_id_group act_id_group_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_id_group
    ADD CONSTRAINT act_id_group_pkey PRIMARY KEY (id_);


--
-- Name: act_id_info act_id_info_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_id_info
    ADD CONSTRAINT act_id_info_pkey PRIMARY KEY (id_);


--
-- Name: act_id_membership act_id_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_id_membership
    ADD CONSTRAINT act_id_membership_pkey PRIMARY KEY (user_id_, group_id_);


--
-- Name: act_id_priv_mapping act_id_priv_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_id_priv_mapping
    ADD CONSTRAINT act_id_priv_mapping_pkey PRIMARY KEY (id_);


--
-- Name: act_id_priv act_id_priv_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_id_priv
    ADD CONSTRAINT act_id_priv_pkey PRIMARY KEY (id_);


--
-- Name: act_id_property act_id_property_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_id_property
    ADD CONSTRAINT act_id_property_pkey PRIMARY KEY (name_);


--
-- Name: act_id_token act_id_token_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_id_token
    ADD CONSTRAINT act_id_token_pkey PRIMARY KEY (id_);


--
-- Name: act_id_user act_id_user_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_id_user
    ADD CONSTRAINT act_id_user_pkey PRIMARY KEY (id_);


--
-- Name: act_procdef_info act_procdef_info_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_procdef_info
    ADD CONSTRAINT act_procdef_info_pkey PRIMARY KEY (id_);


--
-- Name: act_re_deployment act_re_deployment_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_re_deployment
    ADD CONSTRAINT act_re_deployment_pkey PRIMARY KEY (id_);


--
-- Name: act_re_model act_re_model_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_re_model
    ADD CONSTRAINT act_re_model_pkey PRIMARY KEY (id_);


--
-- Name: act_re_procdef act_re_procdef_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_re_procdef
    ADD CONSTRAINT act_re_procdef_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_actinst act_ru_actinst_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_actinst
    ADD CONSTRAINT act_ru_actinst_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_deadletter_job act_ru_deadletter_job_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_deadletter_job
    ADD CONSTRAINT act_ru_deadletter_job_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_entitylink act_ru_entitylink_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_entitylink
    ADD CONSTRAINT act_ru_entitylink_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_event_subscr act_ru_event_subscr_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_event_subscr
    ADD CONSTRAINT act_ru_event_subscr_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_execution act_ru_execution_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_ru_execution_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_external_job act_ru_external_job_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_external_job
    ADD CONSTRAINT act_ru_external_job_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_history_job act_ru_history_job_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_history_job
    ADD CONSTRAINT act_ru_history_job_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_identitylink act_ru_identitylink_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_identitylink
    ADD CONSTRAINT act_ru_identitylink_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_job act_ru_job_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_job
    ADD CONSTRAINT act_ru_job_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_suspended_job act_ru_suspended_job_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_suspended_job
    ADD CONSTRAINT act_ru_suspended_job_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_task act_ru_task_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_ru_task_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_timer_job act_ru_timer_job_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_timer_job
    ADD CONSTRAINT act_ru_timer_job_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_variable act_ru_variable_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_ru_variable_pkey PRIMARY KEY (id_);


--
-- Name: act_procdef_info act_uniq_info_procdef; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_procdef_info
    ADD CONSTRAINT act_uniq_info_procdef UNIQUE (proc_def_id_);


--
-- Name: act_id_priv act_uniq_priv_name; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_id_priv
    ADD CONSTRAINT act_uniq_priv_name UNIQUE (name_);


--
-- Name: act_re_procdef act_uniq_procdef; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_re_procdef
    ADD CONSTRAINT act_uniq_procdef UNIQUE (key_, version_, derived_version_, tenant_id_);


--
-- Name: flw_ev_databasechangeloglock flw_ev_databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.flw_ev_databasechangeloglock
    ADD CONSTRAINT flw_ev_databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: flw_ru_batch_part flw_ru_batch_part_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.flw_ru_batch_part
    ADD CONSTRAINT flw_ru_batch_part_pkey PRIMARY KEY (id_);


--
-- Name: flw_ru_batch flw_ru_batch_pkey; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.flw_ru_batch
    ADD CONSTRAINT flw_ru_batch_pkey PRIMARY KEY (id_);


--
-- Name: act_app_deployment_resource pk_app_deployment_resource; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_app_deployment_resource
    ADD CONSTRAINT pk_app_deployment_resource PRIMARY KEY (id_);


--
-- Name: act_cmmn_deployment_resource pk_cmmn_deployment_resource; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_deployment_resource
    ADD CONSTRAINT pk_cmmn_deployment_resource PRIMARY KEY (id_);


--
-- Name: act_cmmn_ru_plan_item_inst pk_cmmn_plan_item_inst; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_ru_plan_item_inst
    ADD CONSTRAINT pk_cmmn_plan_item_inst PRIMARY KEY (id_);


--
-- Name: act_cmmn_ru_sentry_part_inst pk_cmmn_sentry_part_inst; Type: CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_ru_sentry_part_inst
    ADD CONSTRAINT pk_cmmn_sentry_part_inst PRIMARY KEY (id_);


--
-- Name: act_idx_app_def_dply; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_app_def_dply ON public.act_app_appdef USING btree (deployment_id_);


--
-- Name: act_idx_app_def_uniq; Type: INDEX; Schema: public; Owner: flowable
--

CREATE UNIQUE INDEX act_idx_app_def_uniq ON public.act_app_appdef USING btree (key_, version_, tenant_id_);


--
-- Name: act_idx_app_rsrc_dpl; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_app_rsrc_dpl ON public.act_app_deployment_resource USING btree (deployment_id_);


--
-- Name: act_idx_athrz_procedef; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_athrz_procedef ON public.act_ru_identitylink USING btree (proc_def_id_);


--
-- Name: act_idx_bytear_depl; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_bytear_depl ON public.act_ge_bytearray USING btree (deployment_id_);


--
-- Name: act_idx_case_def_dply; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_case_def_dply ON public.act_cmmn_casedef USING btree (deployment_id_);


--
-- Name: act_idx_case_def_uniq; Type: INDEX; Schema: public; Owner: flowable
--

CREATE UNIQUE INDEX act_idx_case_def_uniq ON public.act_cmmn_casedef USING btree (key_, version_, tenant_id_);


--
-- Name: act_idx_case_inst_case_def; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_case_inst_case_def ON public.act_cmmn_ru_case_inst USING btree (case_def_id_);


--
-- Name: act_idx_case_inst_parent; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_case_inst_parent ON public.act_cmmn_ru_case_inst USING btree (parent_id_);


--
-- Name: act_idx_case_inst_ref_id_; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_case_inst_ref_id_ ON public.act_cmmn_ru_case_inst USING btree (reference_id_);


--
-- Name: act_idx_channel_def_uniq; Type: INDEX; Schema: public; Owner: flowable
--

CREATE UNIQUE INDEX act_idx_channel_def_uniq ON public.flw_channel_definition USING btree (key_, version_, tenant_id_);


--
-- Name: act_idx_cmmn_rsrc_dpl; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_cmmn_rsrc_dpl ON public.act_cmmn_deployment_resource USING btree (deployment_id_);


--
-- Name: act_idx_deadletter_job_correlation_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_deadletter_job_correlation_id ON public.act_ru_deadletter_job USING btree (correlation_id_);


--
-- Name: act_idx_deadletter_job_custom_values_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_deadletter_job_custom_values_id ON public.act_ru_deadletter_job USING btree (custom_values_id_);


--
-- Name: act_idx_deadletter_job_exception_stack_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_deadletter_job_exception_stack_id ON public.act_ru_deadletter_job USING btree (exception_stack_id_);


--
-- Name: act_idx_deadletter_job_execution_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_deadletter_job_execution_id ON public.act_ru_deadletter_job USING btree (execution_id_);


--
-- Name: act_idx_deadletter_job_proc_def_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_deadletter_job_proc_def_id ON public.act_ru_deadletter_job USING btree (proc_def_id_);


--
-- Name: act_idx_deadletter_job_process_instance_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_deadletter_job_process_instance_id ON public.act_ru_deadletter_job USING btree (process_instance_id_);


--
-- Name: act_idx_djob_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_djob_scope ON public.act_ru_deadletter_job USING btree (scope_id_, scope_type_);


--
-- Name: act_idx_djob_scope_def; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_djob_scope_def ON public.act_ru_deadletter_job USING btree (scope_definition_id_, scope_type_);


--
-- Name: act_idx_djob_sub_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_djob_sub_scope ON public.act_ru_deadletter_job USING btree (sub_scope_id_, scope_type_);


--
-- Name: act_idx_dmn_dec_uniq; Type: INDEX; Schema: public; Owner: flowable
--

CREATE UNIQUE INDEX act_idx_dmn_dec_uniq ON public.act_dmn_decision USING btree (key_, version_, tenant_id_);


--
-- Name: act_idx_dmn_instance_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_dmn_instance_id ON public.act_dmn_hi_decision_execution USING btree (instance_id_);


--
-- Name: act_idx_ejob_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ejob_scope ON public.act_ru_external_job USING btree (scope_id_, scope_type_);


--
-- Name: act_idx_ejob_scope_def; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ejob_scope_def ON public.act_ru_external_job USING btree (scope_definition_id_, scope_type_);


--
-- Name: act_idx_ejob_sub_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ejob_sub_scope ON public.act_ru_external_job USING btree (sub_scope_id_, scope_type_);


--
-- Name: act_idx_ent_lnk_ref_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ent_lnk_ref_scope ON public.act_ru_entitylink USING btree (ref_scope_id_, ref_scope_type_, link_type_);


--
-- Name: act_idx_ent_lnk_root_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ent_lnk_root_scope ON public.act_ru_entitylink USING btree (root_scope_id_, root_scope_type_, link_type_);


--
-- Name: act_idx_ent_lnk_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ent_lnk_scope ON public.act_ru_entitylink USING btree (scope_id_, scope_type_, link_type_);


--
-- Name: act_idx_ent_lnk_scope_def; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ent_lnk_scope_def ON public.act_ru_entitylink USING btree (scope_definition_id_, scope_type_, link_type_);


--
-- Name: act_idx_event_def_uniq; Type: INDEX; Schema: public; Owner: flowable
--

CREATE UNIQUE INDEX act_idx_event_def_uniq ON public.flw_event_definition USING btree (key_, version_, tenant_id_);


--
-- Name: act_idx_event_subscr; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_event_subscr ON public.act_ru_event_subscr USING btree (execution_id_);


--
-- Name: act_idx_event_subscr_config_; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_event_subscr_config_ ON public.act_ru_event_subscr USING btree (configuration_);


--
-- Name: act_idx_event_subscr_scoperef_; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_event_subscr_scoperef_ ON public.act_ru_event_subscr USING btree (scope_id_, scope_type_);


--
-- Name: act_idx_exe_parent; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_exe_parent ON public.act_ru_execution USING btree (parent_id_);


--
-- Name: act_idx_exe_procdef; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_exe_procdef ON public.act_ru_execution USING btree (proc_def_id_);


--
-- Name: act_idx_exe_procinst; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_exe_procinst ON public.act_ru_execution USING btree (proc_inst_id_);


--
-- Name: act_idx_exe_root; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_exe_root ON public.act_ru_execution USING btree (root_proc_inst_id_);


--
-- Name: act_idx_exe_super; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_exe_super ON public.act_ru_execution USING btree (super_exec_);


--
-- Name: act_idx_exec_buskey; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_exec_buskey ON public.act_ru_execution USING btree (business_key_);


--
-- Name: act_idx_exec_ref_id_; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_exec_ref_id_ ON public.act_ru_execution USING btree (reference_id_);


--
-- Name: act_idx_external_job_correlation_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_external_job_correlation_id ON public.act_ru_external_job USING btree (correlation_id_);


--
-- Name: act_idx_external_job_custom_values_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_external_job_custom_values_id ON public.act_ru_external_job USING btree (custom_values_id_);


--
-- Name: act_idx_external_job_exception_stack_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_external_job_exception_stack_id ON public.act_ru_external_job USING btree (exception_stack_id_);


--
-- Name: act_idx_form_def_uniq; Type: INDEX; Schema: public; Owner: flowable
--

CREATE UNIQUE INDEX act_idx_form_def_uniq ON public.act_fo_form_definition USING btree (key_, version_, tenant_id_);


--
-- Name: act_idx_form_proc; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_form_proc ON public.act_fo_form_instance USING btree (proc_inst_id_);


--
-- Name: act_idx_form_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_form_scope ON public.act_fo_form_instance USING btree (scope_id_, scope_type_);


--
-- Name: act_idx_form_task; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_form_task ON public.act_fo_form_instance USING btree (task_id_);


--
-- Name: act_idx_hi_act_inst_end; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_act_inst_end ON public.act_hi_actinst USING btree (end_time_);


--
-- Name: act_idx_hi_act_inst_exec; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_act_inst_exec ON public.act_hi_actinst USING btree (execution_id_, act_id_);


--
-- Name: act_idx_hi_act_inst_procinst; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_act_inst_procinst ON public.act_hi_actinst USING btree (proc_inst_id_, act_id_);


--
-- Name: act_idx_hi_act_inst_start; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_act_inst_start ON public.act_hi_actinst USING btree (start_time_);


--
-- Name: act_idx_hi_case_inst_end; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_case_inst_end ON public.act_cmmn_hi_case_inst USING btree (end_time_);


--
-- Name: act_idx_hi_detail_act_inst; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_detail_act_inst ON public.act_hi_detail USING btree (act_inst_id_);


--
-- Name: act_idx_hi_detail_name; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_detail_name ON public.act_hi_detail USING btree (name_);


--
-- Name: act_idx_hi_detail_proc_inst; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_detail_proc_inst ON public.act_hi_detail USING btree (proc_inst_id_);


--
-- Name: act_idx_hi_detail_task_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_detail_task_id ON public.act_hi_detail USING btree (task_id_);


--
-- Name: act_idx_hi_detail_time; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_detail_time ON public.act_hi_detail USING btree (time_);


--
-- Name: act_idx_hi_ent_lnk_ref_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_ent_lnk_ref_scope ON public.act_hi_entitylink USING btree (ref_scope_id_, ref_scope_type_, link_type_);


--
-- Name: act_idx_hi_ent_lnk_root_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_ent_lnk_root_scope ON public.act_hi_entitylink USING btree (root_scope_id_, root_scope_type_, link_type_);


--
-- Name: act_idx_hi_ent_lnk_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_ent_lnk_scope ON public.act_hi_entitylink USING btree (scope_id_, scope_type_, link_type_);


--
-- Name: act_idx_hi_ent_lnk_scope_def; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_ent_lnk_scope_def ON public.act_hi_entitylink USING btree (scope_definition_id_, scope_type_, link_type_);


--
-- Name: act_idx_hi_ident_lnk_procinst; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_ident_lnk_procinst ON public.act_hi_identitylink USING btree (proc_inst_id_);


--
-- Name: act_idx_hi_ident_lnk_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_ident_lnk_scope ON public.act_hi_identitylink USING btree (scope_id_, scope_type_);


--
-- Name: act_idx_hi_ident_lnk_scope_def; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_ident_lnk_scope_def ON public.act_hi_identitylink USING btree (scope_definition_id_, scope_type_);


--
-- Name: act_idx_hi_ident_lnk_sub_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_ident_lnk_sub_scope ON public.act_hi_identitylink USING btree (sub_scope_id_, scope_type_);


--
-- Name: act_idx_hi_ident_lnk_task; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_ident_lnk_task ON public.act_hi_identitylink USING btree (task_id_);


--
-- Name: act_idx_hi_ident_lnk_user; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_ident_lnk_user ON public.act_hi_identitylink USING btree (user_id_);


--
-- Name: act_idx_hi_pro_i_buskey; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_pro_i_buskey ON public.act_hi_procinst USING btree (business_key_);


--
-- Name: act_idx_hi_pro_inst_end; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_pro_inst_end ON public.act_hi_procinst USING btree (end_time_);


--
-- Name: act_idx_hi_pro_super_procinst; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_pro_super_procinst ON public.act_hi_procinst USING btree (super_process_instance_id_);


--
-- Name: act_idx_hi_procvar_exe; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_procvar_exe ON public.act_hi_varinst USING btree (execution_id_);


--
-- Name: act_idx_hi_procvar_name_type; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_procvar_name_type ON public.act_hi_varinst USING btree (name_, var_type_);


--
-- Name: act_idx_hi_procvar_proc_inst; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_procvar_proc_inst ON public.act_hi_varinst USING btree (proc_inst_id_);


--
-- Name: act_idx_hi_procvar_task_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_procvar_task_id ON public.act_hi_varinst USING btree (task_id_);


--
-- Name: act_idx_hi_task_inst_procinst; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_task_inst_procinst ON public.act_hi_taskinst USING btree (proc_inst_id_);


--
-- Name: act_idx_hi_task_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_task_scope ON public.act_hi_taskinst USING btree (scope_id_, scope_type_);


--
-- Name: act_idx_hi_task_scope_def; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_task_scope_def ON public.act_hi_taskinst USING btree (scope_definition_id_, scope_type_);


--
-- Name: act_idx_hi_task_sub_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_task_sub_scope ON public.act_hi_taskinst USING btree (sub_scope_id_, scope_type_);


--
-- Name: act_idx_hi_var_scope_id_type; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_var_scope_id_type ON public.act_hi_varinst USING btree (scope_id_, scope_type_);


--
-- Name: act_idx_hi_var_sub_id_type; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_hi_var_sub_id_type ON public.act_hi_varinst USING btree (sub_scope_id_, scope_type_);


--
-- Name: act_idx_ident_lnk_group; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ident_lnk_group ON public.act_ru_identitylink USING btree (group_id_);


--
-- Name: act_idx_ident_lnk_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ident_lnk_scope ON public.act_ru_identitylink USING btree (scope_id_, scope_type_);


--
-- Name: act_idx_ident_lnk_scope_def; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ident_lnk_scope_def ON public.act_ru_identitylink USING btree (scope_definition_id_, scope_type_);


--
-- Name: act_idx_ident_lnk_sub_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ident_lnk_sub_scope ON public.act_ru_identitylink USING btree (sub_scope_id_, scope_type_);


--
-- Name: act_idx_ident_lnk_user; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ident_lnk_user ON public.act_ru_identitylink USING btree (user_id_);


--
-- Name: act_idx_idl_procinst; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_idl_procinst ON public.act_ru_identitylink USING btree (proc_inst_id_);


--
-- Name: act_idx_job_correlation_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_job_correlation_id ON public.act_ru_job USING btree (correlation_id_);


--
-- Name: act_idx_job_custom_values_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_job_custom_values_id ON public.act_ru_job USING btree (custom_values_id_);


--
-- Name: act_idx_job_exception_stack_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_job_exception_stack_id ON public.act_ru_job USING btree (exception_stack_id_);


--
-- Name: act_idx_job_execution_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_job_execution_id ON public.act_ru_job USING btree (execution_id_);


--
-- Name: act_idx_job_proc_def_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_job_proc_def_id ON public.act_ru_job USING btree (proc_def_id_);


--
-- Name: act_idx_job_process_instance_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_job_process_instance_id ON public.act_ru_job USING btree (process_instance_id_);


--
-- Name: act_idx_job_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_job_scope ON public.act_ru_job USING btree (scope_id_, scope_type_);


--
-- Name: act_idx_job_scope_def; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_job_scope_def ON public.act_ru_job USING btree (scope_definition_id_, scope_type_);


--
-- Name: act_idx_job_sub_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_job_sub_scope ON public.act_ru_job USING btree (sub_scope_id_, scope_type_);


--
-- Name: act_idx_memb_group; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_memb_group ON public.act_id_membership USING btree (group_id_);


--
-- Name: act_idx_memb_user; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_memb_user ON public.act_id_membership USING btree (user_id_);


--
-- Name: act_idx_mil_case_def; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_mil_case_def ON public.act_cmmn_ru_mil_inst USING btree (case_def_id_);


--
-- Name: act_idx_mil_case_inst; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_mil_case_inst ON public.act_cmmn_ru_mil_inst USING btree (case_inst_id_);


--
-- Name: act_idx_model_deployment; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_model_deployment ON public.act_re_model USING btree (deployment_id_);


--
-- Name: act_idx_model_source; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_model_source ON public.act_re_model USING btree (editor_source_value_id_);


--
-- Name: act_idx_model_source_extra; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_model_source_extra ON public.act_re_model USING btree (editor_source_extra_value_id_);


--
-- Name: act_idx_plan_item_case_def; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_plan_item_case_def ON public.act_cmmn_ru_plan_item_inst USING btree (case_def_id_);


--
-- Name: act_idx_plan_item_case_inst; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_plan_item_case_inst ON public.act_cmmn_ru_plan_item_inst USING btree (case_inst_id_);


--
-- Name: act_idx_plan_item_stage_inst; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_plan_item_stage_inst ON public.act_cmmn_ru_plan_item_inst USING btree (stage_inst_id_);


--
-- Name: act_idx_priv_group; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_priv_group ON public.act_id_priv_mapping USING btree (group_id_);


--
-- Name: act_idx_priv_mapping; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_priv_mapping ON public.act_id_priv_mapping USING btree (priv_id_);


--
-- Name: act_idx_priv_user; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_priv_user ON public.act_id_priv_mapping USING btree (user_id_);


--
-- Name: act_idx_procdef_info_json; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_procdef_info_json ON public.act_procdef_info USING btree (info_json_id_);


--
-- Name: act_idx_procdef_info_proc; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_procdef_info_proc ON public.act_procdef_info USING btree (proc_def_id_);


--
-- Name: act_idx_ru_acti_end; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ru_acti_end ON public.act_ru_actinst USING btree (end_time_);


--
-- Name: act_idx_ru_acti_exec; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ru_acti_exec ON public.act_ru_actinst USING btree (execution_id_);


--
-- Name: act_idx_ru_acti_exec_act; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ru_acti_exec_act ON public.act_ru_actinst USING btree (execution_id_, act_id_);


--
-- Name: act_idx_ru_acti_proc; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ru_acti_proc ON public.act_ru_actinst USING btree (proc_inst_id_);


--
-- Name: act_idx_ru_acti_proc_act; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ru_acti_proc_act ON public.act_ru_actinst USING btree (proc_inst_id_, act_id_);


--
-- Name: act_idx_ru_acti_start; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ru_acti_start ON public.act_ru_actinst USING btree (start_time_);


--
-- Name: act_idx_ru_acti_task; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ru_acti_task ON public.act_ru_actinst USING btree (task_id_);


--
-- Name: act_idx_ru_var_scope_id_type; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ru_var_scope_id_type ON public.act_ru_variable USING btree (scope_id_, scope_type_);


--
-- Name: act_idx_ru_var_sub_id_type; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_ru_var_sub_id_type ON public.act_ru_variable USING btree (sub_scope_id_, scope_type_);


--
-- Name: act_idx_sentry_case_def; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_sentry_case_def ON public.act_cmmn_ru_sentry_part_inst USING btree (case_def_id_);


--
-- Name: act_idx_sentry_case_inst; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_sentry_case_inst ON public.act_cmmn_ru_sentry_part_inst USING btree (case_inst_id_);


--
-- Name: act_idx_sentry_plan_item; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_sentry_plan_item ON public.act_cmmn_ru_sentry_part_inst USING btree (plan_item_inst_id_);


--
-- Name: act_idx_sjob_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_sjob_scope ON public.act_ru_suspended_job USING btree (scope_id_, scope_type_);


--
-- Name: act_idx_sjob_scope_def; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_sjob_scope_def ON public.act_ru_suspended_job USING btree (scope_definition_id_, scope_type_);


--
-- Name: act_idx_sjob_sub_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_sjob_sub_scope ON public.act_ru_suspended_job USING btree (sub_scope_id_, scope_type_);


--
-- Name: act_idx_suspended_job_correlation_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_suspended_job_correlation_id ON public.act_ru_suspended_job USING btree (correlation_id_);


--
-- Name: act_idx_suspended_job_custom_values_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_suspended_job_custom_values_id ON public.act_ru_suspended_job USING btree (custom_values_id_);


--
-- Name: act_idx_suspended_job_exception_stack_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_suspended_job_exception_stack_id ON public.act_ru_suspended_job USING btree (exception_stack_id_);


--
-- Name: act_idx_suspended_job_execution_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_suspended_job_execution_id ON public.act_ru_suspended_job USING btree (execution_id_);


--
-- Name: act_idx_suspended_job_proc_def_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_suspended_job_proc_def_id ON public.act_ru_suspended_job USING btree (proc_def_id_);


--
-- Name: act_idx_suspended_job_process_instance_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_suspended_job_process_instance_id ON public.act_ru_suspended_job USING btree (process_instance_id_);


--
-- Name: act_idx_task_create; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_task_create ON public.act_ru_task USING btree (create_time_);


--
-- Name: act_idx_task_exec; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_task_exec ON public.act_ru_task USING btree (execution_id_);


--
-- Name: act_idx_task_procdef; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_task_procdef ON public.act_ru_task USING btree (proc_def_id_);


--
-- Name: act_idx_task_procinst; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_task_procinst ON public.act_ru_task USING btree (proc_inst_id_);


--
-- Name: act_idx_task_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_task_scope ON public.act_ru_task USING btree (scope_id_, scope_type_);


--
-- Name: act_idx_task_scope_def; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_task_scope_def ON public.act_ru_task USING btree (scope_definition_id_, scope_type_);


--
-- Name: act_idx_task_sub_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_task_sub_scope ON public.act_ru_task USING btree (sub_scope_id_, scope_type_);


--
-- Name: act_idx_timer_job_correlation_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_timer_job_correlation_id ON public.act_ru_timer_job USING btree (correlation_id_);


--
-- Name: act_idx_timer_job_custom_values_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_timer_job_custom_values_id ON public.act_ru_timer_job USING btree (custom_values_id_);


--
-- Name: act_idx_timer_job_duedate; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_timer_job_duedate ON public.act_ru_timer_job USING btree (duedate_);


--
-- Name: act_idx_timer_job_exception_stack_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_timer_job_exception_stack_id ON public.act_ru_timer_job USING btree (exception_stack_id_);


--
-- Name: act_idx_timer_job_execution_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_timer_job_execution_id ON public.act_ru_timer_job USING btree (execution_id_);


--
-- Name: act_idx_timer_job_proc_def_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_timer_job_proc_def_id ON public.act_ru_timer_job USING btree (proc_def_id_);


--
-- Name: act_idx_timer_job_process_instance_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_timer_job_process_instance_id ON public.act_ru_timer_job USING btree (process_instance_id_);


--
-- Name: act_idx_tjob_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_tjob_scope ON public.act_ru_timer_job USING btree (scope_id_, scope_type_);


--
-- Name: act_idx_tjob_scope_def; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_tjob_scope_def ON public.act_ru_timer_job USING btree (scope_definition_id_, scope_type_);


--
-- Name: act_idx_tjob_sub_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_tjob_sub_scope ON public.act_ru_timer_job USING btree (sub_scope_id_, scope_type_);


--
-- Name: act_idx_tskass_task; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_tskass_task ON public.act_ru_identitylink USING btree (task_id_);


--
-- Name: act_idx_var_bytearray; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_var_bytearray ON public.act_ru_variable USING btree (bytearray_id_);


--
-- Name: act_idx_var_exe; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_var_exe ON public.act_ru_variable USING btree (execution_id_);


--
-- Name: act_idx_var_procinst; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_var_procinst ON public.act_ru_variable USING btree (proc_inst_id_);


--
-- Name: act_idx_variable_task_id; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX act_idx_variable_task_id ON public.act_ru_variable USING btree (task_id_);


--
-- Name: flw_idx_batch_part; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX flw_idx_batch_part ON public.flw_ru_batch_part USING btree (batch_id_);


--
-- Name: idx_contitem_procid; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX idx_contitem_procid ON public.act_co_content_item USING btree (proc_inst_id_);


--
-- Name: idx_contitem_scope; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX idx_contitem_scope ON public.act_co_content_item USING btree (scope_id_, scope_type_);


--
-- Name: idx_contitem_taskid; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX idx_contitem_taskid ON public.act_co_content_item USING btree (task_id_);


--
-- Name: idx_proc_mod_created; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX idx_proc_mod_created ON public.act_de_model USING btree (created_by);


--
-- Name: idx_proc_mod_history_proc; Type: INDEX; Schema: public; Owner: flowable
--

CREATE INDEX idx_proc_mod_history_proc ON public.act_de_model_history USING btree (model_id);


--
-- Name: act_app_appdef act_fk_app_def_dply; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_app_appdef
    ADD CONSTRAINT act_fk_app_def_dply FOREIGN KEY (deployment_id_) REFERENCES public.act_app_deployment(id_);


--
-- Name: act_app_deployment_resource act_fk_app_rsrc_dpl; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_app_deployment_resource
    ADD CONSTRAINT act_fk_app_rsrc_dpl FOREIGN KEY (deployment_id_) REFERENCES public.act_app_deployment(id_);


--
-- Name: act_ru_identitylink act_fk_athrz_procedef; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_identitylink
    ADD CONSTRAINT act_fk_athrz_procedef FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);


--
-- Name: act_ge_bytearray act_fk_bytearr_depl; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ge_bytearray
    ADD CONSTRAINT act_fk_bytearr_depl FOREIGN KEY (deployment_id_) REFERENCES public.act_re_deployment(id_);


--
-- Name: act_cmmn_casedef act_fk_case_def_dply; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_casedef
    ADD CONSTRAINT act_fk_case_def_dply FOREIGN KEY (deployment_id_) REFERENCES public.act_cmmn_deployment(id_);


--
-- Name: act_cmmn_ru_case_inst act_fk_case_inst_case_def; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_ru_case_inst
    ADD CONSTRAINT act_fk_case_inst_case_def FOREIGN KEY (case_def_id_) REFERENCES public.act_cmmn_casedef(id_);


--
-- Name: act_cmmn_deployment_resource act_fk_cmmn_rsrc_dpl; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_deployment_resource
    ADD CONSTRAINT act_fk_cmmn_rsrc_dpl FOREIGN KEY (deployment_id_) REFERENCES public.act_cmmn_deployment(id_);


--
-- Name: act_ru_deadletter_job act_fk_deadletter_job_custom_values; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_deadletter_job
    ADD CONSTRAINT act_fk_deadletter_job_custom_values FOREIGN KEY (custom_values_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- Name: act_ru_deadletter_job act_fk_deadletter_job_exception; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_deadletter_job
    ADD CONSTRAINT act_fk_deadletter_job_exception FOREIGN KEY (exception_stack_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- Name: act_ru_deadletter_job act_fk_deadletter_job_execution; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_deadletter_job
    ADD CONSTRAINT act_fk_deadletter_job_execution FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_deadletter_job act_fk_deadletter_job_proc_def; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_deadletter_job
    ADD CONSTRAINT act_fk_deadletter_job_proc_def FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);


--
-- Name: act_ru_deadletter_job act_fk_deadletter_job_process_instance; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_deadletter_job
    ADD CONSTRAINT act_fk_deadletter_job_process_instance FOREIGN KEY (process_instance_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_event_subscr act_fk_event_exec; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_event_subscr
    ADD CONSTRAINT act_fk_event_exec FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_execution act_fk_exe_parent; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_fk_exe_parent FOREIGN KEY (parent_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_execution act_fk_exe_procdef; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_fk_exe_procdef FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);


--
-- Name: act_ru_execution act_fk_exe_procinst; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_fk_exe_procinst FOREIGN KEY (proc_inst_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_execution act_fk_exe_super; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_fk_exe_super FOREIGN KEY (super_exec_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_external_job act_fk_external_job_custom_values; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_external_job
    ADD CONSTRAINT act_fk_external_job_custom_values FOREIGN KEY (custom_values_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- Name: act_ru_external_job act_fk_external_job_exception; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_external_job
    ADD CONSTRAINT act_fk_external_job_exception FOREIGN KEY (exception_stack_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- Name: act_ru_identitylink act_fk_idl_procinst; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_identitylink
    ADD CONSTRAINT act_fk_idl_procinst FOREIGN KEY (proc_inst_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_procdef_info act_fk_info_json_ba; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_procdef_info
    ADD CONSTRAINT act_fk_info_json_ba FOREIGN KEY (info_json_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- Name: act_procdef_info act_fk_info_procdef; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_procdef_info
    ADD CONSTRAINT act_fk_info_procdef FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);


--
-- Name: act_ru_job act_fk_job_custom_values; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_job
    ADD CONSTRAINT act_fk_job_custom_values FOREIGN KEY (custom_values_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- Name: act_ru_job act_fk_job_exception; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_job
    ADD CONSTRAINT act_fk_job_exception FOREIGN KEY (exception_stack_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- Name: act_ru_job act_fk_job_execution; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_job
    ADD CONSTRAINT act_fk_job_execution FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_job act_fk_job_proc_def; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_job
    ADD CONSTRAINT act_fk_job_proc_def FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);


--
-- Name: act_ru_job act_fk_job_process_instance; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_job
    ADD CONSTRAINT act_fk_job_process_instance FOREIGN KEY (process_instance_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_id_membership act_fk_memb_group; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_id_membership
    ADD CONSTRAINT act_fk_memb_group FOREIGN KEY (group_id_) REFERENCES public.act_id_group(id_);


--
-- Name: act_id_membership act_fk_memb_user; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_id_membership
    ADD CONSTRAINT act_fk_memb_user FOREIGN KEY (user_id_) REFERENCES public.act_id_user(id_);


--
-- Name: act_cmmn_ru_mil_inst act_fk_mil_case_def; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_ru_mil_inst
    ADD CONSTRAINT act_fk_mil_case_def FOREIGN KEY (case_def_id_) REFERENCES public.act_cmmn_casedef(id_);


--
-- Name: act_cmmn_ru_mil_inst act_fk_mil_case_inst; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_ru_mil_inst
    ADD CONSTRAINT act_fk_mil_case_inst FOREIGN KEY (case_inst_id_) REFERENCES public.act_cmmn_ru_case_inst(id_);


--
-- Name: act_re_model act_fk_model_deployment; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_re_model
    ADD CONSTRAINT act_fk_model_deployment FOREIGN KEY (deployment_id_) REFERENCES public.act_re_deployment(id_);


--
-- Name: act_re_model act_fk_model_source; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_re_model
    ADD CONSTRAINT act_fk_model_source FOREIGN KEY (editor_source_value_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- Name: act_re_model act_fk_model_source_extra; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_re_model
    ADD CONSTRAINT act_fk_model_source_extra FOREIGN KEY (editor_source_extra_value_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- Name: act_cmmn_ru_plan_item_inst act_fk_plan_item_case_def; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_ru_plan_item_inst
    ADD CONSTRAINT act_fk_plan_item_case_def FOREIGN KEY (case_def_id_) REFERENCES public.act_cmmn_casedef(id_);


--
-- Name: act_cmmn_ru_plan_item_inst act_fk_plan_item_case_inst; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_ru_plan_item_inst
    ADD CONSTRAINT act_fk_plan_item_case_inst FOREIGN KEY (case_inst_id_) REFERENCES public.act_cmmn_ru_case_inst(id_);


--
-- Name: act_id_priv_mapping act_fk_priv_mapping; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_id_priv_mapping
    ADD CONSTRAINT act_fk_priv_mapping FOREIGN KEY (priv_id_) REFERENCES public.act_id_priv(id_);


--
-- Name: act_cmmn_ru_sentry_part_inst act_fk_sentry_case_def; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_ru_sentry_part_inst
    ADD CONSTRAINT act_fk_sentry_case_def FOREIGN KEY (case_def_id_) REFERENCES public.act_cmmn_casedef(id_);


--
-- Name: act_cmmn_ru_sentry_part_inst act_fk_sentry_case_inst; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_ru_sentry_part_inst
    ADD CONSTRAINT act_fk_sentry_case_inst FOREIGN KEY (case_inst_id_) REFERENCES public.act_cmmn_ru_case_inst(id_);


--
-- Name: act_cmmn_ru_sentry_part_inst act_fk_sentry_plan_item; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_cmmn_ru_sentry_part_inst
    ADD CONSTRAINT act_fk_sentry_plan_item FOREIGN KEY (plan_item_inst_id_) REFERENCES public.act_cmmn_ru_plan_item_inst(id_);


--
-- Name: act_ru_suspended_job act_fk_suspended_job_custom_values; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_suspended_job
    ADD CONSTRAINT act_fk_suspended_job_custom_values FOREIGN KEY (custom_values_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- Name: act_ru_suspended_job act_fk_suspended_job_exception; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_suspended_job
    ADD CONSTRAINT act_fk_suspended_job_exception FOREIGN KEY (exception_stack_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- Name: act_ru_suspended_job act_fk_suspended_job_execution; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_suspended_job
    ADD CONSTRAINT act_fk_suspended_job_execution FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_suspended_job act_fk_suspended_job_proc_def; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_suspended_job
    ADD CONSTRAINT act_fk_suspended_job_proc_def FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);


--
-- Name: act_ru_suspended_job act_fk_suspended_job_process_instance; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_suspended_job
    ADD CONSTRAINT act_fk_suspended_job_process_instance FOREIGN KEY (process_instance_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_task act_fk_task_exe; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_fk_task_exe FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_task act_fk_task_procdef; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_fk_task_procdef FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);


--
-- Name: act_ru_task act_fk_task_procinst; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_fk_task_procinst FOREIGN KEY (proc_inst_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_timer_job act_fk_timer_job_custom_values; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_timer_job
    ADD CONSTRAINT act_fk_timer_job_custom_values FOREIGN KEY (custom_values_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- Name: act_ru_timer_job act_fk_timer_job_exception; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_timer_job
    ADD CONSTRAINT act_fk_timer_job_exception FOREIGN KEY (exception_stack_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- Name: act_ru_timer_job act_fk_timer_job_execution; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_timer_job
    ADD CONSTRAINT act_fk_timer_job_execution FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_timer_job act_fk_timer_job_proc_def; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_timer_job
    ADD CONSTRAINT act_fk_timer_job_proc_def FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);


--
-- Name: act_ru_timer_job act_fk_timer_job_process_instance; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_timer_job
    ADD CONSTRAINT act_fk_timer_job_process_instance FOREIGN KEY (process_instance_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_identitylink act_fk_tskass_task; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_identitylink
    ADD CONSTRAINT act_fk_tskass_task FOREIGN KEY (task_id_) REFERENCES public.act_ru_task(id_);


--
-- Name: act_ru_variable act_fk_var_bytearray; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_fk_var_bytearray FOREIGN KEY (bytearray_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- Name: act_ru_variable act_fk_var_exe; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_fk_var_exe FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_ru_variable act_fk_var_procinst; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_fk_var_procinst FOREIGN KEY (proc_inst_id_) REFERENCES public.act_ru_execution(id_);


--
-- Name: act_de_model_relation fk_relation_child; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_de_model_relation
    ADD CONSTRAINT fk_relation_child FOREIGN KEY (model_id) REFERENCES public.act_de_model(id);


--
-- Name: act_de_model_relation fk_relation_parent; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.act_de_model_relation
    ADD CONSTRAINT fk_relation_parent FOREIGN KEY (parent_model_id) REFERENCES public.act_de_model(id);


--
-- Name: flw_ru_batch_part flw_fk_batch_part_parent; Type: FK CONSTRAINT; Schema: public; Owner: flowable
--

ALTER TABLE ONLY public.flw_ru_batch_part
    ADD CONSTRAINT flw_fk_batch_part_parent FOREIGN KEY (batch_id_) REFERENCES public.flw_ru_batch(id_);


--
-- PostgreSQL database dump complete
--

\unrestrict aftRDFdLlkPzSTq4RXQhqkGAZ7ePZDyPhJfIlvWbGahHNxhSNNb2nULPp0lZHjJ

--
-- Database "institucion_db" dump
--

--
-- PostgreSQL database dump
--

\restrict uaIKfB45OYCwN22D9nnBoRcLBg8sCbizPu5hDAnEwD6gbQCbPEndpyHsNwNymiL

-- Dumped from database version 15.20 (Debian 15.20-1.pgdg13+1)
-- Dumped by pg_dump version 15.20 (Debian 15.20-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: institucion_db; Type: DATABASE; Schema: -; Owner: flowable
--

CREATE DATABASE institucion_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE institucion_db OWNER TO flowable;

\unrestrict uaIKfB45OYCwN22D9nnBoRcLBg8sCbizPu5hDAnEwD6gbQCbPEndpyHsNwNymiL
\connect institucion_db
\restrict uaIKfB45OYCwN22D9nnBoRcLBg8sCbizPu5hDAnEwD6gbQCbPEndpyHsNwNymiL

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict uaIKfB45OYCwN22D9nnBoRcLBg8sCbizPu5hDAnEwD6gbQCbPEndpyHsNwNymiL

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict 1pXejTZS792KFpjTK0zj0na62BIo32Zk1pU2vpqKZmSpFfBsQzneW5D9BIxe7S4

-- Dumped from database version 15.20 (Debian 15.20-1.pgdg13+1)
-- Dumped by pg_dump version 15.20 (Debian 15.20-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict 1pXejTZS792KFpjTK0zj0na62BIo32Zk1pU2vpqKZmSpFfBsQzneW5D9BIxe7S4

--
-- PostgreSQL database cluster dump complete
--

