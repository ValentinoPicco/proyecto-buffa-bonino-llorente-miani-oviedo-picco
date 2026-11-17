--
-- PostgreSQL database cluster dump
--

\restrict vnK78KJhIlhFZxij05GdLdV94xvCIq4aVNc9fsT9glNKVd6FKyo5hEuVjOMPZoA

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








\unrestrict vnK78KJhIlhFZxij05GdLdV94xvCIq4aVNc9fsT9glNKVd6FKyo5hEuVjOMPZoA

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

\restrict NMR3VyZB8b9EthDzmRw3gQ6fmbUkeUsaT5wichULMf7uQOWPNV2QLoMcd0H40YF

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

\unrestrict NMR3VyZB8b9EthDzmRw3gQ6fmbUkeUsaT5wichULMf7uQOWPNV2QLoMcd0H40YF

--
-- Database "flowable" dump
--

--
-- PostgreSQL database dump
--

\restrict WP4UsrfTKQZa3EEQrMXw8vryAkTOMfTsyFqAXrk4hXuRe7aaZCzcydsLLPoPXVY

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

\unrestrict WP4UsrfTKQZa3EEQrMXw8vryAkTOMfTsyFqAXrk4hXuRe7aaZCzcydsLLPoPXVY
\connect flowable
\restrict WP4UsrfTKQZa3EEQrMXw8vryAkTOMfTsyFqAXrk4hXuRe7aaZCzcydsLLPoPXVY

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
07465075-e1d8-11f1-b51a-4227cbba929c	Organizar curso de capacitación	Process_Curso	Modelo conceptual, no ejecutable. Los recordatorios se cuentan por versión de propuesta. La fecha programada se obtiene de la propuesta aceptada. Para cada participante se espera una respuesta de encuesta; el enunciado no fija un vencimiento. La empresa se representa como pool de caja negra; los mensajes internos del subproceso se expresan con tareas de envío/recepción y eventos de mensaje.	\N	2026-11-16 16:08:56.733	admin	2026-11-16 16:11:15.222	admin	1	{"modelId":"07465075-e1d8-11f1-b51a-4227cbba929c","bounds":{"lowerRight":{"x":1760,"y":2090},"upperLeft":{"x":0,"y":0}},"properties":{"process_id":"Process_Curso","name":"Organizar curso de capacitación","documentation":"Modelo conceptual, no ejecutable. Los recordatorios se cuentan por versión de propuesta. La fecha programada se obtiene de la propuesta aceptada. Para cada participante se espera una respuesta de encuesta; el enunciado no fija un vencimiento. La empresa se representa como pool de caja negra; los mensajes internos del subproceso se expresan con tareas de envío/recepción y eventos de mensaje.","process_author":"","process_version":"","process_namespace":"https://unrc.edu.ar/bpmn/cursos","process_historylevel":"","isexecutable":"false","dataproperties":"{\\"items\\":[{\\"dataproperty_id\\":\\"DatosPropuesta_Object\\",\\"dataproperty_name\\":null,\\"dataproperty_type\\":\\"string\\",\\"dataproperty_value\\":\\"\\"},{\\"dataproperty_id\\":\\"DatosInforme_Object\\",\\"dataproperty_name\\":null,\\"dataproperty_type\\":\\"string\\",\\"dataproperty_value\\":\\"\\"}]}","executionlisteners":"{\\"executionListeners\\":[]}","eventlisteners":"{\\"eventListeners\\":[]}","signaldefinitions":"[]","messagedefinitions":"[{\\"id\\":\\"Msg_sol\\",\\"name\\":\\"Solicitud de curso\\"},{\\"id\\":\\"Msg_prop\\",\\"name\\":\\"Propuesta\\"},{\\"id\\":\\"Msg_acepta\\",\\"name\\":\\"Aceptación\\"},{\\"id\\":\\"Msg_rechaza\\",\\"name\\":\\"Rechazo\\"},{\\"id\\":\\"Msg_mod\\",\\"name\\":\\"Solicitud de modificaciones\\"},{\\"id\\":\\"Msg_record\\",\\"name\\":\\"Recordatorio\\"},{\\"id\\":\\"Msg_nom\\",\\"name\\":\\"Nómina de participantes\\"},{\\"id\\":\\"Msg_corr\\",\\"name\\":\\"Corrección de datos\\"},{\\"id\\":\\"Msg_pedcorr\\",\\"name\\":\\"Solicitud de corrección\\"},{\\"id\\":\\"Msg_consulta\\",\\"name\\":\\"Consulta de avance\\"},{\\"id\\":\\"Msg_resp\\",\\"name\\":\\"Respuesta de avance\\"},{\\"id\\":\\"Msg_cancel\\",\\"name\\":\\"Cancelación\\"},{\\"id\\":\\"Msg_cierre\\",\\"name\\":\\"Notificación de cierre\\"},{\\"id\\":\\"Msg_conf\\",\\"name\\":\\"Confirmación del curso\\"},{\\"id\\":\\"Msg_enc\\",\\"name\\":\\"Encuesta\\"},{\\"id\\":\\"Msg_resenc\\",\\"name\\":\\"Respuesta de encuesta\\"},{\\"id\\":\\"Msg_informe\\",\\"name\\":\\"Informe de resultados\\"}]","escalationdefinitions":"[]","process_potentialstarteruser":"","process_potentialstartergroup":"","iseagerexecutionfetch":"false","messages":[{"message_id":"Msg_sol","message_name":"Solicitud de curso","message_item_ref":null},{"message_id":"Msg_prop","message_name":"Propuesta","message_item_ref":null},{"message_id":"Msg_acepta","message_name":"Aceptación","message_item_ref":null},{"message_id":"Msg_rechaza","message_name":"Rechazo","message_item_ref":null},{"message_id":"Msg_mod","message_name":"Solicitud de modificaciones","message_item_ref":null},{"message_id":"Msg_record","message_name":"Recordatorio","message_item_ref":null},{"message_id":"Msg_nom","message_name":"Nómina de participantes","message_item_ref":null},{"message_id":"Msg_corr","message_name":"Corrección de datos","message_item_ref":null},{"message_id":"Msg_pedcorr","message_name":"Solicitud de corrección","message_item_ref":null},{"message_id":"Msg_consulta","message_name":"Consulta de avance","message_item_ref":null},{"message_id":"Msg_resp","message_name":"Respuesta de avance","message_item_ref":null},{"message_id":"Msg_cancel","message_name":"Cancelación","message_item_ref":null},{"message_id":"Msg_cierre","message_name":"Notificación de cierre","message_item_ref":null},{"message_id":"Msg_conf","message_name":"Confirmación del curso","message_item_ref":null},{"message_id":"Msg_enc","message_name":"Encuesta","message_item_ref":null},{"message_id":"Msg_resenc","message_name":"Respuesta de encuesta","message_item_ref":null},{"message_id":"Msg_informe","message_name":"Informe de resultados","message_item_ref":null}]},"childShapes":[{"resourceId":"Pool_Institucion","properties":{"overrideid":"Pool_Institucion","name":"Institución de capacitación","documentation":"","process_id":"Process_Curso","isexecutable":"false"},"stencil":{"id":"Pool"},"childShapes":[{"resourceId":"Lane_0sq5phl","properties":{"overrideid":"Lane_0sq5phl","name":"Docentes","documentation":"","showcaption":true},"stencil":{"id":"Lane"},"childShapes":[{"resourceId":"Dictar","properties":{"overrideid":"Dictar","name":"Desarrollar curso","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":"","formkeydefinition":"","formreference":"","formfieldvalidation":"true","duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_1sdjeh6"}],"bounds":{"lowerRight":{"x":932,"y":130},"upperLeft":{"x":792,"y":50}},"dockers":[]},{"resourceId":"Fecha","properties":{"overrideid":"Fecha","name":"Fecha programada","documentation":"","executionlisteners":{"executionListeners":[]},"timercycledefinition":"","timerdatedefinition":"${fechaCurso}","timerdurationdefinition":""},"stencil":{"id":"CatchTimerEvent"},"childShapes":[],"outgoing":[{"resourceId":"FechaDictar"}],"bounds":{"lowerRight":{"x":715,"y":103},"upperLeft":{"x":684,"y":72}},"dockers":[{"x":699.5,"y":87.5}]},{"resourceId":"Informe","properties":{"overrideid":"Informe","name":"Elaborar informe de resultados","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":"","formkeydefinition":"","formreference":"","formfieldvalidation":"true","duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"InformeEnviar"}],"bounds":{"lowerRight":{"x":1140,"y":130},"upperLeft":{"x":1000,"y":50}},"dockers":[]},{"resourceId":"Activity_1018bdz","properties":{"overrideid":"Activity_1018bdz","name":"Definir Docente que desarrolla el curso","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":"","formkeydefinition":"","formreference":"","formfieldvalidation":"true","duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_0lscijk"}],"bounds":{"lowerRight":{"x":635,"y":130},"upperLeft":{"x":535,"y":50}},"dockers":[]}],"outgoing":[],"bounds":{"lowerRight":{"x":1505,"y":1910},"upperLeft":{"x":30,"y":1740}},"dockers":[]},{"resourceId":"Lane_04yvzzz","properties":{"overrideid":"Lane_04yvzzz","name":"Administración","documentation":"","showcaption":true},"stencil":{"id":"Lane"},"childShapes":[{"resourceId":"Esperar","properties":{"overrideid":"Esperar","name":"Esperar respuesta","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"sequencefloworder":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"EventGateway"},"childShapes":[],"outgoing":[{"resourceId":"wait3"},{"resourceId":"wait0"},{"resourceId":"wait1"},{"resourceId":"wait2"}],"bounds":{"lowerRight":{"x":835,"y":285},"upperLeft":{"x":795,"y":245}},"dockers":[]},{"resourceId":"Inicio","properties":{"overrideid":"Inicio","name":"Solicitud recibida","documentation":"","executionlisteners":{"executionListeners":[]},"messageref":"Msg_sol","messageexpression":"","interrupting":true},"stencil":{"id":"StartMessageEvent"},"childShapes":[],"outgoing":[{"resourceId":"Flow_0g8vm9l"}],"bounds":{"lowerRight":{"x":87.5,"y":282},"upperLeft":{"x":57,"y":252}},"dockers":[]},{"resourceId":"Recordatorio","properties":{"scriptformat":null,"scripttext":null,"overrideid":"Recordatorio","name":"Enviar recordatorio","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","skipexpression":null,"isforcompensation":false,"scriptautostorevariables":false},"stencil":{"id":"ScriptTask"},"childShapes":[],"outgoing":[{"resourceId":"VolverEsperar"}],"bounds":{"lowerRight":{"x":1455,"y":330},"upperLeft":{"x":1355,"y":250}},"dockers":[]},{"resourceId":"Limite","properties":{"overrideid":"Limite","name":"¿Se enviaron 2 recordatorios?","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"sequencefloworder":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"ExclusiveGateway"},"childShapes":[],"outgoing":[{"resourceId":"OtroRecord"},{"resourceId":"SinRespuesta"}],"bounds":{"lowerRight":{"x":1190,"y":305},"upperLeft":{"x":1150,"y":265}},"dockers":[]},{"resourceId":"Plazo","properties":{"overrideid":"Plazo","name":"5 días","documentation":"","executionlisteners":{"executionListeners":[]},"timercycledefinition":"","timerdatedefinition":"","timerdurationdefinition":"P5D"},"stencil":{"id":"CatchTimerEvent"},"childShapes":[],"outgoing":[{"resourceId":"PlazoLimite"}],"bounds":{"lowerRight":{"x":1043,"y":303},"upperLeft":{"x":1012,"y":272}},"dockers":[{"x":1027.5,"y":287.5}]},{"resourceId":"Aceptar","properties":{"overrideid":"Aceptar","name":"Aceptación","documentation":"","executionlisteners":{"executionListeners":[]},"messageref":"Msg_acepta","messageexpression":""},"stencil":{"id":"CatchMessageEvent"},"childShapes":[],"outgoing":[{"resourceId":"Flow_05hw5hu"}],"bounds":{"lowerRight":{"x":1042,"y":522},"upperLeft":{"x":1012,"y":492}},"dockers":[{"x":1027,"y":507}]},{"resourceId":"Modificar","properties":{"overrideid":"Modificar","name":"Modificaciones","documentation":"","executionlisteners":{"executionListeners":[]},"messageref":"Msg_mod","messageexpression":""},"stencil":{"id":"CatchMessageEvent"},"childShapes":[],"outgoing":[{"resourceId":"ModificarProp"}],"bounds":{"lowerRight":{"x":1042,"y":142},"upperLeft":{"x":1012,"y":112}},"dockers":[{"x":1027,"y":127}]},{"resourceId":"Activity_12e0et1","properties":{"scriptformat":null,"scripttext":null,"overrideid":"Activity_12e0et1","name":"Notificar Cierre","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","skipexpression":null,"isforcompensation":false,"scriptautostorevariables":false},"stencil":{"id":"ScriptTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_175t1j3"}],"bounds":{"lowerRight":{"x":485,"y":1690},"upperLeft":{"x":385,"y":1610}},"dockers":[]},{"resourceId":"Event_0w2kitf","properties":{"overrideid":"Event_0w2kitf","name":"","documentation":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"EndNoneEvent"},"childShapes":[],"outgoing":[],"bounds":{"lowerRight":{"x":585,"y":1660},"upperLeft":{"x":557,"y":1632}},"dockers":[]},{"resourceId":"Archivar","properties":{"overrideid":"Archivar","name":"Archivar solicitud","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":"","formkeydefinition":"","formreference":"","formfieldvalidation":"true","duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"CerrarSolicitud"}],"bounds":{"lowerRight":{"x":1305,"y":450},"upperLeft":{"x":1165,"y":370}},"dockers":[]},{"resourceId":"FinSinCurso","properties":{"overrideid":"FinSinCurso","name":"Solicitud cerrada","documentation":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"EndNoneEvent"},"childShapes":[],"outgoing":[],"bounds":{"lowerRight":{"x":1395,"y":420},"upperLeft":{"x":1367,"y":392}},"dockers":[]},{"resourceId":"Rechazar","properties":{"overrideid":"Rechazar","name":"Rechazo","documentation":"","executionlisteners":{"executionListeners":[]},"messageref":"Msg_rechaza","messageexpression":""},"stencil":{"id":"CatchMessageEvent"},"childShapes":[],"outgoing":[{"resourceId":"Rechazado"}],"bounds":{"lowerRight":{"x":1042,"y":422},"upperLeft":{"x":1012,"y":392}},"dockers":[{"x":1027,"y":407}]},{"resourceId":"Preparar","properties":{"overrideid":"Preparar","name":"Preparar curso","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"dataproperties":{"items":[{"dataproperty_id":"DatosLista_Object","dataproperty_name":null,"dataproperty_type":"string","dataproperty_value":""}]},"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","istransaction":"false","activitytype":"SubProcess","isforcompensation":false},"stencil":{"id":"SubProcess"},"childShapes":[{"resourceId":"SubInicio","properties":{"overrideid":"SubInicio","name":"","documentation":"","executionlisteners":{"executionListeners":[]},"initiator":"","formkeydefinition":"","formreference":"","formfieldvalidation":"true","formproperties":"","interrupting":true},"stencil":{"id":"StartNoneEvent"},"childShapes":[],"outgoing":[{"resourceId":"s1"}],"bounds":{"lowerRight":{"x":55,"y":312},"upperLeft":{"x":25,"y":282}},"dockers":[]},{"resourceId":"ParInicio","properties":{"overrideid":"ParInicio","name":"Preparación en paralelo","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"sequencefloworder":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"ParallelGateway"},"childShapes":[],"outgoing":[{"resourceId":"s2"},{"resourceId":"s5"},{"resourceId":"s6"}],"bounds":{"lowerRight":{"x":145,"y":315},"upperLeft":{"x":105,"y":275}},"dockers":[]},{"resourceId":"Nomina","properties":{"overrideid":"Nomina","name":"Recibir nómina","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false},"stencil":{"id":"ReceiveTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_1j917g3"}],"bounds":{"lowerRight":{"x":340,"y":110},"upperLeft":{"x":200,"y":30}},"dockers":[]},{"resourceId":"Lista","properties":{"overrideid":"Lista","name":"Confeccionar lista definitiva","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":"","formkeydefinition":"","formreference":"","formfieldvalidation":"true","duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_1q09oq9"}],"bounds":{"lowerRight":{"x":810,"y":110},"upperLeft":{"x":670,"y":30}},"dockers":[]},{"resourceId":"Material","properties":{"overrideid":"Material","name":"Preparar materiales","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":"","formkeydefinition":"","formreference":"","formfieldvalidation":"true","duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_0pbsav2"}],"bounds":{"lowerRight":{"x":340,"y":340},"upperLeft":{"x":200,"y":260}},"dockers":[]},{"resourceId":"OrInicio","properties":{"overrideid":"OrInicio","name":"Recursos necesarios","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"sequencefloworder":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"InclusiveGateway"},"childShapes":[],"outgoing":[{"resourceId":"or0"},{"resourceId":"or1"},{"resourceId":"or2"}],"bounds":{"lowerRight":{"x":375,"y":565},"upperLeft":{"x":335,"y":525}},"dockers":[]},{"resourceId":"Virtual","properties":{"overrideid":"Virtual","name":"Solicitar Aula Virtual","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":"","formkeydefinition":"","formreference":"","formfieldvalidation":"true","duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"oj1"},{"resourceId":"Event_1gsyqer"}],"bounds":{"lowerRight":{"x":620,"y":590},"upperLeft":{"x":480,"y":510}},"dockers":[]},{"resourceId":"Equipo","properties":{"overrideid":"Equipo","name":"Contratar equipamiento","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":"","formkeydefinition":"","formreference":"","formfieldvalidation":"true","duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"oj2"},{"resourceId":"Event_1ypcc1j"}],"bounds":{"lowerRight":{"x":620,"y":780},"upperLeft":{"x":480,"y":700}},"dockers":[]},{"resourceId":"OrFin","properties":{"overrideid":"OrFin","name":"Todos los recursos seleccionados listos","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"sequencefloworder":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"InclusiveGateway"},"childShapes":[],"outgoing":[{"resourceId":"s11"}],"bounds":{"lowerRight":{"x":848,"y":565},"upperLeft":{"x":808,"y":525}},"dockers":[]},{"resourceId":"ParFin","properties":{"overrideid":"ParFin","name":"Preparación completa","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"sequencefloworder":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"ParallelGateway"},"childShapes":[],"outgoing":[{"resourceId":"s12"}],"bounds":{"lowerRight":{"x":1055,"y":315},"upperLeft":{"x":1015,"y":275}},"dockers":[]},{"resourceId":"SubFin","properties":{"overrideid":"SubFin","name":"","documentation":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"EndNoneEvent"},"childShapes":[],"outgoing":[],"bounds":{"lowerRight":{"x":1170,"y":310},"upperLeft":{"x":1142,"y":282}},"dockers":[]},{"resourceId":"Activity_12i2hpf","properties":{"overrideid":"Activity_12i2hpf","name":"Evaluar\\nRecursos","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":"","formkeydefinition":"","formreference":"","formfieldvalidation":"true","duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_0r6hcyb"}],"bounds":{"lowerRight":{"x":300,"y":590},"upperLeft":{"x":200,"y":510}},"dockers":[]},{"resourceId":"Activity_048d5em","properties":{"overrideid":"Activity_048d5em","name":"Cancelación","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"activitytype":"Event-Sub-Process","subprocesstype":"Embedded","isforcompensation":false},"stencil":{"id":"EventSubProcess"},"childShapes":[{"resourceId":"Event_1rvo4k6","properties":{"overrideid":"Event_1rvo4k6","name":"","documentation":"","compensationactivityref":"","executionlisteners":{"executionListeners":[]},"asynchronousdefinition":"false"},"stencil":{"id":"ThrowCompensationEvent"},"childShapes":[],"outgoing":[{"resourceId":"Flow_0h5si5f"}],"bounds":{"lowerRight":{"x":152,"y":62},"upperLeft":{"x":122,"y":32}},"dockers":[{"x":137,"y":47}]},{"resourceId":"Event_1g4xmqo","properties":{"overrideid":"Event_1g4xmqo","name":"Recibir Cancelación","documentation":"","executionlisteners":{"executionListeners":[]},"messageref":"","messageexpression":"","interrupting":true},"stencil":{"id":"StartMessageEvent"},"childShapes":[],"outgoing":[{"resourceId":"Flow_099pqle"}],"bounds":{"lowerRight":{"x":62.5,"y":62},"upperLeft":{"x":32,"y":32}},"dockers":[]},{"resourceId":"Event_0snigbc","properties":{"overrideid":"Event_0snigbc","name":"","documentation":"","executionlisteners":{"executionListeners":[]},"errorref":"","errorvariabletransient":false,"errorvariablelocalscope":false},"stencil":{"id":"EndErrorEvent"},"childShapes":[],"outgoing":[],"bounds":{"lowerRight":{"x":240,"y":60},"upperLeft":{"x":212,"y":32}},"dockers":[{"x":226,"y":46}]}],"outgoing":[],"bounds":{"lowerRight":{"x":1230,"y":830},"upperLeft":{"x":930,"y":710}},"dockers":[]},{"resourceId":"Event_1gsyqer","properties":{"overrideid":"Event_1gsyqer","name":"","documentation":"","cancelactivity":true,"executionlisteners":{"executionListeners":[]}},"stencil":{"id":"BoundaryCompensationEvent"},"childShapes":[],"outgoing":[{"resourceId":"Association_0f6fnvw"}],"bounds":{"lowerRight":{"x":562,"y":603},"upperLeft":{"x":532,"y":573}},"dockers":[{"x":70,"y":80}]},{"resourceId":"Event_1ypcc1j","properties":{"overrideid":"Event_1ypcc1j","name":"","documentation":"","cancelactivity":true,"executionlisteners":{"executionListeners":[]}},"stencil":{"id":"BoundaryCompensationEvent"},"childShapes":[],"outgoing":[{"resourceId":"Association_0oqohax"}],"bounds":{"lowerRight":{"x":562,"y":793},"upperLeft":{"x":532,"y":763}},"dockers":[{"x":70,"y":80}]},{"resourceId":"Activity_1m08pcl","properties":{"overrideid":"Activity_1m08pcl","name":"Liberar Equipamiento","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":true,"usertaskassignment":"","formkeydefinition":"","formreference":"","formfieldvalidation":"true","duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[],"bounds":{"lowerRight":{"x":750,"y":860},"upperLeft":{"x":650,"y":780}},"dockers":[]},{"resourceId":"Aula","properties":{"overrideid":"Aula","name":"Reservar aula","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"servicetasktriggerable":"false","executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"servicetaskclass":"","servicetaskexpression":"","servicetaskdelegateexpression":"","servicetaskfields":{"fields":[]},"servicetaskexceptions":{"exceptions":[]},"servicetaskresultvariable":"","servicetaskuselocalscopeforresultvariable":"false","skipexpression":"","servicetaskfailedjobretrytimecycle":"","servicetaskstoreresultvariabletransient":"false"},"stencil":{"id":"ServiceTask"},"childShapes":[],"outgoing":[{"resourceId":"oj0"},{"resourceId":"sid-FFB10310-1EC7-47CC-8F71-627D8DC0DE8F"}],"bounds":{"lowerRight":{"x":580,"y":430},"upperLeft":{"x":480,"y":350}},"dockers":[]},{"resourceId":"Activity_16zz91p","properties":{"overrideid":"Activity_16zz91p","name":"Liberar Aula","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"servicetasktriggerable":"false","executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":true,"servicetaskclass":"","servicetaskexpression":"","servicetaskdelegateexpression":"","servicetaskfields":{"fields":[]},"servicetaskexceptions":{"exceptions":[]},"servicetaskresultvariable":"","servicetaskuselocalscopeforresultvariable":"false","skipexpression":"","servicetaskfailedjobretrytimecycle":"","servicetaskstoreresultvariabletransient":"false"},"stencil":{"id":"ServiceTask"},"childShapes":[],"outgoing":[],"bounds":{"lowerRight":{"x":760,"y":520},"upperLeft":{"x":660,"y":440}},"dockers":[]},{"resourceId":"Activity_02hrooc","properties":{"scriptformat":null,"scripttext":null,"overrideid":"Activity_02hrooc","name":"Liberar Aula Virtual","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","skipexpression":null,"isforcompensation":true,"scriptautostorevariables":false},"stencil":{"id":"ScriptTask"},"childShapes":[],"outgoing":[],"bounds":{"lowerRight":{"x":750,"y":670},"upperLeft":{"x":650,"y":590}},"dockers":[]},{"resourceId":"sid-FFB10310-1EC7-47CC-8F71-627D8DC0DE8F","properties":{"overrideid":"sid-FFB10310-1EC7-47CC-8F71-627D8DC0DE8F","name":"","documentation":"","cancelactivity":true,"executionlisteners":{"executionListeners":[]}},"stencil":{"id":"BoundaryCompensationEvent"},"childShapes":[],"outgoing":[{"resourceId":"Association_1fh67xn"}],"bounds":{"lowerRight":{"x":567.9917555757579,"y":445.43604456881826},"upperLeft":{"x":537.9917555757579,"y":415.43604456881826}},"dockers":[{"x":71.83123779296875,"y":78.39501953125}]}],"outgoing":[{"resourceId":"Preparado"},{"resourceId":"Event_0farfur"}],"bounds":{"lowerRight":{"x":1425,"y":1510},"upperLeft":{"x":165,"y":620}},"dockers":[]},{"resourceId":"Event_0farfur","properties":{"overrideid":"Event_0farfur","name":"","documentation":"","errorref":"","errorvariablename":"","errorvariabletransient":false,"errorvariablelocalscope":false,"cancelactivity":false,"executionlisteners":{"executionListeners":[]}},"stencil":{"id":"BoundaryErrorEvent"},"childShapes":[],"outgoing":[{"resourceId":"Flow_1ymw5qe"}],"bounds":{"lowerRight":{"x":366.2968993935324,"y":1522.7110903860867},"upperLeft":{"x":336.2968993935324,"y":1492.7110903860867}},"dockers":[{"x":190,"y":890}]},{"resourceId":"Propuesta","properties":{"overrideid":"Propuesta","name":"Registrar y Elaborar propuesta","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":"","formkeydefinition":"","formreference":"","formfieldvalidation":"true","duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"main2"}],"bounds":{"lowerRight":{"x":600,"y":450},"upperLeft":{"x":460,"y":370}},"dockers":[]},{"resourceId":"Gateway_10gftrn","properties":{"overrideid":"Gateway_10gftrn","name":"Es viable?","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"sequencefloworder":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"ExclusiveGateway"},"childShapes":[],"outgoing":[{"resourceId":"Flow_0k38d9g"},{"resourceId":"Flow_0w8xn3l"}],"bounds":{"lowerRight":{"x":250,"y":425},"upperLeft":{"x":210,"y":385}},"dockers":[]},{"resourceId":"Activity_1xw400l","properties":{"overrideid":"Activity_1xw400l","name":"Evaluar Viabilidad","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"ruletask_rules":null,"ruletask_variables_input":null,"ruletask_exclude":"false","ruletask_result":null,"ruletask_class":null},"stencil":{"id":"BusinessRule"},"childShapes":[],"outgoing":[{"resourceId":"Flow_0kbnm1d"}],"bounds":{"lowerRight":{"x":125,"y":450},"upperLeft":{"x":25,"y":370}},"dockers":[]},{"resourceId":"Event_18edb9q","properties":{"overrideid":"Event_18edb9q","name":"","documentation":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"EndNoneEvent"},"childShapes":[],"outgoing":[],"bounds":{"lowerRight":{"x":365,"y":530},"upperLeft":{"x":337,"y":502}},"dockers":[]},{"resourceId":"Activity_0iibzwu","properties":{"scriptformat":null,"scripttext":null,"overrideid":"Activity_0iibzwu","name":"Notificar Desición","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","skipexpression":null,"isforcompensation":false,"scriptautostorevariables":false},"stencil":{"id":"ScriptTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_00ve97r"}],"bounds":{"lowerRight":{"x":285,"y":560},"upperLeft":{"x":185,"y":480}},"dockers":[]},{"resourceId":"Confirmar","properties":{"scriptformat":null,"scripttext":null,"overrideid":"Confirmar","name":"Enviar confirmación","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","skipexpression":null,"isforcompensation":false,"scriptautostorevariables":false},"stencil":{"id":"ScriptTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_1topamj"}],"bounds":{"lowerRight":{"x":742,"y":1690},"upperLeft":{"x":642,"y":1610}},"dockers":[]},{"resourceId":"Fin","properties":{"overrideid":"Fin","name":"Liberar recursos.\\n Curso finalizado","documentation":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"EndNoneEvent"},"childShapes":[],"outgoing":[],"bounds":{"lowerRight":{"x":1420,"y":1660},"upperLeft":{"x":1392,"y":1632}},"dockers":[]},{"resourceId":"Revisar","properties":{"overrideid":"Revisar","name":"Revisar propuesta","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":"","formkeydefinition":"","formreference":"","formfieldvalidation":"true","duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_0upbxn5"}],"bounds":{"lowerRight":{"x":1305,"y":110},"upperLeft":{"x":1165,"y":30}},"dockers":[]},{"resourceId":"EnviarInforme","properties":{"overrideid":"EnviarInforme","name":"Enviar informe a empresa y Archivar expediente.","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":"","formkeydefinition":"","formreference":"","formfieldvalidation":"true","duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"InformeArchivar"}],"bounds":{"lowerRight":{"x":1310,"y":1690},"upperLeft":{"x":1210,"y":1610}},"dockers":[]},{"resourceId":"Activity_1eg7zcl","properties":{"scriptformat":null,"scripttext":null,"overrideid":"Activity_1eg7zcl","name":"Habilitar acceso de la empresa","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","skipexpression":null,"isforcompensation":false,"scriptautostorevariables":false},"stencil":{"id":"ScriptTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_1ffpwga"}],"bounds":{"lowerRight":{"x":1315,"y":550},"upperLeft":{"x":1215,"y":470}},"dockers":[]},{"resourceId":"Enviar","properties":{"scriptformat":null,"scripttext":null,"overrideid":"Enviar","name":"Enviar propuesta","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","skipexpression":null,"isforcompensation":false,"scriptautostorevariables":false},"stencil":{"id":"ScriptTask"},"childShapes":[],"outgoing":[{"resourceId":"main3"}],"bounds":{"lowerRight":{"x":580,"y":310},"upperLeft":{"x":480,"y":230}},"dockers":[]}],"outgoing":[],"bounds":{"lowerRight":{"x":1505,"y":1740},"upperLeft":{"x":30,"y":0}},"dockers":[]}],"outgoing":[],"bounds":{"lowerRight":{"x":1660,"y":1990},"upperLeft":{"x":155,"y":80}},"dockers":[]},{"resourceId":"FechaDictar","properties":{"overrideid":"FechaDictar","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Dictar"}],"bounds":{"lowerRight":{"x":976.1758995721917,"y":1908.9103984549567},"upperLeft":{"x":900.7342566778083,"y":1907.7497577950433}},"dockers":[{"x":15.5,"y":15.5},{"x":70,"y":40}],"target":{"resourceId":"Dictar"}},{"resourceId":"Flow_1sdjeh6","properties":{"overrideid":"Flow_1sdjeh6","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Informe"}],"bounds":{"lowerRight":{"x":1184.125,"y":1910},"upperLeft":{"x":1117.875,"y":1910}},"dockers":[{"x":70,"y":40},{"x":70,"y":40}],"target":{"resourceId":"Informe"}},{"resourceId":"InformeEnviar","properties":{"overrideid":"InformeEnviar","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"EnviarInforme"}],"bounds":{"lowerRight":{"x":1445,"y":1910},"upperLeft":{"x":1325.765625,"y":1770.375}},"dockers":[{"x":70,"y":40},{"x":1445,"y":1910},{"x":50,"y":40}],"target":{"resourceId":"EnviarInforme"}},{"resourceId":"Flow_0lscijk","properties":{"overrideid":"Flow_0lscijk","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Fecha"}],"bounds":{"lowerRight":{"x":872.7658632779212,"y":1908.9039523914394},"upperLeft":{"x":820.1989804720788,"y":1907.7562038585606}},"dockers":[{"x":50,"y":40},{"x":15.5,"y":15.5}],"target":{"resourceId":"Fecha"}},{"resourceId":"main3","properties":{"overrideid":"main3","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Esperar"}],"bounds":{"lowerRight":{"x":990.09390385799,"y":349.11331821461386},"upperLeft":{"x":765.54086176701,"y":345.17379116038614}},"dockers":[{"x":50,"y":40},{"x":20,"y":20}],"target":{"resourceId":"Esperar"}},{"resourceId":"VolverEsperar","properties":{"overrideid":"VolverEsperar","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Esperar"}],"bounds":{"lowerRight":{"x":1610,"y":333.6916067935323},"upperLeft":{"x":1001.0280357460425,"y":290}},"dockers":[{"x":50,"y":40},{"x":1610,"y":290},{"x":1005,"y":290},{"x":20,"y":20}],"target":{"resourceId":"Esperar"}},{"resourceId":"wait3","properties":{"overrideid":"wait3","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Plazo"}],"bounds":{"lowerRight":{"x":1200.4259072025163,"y":370},"upperLeft":{"x":1020.7615182064677,"y":346.8874107460425}},"dockers":[{"x":20,"y":20},{"x":1055,"y":350},{"x":1055,"y":370},{"x":15.5,"y":15.5}],"target":{"resourceId":"Plazo"}},{"resourceId":"wait0","properties":{"overrideid":"wait0","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Aceptar"}],"bounds":{"lowerRight":{"x":1198.062605003413,"y":590},"upperLeft":{"x":1000.4110289146626,"y":365.14041681846345}},"dockers":[{"x":20,"y":20},{"x":1005,"y":590},{"x":15,"y":15}],"target":{"resourceId":"Aceptar"}},{"resourceId":"wait1","properties":{"overrideid":"wait1","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Rechazar"}],"bounds":{"lowerRight":{"x":1198.062605003413,"y":490},"upperLeft":{"x":1000.6985247758398,"y":365.2572184993536}},"dockers":[{"x":20,"y":20},{"x":1005,"y":490},{"x":15,"y":15}],"target":{"resourceId":"Rechazar"}},{"resourceId":"wait2","properties":{"overrideid":"wait2","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Modificar"}],"bounds":{"lowerRight":{"x":1198.3439214236748,"y":350},"upperLeft":{"x":1020.52628719021,"y":207.25289034400603}},"dockers":[{"x":20,"y":20},{"x":1050,"y":350},{"x":1050,"y":210},{"x":15,"y":15}],"target":{"resourceId":"Modificar"}},{"resourceId":"CerrarSolicitud","properties":{"overrideid":"CerrarSolicitud","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"FinSinCurso"}],"bounds":{"lowerRight":{"x":1555.8753750937867,"y":488.0663630162681},"upperLeft":{"x":1490.5777499062133,"y":486.2773869837319}},"dockers":[{"x":70,"y":40},{"x":14,"y":14}],"target":{"resourceId":"FinSinCurso"}},{"resourceId":"main2","properties":{"overrideid":"main2","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Enviar"}],"bounds":{"lowerRight":{"x":715,"y":449.625},"upperLeft":{"x":715,"y":390.375}},"dockers":[{"x":70,"y":40},{"x":50,"y":40}],"target":{"resourceId":"Enviar"}},{"resourceId":"Flow_0upbxn5","properties":{"overrideid":"Flow_0upbxn5","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Enviar"}],"bounds":{"lowerRight":{"x":1349.4638671875,"y":309.9375},"upperLeft":{"x":715,"y":150}},"dockers":[{"x":70,"y":40},{"x":715,"y":150},{"x":50,"y":40}],"target":{"resourceId":"Enviar"}},{"resourceId":"OtroRecord","properties":{"overrideid":"OtroRecord","name":"No","documentation":"","conditionsequenceflow":"${recordatorios < 2}","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Recordatorio"}],"bounds":{"lowerRight":{"x":1539.429913769943,"y":368.92404071850945},"upperLeft":{"x":1375.277117480057,"y":365.43142803149055}},"dockers":[{"x":20,"y":20},{"x":50,"y":40}],"target":{"resourceId":"Recordatorio"}},{"resourceId":"PlazoLimite","properties":{"overrideid":"PlazoLimite","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Limite"}],"bounds":{"lowerRight":{"x":1345.09390385799,"y":367.21878696461386},"upperLeft":{"x":1228.52914301701,"y":365.17379116038614}},"dockers":[{"x":15.5,"y":15.5},{"x":20,"y":20}],"target":{"resourceId":"Limite"}},{"resourceId":"SinRespuesta","properties":{"overrideid":"SinRespuesta","name":"Sí","documentation":"","conditionsequenceflow":"${recordatorios >= 2}","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Archivar"}],"bounds":{"lowerRight":{"x":1420,"y":449.21875},"upperLeft":{"x":1356.804638342153,"y":385.93380476897494}},"dockers":[{"x":20,"y":20},{"x":1360,"y":423},{"x":1420,"y":423},{"x":70,"y":40}],"target":{"resourceId":"Archivar"}},{"resourceId":"Rechazado","properties":{"overrideid":"Rechazado","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Archivar"}],"bounds":{"lowerRight":{"x":1349.1251039963488,"y":488.97776592302426},"upperLeft":{"x":1227.6248960036512,"y":487.22535907697574}},"dockers":[{"x":15,"y":15},{"x":70,"y":40}],"target":{"resourceId":"Archivar"}},{"resourceId":"ModificarProp","properties":{"overrideid":"ModificarProp","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Revisar"}],"bounds":{"lowerRight":{"x":1420,"y":210},"upperLeft":{"x":1227.6248960036512,"y":190.375}},"dockers":[{"x":15,"y":15},{"x":1420,"y":210},{"x":70,"y":40}],"target":{"resourceId":"Revisar"}},{"resourceId":"Flow_175t1j3","properties":{"overrideid":"Flow_175t1j3","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Event_0w2kitf"}],"bounds":{"lowerRight":{"x":746.5004322455356,"y":1728.5018509483982},"upperLeft":{"x":670.9370677544644,"y":1726.2793990516018}},"dockers":[{"x":50,"y":40},{"x":14,"y":14}],"target":{"resourceId":"Event_0w2kitf"}},{"resourceId":"Flow_1ymw5qe","properties":{"overrideid":"Flow_1ymw5qe","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Activity_12e0et1"}],"bounds":{"lowerRight":{"x":569.625,"y":1730},"upperLeft":{"x":536.699011962774,"y":1603.1619692845677}},"dockers":[{"x":15,"y":15},{"x":540,"y":1730},{"x":50,"y":40}],"target":{"resourceId":"Activity_12e0et1"}},{"resourceId":"Preparado","properties":{"overrideid":"Preparado","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Confirmar"}],"bounds":{"lowerRight":{"x":901.5707394601488,"y":1689.0249143489038},"upperLeft":{"x":884.2144167898512,"y":1590.4477419010962}},"dockers":[{"x":630,"y":445},{"x":50,"y":40}],"target":{"resourceId":"Confirmar"}},{"resourceId":"s1","properties":{"overrideid":"s1","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"ParInicio"}],"bounds":{"lowerRight":{"x":464.70340170172085,"y":996.632727098864},"upperLeft":{"x":405.60909829827915,"y":995.242272901136}},"dockers":[{"x":15,"y":15},{"x":20,"y":20}],"target":{"resourceId":"ParInicio"}},{"resourceId":"s2","properties":{"overrideid":"s2","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Nomina"}],"bounds":{"lowerRight":{"x":549.546875,"y":985.2111843221684},"upperLeft":{"x":475.21752923728513,"y":770}},"dockers":[{"x":20,"y":20},{"x":480,"y":770},{"x":70,"y":40}],"target":{"resourceId":"Nomina"}},{"resourceId":"s5","properties":{"overrideid":"s5","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Material"}],"bounds":{"lowerRight":{"x":549.8990315006464,"y":997.5827252241602},"upperLeft":{"x":495.2572184993536,"y":995.6985247758398}},"dockers":[{"x":20,"y":20},{"x":70,"y":40}],"target":{"resourceId":"Material"}},{"resourceId":"s6","properties":{"overrideid":"s6","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Activity_12i2hpf"}],"bounds":{"lowerRight":{"x":549.3159542417551,"y":1245.7763295201462},"upperLeft":{"x":475.4110289146625,"y":1015.1404168184634}},"dockers":[{"x":20,"y":20},{"x":480,"y":1240},{"x":50,"y":40}],"target":{"resourceId":"Activity_12i2hpf"}},{"resourceId":"or0","properties":{"overrideid":"or0","name":"Presencial","documentation":"","conditionsequenceflow":"${requiereAula}","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Aula"}],"bounds":{"lowerRight":{"x":829.859375,"y":1234.3130198856602},"upperLeft":{"x":705.344741294011,"y":1090}},"dockers":[{"x":20,"y":20},{"x":710,"y":1090},{"x":50,"y":40}],"target":{"resourceId":"Aula"}},{"resourceId":"oj0","properties":{"overrideid":"oj0","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"OrFin"}],"bounds":{"lowerRight":{"x":1183,"y":1234.3130198856602},"upperLeft":{"x":930.7109375,"y":1090}},"dockers":[{"x":50,"y":40},{"x":1183,"y":1090},{"x":20,"y":20}],"target":{"resourceId":"OrFin"}},{"resourceId":"or1","properties":{"overrideid":"or1","name":"Virtual","documentation":"","conditionsequenceflow":"${requierePlataforma}","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Virtual"}],"bounds":{"lowerRight":{"x":829.6839223190905,"y":1248.1970236492075},"upperLeft":{"x":725.8043589309095,"y":1245.5334451007925}},"dockers":[{"x":20,"y":20},{"x":70,"y":40}],"target":{"resourceId":"Virtual"}},{"resourceId":"oj1","properties":{"overrideid":"oj1","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"OrFin"}],"bounds":{"lowerRight":{"x":1168.312661701881,"y":1248.7320172967964},"upperLeft":{"x":970.499838298119,"y":1245.1742327032036}},"dockers":[{"x":70,"y":40},{"x":20,"y":20}],"target":{"resourceId":"OrFin"}},{"resourceId":"or2","properties":{"overrideid":"or2","name":"Equipamiento especial","documentation":"","conditionsequenceflow":"${requiereEquipamiento}","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Equipo"}],"bounds":{"lowerRight":{"x":829.234375,"y":1440},"upperLeft":{"x":705.5334451007925,"y":1265.8043589309095}},"dockers":[{"x":20,"y":20},{"x":710,"y":1440},{"x":70,"y":40}],"target":{"resourceId":"Equipo"}},{"resourceId":"oj2","properties":{"overrideid":"oj2","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"OrFin"}],"bounds":{"lowerRight":{"x":1183,"y":1440},"upperLeft":{"x":970.64453125,"y":1265.8043589309095}},"dockers":[{"x":70,"y":40},{"x":1183,"y":1440},{"x":20,"y":20}],"target":{"resourceId":"OrFin"}},{"resourceId":"s11","properties":{"overrideid":"s11","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"ParFin"}],"bounds":{"lowerRight":{"x":1390,"y":1250},"upperLeft":{"x":1198.874721992088,"y":1015.9216828216568}},"dockers":[{"x":20,"y":20},{"x":1390,"y":1250},{"x":20,"y":20}],"target":{"resourceId":"ParFin"}},{"resourceId":"s12","properties":{"overrideid":"s12","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"SubFin"}],"bounds":{"lowerRight":{"x":1496.4922216489235,"y":995.9214233194126},"upperLeft":{"x":1405.8515283510765,"y":995.1723266805874}},"dockers":[{"x":20,"y":20},{"x":14,"y":14}],"target":{"resourceId":"SubFin"}},{"resourceId":"Flow_0r6hcyb","properties":{"overrideid":"Flow_0r6hcyb","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"OrInicio"}],"bounds":{"lowerRight":{"x":694.1573818622755,"y":1247.6086848505845},"upperLeft":{"x":650.2176181377245,"y":1245.5163151494155}},"dockers":[{"x":50,"y":40},{"x":20,"y":20}],"target":{"resourceId":"OrInicio"}},{"resourceId":"Flow_099pqle","properties":{"overrideid":"Flow_099pqle","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Event_1rvo4k6"}],"bounds":{"lowerRight":{"x":1404.78125,"y":1457},"upperLeft":{"x":1342.974609375,"y":1457}},"dockers":[{"x":15.25,"y":15},{"x":15,"y":15}],"target":{"resourceId":"Event_1rvo4k6"}},{"resourceId":"Flow_0h5si5f","properties":{"overrideid":"Flow_0h5si5f","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Event_0snigbc"}],"bounds":{"lowerRight":{"x":1495.9610006173668,"y":1456.8247022541277},"upperLeft":{"x":1432.6014993826332,"y":1456.1127977458723}},"dockers":[{"x":15,"y":15},{"x":14,"y":14}],"target":{"resourceId":"Event_0snigbc"}},{"resourceId":"Flow_0pbsav2","properties":{"overrideid":"Flow_0pbsav2","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"ParFin"}],"bounds":{"lowerRight":{"x":1375.035177608622,"y":999.5393626293865},"upperLeft":{"x":690.4775177038781,"y":995.0651295581135}},"dockers":[{"x":70,"y":40},{"x":20,"y":20}],"target":{"resourceId":"ParFin"}},{"resourceId":"Flow_1q09oq9","properties":{"overrideid":"Flow_1q09oq9","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"ParFin"}],"bounds":{"lowerRight":{"x":1390,"y":985.2111843221684},"upperLeft":{"x":1160.140625,"y":770}},"dockers":[{"x":70,"y":40},{"x":1390,"y":770},{"x":20,"y":20}],"target":{"resourceId":"ParFin"}},{"resourceId":"Flow_1j917g3","properties":{"overrideid":"Flow_1j917g3","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Lista"}],"bounds":{"lowerRight":{"x":1019.234375,"y":770},"upperLeft":{"x":690.765625,"y":770}},"dockers":[{"x":70,"y":40},{"x":70,"y":40}],"target":{"resourceId":"Lista"}},{"resourceId":"Association_0oqohax","properties":{"overrideid":"Association_0oqohax","name":"","documentation":""},"stencil":{"id":"Association"},"childShapes":[],"outgoing":[{"resourceId":"Activity_1m08pcl"}],"bounds":{"lowerRight":{"x":1000,"y":1520},"upperLeft":{"x":898.102497049988,"y":1493.4349586998308}},"dockers":[{"x":15,"y":15},{"x":900,"y":1520},{"x":0,"y":40}],"target":{"resourceId":"Activity_1m08pcl"}},{"resourceId":"Association_0f6fnvw","properties":{"overrideid":"Association_0f6fnvw","name":"","documentation":""},"stencil":{"id":"Association"},"childShapes":[],"outgoing":[{"resourceId":"Activity_02hrooc"}],"bounds":{"lowerRight":{"x":1000,"y":1330},"upperLeft":{"x":898.102497049988,"y":1303.4349586998308}},"dockers":[{"x":15,"y":15},{"x":900,"y":1330},{"x":0,"y":40}],"target":{"resourceId":"Activity_02hrooc"}},{"resourceId":"InformeArchivar","properties":{"overrideid":"InformeArchivar","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Fin"}],"bounds":{"lowerRight":{"x":1580.8753750937867,"y":1728.628863016268},"upperLeft":{"x":1495.0464999062133,"y":1726.277386983732}},"dockers":[{"x":50,"y":40},{"x":14,"y":14}],"target":{"resourceId":"Fin"}},{"resourceId":"Flow_0g8vm9l","properties":{"overrideid":"Flow_0g8vm9l","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Activity_1xw400l"}],"bounds":{"lowerRight":{"x":259.22881966076864,"y":449.89862235997015},"upperLeft":{"x":257.54852408923136,"y":362.52325264002985}},"dockers":[{"x":15.25,"y":15},{"x":50,"y":40}],"target":{"resourceId":"Activity_1xw400l"}},{"resourceId":"Flow_0kbnm1d","properties":{"overrideid":"Flow_0kbnm1d","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Gateway_10gftrn"}],"bounds":{"lowerRight":{"x":404.3130198856603,"y":488.36619620598907},"upperLeft":{"x":310.6479176143397,"y":485.34474129401093}},"dockers":[{"x":50,"y":40},{"x":20,"y":20}],"target":{"resourceId":"Gateway_10gftrn"}},{"resourceId":"Flow_0k38d9g","properties":{"overrideid":"Flow_0k38d9g","name":"si","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Propuesta"}],"bounds":{"lowerRight":{"x":644.8595138599604,"y":488.830991897666},"upperLeft":{"x":435.9217361400396,"y":485.348695602334}},"dockers":[{"x":20,"y":20},{"x":70,"y":40}],"target":{"resourceId":"Propuesta"}},{"resourceId":"Flow_0w8xn3l","properties":{"overrideid":"Flow_0w8xn3l","name":"no","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Activity_0iibzwu"}],"bounds":{"lowerRight":{"x":418.2378127757237,"y":559.4696938416449},"upperLeft":{"x":415.9028122242763,"y":505.7646811583551}},"dockers":[{"x":20,"y":20},{"x":50,"y":40}],"target":{"resourceId":"Activity_0iibzwu"}},{"resourceId":"Flow_00ve97r","properties":{"overrideid":"Flow_00ve97r","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Event_18edb9q"}],"bounds":{"lowerRight":{"x":525.9380940006464,"y":598.2467877241602},"upperLeft":{"x":470.8431559993536,"y":596.3469622758398}},"dockers":[{"x":50,"y":40},{"x":14,"y":14}],"target":{"resourceId":"Event_18edb9q"}},{"resourceId":"Flow_1topamj","properties":{"overrideid":"Flow_1topamj","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Activity_1018bdz"}],"bounds":{"lowerRight":{"x":877,"y":1869.6640625},"upperLeft":{"x":770,"y":1770.84375}},"dockers":[{"x":50,"y":40},{"x":877,"y":1815},{"x":770,"y":1815},{"x":50,"y":40}],"target":{"resourceId":"Activity_1018bdz"}},{"resourceId":"Flow_05hw5hu","properties":{"overrideid":"Flow_05hw5hu","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Activity_1eg7zcl"}],"bounds":{"lowerRight":{"x":1399.7266419340765,"y":589.366302209253},"upperLeft":{"x":1227.8749205659235,"y":587.200104040747}},"dockers":[{"x":15,"y":15},{"x":50,"y":40}],"target":{"resourceId":"Activity_1eg7zcl"}},{"resourceId":"Flow_1ffpwga","properties":{"overrideid":"Flow_1ffpwga","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Preparar"}],"bounds":{"lowerRight":{"x":1415.8478902463376,"y":699.8032808028561},"upperLeft":{"x":1357.0134378786624,"y":630.3285551346439}},"dockers":[{"x":50,"y":40},{"x":630,"y":445}],"target":{"resourceId":"Preparar"}},{"resourceId":"Association_1fh67xn","properties":{"overrideid":"Association_1fh67xn","name":"","documentation":""},"stencil":{"id":"Association"},"childShapes":[],"outgoing":[{"resourceId":"Activity_16zz91p"}],"bounds":{"lowerRight":{"x":1010,"y":1180},"upperLeft":{"x":900,"y":1146.148527044165}},"dockers":[{"x":15,"y":15},{"x":900,"y":1180},{"x":0,"y":40}],"target":{"resourceId":"Activity_16zz91p"}}],"stencil":{"id":"BPMNDiagram"},"stencilset":{"namespace":"http://b3mn.org/stencilset/bpmn2.0#","url":"../editor/stencilsets/bpmn2.0/bpmn2.0.json"}}	\\x89504e470d0a1a0a0000000d494844520000011f0000016808060000006e70ff340000464149444154785eed9d0b9814d5b5ef5104931b2fc69093a8d198e4987b3cde3c34c98939e6e6c4247a7dc7e4461886c720604010981e1ef250747c2bca637a782b92282802c6078a2033dd800f4405048d49f48880ca4345544441847df7bfa69bf4ac595d53ddb57bf7eeaef5fbbef575f7eaddabab56edf5ef5dd555bbdab4110441100441100441100441100441108402a2c4c4c4c4f2b4507001389f20084226a175820bc0f90441103209ad135c00ce2708829049689de002703e4110844c42eb041780f3098290034aa9f61b366c98b772e5cacf1a1b1bd5d2a54b8d988e7560c58a155b1289c445f43b2d135a27b8009c4f10841cd0c2337feda22bd5f6eddbd5a79f7eaaf6eedd6bc4100b31972d5bf6a116a3f3e9f75a24b44e7001389f2008398011cfbac786ab97168f6e2120266cebd6adef69f1798e7eaf4542eb041780f309829003d8d53239e2a186d85a7cf6d0efb548689de002703e41107200c767a86098367c07fd5e8b84fe6e2e00e713042107447c5a870bc0f90441c801119fd6e102703e41107240c4a775b8009c4fb044972e5d9458f918150c9326e22318051d96fa84d243463eadc305e07c8225447cca03119fd6e102703ec112223ee5012e8328f0793e5be43c1fc128223ee501aebfc2651054344cd9a64d9be6ca19ce8251447cca035cf889ebaf701984c911908eb575e3c68df76ae1d9bc54aeed124c22e2533e401c303ad1b617c7670c1962216631850784eea75c00ce275842c4a7b074efdefdf45ebd7aade9dab5eb479595958f74ead4e948daa6189c7beeb987ebe5b9afa2a262279ed3f71d24743fe502703ec112223e85a37ffffebffcf6b7bfbdbf5dbb76eab8e38e53175f7cf1473d7bf6bc8bb62b165a7cba6b5b4cfd8e12ba9f7201389f6009119fecc4262cfff7583cf1c6c1d7f18497abea890dff51134f6cd0afdfa3efa5d179bd66d0a0411bdab66dabf6eddba7d6ac59a33a74e8a07af7eefd51663b3f684cd3e8657c588f7cba51bfa384ce051780f309962857f1a9999c3c11c55b539ffc49da17ab4b0c1934f6c116670567b3deb1eb54bfaba6b6f0f7af9da5fa0cb9a9859f5a5555953afdf4d33de1e9d6ad9bf75aef86eda7ed8a697ab93a64e6cd6142f7532e00e7132c810e487de540753c31588bcf969aba445fbc8e4d6af84ffd7a5bdf51f1c0ebabdbdf5f5397ecc9f8dfadae5bfa4deaa70c1830e0d551a346a98e1d3b2abdbba5366edca87af5eaf5016d572c4ae4584f9ac0db2d1b5c00ce2758a28cc5e7f1ea787284168a69436f4f7e55ef2635c4e28d0ff6bc6cb8aaad9dd7be269eacd7efedd4b6bda63ed1159fa99d95fc827e7db7b68f62f58d3740ac864e6a3c213661c531688736fa71234654b0eafac4d999ef35bddf18d3af5fd3f679755dc37b5a6c763ffbecb39f5f37eb69ef33b1894bf7ea11d828b67d3cb1d5f365c4ccb6aca9365a041393f5e3ee587d627a53fbe4617a5dc762d9f1be8e5fe9b5af4ffe4efbffaa7d9f352d7b63a7f4329408a1fb291780f309962847f1a919ffcc1775817d189b90fcb22ecae5faf94383eb123fd68f6f5776edaeaaeb9237eb829e3728bee25f86c4933fd3fe1df81cfcfaf96c7caea6be71642c75bca726de78612c9e5cd4f4bce1175a741e3bf85d99efe9cfe8027f7a50bce1e4dadada43e1aba8a8f8596565e5d33acf9f76a9ac7ca2df3577ff04cb96ad3d8d996d59bd36f589b7705c0a42a2fdded9c768af05690ed621d53e2d9a3b20740326278f487f4f8911ba9f7201389f608972141f3d6a3957175bd27b1e4f3ea74740fd74019f8982c6fa4284864d5df235bc5f3db1e1ebfaf5e6a6b6898dc327278ff69ed7350ed2c53a2bf5bc567ffe7aaf7d3c315c8f5cae6bfaa6e6efc5b09b37a1e13be9f7d268b1faad7e6f1d042286e350f1c406bff62426bfacba8d169f9bf0bc69dd12cfa7da6fc777649877805baf4b7ffdbd2fe8d71f54c71b6f6ffaa69222743fe502703ec112e5293e89b8b62b9af9e28949109494f8bc8751c1e5931a3aeae773f528e296549b5dd51313a7e1603504227dbca7a6ae7121765b526d1ea8a9fbe76d6432dfd39f79bf7a52c3599de6cd6b9b7e1fe0fbb08b0611d16d66c0fcda93ef6397156dd2cb81dd321d6b74aafd4e8cf2da2875c83f233681d115840adf4bdf2b0142f7532e00e7132c5196e2134fbc36b82ef93de27b13a282f585a8e8d7efc4b06b164f4cc17115af4d7d628c7efdb12eea05fa713b8ef7a43ebb65c8e4e5c7a7dabc957edee2bdbac61efaf5666d07b429ec2ac10fb1d123a64fb56fa9b6555a88fee0d73e3366d665cdfc5e1d63687df2a4d4f3de38768478b081f5cbbf8d1152eaf5677a04b4be7a52f202b42d3142f7532e00e7132c518ee2e347d4d6b78c08bdddb8009c4fb044d48a316aeb5b4684de6e5c00ce2758226ac518b5f52d23426f372e00e7132c11b5628cdafa9611a1b71b1780f30996885a31466d7dcb88d0db8d0bc0f9044b44ad18a3b6be6544e8edc605e07c8225a2568c515bdf3222f476e302703ec112512bc6a8ad6f29d0a953a76627596621f476e302703ec112e5568c581fb1d2b3000214ba9f7201389f60096c78ea2b655a5b9fd6de17eca245e7db7a9b6ca47e86d0db8d0bc0f9044b945b31b6b63eadbd2fd8a573e7cebfd2db6419f53384de6e5c00ce2758406ff46bcaad185b5b9fd6de17ec525151d14b6f933f513f43e8edc605e07c82019452ed87cd5db77fe5ca959f353636d25ba2f81aee80891bd1e17e5034aecbb4262eadbd2fd8a5b2b2f25abd4d6aa99f21f476e302703ec1001b366c983fe4be17152cd71bc9a13dee80891bd13970cfa6a01cde9ab8b4f6be60172d3e7fd6dbe412ea6708bdddb8009c4f3000463c616fa18b3b60e2a67134b683fcf2073ff8c1c7ad894b6bef0b76d1e2b35c6f9333a89f21f476e302703ec100d8d5ca75c4430d9fd7e2e34dd1e930bfd486e9427ba7c46596b6ffd1bc4913223e8507bbfb7ad43d2fc8eefea5975eaa1e7cf0c120bbfba1b71b1780f3b500777aecdfbfffbccb2ebb6c0f3a101eb5ddefca1d205d041b938a493e863834b643a485078f00a203f17959dbc9e94669447c0a0f76f787cd7dd1db6df7fbf1c37bb8abc7279f7cd2cc9765773ff476e30270be16e8e1d9a33366ccf8e89d77de51008fd3a74fffb06bd7ae09da5668a29cc50727a55d7cf1c557e9a7ef68eb4ddfd74c68d3244a5fce7496b9f838712b1c8c78d2c71a695fa2964d9c98ddfdd0db8d0bc0f95a807b5defdebddb139e3478adfdbb695ba10993e2a38bbdfd6f7ffbdbff595555d55117f0b138394cdbbfe91f851fe8d73fe9dcb9f3cf71ce867e7d4e4545c545da3ae176bcfabddefa797f6dd5faf515faf5186dd7ebe763b54dd4cfa76a9ba99fcfd636af4bd35d3417ebe709fd1c777d785ebf5eaf5fff5d3f7f43db166def69dba5ed73fdde81364da39cccdd2c3a1a3a4897f2159ff43af7a46fd8a640bbfba1b71b1780f3b5a0478f1ecf3ef7dc7307e6cf9fef090f1ef5ebfdddbb775f49db0a4d98121f14acb6bd5a003e4a15fedbda36a404611d0442db5329c1785cdbc32921b947db4c6d5320345a286ed5cfafd776957e3e1c82a49f5fd6a549a0ba41b0f4f3dfea1f94b353279f9daeed27ddba75fb3e844e3fff96b6632180faf51110c4d4aace4a1938283c5d9a969bb554db82a3fbe719975e7ae9cb7a9d3ed3cf9fc4f2d3360648af3346801062e4823de6650353fd8e8cb8436f332e00e76b81eebcffd9ab57af5d5a70bc110f84e8924b2ef9087eda5668a2409dc045506828ba896db28c7832b1253e03060cf8bf175e78a13af6d863d505175c805b13efeddfbfff83b45d480e8a6deab5ef312f1b14a8df85de665c00cec79212a0b5fa17e4137420111e7f0ad4095c058586e33fbec2036c888ffe8e6b060e1cb8f1e8a38f56dd7bf55723a734a80e1d3aa80163a6e2cea4c369fb7cd0a343dcdb2ba7635e362850bf0bbdcdb8009caf556c74a052a7409dc0658e0cd22fe82e58ae76e9f0db326fcaa77a5e3eaa451b98de3df4463c53662f52978d99a6fa8d9ca0fac4ae3b40db85b536598e79e9f7f66bfb54efceeeecd274ac0cbbca7fd58fabb53da5ad41dbc2d42ef2dddaa66babd3768bb65a6d2352bbc67df56355ea38de855af4ced48fff47ef4afe58effa9eac1fbfa30704c7e8c7a3b4ffe6279e78a2451fcac7447c4a189c3361e0c0df1672e0cf696cf48b585df289217589f3a89fa277b1fe7bf4e8d1ea77fd6e507d875caf366fdeac7af7eefd096d67805929039ef0a41edb5c72c9255fd0f6658843ea4f0288c58f537f109ca905e582d4b1b61e10196d83213a5d9aaefbbb05c7ea204afaf1cf299182582dedd2245e2fa4c4ecf52e4de2f6beb67ddad7a21fe563223e250c4ed60a7b86f3a64d9be62e2d8d339c3d0add2f70d7cfd40dfcf679f74a8f27fe5f8b36b3925fd0febbabe30dbb075c15df37726a52bdbdfd7d3579da5ddb078f5ff269ba1dee8a9a1a3d7d18ab4b8c820f772ad5febf36dde02fa1701ff67f46ce4a4ec7bc0a4d8146dca1b72b1780f3b54aa13b593980b34471b216ce99c87504a4db6fddb871e3bdba036c5e5a3ad77659eb17b8c5714d5da2b316882df4bdeabae4cdda3f3b3621f9e5cb6fbc6ffae0718feed1a381bdbd068d595f3de189c6668d953aa47a62e2df204078a91f77c4e28db101939347346bd73ade312f5bebef87888fe001e1c0c845db5e6ccc1c0cedf1b992111e60b35fd48c5ffc15eebee75a40360e9f9c3cda7b5ed738488bc9acd4f3da9a78120789db54d7277eabdbadd3b607231c8c829a3edbd85f3f7f41fb3ea88e37defecfa8810874ccabd01468773ff47a7101385fabb890e472a0dcf2686b7d6ac6377e430bc93cdc079dbea78563971ecd9c867bc3435470bf75ef33758d0bb15b956af39e16a0b3874d5df235dccb1d96fe3c76ed74ec3339616b0d5bebef478176f743af171780f3b58a0b492e07ca2d8f855e1f2d1aefa48ed3bcad85e4b6dadae4612ddad427c6e8f73fd6bb650bf4e3f6a1931a4f487d76cb90c9cb8fc773884d753cf1a9f62dd5b64a0bd11f2064a9d89fe911d0faea49c90b9a476e9d42af7f100ab4bb1f7abdb8009caf555c487239506e792cb7f5c91557d61fc291da6d37b5bb1f7abdb8009caf555c4972a9536e792cb7f5c995325effd0ebc505e07cad52c649b64ab9e5b1dcd627577259ffbe7dfbb6a33e8709bc5ed9e00270be56c925c94276ca2d8fe5b63eb982f5cfc5ce3df75c27a6e10840e8edca05e07cad12f54e668a72cb63b9ad4f21a9a8a858abed3fa8df51426f572e00e76b15e9646628b73c96dbfa14129dab3bb55d46fd8e127abb7201385fab48273343b9e5b1dcd6a79054344df2f667ea7794d0db950bc0f97ce9528637bb2b16e596c7725b9f4281131975ae1ed0e2f3067dcf51426f572e40339fca61e67b6a3e33df47827c728762a53e6aa594d7a88a4f3edb3e8839b4ed436f572e40335f046f74670ce46eeda22b5bbd6b40ae564a798daaf84460db87deae5c80663e28f7ac65afb648422ec6cc7c1f9692f83b12b95bf7d870f5d2e2d12d7262c20a9057e344557c22b0ed436f572e40335f8166be0fc32fdb38725780d630913b3f339cd7821055f17175db77ead4e9e82e4d1395e1ae25151993fee74ae8edca0568e6c37e265df17c0c7132e3e6495a789cb82b406b98ca9d9f19ca6bc1704d7c66cc98d1a3a6a6664b5555d5de7efdfaad28d44d2e5ddcf69852551ba672cd3cb1714d9e0294d3777370015c159fb4f0e01114fdae00ad612a777e6620af05c525f1993a756ab7ef7ce73baa5dbb76eab8e38e53ddbb773f505d5d6dfaee151eae6d7bdcfe08dba25bb76e6ae2c4896ac182054a8bb027445a903ad3f60108fcddd9e00238273eaede15a035c68e1ddb220fa62d4c5e6de08af8e8e5b866c890216f7ffffbdf57fbf6ed5313eaa7abbe373e807b9317e42697ae6d7bbdfe4bb02d66ce9c79f0269f73e7ce4d8f7e46d0f60108fcddd9e002144c7cc8702f676b93e5ae0078a46d5d329a0b93964b072c06341761ac7baf7e07ef50513d61b1ea33f4e6166dfcac478f1eeaf8e38f576bd6ac517d875eaf06d4cec4e887ee861835babd4c5a3e353570e040b56bd72e4f7ceaeaead2fe4be8760b40e87ec7052898f864c6cd935929030785e79f6fbb85a9dcf999a1bc160c746eeacb97ea7862702cde78079ed7c41b7f8a190a691b3ffaf4e9b3aaaaaa6aff51471da5065c73879afdc853b8d1e566dace04ae6d7b9cc4a877bd96a505082320fd1ab70dda8783d0b47d00027f7736b8002e8bcfc1bb021c72c8214e0b0f30953b3f3394d78261587c1ec70c8398adb0a63ed1b5269e6880df7b1d4f8cd562b44ddbbb5aa02ad39fc1e4efdaf79ab6cfabeb1ab7e9c25bf0c73ffe71d7a0db1e51fdaf9ab43356d7b0abbabef1be747bee0e16989c1e9f4f8fba62f589d76b6be7b5af8927ebf5eb9ddab66379d231808bdbbeb2b2f2ebda929923211c84a6ed0292d3777370015c161f70b2169e772a2a2af66ac56e4bdf740953b9f33383792d08a6c4a766fc335fd445fec9c1ddae78e39a41f1451df01eee4e515d979883bb530c89277f0631f03e53df38528bc9d383e20d27e3973f1d4bb7fb1662e9f77e5953d7f87bfdbcf95fd6e40e1669aa2736fe97f6bd5b539ffc09be1373460f8aaff897d477eec86cebeab6471e3a77eefc2b2d3a57683b8bbe9f03397f37850bd0cc57a099efc382bb026cd5762c7dc3254ce4cecf0a9057e398129f587de3b9d5f16402cf71970a5dec7f1f5c97fc9ef79e169b83a39226fb28e5df5233a1e13b99718016a55efabdb9783ea4aee157faf9f3789eed0e164d9f49fe44fb76d6d4355dd6a09fbf8dc9e6bdcf4d6cf8ba7edd6cf72d02db3ef476e50234f31568e6fbd0e84ebd1a777aa47e9730913b3f2b445e4d634e7c12f1cc7baa639748bfbeda7bae4561705de2c718b1fcf313de2ed4fbd5931acec26e53a65fb7ffb316b27ea93675da46a7fcec1d2c6a2625fe37ded3bb56351931dec388e7f2490d1d216435f1c65bd2ef81086cfbd0db950bd0cc57a099ef43a33bf5a37ad87821f5bb4498dcf95921f36a1a63e2134fbc961ee978af27244fd1e2f042eabdde5a88b662b4021b58bffcdb9ebfaeb1074624da0ec08f5da454fb8dd8ad4a3ddf3cb43e79129e7377b048b5f9ef746c18ee7e81dbefc49aee9c81bba54ec131a0a6256b2202db3ef476e502b4f06125a1b24bcdcd7c1f1adda96768eb4bfdae81754fe520d7dcf959c1f26a1a53e2538a60fba4b653396efbd0db950bc0f99c4377ea5a18f50b6e1165f12973426f572e00e7730ebdcbd50fa31fea17dc42c4a76c09bd5db9009ccf3970bc4777ec85d42fb885884fd9127abb7201389f73e84efd13ccf64ffd825b88f8f81366c6c322cf6a187abb7201389f73e84e3d5ddb07d42fb885888f3fc3e6aedbaf0524af190fd1be88b31a86deae5c00ce679512fe351008223efea4a728a6c2928b156956c3d0db950bc0f9ac82f96f87cd7db1147f0d0482888f3f26663cc4e797da3fdb39f476e502703eab60c413f617a148bf0602c135f119376edc1faaabab37575555ede9d3a74fa25033190605a375da77f331c4a1b10b4ce8efe302703eabd8fe35c03492ba482aba34cd6bdb23cf2906040697c467e2c4899dc84c86fb2fbffcf2f9b49d4d447c9ac3f9ac627383a484670d8a246d98e736c454034206ae888f5e8e6b6a6a6ade4acf64585f5faf3a74e890d74c86b8c422f375755d627ce6756741c132d9eceb8609fd7d5c00ce67159b1b04f3d7a240860c19e2cd6b8bf96d31cf2d7c98f796b617722353d483daa5c36e55036ebcaf853fac5555f55403c73dae56af59a37af6eca95f57157c26c3d6cc665f374ce8efe302703eabd8dc205a7c96a213603edb3498e50d3efdde50da5e282c43e2cb4fc524617a74f171e61c3c26e837e88a9706de3c4f61264388cfaa55ab54af5ebddea4ed6c62b3af1b26f4f77101389f554c6e10fa4b93cd309f2dc0fcb69866123e4cba44974d281cb5b3925f88c593cf61b22fcca593bef21c349b91309ed8eab5cf328361cde4e489a92bce1f8088c5ea13639a62345ddd0eeb555d0be1d9543d7149fa6af883331766fbbed88415c7c4521395659bc930d5e65dbd2b36593feed6df3d3d1d93c3645fa7b10b4ce8efe302703eabd8dc20a99ba8edc37cb618f1a485478f7a12a67f79057f62758d13d373e64038aaeb9315789e6d46c26c331836cdf59c7811536b68013b2d969aebb97a52f202fd7c5afaf30721331766fbbe9a78e3855a1c17e179b6990cbd36f589b7621396ff7b757d63a7189d259160b3af1b26f4f77101389f556c6f101c5cce1c05417830df2d6d27148ec17589dfc4324626301438de8b659991106293d93e969ac110733dd7d425bc7b510dac7fe258eddf86e7dab7403f3f78ee57b6990bb37e5f5d63ad161cdcc6096dd8990cd1468bcf4d78aedb9e194bcd92980d13331e166956c340b5e5071780f359c5b6f800cc678b796db1ab25231ebb60e4a277735ec54823edc3080222d2f43ceb8c842d66304ccdf5fc71753c39a2ff94278ff24646f58d37a4daefc62e5dc6e7f9990bb37c5f4d5de3c2587df277e9cf723319a24d7aaa55ec96a56749cc8689190f8b34ab61e0daca061780f359a5847f0d843cc0dd23f4eed6804cdfa078f2b883c75ab2cf48d8620643ccf5ac9f2f434c8890b6d983e28b0e4f7f8f7ebd4f7fe646bcce3a7361f6efdb3264f2f2e3bdcf6699c930b30d62a46749cc4698190f8b3cab61689de002703eab94f0af81506430d7338ed950bfcb4038d057172d5a94eb8c87c59cd530b44e7001389f554af8d740283231fc433521790af5bb4e4545c58fba74e9f2c685175e9879475e9709ad135c00ce671d08474ad54be9d7401072a653a74edfd0c2f3666565a5773ca94408ad135c00ce27084201e8d1a3c797b4f0acd1239f9c2fcf2832a175820bc0f90441300cfe55d5a2f3a0169f99f4bd1220b44e7001389f200886d1bb5963b5f024fbf6eddb8ebe570284d6092e00e71304c1205a74fa68fb47a74e9dbe42df2b1142eb041780f3098260089cc8aa85675bd7ae5dbf4bdf2b2142eb041780f3098260808a8a8aff05e1d176067dafc408ad135c00ce27084248b08ba545e7556dbde97b2548689de002703e4110428083ca38b8ac473eb7d2f74a94d03ac105e07c822084a0b2b2f22efcadae9f1ebc08b6c409ad135c00ce2708428ee8ddac2f76ebd6ad03664bd0a39ed52574e9441042eb041780f3d9a2edd1471f7ded57bffad50d6ddbb6fdbc4dd3b2888995a4e93eac2eb8e00275d14517a92f7ef18b2dde77c5506b5ffbdad7367ef7bbdfc52e61b369447cc06743c105e07c36687bcc31c7bc7cce39e77cf6fcf3cf7b17890a4229b367cf1e3568d020b561c306fa9653a0d65073e79f7ffe012d406fa01669713284d6092e00e72b38279d74d2ede79d77de7e9a184128652040a584162075eeb9e7cea1f5c9105a27b8009cafe09c70c2095ba1be8220140fd4e0c9279feccd79dd0aa175820bc0f90a4ebb76edf6cbae96201417d4e0e1871f1e440382b4f1850bc0f96c40f35074366fdeac56ae5ca970fb6666dea0bc0cb19e7cf249f5faebafd3af8b049253f7412dd2e26408d2c6172e00e7b301cd41514191ac58b142613ad75c6753f433c442cc643219b962414ed72eba5272ea38a8455a9c0c41daf8c205e07c36a039282af875be267987d7b96f5e794f8b0e1fd6b66ddba6128904fddab206395df7d870f5d2e2d12df261c2a298d342805aa4c5c910a48d2f5c00ce67039a83a282a1bcc95f676a888d5d862821392d0d508bb4381982b4f1850bc0f96c40735054d08969e7366d512b14c96969805aa4c5c910a48d2f5c00ce67039a83a22285621ec96969805aa4c5c910a48d2f5c00ce67039a83a22285621ec96969805aa4c5c910a48d2f5c00ce67039a83a271dd75d749a11846725a3aa0166971320469e30b1780f3d980e6c0185dba74c9d96c150afdde7236c969737315d4222d4e86206d7ce102703e1bd01c18239f0d6dab50a284e4b489ddbb77abcaca4aea7606d4222d4e86206d7ce102703e1bd01c1843c4c70d24a74decd8b123af3e690bd4222d4e86206d7ce102703e1bd01c18239f0d2de7a4984772dac45b6fbd25239f367c00ce67039a0363e4233eb85608a7ecd30e6ecad001a37636aee4b4095c02d2b56b57ea7606d4222d4e86206d7ce102703e1bd01c18231ff14107c1b5423865dfe4af3562a1481a1a1a22771d92e4b489575e794575ebd68dba9d01b5488b9321481b5fb8009ccf063407c6c8477c003a327e493194376988590a45520824a74aad5ebd5a75efde9dba9d01b5488b9321481b5fb8009ccf063407c6c8577c04a110e002db1e3d7a50b733a0166971320469e30b1780f3d980e6c018223e824b60d7f3924b2ea16e67402dd2e26408d2c6172e00e7b301cd8131447c049778fcf1c755efdebda9db19508bb4381982b4f1850bc0f96c4073600c111fc1251e7ef86175e9a59752b733a0166971320469e30b1780f3d980e6c018223e824bcc9b374ff5ebd78fba9d01b5488b9321481b5fb8009ccf063407c610f1115c62ce9c39aa7ffffed4ed0ca8455a9c0c41daf8c205e07c36a0393086888fe01277dd759777334157412dd2e26408d2c6172e00e7b301cd8131447c0497983a75aaaaa9a9a16e67402dd2e26408d2c6172e00e7b301cd8131447c0497a8afaf57c3860da36e67402dd2e26408d2c6172e00e7b301cd8131447c049718376e9c1a316204753b036a911627439036be7001389f0d680e8c21e223b8c42db7dca2aebaea2aea7606d4222d4e86206d7ce102703e1bd01c1843c44770891b6eb8415d73cd35d4ed0ca8455a9c0c41daf8c205e07c36a0393086888fe012101e0890aba0166971320469e30b1780f3d980e6c018223e824b60970bbb5eae825aa4c5c910a48d2f5c00ce67039a036388f8082e8183cde3c78fa76e67402dd2e26408d2c6172e00e7b301cd8131447c0497183a74a89a346912753b036a911627439036be7001389f0d680e8c21e223b8442c1653d3a74fa76e67402dd2e26408d2c6172e00e7b301cd8131447c0497183870a09a356b16753b036a911627439036be7001389f0d680e8c21e223b8c4800103d4ecd9b3a9db19508bb4381982b4f1850bc0f96c4073600c111fc125faf6edabe6cf9f4fddce805aa4c5c910a48d2f5c00ce67039a036388f8082e8189c430a198aba0166971320469e30b1780f3d980e6c018223e824b600a554ca5ea2aa8455a9c0c41daf8c205e07c36a0393086888fe012983c1e93c8bb0a6a911627439036be7001389f0d680e8c21e223b8046e9b83dbe7b80a6a911627439036be7001389f0d680e8c21e223b8046e18881b07ba0a6a911627439036be7001389f0d680e8c21e223b8046e958c5b26bb0a6a911627439036be7001389f0d680e8c21e223b844d7ae5d9dbeb5336a911627439036be7001389f0d680e8c91aff86cdebcd9db376f6c6c6c716ff07c0db19e7cf249a73b9f50582a2b2bd5962d5ba8db19508bb4381982b4f1850bc0f96c4073608c7cc407c2b376d1956afbf6edead34f3f557bf7ee3562888598f8b74304289a407c76ecd841ddce805aa4c5c910a48d2f5c00ce67039a03237cf8e18779890f463ceb1e1bae5e5a3cba858098b06ddbb6a9442241bf5628736a6b6bbdfe881f2157412dd2e26408d2c6172e00e7b301cd4168eaeaead4a1871e9a97f860f7c8e488871a6263374c880ee9fe78da69a7d1b742b17fff7ef5e8a38faa5b6fbdd5c899d3a8455a9c0c41daf8c205e07c36a039f0040017e1e1bc08dce111af8392ded0bd7af552871f7eb83af1c413d5bbefbe4b9b6505c24005c3b489f84487b0fd311b383c80cb35f0039bb6abafbe9a36cb09d4222d4e86206d7ce102703e1b344b0084061b6ad5aa556af7eeddde235e0711a0f486c623c046c6c6c6467fe49147486b1e111fc11426fa2307463c69e1c1341d3367cef4fec6c731a54d9b36d1e681412dd2e26408d2c6172e00e7b341b30420a9109c4cf0ba4f9f3ecd7c14cc8f9bfe85a19c7aeaa9de7b1b376ea46f35e3baebae13f1118cb073e74e75d8618785ea8fd9c0ae565a7876eddae5f92070f08599ac0cb5488b9321481b5fb8009ccf06cd1280732130e2c904af338797d90cfbd4f855c91cd6661eff096236c507bf60788de34058471c2447a7c53f22efbcf38e7770faadb7def286d8f845c3bf64afbdf69afac73ffee19dacf6f2cb2fab75ebd6a9b56bd7aa175e78413df7dc73ead9679ff50e9ae36ffd152b56a865cb9679a3c6279e78422d59b2c4bbb0119d77e1c285de7182871e7a483df0c003de540ff3e6cd53f7dd779f37e7cc3df7dca3eebefb6e6ff22bdc631cbfae3366ccf03af7b469d3d4942953bc294191df891327aa0913267837c5bbfdf6dbd56db7dde64d947ef3cd37ab9b6ebac9bb630384fdda6baff50ebcc2c68c19e3fd60c0468f1ead468d1ae5cd717cc515577877f58461da51dc5e183300c2aaababbd7b9da3e82ebffc72cfb05b0ebbecb2cb54bf7efdbc692b60f81183e1470b868b3a2104305c63d5b367cf83565555e5ede2c37016320c2389b4a14f661a4618694bf71bfa3add1f8f3cf248b63fa6c5228c619ba4993b77aee743cef305b5488b9321481b5fb8009ccf06cd12800e838e8de203789c3c79b2d7b98280612d0cd0616f106c890fed48b0cc0e9cf998b6cc02481746ba58d2c593b6cce242b1a1e85080301463ba3861e98245f122cf38de064371a3d051f030147f5a08200a1087e1c3877b06d1183972a427221093b4b0406470cb18080f04e8faebaff7c408a28442814841ac205a985c1d22168fc7bd5b0b43dcd0172076103d881f0a0e82f8a73ffdc913c73973e6a87befbdd7134d88274414620a5185b84268172d5ae4892e04b8a1a1c113638832c419220db1867043c071f903c47cfdfaf59eb843e421f6107d883f7e04f08380f375f0e3f0de7bef793f16f8d1c08f077e44f063b26fdf3eefc7256c7fe4c0baa16fa01f40f8172c58e06d0ff890937c412dd2e26408d2c6172e00e7b341b3046043a213a318904c3ce21731e8f911f895c1e8e794534ec96b43db121f211a84ed8fd9c0c165fae385115c98bff2518bb4381982b4f1850bc0f96c4073101a1ccccbf7af76111fc134e88f38fef3eb5fff9abe150a8cc2eeb8e30e6f3489916018e101a8455a9c0c41daf8c205e07c36a03930028e93e4233e729e8f5008d2fd117dc055508bb4381982b4f1850bc0f96c4073608c7cc407c700701904150d5386e30572867334417fc4712157412dd2e26408d2c6172e00e7b301cd8131f2111f1c54c4f55738986872048458101e1cf0946bbba209fe3440bf7215d4222d4e86206d7ce102703e1bd01c18231ff10110078c4eb07b64d210538427bae0dfa9302701161ad4222d4e86206d7ce102703e1bd01c18235ff1118442805323f0b7bdaba0166971320469e30b1780f3d980e6c018223ef9cf4d24f30f9907e763e1fc2157412dd2e26408d2c6172e00e7b301cd8131a22e3e43ee7bd1b37ce62692f987cc83933f7122a3aba0166971320469e30b1780f3d980e6c018223e4de24385251793f987cc2177af68820bc0f96c4073608ca88b8f897396e4bc2473e052175cd6e12aa8455a9c0c41daf8c205e07c36a0393046d4c507a241c5241f13f13103aeafc3f565ae825aa4c5c910a48d2f5c00ce67039a036388f888f8b8042ee8c585aeae825aa4c5c910a48d2f5c00ce67039a0363948af8e0eae74220e2e3167ffce31fd55ffef217ea7606d4222d4e86206d7ce102703e1bd01c18a314c407c283e584e10c589c0b820393980603d35d60ae1a4c6781f96d305505a6a6183b76ac7775342e2ac47412986201674e632e1f4c0381bfd7afbcf24aa3e283475c1a80294e101fff8061ba094c3f81e9289e7aea29ef1813a6aec0541698d602d35c608a873befbc534d9d3ad59b22035366600a0d4ca7810b2231dd06a6dec0541c989a03d37460ca0eac33a6f4c0141fe9f979301d487a2e9ef4dc3be9f976e85c3a2e6e7bac0b72e22aa8455a9c0c41daf8c205e07c36a03930868b1d9003cb89c24651a3a0212210131431c40573d8607e1b880ee6c481b0408c060f1eec89130a13c7135090e9e93411d394f8709366a5e7144acf2584e91c200c10082c0f7ee5516c10102c270405c282797fd2f3fd605231cced0321c27c3e989b060285b97b308119840bc50a21432e206ce9f38f2078103ee40b42884b5730b70ef288657671db231761e6db2934a8455a9c0c41daf8c205e07c36a03930868b1d90a350cb694a7c4a71b7ab50390d034418a34057412dd2e26408d2c6172e00e7b301cd81315cec801c855a4e111fb7c06c83d8fd7415d4222d4e86206d7ce102703e1bd01c18c3c50ec851a8e58cf2793e85ca6918b0db89dd4a57412dd2e26408d2c6172e00e7b301cd81315cec801c855ace5ce726c2bcc330cc918ce327f095eafc4385ca691870bc0b07dc5d05b5488b9321481b5fb8009ccf063407c670b10372146a3983ce4df4d7bffe55fde217bf50eddbb757c71f7fbc77001993f697f2fc4385ca691870a01dfff4b90a6a911627439036be7001389f0d680e8ce16207e428e47206999b087f71b76ddbd61bf5ac59b34675e8d0c1bb934529cf3f54c89ce60beee481bb76b80a6a911627439036be7001389f0d680e8ce16207e428f67262a483110f6e1b93be8f15fe4a2f658a9d538ef4ed835c05b5488b9321481b5fb8009ccf063407c670b10372147b3971121f4ef6ebd8b1a3273eb893666b7788759d62e794e3c61b6f0c7d3ff542825aa4c5c910a48d2f5c00ce67039a0363b8d801398abd9c985d2f7d89078e0de1a02876c54c909ed6c3f66466c5ce29074e12c509a2ae825aa4c5c910a48d2f5c00ce67039a0363b8d801395c594e080fce5ec6a807ff768505676ca7c5c7ef8037676127337325a799e08eacf8c7cb55508bb4381982b4f1850bc0f96c4073600c173b20872bcb894b1670b984293071562e7ff57396ef6466aee434139ce383737d5c05b5488b9321481b5fb8009ccf063407c670b10372b8b29cb8eb25ae153345314f727425a799e0ec669ce5ec2aa8455a9c0c41daf8c205e07c36a03930868b1d90c395e5c4859ef847c614100d2a26f958b9880faeebc2f55dae825aa4c5c910a48d2f5c00ce67039a0363b8d801395c594e8c7a4c5e752de2d31ce41657b6bb0a6a911627439036be7001389f0d680e8ce16207e470653971bc07c77d4c817f77a890e463e5223e981e04d38cb80a6a911627439036be7001389f0d680e8ce16207e470613951e4588e421815935cad5cc407f312e19c2a57412dd2e26408d2c6172e00e7b301cd81315cec801cae2c270add24b2dbd59c850b177a13adb90a6a911627439036be7001389f0d680e8ce16207e42895e5cc15119fe62c59b2c49be9d155508bb4381982b4f1850bc0f96c4073600c173b2047a92c67ae88f83407274c62aa5957412dd2e26408d2c6172e00e7b301cd81315cec801ca5b29cb922e7f934e7e9a79ff62ee27515d4222d4e86206d7ce102703e1bd01c1823df0e88cb027076aeadeb91f25dce20e4bb2e7e16743d739dcc8cb37c27332b644ef305f76917f1e103703e1bd01c18239f0e88625dbbe84aaf6872fdd5cef77aa47c963308eb175fa956ac5891d7baf859d0f50c3a991967681f6632b342e5340cebd7af377af98a69508bb4381982b4f1850bc0f96c4073608c7c3a204609eb1e1bae5e5a3cba454104b5a0d723e1362f209fe50c02d663fde3a35a2c9f290bb29e412633cb66f94e6686692b0a95d33060f600dc6ec855508bb4381982b4f1850bc0f96c4073608c7c3aa0ade314b8e9dfa1871eeafdf59acf7206c1c4baf85990f5b44d3aaf85ca6918366ddae4f4246da8455a9c0c41daf8c205e07c36a03930463e1d10c5448b2c1ff32bca7481e0467f871f7eb83af1c413d5bbefbe4b9b85c6d4baf899df7adac6565ef30523454c59e22aa8455a9c0c41daf8c205e07c36a03930868be2932e103c0214078a04c5f2c8238f90d6e130b52e7e966d3d6d6333aff9b273e74e119f367c00ce67039a032364de031d07f9f06b88eb6a30a5016ed57bebadb7aa2953a678d7db3cf1c413dead77478c1861ac60b9a2c4319e1ffef087deb2504e3df554af78366cd840dfca1b53ebe267dc7ada0493dee34afcf4888792ce2ba6862d36d84dcde707d116a8455a9c0c41daf8c205e07c36a03930060408435d080b04e6fefbef57d3a64df38407d359e2fee11024745a08143a86a9824d0b5f36cbdc1d48ff6a63fa52bc97be173a960927a56166412c27a663c0f4a638a08abb20a0fd8c1933bcfbb9e3d4fd65cb9679eb8a83b4a3468d32b62e7e86bceedebddb9bf910ff4ee1a02afed5c105aa581ebc8ffbaccf9f3f5fcd9933c7bb073bb601d619f767c77a403cb04e23478ef4d60f3f1083060d5203060cf0eef99ebe173de6974edf8f1ef9c9bc87fc69a79de68d72b8bcd2dc17db5c05b5488b9321481b5fb8009ccf06340745c554c1fa8d08b03b000374770182b963c70ef5c61b6f7842820286b0608406a1993871a257b0b80d0b0ab5babada13261428840a8285c2442737b52ed96ccf9e3ddef74004d206618041242016100d2c1b2ea8c4941d1015883e961d0209d1c11d1db04ee3c68df3f28049b72052b367cff6440beb0f11c36903103588db6bafbde6891d7205f16b2daf42eba0166971320469e30b1780f3d980e6a0a8982a583ff1c1af337ea54f39e594821688a975f133bff5b48dadbc962ba8455a9c0c41daf8c205e07c36a039282aa60ab6b5a2c441d0421788a975f1b3d6d6d33636f25aaea0166971320469e30b1780f3d980e6a0a898383726e8f92f389b1a14ea38808975f1b3a0eb691bdc21a250392d67508bb4381982b4f1850bc0f96c407350548a713d52a10a25c8bae04031a67a3870e08067f857e8f9e79f6fd18eb35cd7d32685ca6939835aa4c5c910a48d2f5c00ce67039a83a2528ceb910a552841d6e5861b6e503ffde94f55fbf6edbd5b26e3cea5f8578db633b19e3629544ecb19d4222d4e86206d7ce102703e1bd01c141ddbd72315b2505a5b17dc97fdb0c30ef3ce9759b3668d3af2c823bd7fab683b6af9aca74d0a99d37205b5488b9321481b5fb8009ccf06340791a3988582bfbe8f39e618b57af56aefaf712c0bcead094bbe5379049daea3358a99d35205b5488b9321481b5fb8009ccf06340791a39885f2eaabaf7a272b76ecd8d13b3767f2e4c9a1ef270ee11936f7c5bca6f240fb20d375b44631735aaaa0166971320469e30b1780f3d980e62072b85228588e7efdfa85be4f3b463ce97bb45371096a41a6ebf0c3959c9612a8455a9c0c41daf8c205e07c36a039881cae148aa9e530f1177fd8bff14dad4b94402dd2e26408d2c6172e00e7b301cd41e470a5504c2d0744838a493e26e26317d4222d4e86206d7ce102703e1bd01c440e570ac5d47288f89426a8455a9c0c41daf8c205e07c36a039881cae148aa9e510f1294d508bb4381982b4f1850bc0f96c407310395c29142c870913f1294d508bb4381982b4f1850bc0f96c40731039caad50447c4a13d4222d4e86206d7ce102703e1bd01c448e722b14119fd204b5488b9321481b5fb8009ccf06340791a3dc0a45c4a734412dd2e26408d2c6172e00e7b301cd41e428b74291f37c4a13d4222d4e86206d7ce102703e1bd01c448e722b94205379b46661a7eb28b79cda00b5488b9321481b5fb8009ccf06340791a3dc0a25c8541ed9ccd4741de596531ba0166971320469e30b1780f3d980e620729463a1b43695879f9998aea31c735a68508bb4381982b4f1850bc0f96c40731039a450cc2339cd1dd4222d4e86206d7ce102703e1bd01c440e2914f3484e7307b5488b9321481b5fb8009ccf06340791430ac53c92d3dc412dd2e26408d2c6172e00e7b301cd41e49042318fe43477508bb4381982b4f1850bc0f96c40731039a450cc2339cd1dd4222d4e86206d7ce102703e1bd01c448e4215caba4557e43d97b29f999a67b990142aa7e50c6a911627439036be7001389f0d680e2247a10a65dd63c3b5008dcc6b2e653f3335cf7221319d53dce5e3d65b6f55279c70821a3870a0fad6b7be55728f23468cf0eee4fae1871fd2d5f3402dd2e26408d2c6172e00e7b301cd41e4305d286930e2097ba6b19f859d67b99098ca290ab54f9f3e6ace9c39de68af94d9bd7bb73af5d453bd9b4472a0166971320469e30b1780f3d980e62072982a148a896bacfc2cecf55785c4544e712fb333cf3c93ba4b9adebd7babdffce637d42de213454c150a05c24005c3b495bbf8fcf0873f545bb66ca1ee9206b74bc28898825aa4c5c910a48d2f5c00ce67039a83c861aa5028223ee169d7ae9db79ee5c4fefdfbd521871c42dd223e51c454a16472dd75d789f818e08c33cea02e67f8fcf3cfd59d77dea9860e1daaa64f9f4edff6853b7e855aa4c5c910a48d2f5c00ce67039a83c881422984d9101ffa9d2e9909b289cf9b6fbee9dd5ebab2b252f5eddb57cd9d3b973669157c069fedd6ad9bbae4924bbc984179e59557bccf65aeef80010368b3ac1c76d861d425e22398c386f8b83af2314536f1a9aeae563367cef4fe417aeeb9e7bcfbdbdf7ffffdb45956e6cd9ba77efef39fab8b2fbe581d77dc719e78e02ff12060c493161e7c06cb81d710c2975f7e99366791914f1334078221447cc2934d7c203699b79586000d1a3428a34576d00ed6b66d5b356bd62cef1fb50e1d3a787fe90701bb5a101e8c96f008d1c1f93b785e5b5b4b9bb3c8c8a7099a03c110223ee1c9263e186960f402e6cf9fef8d80702222ddf5f3b3e38f3fde131eecbee1b3ddbb776fd1c6cf30e249835d38f86a6a6a0efafc90914f1334078221829ee7b37efd7aef84440ce73ffbecb316ef673397cff3314536f1c128858e7c70fc2628fdfaf553a3468d521d3b76f4c467e3c68daa57af5eb419cbb469d33ca181004e9c38512d58b0400d1932c4f3e12cec20c8c8a7099a03c11041e65286f0fcebbffeabf797327e89d1791f7ffcf116ed380b3bcf7229904d7c2034e3c68d531f7ffcb127dc1090fbeebb8f36cbcabdf7deeb7de699679ef1628c1d3b565d7ae9a5b459567070998e84b0fbb56bd72eda9445463e4dd01c0886083297f255575de51d7bd8b76fdfc1630fe8d8b45da6999a67b914c8263ef8672abd9bd4b56bd79c84270d04089f4d8f6272f9b70be0e0324ea9183c78b0baf9e69b030b0f90914f13340782415a9b4b19ff967cf39bdf54ab57af3e78eca1478f1e2dda516b6d9ee57cafa677ed8af96ce253eac8c8a7099a03c1323886903ef6b06ad52aef9f9c304078d62eba32afabe95dbb62be5cc547463e4dd01c084500d7fb60f80fe179f8e187e9db3981110fa6f37869f1e816e212d45cb962be5cc547463e4dd01c084502e26382a0ffb2f9992bffa495abf8c8c8a7099a03a14898121f880615937c4cc4a770c8c8a7099a03a14888f8b40473f96014564ee09f4d9c5a41412dd2e26408d2c6172e00e7b301cd815024447c5a72fef9e7ab9d3b77527749b363c70eb561c306ea16f1118a03e678499fa886734f700e0bae1dc299bc975d7699772ec9f0e1c3d5d5575fad6ebae9263561c2043563c60cef5c95850b17aa65cb96a9b56bd77aff509593f83cf2c823ea673ffb1975973498c51017b452508bb4381982b4f1850bc0f96c407320140908107e15df78e30d4f48202810169c4007a1c1a9fc109e3163c67842842bbb214c3833174205c182709593f8600ee7f1e3c77bebfdc20b2fd0b74b0a6cdf1ffde847de3f9bdc0989a8455a9c0c41daf8c205e07c36a039104a9c72129f34175e78a17aecb1c7d497bef425ef82ce238e38a2e41eefbaeb2e6fe2b16cbb91a8455a9c0c41daf8c205e07c36a039104a9c72149f28805aa4c5c910a48d2f5c00ce67039a03a1c429a7f37ca2046a911627439036be7001389f0d680e841227c8d5f4ad5914ae98770dd4222d4e86206d7ce102703e1bd01c08254e90abe9b35994ae98770dd4222d4e86206d7ce102703e1bd01c0865406b57d3fb596b57cc0b8501b5488b9321481b5fb8009ccf06340782201401d4222d4e86206d7ce10270be82d3ae5dbbfd186e0b82503c5083eddbb73f40eb9321b44e7001385fc1f9e637bfb9e5f9e79fa7b9b002a6101d366c9877662f26d5c25d013ef9e413da4c10ca1ed4e049279df421ad4f86d03ac105e07c05e798638eb9feecb3cffe8c26c3069874fbf7bfff3d14df13209ca17bc30d37d0668250f69c77de79074e3ffdf4e9b43e1942eb041780f3d9a0ed51471db5faacb3ceda0df5b5b90b86e94231af49e6fcc5b84c20cae00e16423440ada1e6ce39e79ccfbef18d6fbc825aa4c5c9105a27b8009ccf166df5e863e411471cf1b7430f3d745f9ba66529b8e15625b85b64fade49b882191752d27651319d7bef82c3430e39a4c57b62e567a835fd83fb0f5d7757b609263c009f0d051780f39535b158eca1aaaaaa035ff9ca573ce1d16274e0b6db6efb3d6d17152a2a2abea7773ff10b2808d908ad135c00ce57d674ead4e9c8be7dfb2ed702b4a7babafacd280b0fd0c2a3f5a76201f50b4206a175820bc0f922030e38535fd4d039b8aeb2b2f25aea17840c42d7091780f34506111f6fb76b81169fced42f081984ae132e00e78b0c223e5e0efe86e33ed42f081984ae132e00e78b0c51179f4e9d3ab5d739f8148ff43d41c820749d7001385f6488baf8c83f5d424042d7091780f34586a88b8ffcd3250424749d7001385f6410f1917fba844084ae132e00e78b0c51171ff9a74b0848e83ae10270bec81075f1917fba848084ae132e00e78b0c51161ff9a74bc881d075c205e07c9121cae223ff74093910ba4eb8009c2f3244597ce49f2e210742d7091780f34586888b8ffcd3250425749d7001385f6488aaf8e0ca7ef9a74bc881d075c205e07c9121aae2a385a79b5ef7f7f5e30fe97b82c010ba4eb8009c2f3264131fa554fb0d1b36cc5bb972e567b80d30bdc7949fe9f60756ac58b12591485c44e3169a525dee2850e2db86ad935ce00270bec8904d7c86cd5db75f6f6ceff6bff9dc7d139f5bb66cd987bae39c4f631712ddb9e70f9bfb62c92d7714c0b659bbe8ca52dd366c9de4021780f345866ce233e4be17158c76825c6cebd6adefe98ef21c8d5d48f0ab1a76d98bb1dc5100db66dd63c3d54b8b47b7c879502be2b661eb2417b8009c2f3264131f0c8b73fd75a286cfeb8eb287c66e8dd4c97f15dac668eba15f1f4ddb64a398cb2df8e3c2b609d1b7d83ac9052e00e78b0cd9c407fbd974c3e763884363fb91ea1c6bb05c19f6796565e5cdb42d47b1965b689d626f9b907d2bafefcc840bc0f922836be283bfbeb14cb8b1e182050bd4c4891355d7ae5d0fc0a71fcfa6ed29c55a6ea1758abd6db2f4adfd01fb565edf99091780f345064e7c6a6b6b0f2d5647a9a8a8588a659a3b77eec19bbccd9c39d3fb95d29d67286d4f29d6720bad53ec6da3fb4f8bbe75c71d77ec0bd8b7f2face4cb8009c2f129c71c61987a5869eb8b21b27dc5ddba5e99283394b962c69b1d1f3b18ce16d4e565757e7758e5dbb7679f79387af73e7cebfa2eb4029760717b2636adbd0be92ab65f6adcb2fbfdc1bf904e85ba1fb031780f34506ec07e3024b0c49213e7a233cac37c6db555555ea934f3e69b1e173b55c8b180700f5727cdead5b376fc493161eed4b604446db534c75f05c975b689d626f1bf42dec66e5d9b7f2face4cb8009c2ff2981af9e4d351700030f3970a9d43dbd7693b8e627770213b2e6c9b107d2befef4cc305e07c91a7d81d457788b3b45d81e170805fa583147bb985ecb8b26df2ec5ba1be137001385fe4c1e9ec06cec9d8b234c43919f950aacb1d054a7cdb84d6092e00e78b3cb88e06a7b3d38d9f8b6ddab469ee52cb67a396ea72478112df36a175820bc0f9220f2ee0c37534389d3dd75f2bdd7eebc68d1befd59d64f352cbd7e194ea72478112df36a175820bc0f98436de3efaf9f895d1b617fbd93918dae373c5e82425bbdc5100b94de5b8d4b64d689de002703ea18cc1bf1cd427141fbd5dae7178db845e2e2e00e713ca18873b78e47178db845e2e2e00e713ca18873b78e47178db845e2e2e00e713ca18873b78e47178db845e2e2e00e713ca18873b78e47178db845e2e2e00e713ca18873b78e47178db845e2e2e00e713ca18873b78e47178db845e2e2e00e713ca18873b78e47178db845e2e2e007c628e1b3aa549a3f1c5dc30c7b74d28b8009c4f708c54a714ca1c87b773e8e5e202703ec1311cee9482411cdecea1978b0bc0f904c770b8530a0671783b875e2e2e00e7131cc3e14e2918c4e1ed1c7ab9b8009c4f700c873ba5601087b773e8e5e202703ec1311cee9482411cdecea1978b0bc0f904c770b8530a0671783b875e2e2e00e7131cc3e14e2918c4e1ed1c7ab9b8009c4fb08852aafd860d1be6ad5cb9f2b3c6c6463a839d1a3b76ac77f219f5c3302939e606c6149d346ea1696db9f3b5b0ebe4ea720541c447b08a2e94f96b175da930b978b6b97dd129a92f35b7aff739cc0dbcd4f2149b41963b1f0bbb4eae2e5710447c04abe0177add63c3d54b8b47b7e8f0410d93922fb57c570313cbed67f9ae93abcb1504111fc12ad83508fb0b8dcf2fb57c3f2713cbed67f9ae93abcb1504111fc12a389e403b783e863834364577ee63b525b5edd1f674e7ce9dff8bb6098aa9e5f6b320eb447175b98220e22358c554b10429889e3d7bcebee8a28b3e3ff6d863d579e79da74e3bedb44ff3152053cbed6741d689e2ea720541c447b08aa962095210bd7bf7de7dcc31c77807b01f7ae82175c41147a8be7dfbfe8db60b82a9e5e6eccd6d1fa86b673d1d689d28855caeb4e5b35c4110f11172a66672f2c4583ca132ec5dda261ba68aa5b582d01dfb9a6eddba1db8e0820b3ce1a9acac54ddbb77575555557b69db20e01400ba0ca66cd99a8d6af692975b5d270ad6d1543efd2cd7e50a8a888f9033d5f1c4e09a786206f507c154b1a0e306b1f1e3c7ab8e1d3b2abd0ba656ac58a1060d1ab489b6c9c5e87298b0bb1e5baf9e59ffa657e4f4fb5a3353f9f433fa9d268df60f4708bd5c5c00ce27e488169fc763f5c9df65fa6a6b938769411aab4741db30128ac51b2bd3efe9e731ed7b4ddbe7a68a057174bc07b47d1cab4f8cf1be67c28a63f4eb1dd57589bbf4326e8dc5863c71d3f48507464e5bae464e5da6065c71e3fee1c3875fd046a9436aea1b47eab69bb5bd531d6f1ca81fdfa09f474cbd4e1b30ba1b3629a1163ffbbaf7ddefedfc585d79c793eafec6bfa92ba62c57f3137f537fdff88eba65f6b3deebbf2cffc7c1e5bc4eef4ee1f323a7ad38f8f9dd9f7caaee5efcb21aa197eb91a75e5557e958db777ce4ad53fafbb47d18ab4b8c4ae7301ba6f2e967851af9384ce8f5e502703e21076ac63ff3455d189fa40ac4b3cb273574acae4bdeac8b764e6c42f2cb43e2c99f69ff76afbd2e725d504f0f8a379c5c5b5b7ba8a962419c81f5cbbf5d3d31719afeae5dde77c51b2ff4c443fbf07ad0b845f503af9fbda35b559f7d970fbdfaad585de347f057c7932374bb64cd8486ef0c989c3ca2a62eb1400bd89fe8e70fa2c5eac147977a0282ef7ef1d5adeaea3b9ff28ed5bcf8da3635a43ea91e7be6bfd5ce0f3f566bffb1550d9bbcacd9b2eed1f6d6f60f0e7efea115afaa3f3ffe92fae0a3dd6ac9aad7bde33de9754a7f9f5e867f8300355b0e0653f9f433119fdce102703e210762f58de7eae24db4f06bb1c914246d5ea1ebc72d28f2743b9cb61ff6bc94f73ffc788f2e88cf106f60fd13c7eaefd8e67d575d632d465fe9efd2feb7874d5df2353caf9ed8f075fd7ab3e7af4fbca545f25b07dbd527e2b178f212faf9eafac46ff567d669db8375c22806dfffe8d3afa9879f7cd57b8e11cf8d77af3cb86c783df6de55def3b55aa46e9db3ca13a3cccfd7def5b4daf1c1c7def3e4eaa6e33d3a275beef94bc36799df8751507a59b261229f7e86e55a5aa0f37c1c26b44e7001389f90032854bd4b32bc853f9ed839b82ef163fc6a67fa7501bd5f3da9e1ac4ef3e6b5c56b5c2f84d3f66927cfc5963ef3f2be858b1adeec3fe5c9a3bcd1567de30dde77d5352ed4f6fbf477eb657a0fa3308cccf4f3b97a64734bcaff81feccaf318aaba94b9e83d71845719fd7027436046cc23dcb76ffe9d1b5def74f7f68ad37c2c173ec7261d4935e36bc5eb4b2e9f595339e542fbdbe1d62a9ee5bfa8a67f08f98ba5cbdb6f93db5e5dd0f3d41c2f19e4d9b36cd1d3e29b12ffd7d38a616e4b89a897cfa19966b6981ce707698d03ac105e07c420ee8827c6d705df27b8cbfb7779c2535f241317bfebac61eb1a6632b07e05fb8385185eb8536bdf9f6fe5c7fb175fbadeb5f792df9e8e34bf7dc7e4fc3f2188ef7c413b307c5171d9e5a862d43262f3f3ebd4c5a587a6adf3b311c3f8927a6d4d6ce6beff9eb1b2ff344512faf7ebc56bff777f6f3baf8759b4fb57fe9155392afce7978d927b8dc60cc9d4faa77dedfe5ed4e5d33f329b579db4e6ff9d2afb13b86d7101b8c7a263db05a8d9bfbbc7ae1ef5b3c3fc4e90a2d403317ae53a3a73fb97ff5fa571fd605be79ccb4c4e2f4f7695ba585e80fe965c9062efc443eb15cb9e6d3cf90eb8d1b37de8be55a5aa06bbb1c26b44e7001389f60197466fc9a6adb8be30939d8de871f5bba6dd2bd0d7fa23173468fd006d72dffae2ef2462d9083e8db1c2196dbcf100b31f32e707c3615c3a9e52a6142eb041780f30925440cff9a4d489e42fd41c101668cc0b4ed8fe11fae00ff28099123b44e7001389f20084226a175820bc0f90441103209ad135c00ce2708829049689de002703e4110844c42eb041780f309822064125a27b800f089898989b566a1a0c1c4c4c4c4829a200882200882200882200882200882200882200882200882200882200842fefc7fce0ea2d6e01c1d6e0000000049454e44ae426082	0	
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
adm	1	Administración	assignment
teach	1	Docente	assignment
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
admin2	adm
admin_boss	adm
teaching_leader	teach
teaching	teach
teaching2	teach
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
jOQLCsseZ97NLrIWov8A5g==	1	JEJFe86Q+yH5nW2hIBeKeQ==	2026-11-16 16:08:15.865	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:158.0) Gecko/20100101 Firefox/158.0	admin	\N
V+0lMnZIUnpvnIG5u+YeBw==	1	XVMntxCAItY9bwXnuVngWA==	2026-11-17 19:10:53.544	/flowable-ui/	Mozilla/5.0 (X11; Linux x86_64; rv:158.0) Gecko/20100101 Firefox/158.0	admin	\N
\.


--
-- Data for Name: act_id_user; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_id_user (id_, rev_, first_, last_, display_name_, email_, pwd_, picture_id_, tenant_id_) FROM stdin;
admin	1	Test	Administrator	\N	test-admin@example-domain.tld	test	\N	\N
admin2	2	ad	min	\N	admin2@gmail.com	admin2	\N	\N
admin_boss	2	admin	boss	\N	admin_boss@gmail.com	admin_boss	\N	\N
teaching_leader	2	teaching	leader	\N	teachingleader@gmail.com	teachingleader	\N	\N
teaching	2	teaching	the first	\N	teaching@gmail.com	teaching	\N	\N
teaching2	2	teaching	the second	\N	teaching2@gmail.com	teaching2	\N	\N
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

\unrestrict WP4UsrfTKQZa3EEQrMXw8vryAkTOMfTsyFqAXrk4hXuRe7aaZCzcydsLLPoPXVY

--
-- Database "institucion_db" dump
--

--
-- PostgreSQL database dump
--

\restrict 7DbpW94u1Rkq6Lihg2drfUKVkkFIQgAFGesSYbapUlwTLl2be2vIOosB8rC40xT

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

\unrestrict 7DbpW94u1Rkq6Lihg2drfUKVkkFIQgAFGesSYbapUlwTLl2be2vIOosB8rC40xT
\connect institucion_db
\restrict 7DbpW94u1Rkq6Lihg2drfUKVkkFIQgAFGesSYbapUlwTLl2be2vIOosB8rC40xT

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

\unrestrict 7DbpW94u1Rkq6Lihg2drfUKVkkFIQgAFGesSYbapUlwTLl2be2vIOosB8rC40xT

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict r9BgPZ4tyqTpxzmo2sIMc9VGDghYXbAVg5XlzELfLjnFdzTXJD40HG08mULO6bD

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

\unrestrict r9BgPZ4tyqTpxzmo2sIMc9VGDghYXbAVg5XlzELfLjnFdzTXJD40HG08mULO6bD

--
-- PostgreSQL database cluster dump complete
--

