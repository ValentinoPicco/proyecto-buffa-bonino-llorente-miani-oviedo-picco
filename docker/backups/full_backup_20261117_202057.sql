--
-- PostgreSQL database dump
--

\restrict n31kBxfXpuPkSD9BlP0JtqL9gARhfJ5BvDcm2xFlq0xbytd5A3FdkQi3fuS2Vkc

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

ALTER TABLE IF EXISTS ONLY public.flw_ru_batch_part DROP CONSTRAINT IF EXISTS flw_fk_batch_part_parent;
ALTER TABLE IF EXISTS ONLY public.act_de_model_relation DROP CONSTRAINT IF EXISTS fk_relation_parent;
ALTER TABLE IF EXISTS ONLY public.act_de_model_relation DROP CONSTRAINT IF EXISTS fk_relation_child;
ALTER TABLE IF EXISTS ONLY public.act_ru_variable DROP CONSTRAINT IF EXISTS act_fk_var_procinst;
ALTER TABLE IF EXISTS ONLY public.act_ru_variable DROP CONSTRAINT IF EXISTS act_fk_var_exe;
ALTER TABLE IF EXISTS ONLY public.act_ru_variable DROP CONSTRAINT IF EXISTS act_fk_var_bytearray;
ALTER TABLE IF EXISTS ONLY public.act_ru_identitylink DROP CONSTRAINT IF EXISTS act_fk_tskass_task;
ALTER TABLE IF EXISTS ONLY public.act_ru_timer_job DROP CONSTRAINT IF EXISTS act_fk_timer_job_process_instance;
ALTER TABLE IF EXISTS ONLY public.act_ru_timer_job DROP CONSTRAINT IF EXISTS act_fk_timer_job_proc_def;
ALTER TABLE IF EXISTS ONLY public.act_ru_timer_job DROP CONSTRAINT IF EXISTS act_fk_timer_job_execution;
ALTER TABLE IF EXISTS ONLY public.act_ru_timer_job DROP CONSTRAINT IF EXISTS act_fk_timer_job_exception;
ALTER TABLE IF EXISTS ONLY public.act_ru_timer_job DROP CONSTRAINT IF EXISTS act_fk_timer_job_custom_values;
ALTER TABLE IF EXISTS ONLY public.act_ru_task DROP CONSTRAINT IF EXISTS act_fk_task_procinst;
ALTER TABLE IF EXISTS ONLY public.act_ru_task DROP CONSTRAINT IF EXISTS act_fk_task_procdef;
ALTER TABLE IF EXISTS ONLY public.act_ru_task DROP CONSTRAINT IF EXISTS act_fk_task_exe;
ALTER TABLE IF EXISTS ONLY public.act_ru_suspended_job DROP CONSTRAINT IF EXISTS act_fk_suspended_job_process_instance;
ALTER TABLE IF EXISTS ONLY public.act_ru_suspended_job DROP CONSTRAINT IF EXISTS act_fk_suspended_job_proc_def;
ALTER TABLE IF EXISTS ONLY public.act_ru_suspended_job DROP CONSTRAINT IF EXISTS act_fk_suspended_job_execution;
ALTER TABLE IF EXISTS ONLY public.act_ru_suspended_job DROP CONSTRAINT IF EXISTS act_fk_suspended_job_exception;
ALTER TABLE IF EXISTS ONLY public.act_ru_suspended_job DROP CONSTRAINT IF EXISTS act_fk_suspended_job_custom_values;
ALTER TABLE IF EXISTS ONLY public.act_cmmn_ru_sentry_part_inst DROP CONSTRAINT IF EXISTS act_fk_sentry_plan_item;
ALTER TABLE IF EXISTS ONLY public.act_cmmn_ru_sentry_part_inst DROP CONSTRAINT IF EXISTS act_fk_sentry_case_inst;
ALTER TABLE IF EXISTS ONLY public.act_cmmn_ru_sentry_part_inst DROP CONSTRAINT IF EXISTS act_fk_sentry_case_def;
ALTER TABLE IF EXISTS ONLY public.act_id_priv_mapping DROP CONSTRAINT IF EXISTS act_fk_priv_mapping;
ALTER TABLE IF EXISTS ONLY public.act_cmmn_ru_plan_item_inst DROP CONSTRAINT IF EXISTS act_fk_plan_item_case_inst;
ALTER TABLE IF EXISTS ONLY public.act_cmmn_ru_plan_item_inst DROP CONSTRAINT IF EXISTS act_fk_plan_item_case_def;
ALTER TABLE IF EXISTS ONLY public.act_re_model DROP CONSTRAINT IF EXISTS act_fk_model_source_extra;
ALTER TABLE IF EXISTS ONLY public.act_re_model DROP CONSTRAINT IF EXISTS act_fk_model_source;
ALTER TABLE IF EXISTS ONLY public.act_re_model DROP CONSTRAINT IF EXISTS act_fk_model_deployment;
ALTER TABLE IF EXISTS ONLY public.act_cmmn_ru_mil_inst DROP CONSTRAINT IF EXISTS act_fk_mil_case_inst;
ALTER TABLE IF EXISTS ONLY public.act_cmmn_ru_mil_inst DROP CONSTRAINT IF EXISTS act_fk_mil_case_def;
ALTER TABLE IF EXISTS ONLY public.act_id_membership DROP CONSTRAINT IF EXISTS act_fk_memb_user;
ALTER TABLE IF EXISTS ONLY public.act_id_membership DROP CONSTRAINT IF EXISTS act_fk_memb_group;
ALTER TABLE IF EXISTS ONLY public.act_ru_job DROP CONSTRAINT IF EXISTS act_fk_job_process_instance;
ALTER TABLE IF EXISTS ONLY public.act_ru_job DROP CONSTRAINT IF EXISTS act_fk_job_proc_def;
ALTER TABLE IF EXISTS ONLY public.act_ru_job DROP CONSTRAINT IF EXISTS act_fk_job_execution;
ALTER TABLE IF EXISTS ONLY public.act_ru_job DROP CONSTRAINT IF EXISTS act_fk_job_exception;
ALTER TABLE IF EXISTS ONLY public.act_ru_job DROP CONSTRAINT IF EXISTS act_fk_job_custom_values;
ALTER TABLE IF EXISTS ONLY public.act_procdef_info DROP CONSTRAINT IF EXISTS act_fk_info_procdef;
ALTER TABLE IF EXISTS ONLY public.act_procdef_info DROP CONSTRAINT IF EXISTS act_fk_info_json_ba;
ALTER TABLE IF EXISTS ONLY public.act_ru_identitylink DROP CONSTRAINT IF EXISTS act_fk_idl_procinst;
ALTER TABLE IF EXISTS ONLY public.act_ru_external_job DROP CONSTRAINT IF EXISTS act_fk_external_job_exception;
ALTER TABLE IF EXISTS ONLY public.act_ru_external_job DROP CONSTRAINT IF EXISTS act_fk_external_job_custom_values;
ALTER TABLE IF EXISTS ONLY public.act_ru_execution DROP CONSTRAINT IF EXISTS act_fk_exe_super;
ALTER TABLE IF EXISTS ONLY public.act_ru_execution DROP CONSTRAINT IF EXISTS act_fk_exe_procinst;
ALTER TABLE IF EXISTS ONLY public.act_ru_execution DROP CONSTRAINT IF EXISTS act_fk_exe_procdef;
ALTER TABLE IF EXISTS ONLY public.act_ru_execution DROP CONSTRAINT IF EXISTS act_fk_exe_parent;
ALTER TABLE IF EXISTS ONLY public.act_ru_event_subscr DROP CONSTRAINT IF EXISTS act_fk_event_exec;
ALTER TABLE IF EXISTS ONLY public.act_ru_deadletter_job DROP CONSTRAINT IF EXISTS act_fk_deadletter_job_process_instance;
ALTER TABLE IF EXISTS ONLY public.act_ru_deadletter_job DROP CONSTRAINT IF EXISTS act_fk_deadletter_job_proc_def;
ALTER TABLE IF EXISTS ONLY public.act_ru_deadletter_job DROP CONSTRAINT IF EXISTS act_fk_deadletter_job_execution;
ALTER TABLE IF EXISTS ONLY public.act_ru_deadletter_job DROP CONSTRAINT IF EXISTS act_fk_deadletter_job_exception;
ALTER TABLE IF EXISTS ONLY public.act_ru_deadletter_job DROP CONSTRAINT IF EXISTS act_fk_deadletter_job_custom_values;
ALTER TABLE IF EXISTS ONLY public.act_cmmn_deployment_resource DROP CONSTRAINT IF EXISTS act_fk_cmmn_rsrc_dpl;
ALTER TABLE IF EXISTS ONLY public.act_cmmn_ru_case_inst DROP CONSTRAINT IF EXISTS act_fk_case_inst_case_def;
ALTER TABLE IF EXISTS ONLY public.act_cmmn_casedef DROP CONSTRAINT IF EXISTS act_fk_case_def_dply;
ALTER TABLE IF EXISTS ONLY public.act_ge_bytearray DROP CONSTRAINT IF EXISTS act_fk_bytearr_depl;
ALTER TABLE IF EXISTS ONLY public.act_ru_identitylink DROP CONSTRAINT IF EXISTS act_fk_athrz_procedef;
ALTER TABLE IF EXISTS ONLY public.act_app_deployment_resource DROP CONSTRAINT IF EXISTS act_fk_app_rsrc_dpl;
ALTER TABLE IF EXISTS ONLY public.act_app_appdef DROP CONSTRAINT IF EXISTS act_fk_app_def_dply;
DROP INDEX IF EXISTS public.idx_proc_mod_history_proc;
DROP INDEX IF EXISTS public.idx_proc_mod_created;
DROP INDEX IF EXISTS public.idx_contitem_taskid;
DROP INDEX IF EXISTS public.idx_contitem_scope;
DROP INDEX IF EXISTS public.idx_contitem_procid;
DROP INDEX IF EXISTS public.flw_idx_batch_part;
DROP INDEX IF EXISTS public.act_idx_variable_task_id;
DROP INDEX IF EXISTS public.act_idx_var_procinst;
DROP INDEX IF EXISTS public.act_idx_var_exe;
DROP INDEX IF EXISTS public.act_idx_var_bytearray;
DROP INDEX IF EXISTS public.act_idx_tskass_task;
DROP INDEX IF EXISTS public.act_idx_tjob_sub_scope;
DROP INDEX IF EXISTS public.act_idx_tjob_scope_def;
DROP INDEX IF EXISTS public.act_idx_tjob_scope;
DROP INDEX IF EXISTS public.act_idx_timer_job_process_instance_id;
DROP INDEX IF EXISTS public.act_idx_timer_job_proc_def_id;
DROP INDEX IF EXISTS public.act_idx_timer_job_execution_id;
DROP INDEX IF EXISTS public.act_idx_timer_job_exception_stack_id;
DROP INDEX IF EXISTS public.act_idx_timer_job_duedate;
DROP INDEX IF EXISTS public.act_idx_timer_job_custom_values_id;
DROP INDEX IF EXISTS public.act_idx_timer_job_correlation_id;
DROP INDEX IF EXISTS public.act_idx_task_sub_scope;
DROP INDEX IF EXISTS public.act_idx_task_scope_def;
DROP INDEX IF EXISTS public.act_idx_task_scope;
DROP INDEX IF EXISTS public.act_idx_task_procinst;
DROP INDEX IF EXISTS public.act_idx_task_procdef;
DROP INDEX IF EXISTS public.act_idx_task_exec;
DROP INDEX IF EXISTS public.act_idx_task_create;
DROP INDEX IF EXISTS public.act_idx_suspended_job_process_instance_id;
DROP INDEX IF EXISTS public.act_idx_suspended_job_proc_def_id;
DROP INDEX IF EXISTS public.act_idx_suspended_job_execution_id;
DROP INDEX IF EXISTS public.act_idx_suspended_job_exception_stack_id;
DROP INDEX IF EXISTS public.act_idx_suspended_job_custom_values_id;
DROP INDEX IF EXISTS public.act_idx_suspended_job_correlation_id;
DROP INDEX IF EXISTS public.act_idx_sjob_sub_scope;
DROP INDEX IF EXISTS public.act_idx_sjob_scope_def;
DROP INDEX IF EXISTS public.act_idx_sjob_scope;
DROP INDEX IF EXISTS public.act_idx_sentry_plan_item;
DROP INDEX IF EXISTS public.act_idx_sentry_case_inst;
DROP INDEX IF EXISTS public.act_idx_sentry_case_def;
DROP INDEX IF EXISTS public.act_idx_ru_var_sub_id_type;
DROP INDEX IF EXISTS public.act_idx_ru_var_scope_id_type;
DROP INDEX IF EXISTS public.act_idx_ru_acti_task;
DROP INDEX IF EXISTS public.act_idx_ru_acti_start;
DROP INDEX IF EXISTS public.act_idx_ru_acti_proc_act;
DROP INDEX IF EXISTS public.act_idx_ru_acti_proc;
DROP INDEX IF EXISTS public.act_idx_ru_acti_exec_act;
DROP INDEX IF EXISTS public.act_idx_ru_acti_exec;
DROP INDEX IF EXISTS public.act_idx_ru_acti_end;
DROP INDEX IF EXISTS public.act_idx_procdef_info_proc;
DROP INDEX IF EXISTS public.act_idx_procdef_info_json;
DROP INDEX IF EXISTS public.act_idx_priv_user;
DROP INDEX IF EXISTS public.act_idx_priv_mapping;
DROP INDEX IF EXISTS public.act_idx_priv_group;
DROP INDEX IF EXISTS public.act_idx_plan_item_stage_inst;
DROP INDEX IF EXISTS public.act_idx_plan_item_case_inst;
DROP INDEX IF EXISTS public.act_idx_plan_item_case_def;
DROP INDEX IF EXISTS public.act_idx_model_source_extra;
DROP INDEX IF EXISTS public.act_idx_model_source;
DROP INDEX IF EXISTS public.act_idx_model_deployment;
DROP INDEX IF EXISTS public.act_idx_mil_case_inst;
DROP INDEX IF EXISTS public.act_idx_mil_case_def;
DROP INDEX IF EXISTS public.act_idx_memb_user;
DROP INDEX IF EXISTS public.act_idx_memb_group;
DROP INDEX IF EXISTS public.act_idx_job_sub_scope;
DROP INDEX IF EXISTS public.act_idx_job_scope_def;
DROP INDEX IF EXISTS public.act_idx_job_scope;
DROP INDEX IF EXISTS public.act_idx_job_process_instance_id;
DROP INDEX IF EXISTS public.act_idx_job_proc_def_id;
DROP INDEX IF EXISTS public.act_idx_job_execution_id;
DROP INDEX IF EXISTS public.act_idx_job_exception_stack_id;
DROP INDEX IF EXISTS public.act_idx_job_custom_values_id;
DROP INDEX IF EXISTS public.act_idx_job_correlation_id;
DROP INDEX IF EXISTS public.act_idx_idl_procinst;
DROP INDEX IF EXISTS public.act_idx_ident_lnk_user;
DROP INDEX IF EXISTS public.act_idx_ident_lnk_sub_scope;
DROP INDEX IF EXISTS public.act_idx_ident_lnk_scope_def;
DROP INDEX IF EXISTS public.act_idx_ident_lnk_scope;
DROP INDEX IF EXISTS public.act_idx_ident_lnk_group;
DROP INDEX IF EXISTS public.act_idx_hi_var_sub_id_type;
DROP INDEX IF EXISTS public.act_idx_hi_var_scope_id_type;
DROP INDEX IF EXISTS public.act_idx_hi_task_sub_scope;
DROP INDEX IF EXISTS public.act_idx_hi_task_scope_def;
DROP INDEX IF EXISTS public.act_idx_hi_task_scope;
DROP INDEX IF EXISTS public.act_idx_hi_task_inst_procinst;
DROP INDEX IF EXISTS public.act_idx_hi_procvar_task_id;
DROP INDEX IF EXISTS public.act_idx_hi_procvar_proc_inst;
DROP INDEX IF EXISTS public.act_idx_hi_procvar_name_type;
DROP INDEX IF EXISTS public.act_idx_hi_procvar_exe;
DROP INDEX IF EXISTS public.act_idx_hi_pro_super_procinst;
DROP INDEX IF EXISTS public.act_idx_hi_pro_inst_end;
DROP INDEX IF EXISTS public.act_idx_hi_pro_i_buskey;
DROP INDEX IF EXISTS public.act_idx_hi_ident_lnk_user;
DROP INDEX IF EXISTS public.act_idx_hi_ident_lnk_task;
DROP INDEX IF EXISTS public.act_idx_hi_ident_lnk_sub_scope;
DROP INDEX IF EXISTS public.act_idx_hi_ident_lnk_scope_def;
DROP INDEX IF EXISTS public.act_idx_hi_ident_lnk_scope;
DROP INDEX IF EXISTS public.act_idx_hi_ident_lnk_procinst;
DROP INDEX IF EXISTS public.act_idx_hi_ent_lnk_scope_def;
DROP INDEX IF EXISTS public.act_idx_hi_ent_lnk_scope;
DROP INDEX IF EXISTS public.act_idx_hi_ent_lnk_root_scope;
DROP INDEX IF EXISTS public.act_idx_hi_ent_lnk_ref_scope;
DROP INDEX IF EXISTS public.act_idx_hi_detail_time;
DROP INDEX IF EXISTS public.act_idx_hi_detail_task_id;
DROP INDEX IF EXISTS public.act_idx_hi_detail_proc_inst;
DROP INDEX IF EXISTS public.act_idx_hi_detail_name;
DROP INDEX IF EXISTS public.act_idx_hi_detail_act_inst;
DROP INDEX IF EXISTS public.act_idx_hi_case_inst_end;
DROP INDEX IF EXISTS public.act_idx_hi_act_inst_start;
DROP INDEX IF EXISTS public.act_idx_hi_act_inst_procinst;
DROP INDEX IF EXISTS public.act_idx_hi_act_inst_exec;
DROP INDEX IF EXISTS public.act_idx_hi_act_inst_end;
DROP INDEX IF EXISTS public.act_idx_form_task;
DROP INDEX IF EXISTS public.act_idx_form_scope;
DROP INDEX IF EXISTS public.act_idx_form_proc;
DROP INDEX IF EXISTS public.act_idx_form_def_uniq;
DROP INDEX IF EXISTS public.act_idx_external_job_exception_stack_id;
DROP INDEX IF EXISTS public.act_idx_external_job_custom_values_id;
DROP INDEX IF EXISTS public.act_idx_external_job_correlation_id;
DROP INDEX IF EXISTS public.act_idx_exec_ref_id_;
DROP INDEX IF EXISTS public.act_idx_exec_buskey;
DROP INDEX IF EXISTS public.act_idx_exe_super;
DROP INDEX IF EXISTS public.act_idx_exe_root;
DROP INDEX IF EXISTS public.act_idx_exe_procinst;
DROP INDEX IF EXISTS public.act_idx_exe_procdef;
DROP INDEX IF EXISTS public.act_idx_exe_parent;
DROP INDEX IF EXISTS public.act_idx_event_subscr_scoperef_;
DROP INDEX IF EXISTS public.act_idx_event_subscr_config_;
DROP INDEX IF EXISTS public.act_idx_event_subscr;
DROP INDEX IF EXISTS public.act_idx_event_def_uniq;
DROP INDEX IF EXISTS public.act_idx_ent_lnk_scope_def;
DROP INDEX IF EXISTS public.act_idx_ent_lnk_scope;
DROP INDEX IF EXISTS public.act_idx_ent_lnk_root_scope;
DROP INDEX IF EXISTS public.act_idx_ent_lnk_ref_scope;
DROP INDEX IF EXISTS public.act_idx_ejob_sub_scope;
DROP INDEX IF EXISTS public.act_idx_ejob_scope_def;
DROP INDEX IF EXISTS public.act_idx_ejob_scope;
DROP INDEX IF EXISTS public.act_idx_dmn_instance_id;
DROP INDEX IF EXISTS public.act_idx_dmn_dec_uniq;
DROP INDEX IF EXISTS public.act_idx_djob_sub_scope;
DROP INDEX IF EXISTS public.act_idx_djob_scope_def;
DROP INDEX IF EXISTS public.act_idx_djob_scope;
DROP INDEX IF EXISTS public.act_idx_deadletter_job_process_instance_id;
DROP INDEX IF EXISTS public.act_idx_deadletter_job_proc_def_id;
DROP INDEX IF EXISTS public.act_idx_deadletter_job_execution_id;
DROP INDEX IF EXISTS public.act_idx_deadletter_job_exception_stack_id;
DROP INDEX IF EXISTS public.act_idx_deadletter_job_custom_values_id;
DROP INDEX IF EXISTS public.act_idx_deadletter_job_correlation_id;
DROP INDEX IF EXISTS public.act_idx_cmmn_rsrc_dpl;
DROP INDEX IF EXISTS public.act_idx_channel_def_uniq;
DROP INDEX IF EXISTS public.act_idx_case_inst_ref_id_;
DROP INDEX IF EXISTS public.act_idx_case_inst_parent;
DROP INDEX IF EXISTS public.act_idx_case_inst_case_def;
DROP INDEX IF EXISTS public.act_idx_case_def_uniq;
DROP INDEX IF EXISTS public.act_idx_case_def_dply;
DROP INDEX IF EXISTS public.act_idx_bytear_depl;
DROP INDEX IF EXISTS public.act_idx_athrz_procedef;
DROP INDEX IF EXISTS public.act_idx_app_rsrc_dpl;
DROP INDEX IF EXISTS public.act_idx_app_def_uniq;
DROP INDEX IF EXISTS public.act_idx_app_def_dply;
ALTER TABLE IF EXISTS ONLY public.act_cmmn_ru_sentry_part_inst DROP CONSTRAINT IF EXISTS pk_cmmn_sentry_part_inst;
ALTER TABLE IF EXISTS ONLY public.act_cmmn_ru_plan_item_inst DROP CONSTRAINT IF EXISTS pk_cmmn_plan_item_inst;
ALTER TABLE IF EXISTS ONLY public.act_cmmn_deployment_resource DROP CONSTRAINT IF EXISTS pk_cmmn_deployment_resource;
ALTER TABLE IF EXISTS ONLY public.act_app_deployment_resource DROP CONSTRAINT IF EXISTS pk_app_deployment_resource;
ALTER TABLE IF EXISTS ONLY public.flw_ru_batch DROP CONSTRAINT IF EXISTS flw_ru_batch_pkey;
ALTER TABLE IF EXISTS ONLY public.flw_ru_batch_part DROP CONSTRAINT IF EXISTS flw_ru_batch_part_pkey;
ALTER TABLE IF EXISTS ONLY public.flw_ev_databasechangeloglock DROP CONSTRAINT IF EXISTS flw_ev_databasechangeloglock_pkey;
ALTER TABLE IF EXISTS ONLY public.act_re_procdef DROP CONSTRAINT IF EXISTS act_uniq_procdef;
ALTER TABLE IF EXISTS ONLY public.act_id_priv DROP CONSTRAINT IF EXISTS act_uniq_priv_name;
ALTER TABLE IF EXISTS ONLY public.act_procdef_info DROP CONSTRAINT IF EXISTS act_uniq_info_procdef;
ALTER TABLE IF EXISTS ONLY public.act_ru_variable DROP CONSTRAINT IF EXISTS act_ru_variable_pkey;
ALTER TABLE IF EXISTS ONLY public.act_ru_timer_job DROP CONSTRAINT IF EXISTS act_ru_timer_job_pkey;
ALTER TABLE IF EXISTS ONLY public.act_ru_task DROP CONSTRAINT IF EXISTS act_ru_task_pkey;
ALTER TABLE IF EXISTS ONLY public.act_ru_suspended_job DROP CONSTRAINT IF EXISTS act_ru_suspended_job_pkey;
ALTER TABLE IF EXISTS ONLY public.act_ru_job DROP CONSTRAINT IF EXISTS act_ru_job_pkey;
ALTER TABLE IF EXISTS ONLY public.act_ru_identitylink DROP CONSTRAINT IF EXISTS act_ru_identitylink_pkey;
ALTER TABLE IF EXISTS ONLY public.act_ru_history_job DROP CONSTRAINT IF EXISTS act_ru_history_job_pkey;
ALTER TABLE IF EXISTS ONLY public.act_ru_external_job DROP CONSTRAINT IF EXISTS act_ru_external_job_pkey;
ALTER TABLE IF EXISTS ONLY public.act_ru_execution DROP CONSTRAINT IF EXISTS act_ru_execution_pkey;
ALTER TABLE IF EXISTS ONLY public.act_ru_event_subscr DROP CONSTRAINT IF EXISTS act_ru_event_subscr_pkey;
ALTER TABLE IF EXISTS ONLY public.act_ru_entitylink DROP CONSTRAINT IF EXISTS act_ru_entitylink_pkey;
ALTER TABLE IF EXISTS ONLY public.act_ru_deadletter_job DROP CONSTRAINT IF EXISTS act_ru_deadletter_job_pkey;
ALTER TABLE IF EXISTS ONLY public.act_ru_actinst DROP CONSTRAINT IF EXISTS act_ru_actinst_pkey;
ALTER TABLE IF EXISTS ONLY public.act_re_procdef DROP CONSTRAINT IF EXISTS act_re_procdef_pkey;
ALTER TABLE IF EXISTS ONLY public.act_re_model DROP CONSTRAINT IF EXISTS act_re_model_pkey;
ALTER TABLE IF EXISTS ONLY public.act_re_deployment DROP CONSTRAINT IF EXISTS act_re_deployment_pkey;
ALTER TABLE IF EXISTS ONLY public.act_procdef_info DROP CONSTRAINT IF EXISTS act_procdef_info_pkey;
ALTER TABLE IF EXISTS ONLY public.act_id_user DROP CONSTRAINT IF EXISTS act_id_user_pkey;
ALTER TABLE IF EXISTS ONLY public.act_id_token DROP CONSTRAINT IF EXISTS act_id_token_pkey;
ALTER TABLE IF EXISTS ONLY public.act_id_property DROP CONSTRAINT IF EXISTS act_id_property_pkey;
ALTER TABLE IF EXISTS ONLY public.act_id_priv DROP CONSTRAINT IF EXISTS act_id_priv_pkey;
ALTER TABLE IF EXISTS ONLY public.act_id_priv_mapping DROP CONSTRAINT IF EXISTS act_id_priv_mapping_pkey;
ALTER TABLE IF EXISTS ONLY public.act_id_membership DROP CONSTRAINT IF EXISTS act_id_membership_pkey;
ALTER TABLE IF EXISTS ONLY public.act_id_info DROP CONSTRAINT IF EXISTS act_id_info_pkey;
ALTER TABLE IF EXISTS ONLY public.act_id_group DROP CONSTRAINT IF EXISTS act_id_group_pkey;
ALTER TABLE IF EXISTS ONLY public.act_id_bytearray DROP CONSTRAINT IF EXISTS act_id_bytearray_pkey;
ALTER TABLE IF EXISTS ONLY public.act_hi_varinst DROP CONSTRAINT IF EXISTS act_hi_varinst_pkey;
ALTER TABLE IF EXISTS ONLY public.act_hi_tsk_log DROP CONSTRAINT IF EXISTS act_hi_tsk_log_pkey;
ALTER TABLE IF EXISTS ONLY public.act_hi_taskinst DROP CONSTRAINT IF EXISTS act_hi_taskinst_pkey;
ALTER TABLE IF EXISTS ONLY public.act_hi_procinst DROP CONSTRAINT IF EXISTS act_hi_procinst_proc_inst_id__key;
ALTER TABLE IF EXISTS ONLY public.act_hi_procinst DROP CONSTRAINT IF EXISTS act_hi_procinst_pkey;
ALTER TABLE IF EXISTS ONLY public.act_hi_identitylink DROP CONSTRAINT IF EXISTS act_hi_identitylink_pkey;
ALTER TABLE IF EXISTS ONLY public.act_hi_entitylink DROP CONSTRAINT IF EXISTS act_hi_entitylink_pkey;
ALTER TABLE IF EXISTS ONLY public.act_hi_detail DROP CONSTRAINT IF EXISTS act_hi_detail_pkey;
ALTER TABLE IF EXISTS ONLY public.act_hi_comment DROP CONSTRAINT IF EXISTS act_hi_comment_pkey;
ALTER TABLE IF EXISTS ONLY public.act_hi_attachment DROP CONSTRAINT IF EXISTS act_hi_attachment_pkey;
ALTER TABLE IF EXISTS ONLY public.act_hi_actinst DROP CONSTRAINT IF EXISTS act_hi_actinst_pkey;
ALTER TABLE IF EXISTS ONLY public.act_ge_property DROP CONSTRAINT IF EXISTS act_ge_property_pkey;
ALTER TABLE IF EXISTS ONLY public.act_ge_bytearray DROP CONSTRAINT IF EXISTS act_ge_bytearray_pkey;
ALTER TABLE IF EXISTS ONLY public.act_fo_databasechangeloglock DROP CONSTRAINT IF EXISTS act_fo_databasechangeloglock_pkey;
ALTER TABLE IF EXISTS ONLY public.act_evt_log DROP CONSTRAINT IF EXISTS act_evt_log_pkey;
ALTER TABLE IF EXISTS ONLY public.act_dmn_databasechangeloglock DROP CONSTRAINT IF EXISTS act_dmn_databasechangeloglock_pkey;
ALTER TABLE IF EXISTS ONLY public.act_de_databasechangeloglock DROP CONSTRAINT IF EXISTS act_de_databasechangeloglock_pkey;
ALTER TABLE IF EXISTS ONLY public.act_co_databasechangeloglock DROP CONSTRAINT IF EXISTS act_co_databasechangeloglock_pkey;
ALTER TABLE IF EXISTS ONLY public.act_cmmn_databasechangeloglock DROP CONSTRAINT IF EXISTS act_cmmn_databasechangeloglock_pkey;
ALTER TABLE IF EXISTS ONLY public.act_app_databasechangeloglock DROP CONSTRAINT IF EXISTS act_app_databasechangeloglock_pkey;
ALTER TABLE IF EXISTS ONLY public.act_adm_databasechangeloglock DROP CONSTRAINT IF EXISTS act_adm_databasechangeloglock_pkey;
ALTER TABLE IF EXISTS ONLY public.flw_event_resource DROP CONSTRAINT IF EXISTS "FLW_EVENT_RESOURCE_pkey";
ALTER TABLE IF EXISTS ONLY public.flw_event_deployment DROP CONSTRAINT IF EXISTS "FLW_EVENT_DEPLOYMENT_pkey";
ALTER TABLE IF EXISTS ONLY public.flw_event_definition DROP CONSTRAINT IF EXISTS "FLW_EVENT_DEFINITION_pkey";
ALTER TABLE IF EXISTS ONLY public.flw_channel_definition DROP CONSTRAINT IF EXISTS "FLW_CHANNEL_DEFINITION_pkey";
ALTER TABLE IF EXISTS ONLY public.act_fo_form_resource DROP CONSTRAINT IF EXISTS "ACT_FO_FORM_RESOURCE_pkey";
ALTER TABLE IF EXISTS ONLY public.act_fo_form_instance DROP CONSTRAINT IF EXISTS "ACT_FO_FORM_INSTANCE_pkey";
ALTER TABLE IF EXISTS ONLY public.act_fo_form_deployment DROP CONSTRAINT IF EXISTS "ACT_FO_FORM_DEPLOYMENT_pkey";
ALTER TABLE IF EXISTS ONLY public.act_fo_form_definition DROP CONSTRAINT IF EXISTS "ACT_FO_FORM_DEFINITION_pkey";
ALTER TABLE IF EXISTS ONLY public.act_dmn_hi_decision_execution DROP CONSTRAINT IF EXISTS "ACT_DMN_HI_DECISION_EXECUTION_pkey";
ALTER TABLE IF EXISTS ONLY public.act_dmn_deployment DROP CONSTRAINT IF EXISTS "ACT_DMN_DEPLOYMENT_pkey";
ALTER TABLE IF EXISTS ONLY public.act_dmn_deployment_resource DROP CONSTRAINT IF EXISTS "ACT_DMN_DEPLOYMENT_RESOURCE_pkey";
ALTER TABLE IF EXISTS ONLY public.act_dmn_decision DROP CONSTRAINT IF EXISTS "ACT_DMN_DECISION_TABLE_pkey";
ALTER TABLE IF EXISTS ONLY public.act_de_model DROP CONSTRAINT IF EXISTS "ACT_DE_MODEL_pkey";
ALTER TABLE IF EXISTS ONLY public.act_de_model_relation DROP CONSTRAINT IF EXISTS "ACT_DE_MODEL_RELATION_pkey";
ALTER TABLE IF EXISTS ONLY public.act_de_model_history DROP CONSTRAINT IF EXISTS "ACT_DE_MODEL_HISTORY_pkey";
ALTER TABLE IF EXISTS ONLY public.act_co_content_item DROP CONSTRAINT IF EXISTS "ACT_CO_CONTENT_ITEM_pkey";
ALTER TABLE IF EXISTS ONLY public.act_cmmn_ru_mil_inst DROP CONSTRAINT IF EXISTS "ACT_CMMN_RU_MIL_INST_pkey";
ALTER TABLE IF EXISTS ONLY public.act_cmmn_ru_case_inst DROP CONSTRAINT IF EXISTS "ACT_CMMN_RU_CASE_INST_pkey";
ALTER TABLE IF EXISTS ONLY public.act_cmmn_hi_plan_item_inst DROP CONSTRAINT IF EXISTS "ACT_CMMN_HI_PLAN_ITEM_INST_pkey";
ALTER TABLE IF EXISTS ONLY public.act_cmmn_hi_mil_inst DROP CONSTRAINT IF EXISTS "ACT_CMMN_HI_MIL_INST_pkey";
ALTER TABLE IF EXISTS ONLY public.act_cmmn_hi_case_inst DROP CONSTRAINT IF EXISTS "ACT_CMMN_HI_CASE_INST_pkey";
ALTER TABLE IF EXISTS ONLY public.act_cmmn_deployment DROP CONSTRAINT IF EXISTS "ACT_CMMN_DEPLOYMENT_pkey";
ALTER TABLE IF EXISTS ONLY public.act_cmmn_casedef DROP CONSTRAINT IF EXISTS "ACT_CMMN_CASEDEF_pkey";
ALTER TABLE IF EXISTS ONLY public.act_app_deployment DROP CONSTRAINT IF EXISTS "ACT_APP_DEPLOYMENT_pkey";
ALTER TABLE IF EXISTS ONLY public.act_app_appdef DROP CONSTRAINT IF EXISTS "ACT_APP_APPDEF_pkey";
ALTER TABLE IF EXISTS ONLY public.act_adm_server_config DROP CONSTRAINT IF EXISTS "ACT_ADM_SERVER_CONFIG_pkey";
ALTER TABLE IF EXISTS public.act_hi_tsk_log ALTER COLUMN id_ DROP DEFAULT;
ALTER TABLE IF EXISTS public.act_evt_log ALTER COLUMN log_nr_ DROP DEFAULT;
DROP TABLE IF EXISTS public.flw_ru_batch_part;
DROP TABLE IF EXISTS public.flw_ru_batch;
DROP TABLE IF EXISTS public.flw_event_resource;
DROP TABLE IF EXISTS public.flw_event_deployment;
DROP TABLE IF EXISTS public.flw_event_definition;
DROP TABLE IF EXISTS public.flw_ev_databasechangeloglock;
DROP TABLE IF EXISTS public.flw_ev_databasechangelog;
DROP TABLE IF EXISTS public.flw_channel_definition;
DROP TABLE IF EXISTS public.act_ru_variable;
DROP TABLE IF EXISTS public.act_ru_timer_job;
DROP TABLE IF EXISTS public.act_ru_task;
DROP TABLE IF EXISTS public.act_ru_suspended_job;
DROP TABLE IF EXISTS public.act_ru_job;
DROP TABLE IF EXISTS public.act_ru_identitylink;
DROP TABLE IF EXISTS public.act_ru_history_job;
DROP TABLE IF EXISTS public.act_ru_external_job;
DROP TABLE IF EXISTS public.act_ru_execution;
DROP TABLE IF EXISTS public.act_ru_event_subscr;
DROP TABLE IF EXISTS public.act_ru_entitylink;
DROP TABLE IF EXISTS public.act_ru_deadletter_job;
DROP TABLE IF EXISTS public.act_ru_actinst;
DROP TABLE IF EXISTS public.act_re_procdef;
DROP TABLE IF EXISTS public.act_re_model;
DROP TABLE IF EXISTS public.act_re_deployment;
DROP TABLE IF EXISTS public.act_procdef_info;
DROP TABLE IF EXISTS public.act_id_user;
DROP TABLE IF EXISTS public.act_id_token;
DROP TABLE IF EXISTS public.act_id_property;
DROP TABLE IF EXISTS public.act_id_priv_mapping;
DROP TABLE IF EXISTS public.act_id_priv;
DROP TABLE IF EXISTS public.act_id_membership;
DROP TABLE IF EXISTS public.act_id_info;
DROP TABLE IF EXISTS public.act_id_group;
DROP TABLE IF EXISTS public.act_id_bytearray;
DROP TABLE IF EXISTS public.act_hi_varinst;
DROP SEQUENCE IF EXISTS public.act_hi_tsk_log_id__seq;
DROP TABLE IF EXISTS public.act_hi_tsk_log;
DROP TABLE IF EXISTS public.act_hi_taskinst;
DROP TABLE IF EXISTS public.act_hi_procinst;
DROP TABLE IF EXISTS public.act_hi_identitylink;
DROP TABLE IF EXISTS public.act_hi_entitylink;
DROP TABLE IF EXISTS public.act_hi_detail;
DROP TABLE IF EXISTS public.act_hi_comment;
DROP TABLE IF EXISTS public.act_hi_attachment;
DROP TABLE IF EXISTS public.act_hi_actinst;
DROP TABLE IF EXISTS public.act_ge_property;
DROP TABLE IF EXISTS public.act_ge_bytearray;
DROP TABLE IF EXISTS public.act_fo_form_resource;
DROP TABLE IF EXISTS public.act_fo_form_instance;
DROP TABLE IF EXISTS public.act_fo_form_deployment;
DROP TABLE IF EXISTS public.act_fo_form_definition;
DROP TABLE IF EXISTS public.act_fo_databasechangeloglock;
DROP TABLE IF EXISTS public.act_fo_databasechangelog;
DROP SEQUENCE IF EXISTS public.act_evt_log_log_nr__seq;
DROP TABLE IF EXISTS public.act_evt_log;
DROP TABLE IF EXISTS public.act_dmn_hi_decision_execution;
DROP TABLE IF EXISTS public.act_dmn_deployment_resource;
DROP TABLE IF EXISTS public.act_dmn_deployment;
DROP TABLE IF EXISTS public.act_dmn_decision;
DROP TABLE IF EXISTS public.act_dmn_databasechangeloglock;
DROP TABLE IF EXISTS public.act_dmn_databasechangelog;
DROP TABLE IF EXISTS public.act_de_model_relation;
DROP TABLE IF EXISTS public.act_de_model_history;
DROP TABLE IF EXISTS public.act_de_model;
DROP TABLE IF EXISTS public.act_de_databasechangeloglock;
DROP TABLE IF EXISTS public.act_de_databasechangelog;
DROP TABLE IF EXISTS public.act_co_databasechangeloglock;
DROP TABLE IF EXISTS public.act_co_databasechangelog;
DROP TABLE IF EXISTS public.act_co_content_item;
DROP TABLE IF EXISTS public.act_cmmn_ru_sentry_part_inst;
DROP TABLE IF EXISTS public.act_cmmn_ru_plan_item_inst;
DROP TABLE IF EXISTS public.act_cmmn_ru_mil_inst;
DROP TABLE IF EXISTS public.act_cmmn_ru_case_inst;
DROP TABLE IF EXISTS public.act_cmmn_hi_plan_item_inst;
DROP TABLE IF EXISTS public.act_cmmn_hi_mil_inst;
DROP TABLE IF EXISTS public.act_cmmn_hi_case_inst;
DROP TABLE IF EXISTS public.act_cmmn_deployment_resource;
DROP TABLE IF EXISTS public.act_cmmn_deployment;
DROP TABLE IF EXISTS public.act_cmmn_databasechangeloglock;
DROP TABLE IF EXISTS public.act_cmmn_databasechangelog;
DROP TABLE IF EXISTS public.act_cmmn_casedef;
DROP TABLE IF EXISTS public.act_app_deployment_resource;
DROP TABLE IF EXISTS public.act_app_deployment;
DROP TABLE IF EXISTS public.act_app_databasechangeloglock;
DROP TABLE IF EXISTS public.act_app_databasechangelog;
DROP TABLE IF EXISTS public.act_app_appdef;
DROP TABLE IF EXISTS public.act_adm_server_config;
DROP TABLE IF EXISTS public.act_adm_databasechangeloglock;
DROP TABLE IF EXISTS public.act_adm_databasechangelog;
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
1	flowable	META-INF/liquibase/flowable-admin-app-db-changelog.xml	2026-11-16 15:54:35.540378	1	EXECUTED	8:655e3bb142f7d051dfc2d641ee0eeebd	createTable tableName=ACT_ADM_SERVER_CONFIG		\N	4.9.0	\N	\N	4844475521
1	flowable	META-INF/liquibase/flowable-admin-app-db-changelog.xml	2026-11-16 15:54:35.540378	1	EXECUTED	8:655e3bb142f7d051dfc2d641ee0eeebd	createTable tableName=ACT_ADM_SERVER_CONFIG		\N	4.9.0	\N	\N	4844475521
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
be67ed20-e2d1-11f1-87a6-06295b567284	1	App Cursos	appCursos	1	\N	be67c60c-e2d1-11f1-87a6-06295b567284	appCursos.app		
\.


--
-- Data for Name: act_app_databasechangelog; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_app_databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	flowable	org/flowable/app/db/liquibase/flowable-app-db-changelog.xml	2026-11-16 15:54:33.897803	1	EXECUTED	8:496fc778bdf2ab13f2e1926d0e63e0a2	createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...		\N	4.9.0	\N	\N	4844473858
3	flowable	org/flowable/app/db/liquibase/flowable-app-db-changelog.xml	2026-11-16 15:54:33.907771	2	EXECUTED	8:f1f8aff320aade831944ebad24355f3d	createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF		\N	4.9.0	\N	\N	4844473858
1	flowable	org/flowable/app/db/liquibase/flowable-app-db-changelog.xml	2026-11-16 15:54:33.897803	1	EXECUTED	8:496fc778bdf2ab13f2e1926d0e63e0a2	createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...		\N	4.9.0	\N	\N	4844473858
3	flowable	org/flowable/app/db/liquibase/flowable-app-db-changelog.xml	2026-11-16 15:54:33.907771	2	EXECUTED	8:f1f8aff320aade831944ebad24355f3d	createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF		\N	4.9.0	\N	\N	4844473858
1	flowable	org/flowable/app/db/liquibase/flowable-app-db-changelog.xml	2026-11-16 15:54:33.897803	1	EXECUTED	8:496fc778bdf2ab13f2e1926d0e63e0a2	createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...		\N	4.9.0	\N	\N	4844473858
3	flowable	org/flowable/app/db/liquibase/flowable-app-db-changelog.xml	2026-11-16 15:54:33.907771	2	EXECUTED	8:f1f8aff320aade831944ebad24355f3d	createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF		\N	4.9.0	\N	\N	4844473858
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
be67c60c-e2d1-11f1-87a6-06295b567284	App Cursos	\N	appCursos	2026-11-17 21:56:29.571	
\.


--
-- Data for Name: act_app_deployment_resource; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_app_deployment_resource (id_, name_, deployment_id_, resource_bytes_) FROM stdin;
be67c60d-e2d1-11f1-87a6-06295b567284	appCursos.app	be67c60c-e2d1-11f1-87a6-06295b567284	\\x7b226b6579223a22617070437572736f73222c226e616d65223a2241707020437572736f73222c226465736372697074696f6e223a22222c227468656d65223a227468656d652d31222c2269636f6e223a22676c79706869636f6e2d626f6f6b222c227573657273416363657373223a6e756c6c2c2267726f757073416363657373223a6e756c6c7d
be67c60e-e2d1-11f1-87a6-06295b567284	dmn-decisionVialidad.dmn	be67c60c-e2d1-11f1-87a6-06295b567284	\\x3c646566696e6974696f6e7320786d6c6e733d2268747470733a2f2f7777772e6f6d672e6f72672f737065632f444d4e2f32303139313131312f4d4f44454c2f2220786d6c6e733a646d6e64693d2268747470733a2f2f7777772e6f6d672e6f72672f737065632f444d4e2f32303139313131312f444d4e44492f2220786d6c6e733a64633d22687474703a2f2f7777772e6f6d672e6f72672f737065632f444d4e2f32303138303532312f44432f2220786d6c6e733a64693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f444d4e2f32303138303532312f44492f222069643d22646566696e6974696f6e5f31313331373862662d653263372d313166312d383761362d30363239356235363732383422206e616d653d224576616c756172205669616c6964616420437572736f7322206e616d6573706163653d22687474703a2f2f7777772e666c6f7761626c652e6f72672f646d6e22206578706f727465723d22466c6f7761626c65204f70656e20536f75726365204d6f64656c657222206578706f7274657256657273696f6e3d22362e382e30223e0a20203c6465636973696f6e2069643d226465636973696f6e5669616c6964616422206e616d653d224576616c756172205669616c6964616420437572736f73223e0a202020203c6465636973696f6e5461626c652069643d226465636973696f6e5461626c655f64336336303663302d386538392d346631322d623638652d3665626136656165396463382220686974506f6c6963793d224649525354223e0a2020202020203c696e7075743e0a20202020202020203c696e70757445787072657373696f6e2069643d22696e70757445787072657373696f6e5f39623561333863642d336365662d343564382d386531612d6130646135396464356239372220747970655265663d226e756d626572223e0a202020202020202020203c746578743e6f74726173496e7374616e636961733c2f746578743e0a20202020202020203c2f696e70757445787072657373696f6e3e0a2020202020203c2f696e7075743e0a2020202020203c6f75747075742069643d226f757470757445787072657373696f6e5f63313736653264632d333731382d343363382d383237392d36303533663439316465343922206e616d653d22766961626c652220747970655265663d22626f6f6c65616e223e3c2f6f75747075743e0a2020202020203c72756c653e0a20202020202020203c696e707574456e7472792069643d22696e707574456e7472795f39623561333863642d336365662d343564382d386531612d6130646135396464356239375f31223e0a202020202020202020203c746578743e3c215b43444154415b3c20355d5d3e3c2f746578743e0a20202020202020203c2f696e707574456e7472793e0a20202020202020203c6f7574707574456e7472792069643d226f7574707574456e7472795f63313736653264632d333731382d343363382d383237392d3630353366343931646534395f31223e0a202020202020202020203c746578743e3c215b43444154415b747275655d5d3e3c2f746578743e0a20202020202020203c2f6f7574707574456e7472793e0a2020202020203c2f72756c653e0a2020202020203c72756c653e0a20202020202020203c696e707574456e7472792069643d22696e707574456e7472795f39623561333863642d336365662d343564382d386531612d6130646135396464356239375f32223e0a202020202020202020203c746578743e3c215b43444154415b3e3d20355d5d3e3c2f746578743e0a20202020202020203c2f696e707574456e7472793e0a20202020202020203c6f7574707574456e7472792069643d226f7574707574456e7472795f63313736653264632d333731382d343363382d383237392d3630353366343931646534395f32223e0a202020202020202020203c746578743e3c215b43444154415b66616c73655d5d3e3c2f746578743e0a20202020202020203c2f6f7574707574456e7472793e0a2020202020203c2f72756c653e0a202020203c2f6465636973696f6e5461626c653e0a20203c2f6465636973696f6e3e0a20203c646d6e64693a444d4e44493e3c2f646d6e64693a444d4e44493e0a3c2f646566696e6974696f6e733e
be67c60f-e2d1-11f1-87a6-06295b567284	Process_Curso.bpmn	be67c60c-e2d1-11f1-87a6-06295b567284	\\x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c646566696e6974696f6e7320786d6c6e733d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f4d4f44454c2220786d6c6e733a7873693d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d612d696e7374616e63652220786d6c6e733a7873643d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d612220786d6c6e733a666c6f7761626c653d22687474703a2f2f666c6f7761626c652e6f72672f62706d6e2220786d6c6e733a62706d6e64693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f44492220786d6c6e733a6f6d6764633d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f44432220786d6c6e733a6f6d6764693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f44492220747970654c616e67756167653d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d61222065787072657373696f6e4c616e67756167653d22687474703a2f2f7777772e77332e6f72672f313939392f585061746822207461726765744e616d6573706163653d22687474703a2f2f666c6f7761626c652e6f72672f7465737422206578706f727465723d22466c6f7761626c65204f70656e20536f75726365204d6f64656c657222206578706f7274657256657273696f6e3d22362e382e30223e0a20203c636f6c6c61626f726174696f6e2069643d22436f6c6c61626f726174696f6e223e0a202020203c7061727469636970616e742069643d22506f6f6c5f496e737469747563696f6e22206e616d653d22496e73746974756369c3b36e2064652063617061636974616369c3b36e222070726f636573735265663d2250726f636573735f437572736f223e3c2f7061727469636970616e743e0a20203c2f636f6c6c61626f726174696f6e3e0a20203c6d6573736167652069643d224d73675f736f6c22206e616d653d22536f6c69636974756420646520637572736f223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f70726f7022206e616d653d2250726f707565737461223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f61636570746122206e616d653d224163657074616369c3b36e223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f72656368617a6122206e616d653d2252656368617a6f223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f6d6f6422206e616d653d22536f6c696369747564206465206d6f64696669636163696f6e6573223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f7265636f726422206e616d653d225265636f726461746f72696f223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f6e6f6d22206e616d653d224ec3b36d696e61206465207061727469636970616e746573223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f636f727222206e616d653d22436f727265636369c3b36e206465206461746f73223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f706564636f727222206e616d653d22536f6c69636974756420646520636f727265636369c3b36e223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f636f6e73756c746122206e616d653d22436f6e73756c7461206465206176616e6365223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f7265737022206e616d653d22526573707565737461206465206176616e6365223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f63616e63656c22206e616d653d2243616e63656c616369c3b36e223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f63696572726522206e616d653d224e6f7469666963616369c3b36e20646520636965727265223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f636f6e6622206e616d653d22436f6e6669726d616369c3b36e2064656c20637572736f223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f656e6322206e616d653d22456e637565737461223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f726573656e6322206e616d653d2252657370756573746120646520656e637565737461223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f696e666f726d6522206e616d653d22496e666f726d6520646520726573756c7461646f73223e3c2f6d6573736167653e0a20203c70726f636573732069643d2250726f636573735f437572736f22206e616d653d22496e73746974756369c3b36e2064652063617061636974616369c3b36e2220697345786563757461626c653d2274727565223e0a202020203c6c616e655365742069643d226c616e655365745f50726f636573735f437572736f223e0a2020202020203c6c616e652069643d224c616e655f3073713570686c22206e616d653d22446f63656e746573223e0a20202020202020203c666c6f774e6f64655265663e4469637461723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e46656368613c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e496e666f726d653c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e41637469766974795f3130313862647a3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e46656368614469637461723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f3173646a6568363c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e496e666f726d65456e766961723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f306c7363696a6b3c2f666c6f774e6f64655265663e0a2020202020203c2f6c616e653e0a2020202020203c6c616e652069643d224c616e655f303479767a7a7a22206e616d653d2241646d696e69737472616369c3b36e223e0a20202020202020203c666c6f774e6f64655265663e457370657261723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e496e6963696f3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e5265636f726461746f72696f3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e4c696d6974653c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e506c617a6f3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e416365707461723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e4d6f646966696361723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e41637469766974795f313265306574313c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e4576656e745f3077326b6974663c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e41726368697661723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e46696e53696e437572736f3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e52656368617a61723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e50726570617261723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e4576656e745f306661726675723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e50726f7075657374613c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e476174657761795f3130676674726e3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e4576656e745f313865646239713c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e41637469766974795f306969627a77753c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e436f6e6669726d61723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e46696e3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e526576697361723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e456e76696172496e666f726d653c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e41637469766974795f316567377a636c3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e456e766961723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e41637469766974795f3178773430306c3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e6d61696e333c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e566f6c766572457370657261723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e77616974333c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e77616974303c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e77616974313c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e77616974323c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e436572726172536f6c6963697475643c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e6d61696e323c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f30757062786e353c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e4f74726f5265636f72643c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e506c617a6f4c696d6974653c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e53696e5265737075657374613c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e52656368617a61646f3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e4d6f6469666963617250726f703c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f31373574316a333c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f31796d773571653c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e50726570617261646f3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e496e666f726d6541726368697661723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f306738766d396c3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f306b626e6d31643c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f303076653937723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f31746f70616d6a3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f303568773568753c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f316666707767613c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f307738786e336c3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f306b33386439673c2f666c6f774e6f64655265663e0a2020202020203c2f6c616e653e0a202020203c2f6c616e655365743e0a202020203c757365725461736b2069643d2244696374617222206e616d653d224465736172726f6c6c617220637572736f2220666c6f7761626c653a61737369676e65653d22247b646f63656e746553656c656363696f6e61646f7d2220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a2020202020203c657874656e73696f6e456c656d656e74733e0a20202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a2020202020203c2f657874656e73696f6e456c656d656e74733e0a202020203c2f757365725461736b3e0a202020203c696e7465726d65646961746543617463684576656e742069643d22466563686122206e616d653d2246656368612070726f6772616d616461223e0a2020202020203c74696d65724576656e74446566696e6974696f6e3e0a20202020202020203c74696d65446174653e247b6665636861437572736f7d3c2f74696d65446174653e0a2020202020203c2f74696d65724576656e74446566696e6974696f6e3e0a202020203c2f696e7465726d65646961746543617463684576656e743e0a202020203c757365725461736b2069643d22496e666f726d6522206e616d653d22456c61626f72617220696e666f726d6520646520726573756c7461646f732220666c6f7761626c653a63616e64696461746555736572733d227465616368696e675f6c65616465722220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a2020202020203c657874656e73696f6e456c656d656e74733e0a20202020202020203c6d6f64656c65723a757365722d696e666f2d656d61696c2d7465616368696e675f6c656164657220786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b7465616368696e676c656164657240676d61696c2e636f6d5d5d3e3c2f6d6f64656c65723a757365722d696e666f2d656d61696c2d7465616368696e675f6c65616465723e0a20202020202020203c6d6f64656c65723a757365722d696e666f2d66697273746e616d652d7465616368696e675f6c656164657220786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b7465616368696e675d5d3e3c2f6d6f64656c65723a757365722d696e666f2d66697273746e616d652d7465616368696e675f6c65616465723e0a20202020202020203c6d6f64656c65723a757365722d696e666f2d6c6173746e616d652d7465616368696e675f6c656164657220786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b6c65616465725d5d3e3c2f6d6f64656c65723a757365722d696e666f2d6c6173746e616d652d7465616368696e675f6c65616465723e0a20202020202020203c6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d7573657220786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d757365723e0a20202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a2020202020203c2f657874656e73696f6e456c656d656e74733e0a202020203c2f757365725461736b3e0a202020203c757365725461736b2069643d2241637469766974795f3130313862647a22206e616d653d22446566696e697220446f63656e746520717565206465736172726f6c6c6120656c20637572736f2220666c6f7761626c653a61737369676e65653d227465616368696e675f6c65616465722220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a2020202020203c657874656e73696f6e456c656d656e74733e0a20202020202020203c6d6f64656c65723a61637469766974692d69646d2d61737369676e656520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d61737369676e65653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d656d61696c20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b7465616368696e676c656164657240676d61696c2e636f6d5d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d656d61696c3e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b7465616368696e675d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b6c65616465725d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d653e0a20202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a2020202020203c2f657874656e73696f6e456c656d656e74733e0a202020203c2f757365725461736b3e0a202020203c6576656e744261736564476174657761792069643d224573706572617222206e616d653d224573706572617220726573707565737461223e3c2f6576656e744261736564476174657761793e0a202020203c73746172744576656e742069643d22496e6963696f22206e616d653d22536f6c69636974756420726563696269646122206973496e74657272757074696e673d2274727565223e0a2020202020203c6d6573736167654576656e74446566696e6974696f6e206d6573736167655265663d224d73675f736f6c2220666c6f7761626c653a6d65737361676545787072657373696f6e3d22736f6c6963697475644d7367223e3c2f6d6573736167654576656e74446566696e6974696f6e3e0a202020203c2f73746172744576656e743e0a202020203c7363726970745461736b2069643d225265636f726461746f72696f22206e616d653d22456e76696172207265636f726461746f72696f2220736372697074466f726d61743d2267726f6f76792220666c6f7761626c653a6175746f53746f72655661726961626c65733d2266616c7365223e0a2020202020203c7363726970743e3c215b43444154415b2f2f2070656e6469656e74655d5d3e3c2f7363726970743e0a202020203c2f7363726970745461736b3e0a202020203c6578636c7573697665476174657761792069643d224c696d69746522206e616d653d22c2bf536520656e766961726f6e2032207265636f726461746f72696f733f223e3c2f6578636c7573697665476174657761793e0a202020203c696e7465726d65646961746543617463684576656e742069643d22506c617a6f22206e616d653d22352064c3ad6173223e0a2020202020203c74696d65724576656e74446566696e6974696f6e3e0a20202020202020203c74696d654475726174696f6e3e5035443c2f74696d654475726174696f6e3e0a2020202020203c2f74696d65724576656e74446566696e6974696f6e3e0a202020203c2f696e7465726d65646961746543617463684576656e743e0a202020203c696e7465726d65646961746543617463684576656e742069643d224163657074617222206e616d653d224163657074616369c3b36e223e0a2020202020203c6d6573736167654576656e74446566696e6974696f6e206d6573736167655265663d224d73675f6163657074612220666c6f7761626c653a6d65737361676545787072657373696f6e3d2261636570746163696f6e4d7367223e3c2f6d6573736167654576656e74446566696e6974696f6e3e0a202020203c2f696e7465726d65646961746543617463684576656e743e0a202020203c696e7465726d65646961746543617463684576656e742069643d224d6f6469666963617222206e616d653d224d6f64696669636163696f6e6573223e0a2020202020203c6d6573736167654576656e74446566696e6974696f6e206d6573736167655265663d224d73675f6d6f642220666c6f7761626c653a6d65737361676545787072657373696f6e3d226d6f64696669636163696f6e65734d7367223e3c2f6d6573736167654576656e74446566696e6974696f6e3e0a202020203c2f696e7465726d65646961746543617463684576656e743e0a202020203c7363726970745461736b2069643d2241637469766974795f3132653065743122206e616d653d224e6f74696669636172204369657272652220736372697074466f726d61743d2267726f6f76792220666c6f7761626c653a6175746f53746f72655661726961626c65733d2266616c7365223e0a2020202020203c7363726970743e3c215b43444154415b2f2f2070656e6469656e74655d5d3e3c2f7363726970743e0a202020203c2f7363726970745461736b3e0a202020203c656e644576656e742069643d224576656e745f3077326b697466223e3c2f656e644576656e743e0a202020203c757365725461736b2069643d22417263686976617222206e616d653d22417263686976617220736f6c6963697475642220666c6f7761626c653a61737369676e65653d2261646d696e5f626f73732220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a2020202020203c657874656e73696f6e456c656d656e74733e0a20202020202020203c6d6f64656c65723a61637469766974692d69646d2d61737369676e656520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d61737369676e65653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d656d61696c20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b61646d696e5f626f737340676d61696c2e636f6d5d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d656d61696c3e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b61646d696e5d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b626f73735d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d653e0a20202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a2020202020203c2f657874656e73696f6e456c656d656e74733e0a202020203c2f757365725461736b3e0a202020203c656e644576656e742069643d2246696e53696e437572736f22206e616d653d22536f6c6963697475642063657272616461223e3c2f656e644576656e743e0a202020203c696e7465726d65646961746543617463684576656e742069643d2252656368617a617222206e616d653d2252656368617a6f223e0a2020202020203c6d6573736167654576656e74446566696e6974696f6e206d6573736167655265663d224d73675f72656368617a612220666c6f7761626c653a6d65737361676545787072657373696f6e3d2272656368617a6f4d7367223e3c2f6d6573736167654576656e74446566696e6974696f6e3e0a202020203c2f696e7465726d65646961746543617463684576656e743e0a202020203c73756250726f636573732069643d22507265706172617222206e616d653d22507265706172617220637572736f223e0a2020202020203c73746172744576656e742069643d22537562496e6963696f2220666c6f7761626c653a696e69746961746f723d22696e69746961746f722220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e3c2f73746172744576656e743e0a2020202020203c706172616c6c656c476174657761792069643d22506172496e6963696f22206e616d653d22507265706172616369c3b36e20656e20706172616c656c6f223e3c2f706172616c6c656c476174657761793e0a2020202020203c726563656976655461736b2069643d224e6f6d696e6122206e616d653d2252656369626972206ec3b36d696e61223e3c2f726563656976655461736b3e0a2020202020203c757365725461736b2069643d224c6973746122206e616d653d22436f6e66656363696f6e6172206c6973746120646566696e69746976612220666c6f7761626c653a63616e64696461746547726f7570733d2261646d2220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a20202020202020203c657874656e73696f6e456c656d656e74733e0a202020202020202020203c6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b41646d696e69737472616369c3b36e5d5d3e3c2f6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d3e0a202020202020202020203c6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f757020786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f75703e0a202020202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a20202020202020203c2f657874656e73696f6e456c656d656e74733e0a2020202020203c2f757365725461736b3e0a2020202020203c757365725461736b2069643d224d6174657269616c22206e616d653d225072657061726172206d6174657269616c65732220666c6f7761626c653a63616e64696461746547726f7570733d2261646d2220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a20202020202020203c657874656e73696f6e456c656d656e74733e0a202020202020202020203c6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b41646d696e69737472616369c3b36e5d5d3e3c2f6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d3e0a202020202020202020203c6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f757020786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f75703e0a202020202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a20202020202020203c2f657874656e73696f6e456c656d656e74733e0a2020202020203c2f757365725461736b3e0a2020202020203c696e636c7573697665476174657761792069643d224f72496e6963696f22206e616d653d225265637572736f73206e656365736172696f73223e3c2f696e636c7573697665476174657761793e0a2020202020203c757365725461736b2069643d225669727475616c22206e616d653d22536f6c6963697461722041756c61205669727475616c2220666c6f7761626c653a63616e64696461746547726f7570733d2261646d2220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a20202020202020203c657874656e73696f6e456c656d656e74733e0a202020202020202020203c6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b41646d696e69737472616369c3b36e5d5d3e3c2f6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d3e0a202020202020202020203c6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f757020786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f75703e0a202020202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a20202020202020203c2f657874656e73696f6e456c656d656e74733e0a2020202020203c2f757365725461736b3e0a2020202020203c757365725461736b2069643d2245717569706f22206e616d653d22436f6e747261746172206571756970616d69656e746f2220666c6f7761626c653a63616e64696461746547726f7570733d2261646d2220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a20202020202020203c657874656e73696f6e456c656d656e74733e0a202020202020202020203c6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b41646d696e69737472616369c3b36e5d5d3e3c2f6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d3e0a202020202020202020203c6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f757020786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f75703e0a202020202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a20202020202020203c2f657874656e73696f6e456c656d656e74733e0a2020202020203c2f757365725461736b3e0a2020202020203c696e636c7573697665476174657761792069643d224f7246696e22206e616d653d22546f646f73206c6f73207265637572736f732073656c656363696f6e61646f73206c6973746f73223e3c2f696e636c7573697665476174657761793e0a2020202020203c706172616c6c656c476174657761792069643d2250617246696e22206e616d653d22507265706172616369c3b36e20636f6d706c657461223e3c2f706172616c6c656c476174657761793e0a2020202020203c656e644576656e742069643d2253756246696e223e3c2f656e644576656e743e0a2020202020203c757365725461736b2069643d2241637469766974795f3132693268706622206e616d653d224576616c7561720a5265637572736f732220666c6f7761626c653a63616e64696461746547726f7570733d2261646d2220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a20202020202020203c657874656e73696f6e456c656d656e74733e0a202020202020202020203c6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b41646d696e69737472616369c3b36e5d5d3e3c2f6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d3e0a202020202020202020203c6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f757020786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f75703e0a202020202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a20202020202020203c2f657874656e73696f6e456c656d656e74733e0a2020202020203c2f757365725461736b3e0a2020202020203c73756250726f636573732069643d2241637469766974795f3034386435656d22206e616d653d2243616e63656c616369c3b36e222074726967676572656442794576656e743d2274727565223e0a20202020202020203c696e7465726d6564696174655468726f774576656e742069643d224576656e745f3172766f346b36223e0a202020202020202020203c636f6d70656e736174654576656e74446566696e6974696f6e3e3c2f636f6d70656e736174654576656e74446566696e6974696f6e3e0a20202020202020203c2f696e7465726d6564696174655468726f774576656e743e0a20202020202020203c73746172744576656e742069643d224576656e745f316734786d716f22206e616d653d22526563696269722043616e63656c616369c3b36e22206973496e74657272757074696e673d2274727565223e0a202020202020202020203c6d6573736167654576656e74446566696e6974696f6e20666c6f7761626c653a6d65737361676545787072657373696f6e3d2263616e63656c6163696f6e4d7367223e3c2f6d6573736167654576656e74446566696e6974696f6e3e0a20202020202020203c2f73746172744576656e743e0a20202020202020203c656e644576656e742069643d224576656e745f30736e69676263223e0a202020202020202020203c6572726f724576656e74446566696e6974696f6e20666c6f7761626c653a6572726f725661726961626c654c6f63616c53636f70653d2266616c73652220666c6f7761626c653a6572726f725661726961626c655472616e7369656e743d2266616c7365223e3c2f6572726f724576656e74446566696e6974696f6e3e0a20202020202020203c2f656e644576656e743e0a20202020202020203c73657175656e6365466c6f772069643d22466c6f775f30393970716c652220736f757263655265663d224576656e745f316734786d716f22207461726765745265663d224576656e745f3172766f346b36223e3c2f73657175656e6365466c6f773e0a20202020202020203c73657175656e6365466c6f772069643d22466c6f775f306835736935662220736f757263655265663d224576656e745f3172766f346b3622207461726765745265663d224576656e745f30736e69676263223e3c2f73657175656e6365466c6f773e0a2020202020203c2f73756250726f636573733e0a2020202020203c626f756e646172794576656e742069643d224576656e745f3167737971657222206174746163686564546f5265663d225669727475616c222063616e63656c41637469766974793d2266616c7365223e0a20202020202020203c636f6d70656e736174654576656e74446566696e6974696f6e3e3c2f636f6d70656e736174654576656e74446566696e6974696f6e3e0a2020202020203c2f626f756e646172794576656e743e0a2020202020203c626f756e646172794576656e742069643d224576656e745f3179706363316a22206174746163686564546f5265663d2245717569706f222063616e63656c41637469766974793d2266616c7365223e0a20202020202020203c636f6d70656e736174654576656e74446566696e6974696f6e3e3c2f636f6d70656e736174654576656e74446566696e6974696f6e3e0a2020202020203c2f626f756e646172794576656e743e0a2020202020203c757365725461736b2069643d2241637469766974795f316d303870636c22206e616d653d224c696265726172204571756970616d69656e746f22206973466f72436f6d70656e736174696f6e3d22747275652220666c6f7761626c653a63616e64696461746547726f7570733d2261646d2220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a20202020202020203c657874656e73696f6e456c656d656e74733e0a202020202020202020203c6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b41646d696e69737472616369c3b36e5d5d3e3c2f6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d3e0a202020202020202020203c6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f757020786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f75703e0a202020202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a20202020202020203c2f657874656e73696f6e456c656d656e74733e0a2020202020203c2f757365725461736b3e0a2020202020203c736572766963655461736b2069643d2241756c6122206e616d653d2252657365727661722061756c612220666c6f7761626c653a65787072657373696f6e3d22247b747275657d223e3c2f736572766963655461736b3e0a2020202020203c736572766963655461736b2069643d2241637469766974795f31367a7a39317022206e616d653d224c6962657261722041756c6122206973466f72436f6d70656e736174696f6e3d22747275652220666c6f7761626c653a65787072657373696f6e3d22247b747275657d223e3c2f736572766963655461736b3e0a2020202020203c7363726970745461736b2069643d2241637469766974795f303268726f6f6322206e616d653d224c6962657261722041756c61205669727475616c22206973466f72436f6d70656e736174696f6e3d22747275652220736372697074466f726d61743d2267726f6f76792220666c6f7761626c653a6175746f53746f72655661726961626c65733d2266616c7365223e0a20202020202020203c7363726970743e3c215b43444154415b2f2f2070656e6469656e74655d5d3e3c2f7363726970743e0a2020202020203c2f7363726970745461736b3e0a2020202020203c626f756e646172794576656e742069643d227369642d46464231303331302d314543372d343743432d384637312d36323744384443304445384622206174746163686564546f5265663d2241756c61222063616e63656c41637469766974793d2266616c7365223e0a20202020202020203c636f6d70656e736174654576656e74446566696e6974696f6e3e3c2f636f6d70656e736174654576656e74446566696e6974696f6e3e0a2020202020203c2f626f756e646172794576656e743e0a2020202020203c73657175656e6365466c6f772069643d2273312220736f757263655265663d22537562496e6963696f22207461726765745265663d22506172496e6963696f223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d2273322220736f757263655265663d22506172496e6963696f22207461726765745265663d224e6f6d696e61223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d2273352220736f757263655265663d22506172496e6963696f22207461726765745265663d224d6174657269616c223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d2273362220736f757263655265663d22506172496e6963696f22207461726765745265663d2241637469766974795f31326932687066223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d226f723022206e616d653d2250726573656e6369616c2220736f757263655265663d224f72496e6963696f22207461726765745265663d2241756c61223e0a20202020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e3c215b43444154415b247b726571756965726541756c617d5d5d3e3c2f636f6e646974696f6e45787072657373696f6e3e0a2020202020203c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d226f6a302220736f757263655265663d2241756c6122207461726765745265663d224f7246696e223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d226f723122206e616d653d225669727475616c2220736f757263655265663d224f72496e6963696f22207461726765745265663d225669727475616c223e0a20202020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e3c215b43444154415b247b7265717569657265506c617461666f726d617d5d5d3e3c2f636f6e646974696f6e45787072657373696f6e3e0a2020202020203c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d226f6a312220736f757263655265663d225669727475616c22207461726765745265663d224f7246696e223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d226f723222206e616d653d224571756970616d69656e746f20657370656369616c2220736f757263655265663d224f72496e6963696f22207461726765745265663d2245717569706f223e0a20202020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e3c215b43444154415b247b72657175696572654571756970616d69656e746f7d5d5d3e3c2f636f6e646974696f6e45787072657373696f6e3e0a2020202020203c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d226f6a322220736f757263655265663d2245717569706f22207461726765745265663d224f7246696e223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d227331312220736f757263655265663d224f7246696e22207461726765745265663d2250617246696e223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d227331322220736f757263655265663d2250617246696e22207461726765745265663d2253756246696e223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d22466c6f775f307236686379622220736f757263655265663d2241637469766974795f3132693268706622207461726765745265663d224f72496e6963696f223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d22466c6f775f307062736176322220736f757263655265663d224d6174657269616c22207461726765745265663d2250617246696e223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d22466c6f775f317130396f71392220736f757263655265663d224c6973746122207461726765745265663d2250617246696e223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d22466c6f775f316a39313767332220736f757263655265663d224e6f6d696e6122207461726765745265663d224c69737461223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d224173736f63696174696f6e5f306f716f6861782220736f757263655265663d224576656e745f3179706363316a22207461726765745265663d2241637469766974795f316d303870636c223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d224173736f63696174696f6e5f306636666e76772220736f757263655265663d224576656e745f3167737971657222207461726765745265663d2241637469766974795f303268726f6f63223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d224173736f63696174696f6e5f3166683637786e2220736f757263655265663d227369642d46464231303331302d314543372d343743432d384637312d36323744384443304445384622207461726765745265663d2241637469766974795f31367a7a393170223e3c2f73657175656e6365466c6f773e0a202020203c2f73756250726f636573733e0a202020203c626f756e646172794576656e742069643d224576656e745f3066617266757222206174746163686564546f5265663d225072657061726172223e0a2020202020203c6572726f724576656e74446566696e6974696f6e20666c6f7761626c653a6572726f725661726961626c654c6f63616c53636f70653d2266616c73652220666c6f7761626c653a6572726f725661726961626c655472616e7369656e743d2266616c7365223e3c2f6572726f724576656e74446566696e6974696f6e3e0a202020203c2f626f756e646172794576656e743e0a202020203c757365725461736b2069643d2250726f70756573746122206e616d653d22526567697374726172207920456c61626f7261722070726f7075657374612220666c6f7761626c653a61737369676e65653d2261646d696e5f626f73732220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a2020202020203c657874656e73696f6e456c656d656e74733e0a20202020202020203c6d6f64656c65723a61637469766974692d69646d2d61737369676e656520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d61737369676e65653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d656d61696c20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b61646d696e5f626f737340676d61696c2e636f6d5d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d656d61696c3e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b61646d696e5d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b626f73735d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d653e0a20202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a2020202020203c2f657874656e73696f6e456c656d656e74733e0a202020203c2f757365725461736b3e0a202020203c6578636c7573697665476174657761792069643d22476174657761795f3130676674726e22206e616d653d22457320766961626c653f223e3c2f6578636c7573697665476174657761793e0a202020203c656e644576656e742069643d224576656e745f31386564623971223e3c2f656e644576656e743e0a202020203c7363726970745461736b2069643d2241637469766974795f306969627a777522206e616d653d224e6f7469666963617220446573696369c3b36e2220736372697074466f726d61743d2267726f6f76792220666c6f7761626c653a6175746f53746f72655661726961626c65733d2266616c7365223e0a2020202020203c7363726970743e3c215b43444154415b2f2f2070656e6469656e74655d5d3e3c2f7363726970743e0a202020203c2f7363726970745461736b3e0a202020203c7363726970745461736b2069643d22436f6e6669726d617222206e616d653d22456e7669617220636f6e6669726d616369c3b36e2220736372697074466f726d61743d2267726f6f76792220666c6f7761626c653a6175746f53746f72655661726961626c65733d2266616c7365223e0a2020202020203c7363726970743e3c215b43444154415b2f2f2070656e6469656e74655d5d3e3c2f7363726970743e0a202020203c2f7363726970745461736b3e0a202020203c656e644576656e742069643d2246696e22206e616d653d224c696265726172207265637572736f732e0ac2a0437572736f2066696e616c697a61646f223e3c2f656e644576656e743e0a202020203c757365725461736b2069643d225265766973617222206e616d653d22526576697361722070726f7075657374612220666c6f7761626c653a61737369676e65653d2261646d696e5f626f73732220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a2020202020203c657874656e73696f6e456c656d656e74733e0a20202020202020203c6d6f64656c65723a61637469766974692d69646d2d61737369676e656520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d61737369676e65653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d656d61696c20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b61646d696e5f626f737340676d61696c2e636f6d5d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d656d61696c3e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b61646d696e5d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b626f73735d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d653e0a20202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a2020202020203c2f657874656e73696f6e456c656d656e74733e0a202020203c2f757365725461736b3e0a202020203c757365725461736b2069643d22456e76696172496e666f726d6522206e616d653d22456e7669617220696e666f726d65206120656d7072657361207920417263686976617220657870656469656e74652e2220666c6f7761626c653a61737369676e65653d2261646d696e5f626f73732220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a2020202020203c657874656e73696f6e456c656d656e74733e0a20202020202020203c6d6f64656c65723a61637469766974692d69646d2d61737369676e656520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d61737369676e65653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d656d61696c20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b61646d696e5f626f737340676d61696c2e636f6d5d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d656d61696c3e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b61646d696e5d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b626f73735d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d653e0a20202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a2020202020203c2f657874656e73696f6e456c656d656e74733e0a202020203c2f757365725461736b3e0a202020203c7363726970745461736b2069643d2241637469766974795f316567377a636c22206e616d653d22486162696c697461722061636365736f206465206c6120656d70726573612220736372697074466f726d61743d2267726f6f76792220666c6f7761626c653a6175746f53746f72655661726961626c65733d2266616c7365223e0a2020202020203c7363726970743e3c215b43444154415b2f2f2070656e6469656e74655d5d3e3c2f7363726970743e0a202020203c2f7363726970745461736b3e0a202020203c7363726970745461736b2069643d22456e7669617222206e616d653d22456e766961722070726f7075657374612220736372697074466f726d61743d2267726f6f76792220666c6f7761626c653a6175746f53746f72655661726961626c65733d2266616c7365223e0a2020202020203c7363726970743e3c215b43444154415b2f2f2070656e6469656e74655d5d3e3c2f7363726970743e0a202020203c2f7363726970745461736b3e0a202020203c736572766963655461736b2069643d2241637469766974795f3178773430306c22206e616d653d224576616c7561722056696162696c696461642220666c6f7761626c653a747970653d22646d6e223e0a2020202020203c657874656e73696f6e456c656d656e74733e0a20202020202020203c666c6f7761626c653a6669656c64206e616d653d226465636973696f6e5461626c655265666572656e63654b6579223e0a202020202020202020203c666c6f7761626c653a737472696e673e3c215b43444154415b6465636973696f6e5669616c696461645d5d3e3c2f666c6f7761626c653a737472696e673e0a20202020202020203c2f666c6f7761626c653a6669656c643e0a20202020202020203c666c6f7761626c653a6669656c64206e616d653d226465636973696f6e5461736b5468726f774572726f724f6e4e6f48697473223e0a202020202020202020203c666c6f7761626c653a737472696e673e3c215b43444154415b66616c73655d5d3e3c2f666c6f7761626c653a737472696e673e0a20202020202020203c2f666c6f7761626c653a6669656c643e0a20202020202020203c666c6f7761626c653a6669656c64206e616d653d2266616c6c6261636b546f44656661756c7454656e616e74223e0a202020202020202020203c666c6f7761626c653a737472696e673e3c215b43444154415b66616c73655d5d3e3c2f666c6f7761626c653a737472696e673e0a20202020202020203c2f666c6f7761626c653a6669656c643e0a20202020202020203c666c6f7761626c653a6669656c64206e616d653d2273616d654465706c6f796d656e74223e0a202020202020202020203c666c6f7761626c653a737472696e673e3c215b43444154415b66616c73655d5d3e3c2f666c6f7761626c653a737472696e673e0a20202020202020203c2f666c6f7761626c653a6669656c643e0a20202020202020203c666c6f7761626c653a6465636973696f6e5265666572656e63655479706520786d6c6e733a666c6f7761626c653d22687474703a2f2f666c6f7761626c652e6f72672f62706d6e223e3c215b43444154415b6465636973696f6e536572766963655d5d3e3c2f666c6f7761626c653a6465636973696f6e5265666572656e6365547970653e0a2020202020203c2f657874656e73696f6e456c656d656e74733e0a202020203c2f736572766963655461736b3e0a202020203c73657175656e6365466c6f772069643d2246656368614469637461722220736f757263655265663d22466563686122207461726765745265663d22446963746172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f3173646a6568362220736f757263655265663d2244696374617222207461726765745265663d22496e666f726d65223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22496e666f726d65456e766961722220736f757263655265663d22496e666f726d6522207461726765745265663d22456e76696172496e666f726d65223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f306c7363696a6b2220736f757263655265663d2241637469766974795f3130313862647a22207461726765745265663d224665636861223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d226d61696e332220736f757263655265663d22456e7669617222207461726765745265663d2245737065726172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22566f6c766572457370657261722220736f757263655265663d225265636f726461746f72696f22207461726765745265663d2245737065726172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d2277616974332220736f757263655265663d224573706572617222207461726765745265663d22506c617a6f223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d2277616974302220736f757263655265663d224573706572617222207461726765745265663d2241636570746172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d2277616974312220736f757263655265663d224573706572617222207461726765745265663d2252656368617a6172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d2277616974322220736f757263655265663d224573706572617222207461726765745265663d224d6f64696669636172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22436572726172536f6c6963697475642220736f757263655265663d22417263686976617222207461726765745265663d2246696e53696e437572736f223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d226d61696e322220736f757263655265663d2250726f70756573746122207461726765745265663d22456e76696172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f30757062786e352220736f757263655265663d225265766973617222207461726765745265663d22456e76696172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d224f74726f5265636f726422206e616d653d224e6f2220736f757263655265663d224c696d69746522207461726765745265663d225265636f726461746f72696f223e0a2020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e3c215b43444154415b247b7265636f726461746f72696f73203c20327d5d5d3e3c2f636f6e646974696f6e45787072657373696f6e3e0a202020203c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22506c617a6f4c696d6974652220736f757263655265663d22506c617a6f22207461726765745265663d224c696d697465223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d2253696e52657370756573746122206e616d653d2253c3ad2220736f757263655265663d224c696d69746522207461726765745265663d224172636869766172223e0a2020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e3c215b43444154415b247b7265636f726461746f72696f73203e3d20327d5d5d3e3c2f636f6e646974696f6e45787072657373696f6e3e0a202020203c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d2252656368617a61646f2220736f757263655265663d2252656368617a617222207461726765745265663d224172636869766172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d224d6f6469666963617250726f702220736f757263655265663d224d6f6469666963617222207461726765745265663d2252657669736172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f31373574316a332220736f757263655265663d2241637469766974795f3132653065743122207461726765745265663d224576656e745f3077326b697466223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f31796d773571652220736f757263655265663d224576656e745f3066617266757222207461726765745265663d2241637469766974795f31326530657431223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d2250726570617261646f2220736f757263655265663d22507265706172617222207461726765745265663d22436f6e6669726d6172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22496e666f726d6541726368697661722220736f757263655265663d22456e76696172496e666f726d6522207461726765745265663d2246696e223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f306738766d396c2220736f757263655265663d22496e6963696f22207461726765745265663d2241637469766974795f3178773430306c223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f306b626e6d31642220736f757263655265663d2241637469766974795f3178773430306c22207461726765745265663d22476174657761795f3130676674726e223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f303076653937722220736f757263655265663d2241637469766974795f306969627a777522207461726765745265663d224576656e745f31386564623971223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f31746f70616d6a2220736f757263655265663d22436f6e6669726d617222207461726765745265663d2241637469766974795f3130313862647a223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f303568773568752220736f757263655265663d224163657074617222207461726765745265663d2241637469766974795f316567377a636c223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f316666707767612220736f757263655265663d2241637469766974795f316567377a636c22207461726765745265663d225072657061726172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f307738786e336c22206e616d653d226e6f2220736f757263655265663d22476174657761795f3130676674726e22207461726765745265663d2241637469766974795f306969627a7775223e0a2020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e3c215b43444154415b247b766961626c65203d3d2066616c73657d5d5d3e3c2f636f6e646974696f6e45787072657373696f6e3e0a202020203c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f306b333864396722206e616d653d2273692220736f757263655265663d22476174657761795f3130676674726e22207461726765745265663d2250726f707565737461223e0a2020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e3c215b43444154415b247b766961626c65203d3d20747275657d5d5d3e3c2f636f6e646974696f6e45787072657373696f6e3e0a202020203c2f73657175656e6365466c6f773e0a20203c2f70726f636573733e0a20203c62706d6e64693a42504d4e4469616772616d2069643d2242504d4e4469616772616d5f436f6c6c61626f726174696f6e223e0a202020203c62706d6e64693a42504d4e506c616e652062706d6e456c656d656e743d22436f6c6c61626f726174696f6e222069643d2242504d4e506c616e655f436f6c6c61626f726174696f6e223e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22506f6f6c5f496e737469747563696f6e222069643d2242504d4e53686170655f506f6f6c5f496e737469747563696f6e223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d22313931302e30222077696474683d22313530352e302220783d223135352e302220793d2238302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224c616e655f3073713570686c222069643d2242504d4e53686170655f4c616e655f3073713570686c223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d223137302e30222077696474683d22313437352e302220783d223138352e302220793d22313832302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22446963746172222069643d2242504d4e53686170655f446963746172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d223937372e302220793d22313837302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224665636861222069643d2242504d4e53686170655f4665636861223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233312e30222077696474683d2233312e302220783d223836392e302220793d22313839322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22496e666f726d65222069643d2242504d4e53686170655f496e666f726d65223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d22313138352e302220793d22313837302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f3130313862647a222069643d2242504d4e53686170655f41637469766974795f3130313862647a223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d223732302e302220793d22313837302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224c616e655f303479767a7a7a222069643d2242504d4e53686170655f4c616e655f303479767a7a7a223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d22313734302e30222077696474683d22313437352e302220783d223138352e302220793d2238302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2245737065726172222069643d2242504d4e53686170655f45737065726172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2234302e30222077696474683d2234302e302220783d223938302e302220793d223332352e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22496e6963696f222069643d2242504d4e53686170655f496e6963696f223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e352220783d223234322e302220793d223333322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d225265636f726461746f72696f222069643d2242504d4e53686170655f5265636f726461746f72696f223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d22313534302e302220793d223333302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224c696d697465222069643d2242504d4e53686170655f4c696d697465223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2234302e30222077696474683d2234302e302220783d22313333352e302220793d223334352e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22506c617a6f222069643d2242504d4e53686170655f506c617a6f223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233312e30222077696474683d2233312e302220783d22313139372e302220793d223335322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241636570746172222069643d2242504d4e53686170655f41636570746172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e302220783d22313139372e302220793d223537322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224d6f64696669636172222069643d2242504d4e53686170655f4d6f64696669636172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e302220783d22313139372e302220793d223139322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f31326530657431222069643d2242504d4e53686170655f41637469766974795f31326530657431223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d223537302e302220793d22313639302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224576656e745f3077326b697466222069643d2242504d4e53686170655f4576656e745f3077326b697466223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2232382e30222077696474683d2232382e302220783d223734322e302220793d22313731322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224172636869766172222069643d2242504d4e53686170655f4172636869766172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d22313335302e302220793d223435302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2246696e53696e437572736f222069643d2242504d4e53686170655f46696e53696e437572736f223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2232382e30222077696474683d2232382e302220783d22313535322e302220793d223437322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2252656368617a6172222069643d2242504d4e53686170655f52656368617a6172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e302220783d22313139372e302220793d223437322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d225072657061726172222069643d2242504d4e53686170655f5072657061726172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d223839302e30222077696474683d22313236302e302220783d223335302e302220793d223730302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22537562496e6963696f222069643d2242504d4e53686170655f537562496e6963696f223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e302220783d223337352e302220793d223938322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22506172496e6963696f222069643d2242504d4e53686170655f506172496e6963696f223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2234302e30222077696474683d2234302e302220783d223435352e302220793d223937352e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224e6f6d696e61222069643d2242504d4e53686170655f4e6f6d696e61223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d223535302e302220793d223733302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224c69737461222069643d2242504d4e53686170655f4c69737461223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d22313032302e302220793d223733302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224d6174657269616c222069643d2242504d4e53686170655f4d6174657269616c223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d223535302e302220793d223936302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224f72496e6963696f222069643d2242504d4e53686170655f4f72496e6963696f223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2234302e30222077696474683d2234302e302220783d223638352e302220793d22313232352e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d225669727475616c222069643d2242504d4e53686170655f5669727475616c223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d223833302e302220793d22313231302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2245717569706f222069643d2242504d4e53686170655f45717569706f223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d223833302e302220793d22313430302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224f7246696e222069643d2242504d4e53686170655f4f7246696e223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2234302e30222077696474683d2234302e302220783d22313135382e302220793d22313232352e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2250617246696e222069643d2242504d4e53686170655f50617246696e223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2234302e30222077696474683d2234302e302220783d22313336352e302220793d223937352e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2253756246696e222069643d2242504d4e53686170655f53756246696e223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2232382e30222077696474683d2232382e302220783d22313439322e302220793d223938322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f31326932687066222069643d2242504d4e53686170655f41637469766974795f31326932687066223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d223535302e302220793d22313231302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f3034386435656d222069643d2242504d4e53686170655f41637469766974795f3034386435656d223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d223132302e30222077696474683d223330302e302220783d22313238302e302220793d22313431302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224576656e745f3172766f346b36222069643d2242504d4e53686170655f4576656e745f3172766f346b36223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e302220783d22313430322e302220793d22313434322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224576656e745f316734786d716f222069643d2242504d4e53686170655f4576656e745f316734786d716f223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e352220783d22313331322e302220793d22313434322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224576656e745f30736e69676263222069643d2242504d4e53686170655f4576656e745f30736e69676263223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2232382e30222077696474683d2232382e302220783d22313439322e302220793d22313434322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224576656e745f31677379716572222069643d2242504d4e53686170655f4576656e745f31677379716572223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e302220783d223838352e302220793d22313237362e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224576656e745f3179706363316a222069643d2242504d4e53686170655f4576656e745f3179706363316a223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e302220783d223838352e302220793d22313436362e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f316d303870636c222069643d2242504d4e53686170655f41637469766974795f316d303870636c223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d22313030302e302220793d22313438302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241756c61222069643d2242504d4e53686170655f41756c61223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d223833302e302220793d22313035302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f31367a7a393170222069643d2242504d4e53686170655f41637469766974795f31367a7a393170223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d22313031302e302220793d22313134302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f303268726f6f63222069643d2242504d4e53686170655f41637469766974795f303268726f6f63223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d22313030302e302220793d22313239302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d227369642d46464231303331302d314543372d343743432d384637312d363237443844433044453846222069643d2242504d4e53686170655f7369642d46464231303331302d314543372d343743432d384637312d363237443844433044453846223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e302220783d223838372e393931373535353735373537392220793d22313131352e34333630343435363838313833223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224576656e745f30666172667572222069643d2242504d4e53686170655f4576656e745f30666172667572223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e302220783d223532342e323936383939333933353332342220793d22313537352e37313130393033383630383637223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2250726f707565737461222069643d2242504d4e53686170655f50726f707565737461223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d223634352e302220793d223435302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22476174657761795f3130676674726e222069643d2242504d4e53686170655f476174657761795f3130676674726e223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2234302e30222077696474683d2234302e302220783d223339352e302220793d223436352e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224576656e745f31386564623971222069643d2242504d4e53686170655f4576656e745f31386564623971223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2232382e30222077696474683d2232382e302220783d223532322e302220793d223538322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f306969627a7775222069643d2242504d4e53686170655f41637469766974795f306969627a7775223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d223337302e302220793d223536302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22436f6e6669726d6172222069643d2242504d4e53686170655f436f6e6669726d6172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d223832372e302220793d22313639302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2246696e222069643d2242504d4e53686170655f46696e223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2232382e30222077696474683d2232382e302220783d22313537372e302220793d22313731322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2252657669736172222069643d2242504d4e53686170655f52657669736172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d22313335302e302220793d223131302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22456e76696172496e666f726d65222069643d2242504d4e53686170655f456e76696172496e666f726d65223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d22313339352e302220793d22313639302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f316567377a636c222069643d2242504d4e53686170655f41637469766974795f316567377a636c223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d22313430302e302220793d223535302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22456e76696172222069643d2242504d4e53686170655f456e76696172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d223636352e302220793d223331302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f3178773430306c222069643d2242504d4e53686170655f41637469766974795f3178773430306c223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d223231302e302220793d223435302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d224f74726f5265636f7264222069643d2242504d4e456467655f4f74726f5265636f72642220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313337342e353330333933353836303035392220793d223336352e3431353632353030303030303033223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313533392e393939393939393939393939332220793d223336382e3933363137303231323736353934223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d2250726570617261646f222069643d2242504d4e456467655f50726570617261646f2220666c6f7761626c653a736f75726365446f636b6572583d223633302e302220666c6f7761626c653a736f75726365446f636b6572593d223434352e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223930312e363439353732363439353732362220793d22313538392e39343939393939393939393938223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223838342e303333393331363233393331362220793d22313639302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d2252656368617a61646f222069643d2242504d4e456467655f52656368617a61646f2220666c6f7761626c653a736f75726365446f636b6572583d2231352e302220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313232362e393438343236353335333931372220793d223438372e32313536303331353834323431223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313334392e3939393939393939393939362220793d223438382e39393033383436313533383436223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d2253696e526573707565737461222069643d2242504d4e456467655f53696e5265737075657374612220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313335362e353833333333333333333333332220793d223338332e3335333336373637303336343535223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313336302e302220793d223432332e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313432302e302220793d223432332e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313432302e302220793d223435302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f306b3338643967222069643d2242504d4e456467655f466c6f775f306b33386439672220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223433342e363139373838353933383938392220793d223438352e33323730343931383033323739223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223634342e393939393939393939393938392220793d223438382e38333333333333333333333333223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f316a3931376733222069643d2242504d4e456467655f466c6f775f316a39313767332220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223638392e393439393939393939373630332220793d223737302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313032302e302220793d223737302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d224173736f63696174696f6e5f3166683637786e222069643d2242504d4e456467655f4173736f63696174696f6e5f3166683637786e2220666c6f7761626c653a736f75726365446f636b6572583d2231352e302220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d22302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223930322e303837393439333231333130322220793d22313134352e33353933353333333330373037223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223930302e302220793d22313138302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313031302e302220793d22313138302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f30307665393772222069643d2242504d4e456467655f466c6f775f303076653937722220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2231342e302220666c6f7761626c653a746172676574446f636b6572593d2231342e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223436392e393439393939393939393936352220793d223539382e32373538363230363839363536223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223532322e303038313535383534303631372220793d223539362e34383037353432363732393035223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d224665636861446963746172222069643d2242504d4e456467655f46656368614469637461722220666c6f7761626c653a736f75726365446f636b6572583d2231352e352220666c6f7761626c653a736f75726365446f636b6572593d2231352e352220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223839392e393438313337383733303739382220793d22313930372e37333736363438333631363538223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223937362e393939393939393939393931382220793d22313930382e393233303736393233303737223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f30393970716c65222069643d2242504d4e456467655f466c6f775f30393970716c652220666c6f7761626c653a736f75726365446f636b6572583d2231352e32352220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d2231352e302220666c6f7761626c653a746172676574446f636b6572593d2231352e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313334322e343439393937363136343633392220793d22313435372e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313430322e302220793d22313435372e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d227331222069643d2242504d4e456467655f73312220666c6f7761626c653a736f75726365446f636b6572583d2231352e302220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223430342e39343539343530353334303434342220793d223939362e36343731353435353331333332223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223435352e343539373730313134393431332220793d223939352e343538363230363839363535223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d227332222069643d2242504d4e456467655f73322220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223437352e343333363935363532313733392220793d223937352e34333437383236303836393536223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223438302e302220793d223737302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223535302e302220793d223737302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f307738786e336c222069643d2242504d4e456467655f466c6f775f307738786e336c2220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223431352e38333132352220793d223530342e31313131333635353238373236223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223431382e323630383639353635323137342220793d223536302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d227335222069643d2242504d4e456467655f73352220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223439342e323738373937343638333534342220793d223939352e36363530303030303030303031223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223535302e302220793d223939372e35383632303638393635353137223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d227336222069643d2242504d4e456467655f73362220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223437352e3339392220793d22313031342e35343731373131333135343735223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223438302e302220793d22313234302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223534392e393939393939393939393939312220793d22313234352e38333333333333333333333333223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f30723668637962222069643d2242504d4e456467655f466c6f775f307236686379622220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223634392e393439393939393939393938322220793d22313234372e36313930343736313930343737223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223638352e393039303930393039303839322220793d22313234352e39303638313831383138313836223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d224173736f63696174696f6e5f306636666e7677222069643d2242504d4e456467655f4173736f63696174696f6e5f306636666e76772220666c6f7761626c653a736f75726365446f636b6572583d2231352e302220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d22302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223930302e302220793d22313330352e39343939383830303639333039223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223930302e302220793d22313333302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313030302e302220793d22313333302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d226f7230222069643d2242504d4e456467655f6f72302220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223730352e363233343337352220793d22313232352e363235223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223731302e302220793d22313039302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223833302e302220793d22313039302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d226f7232222069643d2242504d4e456467655f6f72322220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223730352e34393837352220793d22313236342e34343635313432343238373837223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223731302e302220793d22313434302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223833302e302220793d22313434302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d226f7231222069643d2242504d4e456467655f6f72312220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223732342e343436353134323432383734332220793d22313234352e3439383735223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223832392e393939393939393939393938392220793d22313234382e32303531323832303531323832223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22496e666f726d65456e76696172222069643d2242504d4e456467655f496e666f726d65456e766961722220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313332342e39352220793d22313931302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313434352e302220793d22313931302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313434352e302220793d22313736392e3935223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d226d61696e32222069643d2242504d4e456467655f6d61696e322220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223731352e302220793d223435302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223731352e302220793d223338392e3935303030303030303030303035223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d226f6a30222069643d2242504d4e456467655f6f6a302220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223932392e393439393939393939393932352220793d22313039302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313138332e302220793d22313039302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313137382e363233343337352220793d22313232352e363235223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f31373574316a33222069643d2242504d4e456467655f466c6f775f31373574316a332220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2231342e302220666c6f7761626c653a746172676574446f636b6572593d2231342e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223636392e393439393939393939393939392220793d22313732382e35323934313137363437303539223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223734322e3030353933323036393930372220793d22313732362e34313031323034313639333937223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d226f6a32222069643d2242504d4e456467655f6f6a322220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223936392e393439393939393939393939392220793d22313434302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313138332e302220793d22313434302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313137382e34393837352220793d22313236342e343038343636373333333637223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d226d61696e33222069643d2242504d4e456467655f6d61696e332220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223736342e393439393939393939393939392220793d223334392e3132323830373031373534333833223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223938302e333434383237353836323035362220793d223334352e33343339363535313732343134223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d226f6a31222069643d2242504d4e456467655f6f6a312220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223936392e393439393939393939393839392220793d22313234382e37343130303731393432343435223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313135382e333533333536383930343531332220793d22313234352e33353234373334393832333332223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f30683573693566222069643d2242504d4e456467655f466c6f775f306835736935662220666c6f7761626c653a736f75726365446f636b6572583d2231352e302220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d2231342e302220666c6f7761626c653a746172676574446f636b6572593d2231342e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313433312e393439303735373235353337382220793d22313435362e383331343731303933393931223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313439322e303030383632393930343533372220793d22313435362e313536373331393834393431223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f306738766d396c222069643d2242504d4e456467655f466c6f775f306738766d396c2220666c6f7761626c653a736f75726365446f636b6572583d2231352e32352220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223235372e35333734343935393335323130352220793d223336312e39343732383539323936343939223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223235392e323330373639323330373639322220793d223435302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22566f6c76657245737065726172222069643d2242504d4e456467655f566f6c766572457370657261722220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313539392e393837352220793d223333302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313631302e302220793d223239302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313030352e302220793d223239302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313030312e363632343939393939393939392220793d223332362e36363636363636363636363637223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f30757062786e35222069643d2242504d4e456467655f466c6f775f30757062786e352220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313335302e302220793d223135302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223731352e302220793d223135302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223731352e302220793d223331302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f306b626e6d3164222069643d2242504d4e456467655f466c6f775f306b626e6d31642220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223330392e39343939393939393939393939332220793d223438382e3338373039363737343139333534223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223339352e3632352220793d223438352e3632333433373439393939393937223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22506c617a6f4c696d697465222069643d2242504d4e456467655f506c617a6f4c696d6974652220666c6f7761626c653a736f75726365446f636b6572583d2231352e352220666c6f7761626c653a736f75726365446f636b6572593d2231352e352220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313232372e393437363730373635303335312220793d223336372e3232383131313137313434383233223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313333352e333434383237353836323035362220793d223336352e33343339363535313732343134223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d224d6f6469666963617250726f70222069643d2242504d4e456467655f4d6f6469666963617250726f702220666c6f7761626c653a736f75726365446f636b6572583d2231352e302220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313232362e3934383432363533323039322220793d223230372e3231353630333039363034313833223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313432302e302220793d223231302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313432302e302220793d223138392e3935223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f31796d77357165222069643d2242504d4e456467655f466c6f775f31796d773571652220666c6f7761626c653a736f75726365446f636b6572583d2231352e302220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223533392e333732333632373939303437332220793d22313630352e3636303837363632393032223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223534302e302220793d22313733302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223536392e393939393939393939373432342220793d22313733302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f30706273617632222069643d2242504d4e456467655f466c6f775f307062736176322220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223638392e393439393939393939393832382220793d223939392e35343234383336363031333039223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313336352e313239383730313239383638332220793d223939352e31323935343534353435343536223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f306c7363696a6b222069643d2242504d4e456467655f466c6f775f306c7363696a6b2220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2231352e352220666c6f7761626c653a746172676574446f636b6572593d2231352e35223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223831392e393439393939393939393931332220793d22313930382e39303832393639343332333133223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223836392e303033363137323736323935322220793d22313930372e38333732353737303233313239223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22733131222069643d2242504d4e456467655f7331312220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313139372e343835393339363539313336322220793d22313234352e34353936373734313933353439223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313339302e302220793d22313235302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313338352e3338333635333834363135342220793d22313031342e35323139343131333132303434223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22496e666f726d654172636869766172222069643d2242504d4e456467655f496e666f726d6541726368697661722220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2231342e302220666c6f7761626c653a746172676574446f636b6572593d2231342e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313439342e393439393939393939393933372220793d22313732382e36333031333639383633303133223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313537372e303035313436363337393835352220793d22313732362e33383230353134303033323639223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f31746f70616d6a222069643d2242504d4e456467655f466c6f775f31746f70616d6a2220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223837372e302220793d22313736392e3935223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223837372e302220793d22313831352e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223737302e302220793d22313831352e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223737302e302220793d22313837302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22733132222069643d2242504d4e456467655f7331322220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2231342e302220666c6f7761626c653a746172676574446f636b6572593d2231342e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313430342e373738343339383033343330352220793d223939352e31363335323435393031363339223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313439322e303030313830353836303033312220793d223939352e38383433303133393036323938223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f31666670776761222069643d2242504d4e456467655f466c6f775f316666707767612220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d223633302e302220666c6f7761626c653a746172676574446f636b6572593d223434352e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313431362e3132363132363132363132362220793d223632392e39343939393939393939393939223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313335362e383034353034353034353034342220793d223730302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f3173646a656836222069643d2242504d4e456467655f466c6f775f3173646a6568362220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313131362e39352220793d22313931302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313138352e302220793d22313931302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d227761697430222069643d2242504d4e456467655f77616974302220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2231352e302220666c6f7761626c653a746172676574446f636b6572593d2231352e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313030302e3339392220793d223336342e3534373137313133313534373433223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313030352e302220793d223539302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313139372e303031353339313631363735352220793d223538372e32313636343434363938363337223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d227761697433222069643d2242504d4e456467655f77616974332220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2231352e352220666c6f7761626c653a746172676574446f636b6572593d2231352e35223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313031382e323733363638383835313931322220793d223334362e3636323439393939393939393937223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313035352e302220793d223335302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313035352e302220793d223337302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313139372e303031393039373538363535352220793d223336372e3734353230373833373832353433223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d227761697431222069643d2242504d4e456467655f77616974312220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2231352e302220666c6f7761626c653a746172676574446f636b6572593d2231352e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313030302e3636352220793d223336342e32373837393734363833353434223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313030352e302220793d223439302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313139372e303031353339313631363735352220793d223438372e32313636343434363938363337223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d227761697432222069643d2242504d4e456467655f77616974322220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2231352e302220666c6f7761626c653a746172676574446f636b6572593d2231352e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313031382e313231353531373234313337382220793d223334362e38313336333633363336333634223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313035302e302220793d223335302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313035302e302220793d223231302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313139372e303032353136303836343136362220793d223230372e3237363830353830313037393532223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d224173736f63696174696f6e5f306f716f686178222069643d2242504d4e456467655f4173736f63696174696f6e5f306f716f6861782220666c6f7761626c653a736f75726365446f636b6572583d2231352e302220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d22302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223930302e302220793d22313439352e39343939383830303639333039223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223930302e302220793d22313532302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313030302e302220793d22313532302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f30356877356875222069643d2242504d4e456467655f466c6f775f303568773568752220666c6f7761626c653a736f75726365446f636b6572583d2231352e302220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313232362e393438373938323436353130332220793d223538372e31383834333039393533313931223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313339392e393939393939393939393936362220793d223538392e33363937343738393931353936223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22436572726172536f6c696369747564222069643d2242504d4e456467655f436572726172536f6c6963697475642220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2231342e302220666c6f7761626c653a746172676574446f636b6572593d2231342e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313438392e393439393939393939393936362220793d223438382e303832313931373830383232223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313535322e303035313436363337393839362220793d223438362e3338323035313430303332363933223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f317130396f7139222069643d2242504d4e456467655f466c6f775f317130396f71392220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313135392e39352220793d223737302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313339302e302220793d223737302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313338352e343333363935363532313733382220793d223937352e34333437383236303836393536223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a202020203c2f62706d6e64693a42504d4e506c616e653e0a20203c2f62706d6e64693a42504d4e4469616772616d3e0a3c2f646566696e6974696f6e733e
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
1	activiti	org/flowable/content/db/liquibase/flowable-content-db-changelog.xml	2026-11-16 15:54:33.039557	1	EXECUTED	8:7644d7165cfe799200a2abdd3419e8b6	createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM		\N	4.9.0	\N	\N	4844473011
2	flowable	org/flowable/content/db/liquibase/flowable-content-db-changelog.xml	2026-11-16 15:54:33.056991	2	EXECUTED	8:fe7b11ac7dbbf9c43006b23bbab60bab	addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM		\N	4.9.0	\N	\N	4844473011
1	activiti	org/flowable/content/db/liquibase/flowable-content-db-changelog.xml	2026-11-16 15:54:33.039557	1	EXECUTED	8:7644d7165cfe799200a2abdd3419e8b6	createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM		\N	4.9.0	\N	\N	4844473011
2	flowable	org/flowable/content/db/liquibase/flowable-content-db-changelog.xml	2026-11-16 15:54:33.056991	2	EXECUTED	8:fe7b11ac7dbbf9c43006b23bbab60bab	addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM		\N	4.9.0	\N	\N	4844473011
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
1	flowable	META-INF/liquibase/flowable-modeler-app-db-changelog.xml	2026-11-16 15:54:36.121338	1	EXECUTED	8:e70d1d9d3899a734296b2514ccc71501	createTable tableName=ACT_DE_MODEL; createIndex indexName=idx_proc_mod_created, tableName=ACT_DE_MODEL; createTable tableName=ACT_DE_MODEL_HISTORY; createIndex indexName=idx_proc_mod_history_proc, tableName=ACT_DE_MODEL_HISTORY; createTable tableN...		\N	4.9.0	\N	\N	4844476067
3	flowable	META-INF/liquibase/flowable-modeler-app-db-changelog.xml	2026-11-16 15:54:36.131698	2	EXECUTED	8:3a9143bef2e45f2316231cc1369138b6	addColumn tableName=ACT_DE_MODEL; addColumn tableName=ACT_DE_MODEL_HISTORY		\N	4.9.0	\N	\N	4844476067
1	flowable	META-INF/liquibase/flowable-modeler-app-db-changelog.xml	2026-11-16 15:54:36.121338	1	EXECUTED	8:e70d1d9d3899a734296b2514ccc71501	createTable tableName=ACT_DE_MODEL; createIndex indexName=idx_proc_mod_created, tableName=ACT_DE_MODEL; createTable tableName=ACT_DE_MODEL_HISTORY; createIndex indexName=idx_proc_mod_history_proc, tableName=ACT_DE_MODEL_HISTORY; createTable tableN...		\N	4.9.0	\N	\N	4844476067
3	flowable	META-INF/liquibase/flowable-modeler-app-db-changelog.xml	2026-11-16 15:54:36.131698	2	EXECUTED	8:3a9143bef2e45f2316231cc1369138b6	addColumn tableName=ACT_DE_MODEL; addColumn tableName=ACT_DE_MODEL_HISTORY		\N	4.9.0	\N	\N	4844476067
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
113178bf-e2c7-11f1-87a6-06295b567284	Evaluar Vialidad Cursos	decisionVialidad	\N	\N	2026-11-17 20:40:04.002	admin	2026-11-17 20:50:00.672	admin	1	{"id":"113178bf-e2c7-11f1-87a6-06295b567284","modelVersion":"3","name":"Evaluar Vialidad Cursos","key":"decisionVialidad","description":"","forceDMN11":false,"hitIndicator":"FIRST","inputExpressions":[{"id":"3","variableId":"otrasInstancias","variableType":null,"type":"number","label":"","entries":[],"newVariable":false,"complexExpression":false}],"outputExpressions":[{"id":"4","variableId":"viable","variableType":null,"type":"boolean","label":"","entries":[],"newVariable":false,"complexExpression":false}],"rules":[{"4":"true","3_operator":"<","3_expression":5},{"4":"false","3_operator":">=","3_expression":5}]}	\\x89504e470d0a1a0a0000000d494844520000012c0000006c0806000000d0528fad0000077149444154785eeddd7d4c94871dc0f1df9d1c2020c78b125a058b035f06b6192d0e2dab3070eb1f83129da8c9429b2991cd2c51d9d260c8e632ebb2b889d3d858f707c6ac5d1756576d3bdb39e99ada46b3750644b00c65e0d081881c6f72c7cb2d9ce3e95c8f15e1e985dff1fdfc75bfe78e877b2e0fdf3cf7847bcee2743add324155cdb78e1ac33461b58a7b64442cd3e4e9601c3d5d9d812f95eec8ddb46953f0860d1b428d3b8089735b08167c8160c104046baaf6bd71a3686562d8fbab96d81b8efee9e6da79765b5b5bd7706c64a8a57353c6bcb355b58ee51f5deb4fcf4c0e3ffbde6547f6b2b8d9d54be6875c3b79e1f633ebbe1cfdfa233141b78d95f9b1991aac6f1d6b90ad19b1f2c58742e495bfdc92a79745c8e9fa2e09b15965c3e373252c7896e41fa997c49860696c1ff0ec01410156991f19288efe21b9dd37e45976b278991fef1d13e63d58272ede922716ce91f8a86063d928de127eda994b8e472f37f7a70e0ebb0357a7849f3d57d7bd3a2224a0a3306bde9b0156cbc8bb758ee4c7e242ffd1dc3110bdf4e1909be73eee4e090f09e89e176e732c8a09ea3056e4279a3b9c5197aff72524c785362d9c1bd439b6593335586fd7dd919ad67e69eb76c9779e8a95174eff53d213e6c8d6afc4ca0d874b1eb607ca377f75451eb2074a4ba75366592ce216b724c5cc96d62e97f43a87654ef02cf9f5738bfd640ff96c7fbbde2bef3638e41b29519ed76774fbffc37bb01c7787c43e3bc098c710acc9bbd8d41bffa584b01663811f3b5beb589e9d62bff4df9b3853833519a301fb5dd152639e69aede1a908af36d529c11ebe9d067066b3c040b13d1d133143a34ec9e151b61eb1e5b46b03051a3c11a3b688a99632358d341cdf90f621e4d7fb27d3a3c175f2058e3ebeded95b0b03063c6b838c29a14f7b01c2a7b3eb3b9a17e812d3068c81e15ddb5a56cf79f07faeeda2a7ef6426667fbcde8e4b4f48f9f2d79fec2d13dbb9f6caabfb43079c5ca86b8c4251d396b0baeedfffef772226362bb9f79f6db351fbcfdd62355bfaf5c59fefa3b15c6fafd10c1fa445d5d9d24252549595999343636ca8a152b243f3f5fdadbdba5b2b2520e1e3c683c16f7215893d174a5defee13b6f7ee1a3f7aa523697fef00f3517ce2f708bdb925bf8dce5033f28f97a7c52d2cdbe6ec7ecad3fda7beea51fefcae86cfb57a4d3e9b2fde4d86f5e1371cbcbbffc45aacbe90cc8ca5f77a5eeafe763df7feb8dd49fbefcdaabc62ff04304eb13070e1c90eddbb7cbce9d3ba5b5b555366edc28090909525d5d2d4141419e195e112cf806c1820908167c8360c104040bbe41b060028265a6dfbe58fed813ab739aaf37fe3da2ea6465ead2d4b4a6c733325b1a6babe75ea9b918f7d4d37975695fcdb961fcc00c42b0eed9b16387141414784eb49796967a96ad5ab54a6a6b6b252b2b4bd2d3d3e5ead5abb278f1ccf947d10740b0ccf6e11f4f2fa87cb13c67f7b1575fb14744b97ebee3bb5febbfdb1f1c1e1edeb73c3da3297b6dc135e3c13308c1bae7d0a143b279f366cf8977abd52a5bb66c9153a74ec9a2458ba4a5a545dadada3ccb4b4a4a66d0de3161040bbe41b060028205df20583001c1826f102c988060c13708164c40b0e01b040b262058f00d820513102cf806c1820908167c8360c1040f16acececec3e639826ac56ebf0c8c8887149424c5f2e972b383030f0de85cb8107141616d663e9e9e99970b0a6e345c6dc6ef780c562b9ffe2f398765c2ed750515151ddba75eba2f3f2f2e64fbb27080d06bd066bf42302f1f1f1c63cc68c600d0c0c4870b0797df1c760151616caf1e3c78d6df40704cbbbd1cf10a6a4a41833fe2fefc11afd6c535e5e9e318f996ab0b66ddb26870f1f36e6c9ba73e78e4446467a6efb63b08686862420e0d35f02a219c1f26efffefd929b9bebb902696666a6a4a5a5c9be7dfb8cfb71dfdfbbf760edd9b3c773f9d6ff35d5607d1efc3158fe8860c104de83351e8285c922583001c1826f102c98c07bb046bfc9233131d198c74ce5086b7070506c369b319bc51fdf1272d27de63873e68cac59b346bababa24222262e66cf8e4780fd678277da712ac51c5c5c572e4c811639e2c87c32176bbdd73db1f8335deebaf194758de399d4e59bf7ebd545454c88913273c5f01565e5e6edc8f099c74dfbb77afecdab5cb98c74c35589f077f0c963f22583081f7608d876061b208164ce009d66e630480698c60015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150836001508360015083600150e3df57ebec9bb440aabf0000001064654247413833364430333737373742354444380dce7d940000000049454e44ae426082	4	
07465075-e1d8-11f1-b51a-4227cbba929c	Organizar curso de capacitación	Process_Curso	Modelo conceptual, no ejecutable. Los recordatorios se cuentan por versión de propuesta. La fecha programada se obtiene de la propuesta aceptada. Para cada participante se espera una respuesta de encuesta; el enunciado no fija un vencimiento. La empresa se representa como pool de caja negra; los mensajes internos del subproceso se expresan con tareas de envío/recepción y eventos de mensaje.	\N	2026-11-16 16:08:56.733	admin	2026-11-17 21:56:18.154	admin	1	{"modelId":"07465075-e1d8-11f1-b51a-4227cbba929c","bounds":{"lowerRight":{"x":1760,"y":2090},"upperLeft":{"x":0,"y":0}},"properties":{"process_id":"Process_Curso","name":"Organizar curso de capacitación","documentation":"Modelo conceptual, no ejecutable. Los recordatorios se cuentan por versión de propuesta. La fecha programada se obtiene de la propuesta aceptada. Para cada participante se espera una respuesta de encuesta; el enunciado no fija un vencimiento. La empresa se representa como pool de caja negra; los mensajes internos del subproceso se expresan con tareas de envío/recepción y eventos de mensaje.","process_author":"","process_version":"","process_namespace":"https://unrc.edu.ar/bpmn/cursos","process_historylevel":"","isexecutable":true,"dataproperties":"null","executionlisteners":"{\\"executionListeners\\":[]}","eventlisteners":"{\\"eventListeners\\":[]}","signaldefinitions":"[]","messagedefinitions":"[{\\"id\\":\\"Msg_sol\\",\\"name\\":\\"Solicitud de curso\\"},{\\"id\\":\\"Msg_prop\\",\\"name\\":\\"Propuesta\\"},{\\"id\\":\\"Msg_acepta\\",\\"name\\":\\"Aceptación\\"},{\\"id\\":\\"Msg_rechaza\\",\\"name\\":\\"Rechazo\\"},{\\"id\\":\\"Msg_mod\\",\\"name\\":\\"Solicitud de modificaciones\\"},{\\"id\\":\\"Msg_record\\",\\"name\\":\\"Recordatorio\\"},{\\"id\\":\\"Msg_nom\\",\\"name\\":\\"Nómina de participantes\\"},{\\"id\\":\\"Msg_corr\\",\\"name\\":\\"Corrección de datos\\"},{\\"id\\":\\"Msg_pedcorr\\",\\"name\\":\\"Solicitud de corrección\\"},{\\"id\\":\\"Msg_consulta\\",\\"name\\":\\"Consulta de avance\\"},{\\"id\\":\\"Msg_resp\\",\\"name\\":\\"Respuesta de avance\\"},{\\"id\\":\\"Msg_cancel\\",\\"name\\":\\"Cancelación\\"},{\\"id\\":\\"Msg_cierre\\",\\"name\\":\\"Notificación de cierre\\"},{\\"id\\":\\"Msg_conf\\",\\"name\\":\\"Confirmación del curso\\"},{\\"id\\":\\"Msg_enc\\",\\"name\\":\\"Encuesta\\"},{\\"id\\":\\"Msg_resenc\\",\\"name\\":\\"Respuesta de encuesta\\"},{\\"id\\":\\"Msg_informe\\",\\"name\\":\\"Informe de resultados\\"}]","escalationdefinitions":"[]","process_potentialstarteruser":"","process_potentialstartergroup":"","iseagerexecutionfetch":"false","messages":[{"message_id":"Msg_sol","message_name":"Solicitud de curso","message_item_ref":null},{"message_id":"Msg_prop","message_name":"Propuesta","message_item_ref":null},{"message_id":"Msg_acepta","message_name":"Aceptación","message_item_ref":null},{"message_id":"Msg_rechaza","message_name":"Rechazo","message_item_ref":null},{"message_id":"Msg_mod","message_name":"Solicitud de modificaciones","message_item_ref":null},{"message_id":"Msg_record","message_name":"Recordatorio","message_item_ref":null},{"message_id":"Msg_nom","message_name":"Nómina de participantes","message_item_ref":null},{"message_id":"Msg_corr","message_name":"Corrección de datos","message_item_ref":null},{"message_id":"Msg_pedcorr","message_name":"Solicitud de corrección","message_item_ref":null},{"message_id":"Msg_consulta","message_name":"Consulta de avance","message_item_ref":null},{"message_id":"Msg_resp","message_name":"Respuesta de avance","message_item_ref":null},{"message_id":"Msg_cancel","message_name":"Cancelación","message_item_ref":null},{"message_id":"Msg_cierre","message_name":"Notificación de cierre","message_item_ref":null},{"message_id":"Msg_conf","message_name":"Confirmación del curso","message_item_ref":null},{"message_id":"Msg_enc","message_name":"Encuesta","message_item_ref":null},{"message_id":"Msg_resenc","message_name":"Respuesta de encuesta","message_item_ref":null},{"message_id":"Msg_informe","message_name":"Informe de resultados","message_item_ref":null}]},"childShapes":[{"resourceId":"Pool_Institucion","properties":{"overrideid":"Pool_Institucion","name":"Institución de capacitación","documentation":"","process_id":"Process_Curso","isexecutable":true},"stencil":{"id":"Pool"},"childShapes":[{"resourceId":"Lane_0sq5phl","properties":{"overrideid":"Lane_0sq5phl","name":"Docentes","documentation":"","showcaption":true},"stencil":{"id":"Lane"},"childShapes":[{"resourceId":"Dictar","properties":{"overrideid":"Dictar","name":"Desarrollar curso","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":{"assignment":{"type":"static","assignee":"${docenteSeleccionado}"}},"formkeydefinition":"","formreference":"","formfieldvalidation":true,"duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_1sdjeh6"}],"bounds":{"lowerRight":{"x":932,"y":130},"upperLeft":{"x":792,"y":50}},"dockers":[]},{"resourceId":"Fecha","properties":{"overrideid":"Fecha","name":"Fecha programada","documentation":"","executionlisteners":{"executionListeners":[]},"timercycledefinition":"","timerdatedefinition":"${fechaCurso}","timerdurationdefinition":""},"stencil":{"id":"CatchTimerEvent"},"childShapes":[],"outgoing":[{"resourceId":"FechaDictar"}],"bounds":{"lowerRight":{"x":715,"y":103},"upperLeft":{"x":684,"y":72}},"dockers":[{"x":699.5,"y":87.5}]},{"resourceId":"Informe","properties":{"overrideid":"Informe","name":"Elaborar informe de resultados","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":{"assignment":{"type":"idm","idm":{"type":"users","candidateUsers":[{"id":"teaching_leader","firstName":"teaching","lastName":"leader","email":"teachingleader@gmail.com","fullName":"teaching leader","tenantId":null,"groups":[],"privileges":[],"$$hashKey":"object:6306"}]}}},"formkeydefinition":"","formreference":"","formfieldvalidation":true,"duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"InformeEnviar"}],"bounds":{"lowerRight":{"x":1140,"y":130},"upperLeft":{"x":1000,"y":50}},"dockers":[]},{"resourceId":"Activity_1018bdz","properties":{"overrideid":"Activity_1018bdz","name":"Definir Docente que desarrolla el curso","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":{"assignment":{"type":"idm","idm":{"type":"user","assignee":{"id":"teaching_leader","firstName":"teaching","lastName":"leader","email":"teachingleader@gmail.com","fullName":"teaching leader","tenantId":null,"groups":[],"privileges":[],"$$hashKey":"object:6098"}}}},"formkeydefinition":"","formreference":"","formfieldvalidation":true,"duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_0lscijk"}],"bounds":{"lowerRight":{"x":635,"y":130},"upperLeft":{"x":535,"y":50}},"dockers":[]}],"outgoing":[],"bounds":{"lowerRight":{"x":1505,"y":1910},"upperLeft":{"x":30,"y":1740}},"dockers":[]},{"resourceId":"Lane_04yvzzz","properties":{"overrideid":"Lane_04yvzzz","name":"Administración","documentation":"","showcaption":true},"stencil":{"id":"Lane"},"childShapes":[{"resourceId":"Esperar","properties":{"overrideid":"Esperar","name":"Esperar respuesta","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"sequencefloworder":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"EventGateway"},"childShapes":[],"outgoing":[{"resourceId":"wait3"},{"resourceId":"wait0"},{"resourceId":"wait1"},{"resourceId":"wait2"}],"bounds":{"lowerRight":{"x":835,"y":285},"upperLeft":{"x":795,"y":245}},"dockers":[]},{"resourceId":"Inicio","properties":{"overrideid":"Inicio","name":"Solicitud recibida","documentation":"","executionlisteners":{"executionListeners":[]},"messageref":"Msg_sol","messageexpression":"solicitudMsg","interrupting":true},"stencil":{"id":"StartMessageEvent"},"childShapes":[],"outgoing":[{"resourceId":"Flow_0g8vm9l"}],"bounds":{"lowerRight":{"x":87.5,"y":282},"upperLeft":{"x":57,"y":252}},"dockers":[]},{"resourceId":"Recordatorio","properties":{"scriptformat":"groovy","scripttext":"// pendiente","overrideid":"Recordatorio","name":"Enviar recordatorio","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","skipexpression":null,"isforcompensation":false,"scriptautostorevariables":false},"stencil":{"id":"ScriptTask"},"childShapes":[],"outgoing":[{"resourceId":"VolverEsperar"}],"bounds":{"lowerRight":{"x":1455,"y":330},"upperLeft":{"x":1355,"y":250}},"dockers":[]},{"resourceId":"Limite","properties":{"overrideid":"Limite","name":"¿Se enviaron 2 recordatorios?","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"sequencefloworder":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"ExclusiveGateway"},"childShapes":[],"outgoing":[{"resourceId":"OtroRecord"},{"resourceId":"SinRespuesta"}],"bounds":{"lowerRight":{"x":1190,"y":305},"upperLeft":{"x":1150,"y":265}},"dockers":[]},{"resourceId":"Plazo","properties":{"overrideid":"Plazo","name":"5 días","documentation":"","executionlisteners":{"executionListeners":[]},"timercycledefinition":"","timerdatedefinition":"","timerdurationdefinition":"P5D"},"stencil":{"id":"CatchTimerEvent"},"childShapes":[],"outgoing":[{"resourceId":"PlazoLimite"}],"bounds":{"lowerRight":{"x":1043,"y":303},"upperLeft":{"x":1012,"y":272}},"dockers":[{"x":1027.5,"y":287.5}]},{"resourceId":"Aceptar","properties":{"overrideid":"Aceptar","name":"Aceptación","documentation":"","executionlisteners":{"executionListeners":[]},"messageref":"Msg_acepta","messageexpression":"aceptacionMsg"},"stencil":{"id":"CatchMessageEvent"},"childShapes":[],"outgoing":[{"resourceId":"Flow_05hw5hu"}],"bounds":{"lowerRight":{"x":1042,"y":522},"upperLeft":{"x":1012,"y":492}},"dockers":[{"x":1027,"y":507}]},{"resourceId":"Modificar","properties":{"overrideid":"Modificar","name":"Modificaciones","documentation":"","executionlisteners":{"executionListeners":[]},"messageref":"Msg_mod","messageexpression":"modificacionesMsg"},"stencil":{"id":"CatchMessageEvent"},"childShapes":[],"outgoing":[{"resourceId":"ModificarProp"}],"bounds":{"lowerRight":{"x":1042,"y":142},"upperLeft":{"x":1012,"y":112}},"dockers":[{"x":1027,"y":127}]},{"resourceId":"Activity_12e0et1","properties":{"scriptformat":"groovy","scripttext":"// pendiente","overrideid":"Activity_12e0et1","name":"Notificar Cierre","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","skipexpression":null,"isforcompensation":false,"scriptautostorevariables":false},"stencil":{"id":"ScriptTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_175t1j3"}],"bounds":{"lowerRight":{"x":485,"y":1690},"upperLeft":{"x":385,"y":1610}},"dockers":[]},{"resourceId":"Event_0w2kitf","properties":{"overrideid":"Event_0w2kitf","name":"","documentation":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"EndNoneEvent"},"childShapes":[],"outgoing":[],"bounds":{"lowerRight":{"x":585,"y":1660},"upperLeft":{"x":557,"y":1632}},"dockers":[]},{"resourceId":"Archivar","properties":{"overrideid":"Archivar","name":"Archivar solicitud","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":{"assignment":{"type":"idm","idm":{"type":"user","assignee":{"id":"admin_boss","firstName":"admin","lastName":"boss","email":"admin_boss@gmail.com","fullName":"admin boss","tenantId":null,"groups":[],"privileges":[],"$$hashKey":"object:3008"}}}},"formkeydefinition":"","formreference":"","formfieldvalidation":true,"duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"CerrarSolicitud"}],"bounds":{"lowerRight":{"x":1305,"y":450},"upperLeft":{"x":1165,"y":370}},"dockers":[]},{"resourceId":"FinSinCurso","properties":{"overrideid":"FinSinCurso","name":"Solicitud cerrada","documentation":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"EndNoneEvent"},"childShapes":[],"outgoing":[],"bounds":{"lowerRight":{"x":1395,"y":420},"upperLeft":{"x":1367,"y":392}},"dockers":[]},{"resourceId":"Rechazar","properties":{"overrideid":"Rechazar","name":"Rechazo","documentation":"","executionlisteners":{"executionListeners":[]},"messageref":"Msg_rechaza","messageexpression":"rechazoMsg"},"stencil":{"id":"CatchMessageEvent"},"childShapes":[],"outgoing":[{"resourceId":"Rechazado"}],"bounds":{"lowerRight":{"x":1042,"y":422},"upperLeft":{"x":1012,"y":392}},"dockers":[{"x":1027,"y":407}]},{"resourceId":"Preparar","properties":{"overrideid":"Preparar","name":"Preparar curso","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"dataproperties":null,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","istransaction":"false","activitytype":"SubProcess","isforcompensation":false},"stencil":{"id":"SubProcess"},"childShapes":[{"resourceId":"SubInicio","properties":{"overrideid":"SubInicio","name":"","documentation":"","executionlisteners":{"executionListeners":[]},"initiator":"","formkeydefinition":"","formreference":"","formfieldvalidation":"true","formproperties":"","interrupting":true},"stencil":{"id":"StartNoneEvent"},"childShapes":[],"outgoing":[{"resourceId":"s1"}],"bounds":{"lowerRight":{"x":55,"y":312},"upperLeft":{"x":25,"y":282}},"dockers":[]},{"resourceId":"ParInicio","properties":{"overrideid":"ParInicio","name":"Preparación en paralelo","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"sequencefloworder":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"ParallelGateway"},"childShapes":[],"outgoing":[{"resourceId":"s2"},{"resourceId":"s5"},{"resourceId":"s6"}],"bounds":{"lowerRight":{"x":145,"y":315},"upperLeft":{"x":105,"y":275}},"dockers":[]},{"resourceId":"Nomina","properties":{"overrideid":"Nomina","name":"Recibir nómina","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false},"stencil":{"id":"ReceiveTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_1j917g3"}],"bounds":{"lowerRight":{"x":340,"y":110},"upperLeft":{"x":200,"y":30}},"dockers":[]},{"resourceId":"Lista","properties":{"overrideid":"Lista","name":"Confeccionar lista definitiva","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":{"assignment":{"type":"idm","idm":{"type":"groups","candidateGroups":[{"id":"adm","name":"Administración","type":"assignment","$$hashKey":"object:1987"}]}}},"formkeydefinition":"","formreference":"","formfieldvalidation":true,"duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_1q09oq9"}],"bounds":{"lowerRight":{"x":810,"y":110},"upperLeft":{"x":670,"y":30}},"dockers":[]},{"resourceId":"Material","properties":{"overrideid":"Material","name":"Preparar materiales","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":{"assignment":{"type":"idm","idm":{"type":"groups","candidateGroups":[{"id":"adm","name":"Administración","type":"assignment","$$hashKey":"object:3999"}]}}},"formkeydefinition":"","formreference":"","formfieldvalidation":true,"duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_0pbsav2"}],"bounds":{"lowerRight":{"x":340,"y":340},"upperLeft":{"x":200,"y":260}},"dockers":[]},{"resourceId":"OrInicio","properties":{"overrideid":"OrInicio","name":"Recursos necesarios","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"sequencefloworder":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"InclusiveGateway"},"childShapes":[],"outgoing":[{"resourceId":"or0"},{"resourceId":"or1"},{"resourceId":"or2"}],"bounds":{"lowerRight":{"x":375,"y":565},"upperLeft":{"x":335,"y":525}},"dockers":[]},{"resourceId":"Virtual","properties":{"overrideid":"Virtual","name":"Solicitar Aula Virtual","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":{"assignment":{"type":"idm","idm":{"type":"groups","candidateGroups":[{"id":"adm","name":"Administración","type":"assignment","$$hashKey":"object:4854"}]}}},"formkeydefinition":"","formreference":"","formfieldvalidation":true,"duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"oj1"},{"resourceId":"Event_1gsyqer"}],"bounds":{"lowerRight":{"x":620,"y":590},"upperLeft":{"x":480,"y":510}},"dockers":[]},{"resourceId":"Equipo","properties":{"overrideid":"Equipo","name":"Contratar equipamiento","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":{"assignment":{"type":"idm","idm":{"type":"groups","candidateGroups":[{"id":"adm","name":"Administración","type":"assignment","$$hashKey":"object:5166"}]}}},"formkeydefinition":"","formreference":"","formfieldvalidation":true,"duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"oj2"},{"resourceId":"Event_1ypcc1j"}],"bounds":{"lowerRight":{"x":620,"y":780},"upperLeft":{"x":480,"y":700}},"dockers":[]},{"resourceId":"OrFin","properties":{"overrideid":"OrFin","name":"Todos los recursos seleccionados listos","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"sequencefloworder":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"InclusiveGateway"},"childShapes":[],"outgoing":[{"resourceId":"s11"}],"bounds":{"lowerRight":{"x":848,"y":565},"upperLeft":{"x":808,"y":525}},"dockers":[]},{"resourceId":"ParFin","properties":{"overrideid":"ParFin","name":"Preparación completa","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"sequencefloworder":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"ParallelGateway"},"childShapes":[],"outgoing":[{"resourceId":"s12"}],"bounds":{"lowerRight":{"x":1055,"y":315},"upperLeft":{"x":1015,"y":275}},"dockers":[]},{"resourceId":"SubFin","properties":{"overrideid":"SubFin","name":"","documentation":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"EndNoneEvent"},"childShapes":[],"outgoing":[],"bounds":{"lowerRight":{"x":1170,"y":310},"upperLeft":{"x":1142,"y":282}},"dockers":[]},{"resourceId":"Activity_12i2hpf","properties":{"overrideid":"Activity_12i2hpf","name":"Evaluar\\nRecursos","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":{"assignment":{"type":"idm","idm":{"type":"groups","candidateGroups":[{"id":"adm","name":"Administración","type":"assignment","$$hashKey":"object:3684"}]}}},"formkeydefinition":"","formreference":"","formfieldvalidation":true,"duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_0r6hcyb"}],"bounds":{"lowerRight":{"x":300,"y":590},"upperLeft":{"x":200,"y":510}},"dockers":[]},{"resourceId":"Activity_048d5em","properties":{"overrideid":"Activity_048d5em","name":"Cancelación","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"activitytype":"Event-Sub-Process","subprocesstype":"Embedded","isforcompensation":false},"stencil":{"id":"EventSubProcess"},"childShapes":[{"resourceId":"Event_1rvo4k6","properties":{"overrideid":"Event_1rvo4k6","name":"","documentation":"","compensationactivityref":"","executionlisteners":{"executionListeners":[]},"asynchronousdefinition":"false"},"stencil":{"id":"ThrowCompensationEvent"},"childShapes":[],"outgoing":[{"resourceId":"Flow_0h5si5f"}],"bounds":{"lowerRight":{"x":152,"y":62},"upperLeft":{"x":122,"y":32}},"dockers":[{"x":137,"y":47}]},{"resourceId":"Event_1g4xmqo","properties":{"overrideid":"Event_1g4xmqo","name":"Recibir Cancelación","documentation":"","executionlisteners":{"executionListeners":[]},"messageref":"","messageexpression":"cancelacionMsg","interrupting":true},"stencil":{"id":"StartMessageEvent"},"childShapes":[],"outgoing":[{"resourceId":"Flow_099pqle"}],"bounds":{"lowerRight":{"x":62.5,"y":62},"upperLeft":{"x":32,"y":32}},"dockers":[]},{"resourceId":"Event_0snigbc","properties":{"overrideid":"Event_0snigbc","name":"","documentation":"","executionlisteners":{"executionListeners":[]},"errorref":"","errorvariabletransient":false,"errorvariablelocalscope":false},"stencil":{"id":"EndErrorEvent"},"childShapes":[],"outgoing":[],"bounds":{"lowerRight":{"x":240,"y":60},"upperLeft":{"x":212,"y":32}},"dockers":[{"x":226,"y":46}]}],"outgoing":[],"bounds":{"lowerRight":{"x":1230,"y":830},"upperLeft":{"x":930,"y":710}},"dockers":[]},{"resourceId":"Event_1gsyqer","properties":{"overrideid":"Event_1gsyqer","name":"","documentation":"","cancelactivity":true,"executionlisteners":{"executionListeners":[]}},"stencil":{"id":"BoundaryCompensationEvent"},"childShapes":[],"outgoing":[{"resourceId":"Association_0f6fnvw"}],"bounds":{"lowerRight":{"x":565,"y":606},"upperLeft":{"x":535,"y":576}},"dockers":[{"x":70,"y":80}]},{"resourceId":"Event_1ypcc1j","properties":{"overrideid":"Event_1ypcc1j","name":"","documentation":"","cancelactivity":true,"executionlisteners":{"executionListeners":[]}},"stencil":{"id":"BoundaryCompensationEvent"},"childShapes":[],"outgoing":[{"resourceId":"Association_0oqohax"}],"bounds":{"lowerRight":{"x":565,"y":796},"upperLeft":{"x":535,"y":766}},"dockers":[{"x":70,"y":80}]},{"resourceId":"Activity_1m08pcl","properties":{"overrideid":"Activity_1m08pcl","name":"Liberar Equipamiento","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":true,"usertaskassignment":{"assignment":{"type":"idm","idm":{"type":"groups","candidateGroups":[{"id":"adm","name":"Administración","type":"assignment","$$hashKey":"object:5365"}]}}},"formkeydefinition":"","formreference":"","formfieldvalidation":true,"duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[],"bounds":{"lowerRight":{"x":750,"y":860},"upperLeft":{"x":650,"y":780}},"dockers":[]},{"resourceId":"Aula","properties":{"overrideid":"Aula","name":"Reservar aula","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"servicetasktriggerable":"false","executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"servicetaskclass":"","servicetaskexpression":"${true}","servicetaskdelegateexpression":"","servicetaskfields":{"fields":[]},"servicetaskexceptions":{"exceptions":[]},"servicetaskresultvariable":"","servicetaskuselocalscopeforresultvariable":"false","skipexpression":"","servicetaskfailedjobretrytimecycle":"","servicetaskstoreresultvariabletransient":"false"},"stencil":{"id":"ServiceTask"},"childShapes":[],"outgoing":[{"resourceId":"oj0"},{"resourceId":"sid-FFB10310-1EC7-47CC-8F71-627D8DC0DE8F"}],"bounds":{"lowerRight":{"x":580,"y":430},"upperLeft":{"x":480,"y":350}},"dockers":[]},{"resourceId":"Activity_16zz91p","properties":{"overrideid":"Activity_16zz91p","name":"Liberar Aula","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"servicetasktriggerable":"false","executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":true,"servicetaskclass":"","servicetaskexpression":"${true}","servicetaskdelegateexpression":"","servicetaskfields":{"fields":[]},"servicetaskexceptions":{"exceptions":[]},"servicetaskresultvariable":"","servicetaskuselocalscopeforresultvariable":"false","skipexpression":"","servicetaskfailedjobretrytimecycle":"","servicetaskstoreresultvariabletransient":"false"},"stencil":{"id":"ServiceTask"},"childShapes":[],"outgoing":[],"bounds":{"lowerRight":{"x":760,"y":520},"upperLeft":{"x":660,"y":440}},"dockers":[]},{"resourceId":"Activity_02hrooc","properties":{"scriptformat":"groovy","scripttext":"// pendiente","overrideid":"Activity_02hrooc","name":"Liberar Aula Virtual","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","skipexpression":null,"isforcompensation":true,"scriptautostorevariables":false},"stencil":{"id":"ScriptTask"},"childShapes":[],"outgoing":[],"bounds":{"lowerRight":{"x":750,"y":670},"upperLeft":{"x":650,"y":590}},"dockers":[]},{"resourceId":"sid-FFB10310-1EC7-47CC-8F71-627D8DC0DE8F","properties":{"overrideid":"sid-FFB10310-1EC7-47CC-8F71-627D8DC0DE8F","name":"","documentation":"","cancelactivity":true,"executionlisteners":{"executionListeners":[]}},"stencil":{"id":"BoundaryCompensationEvent"},"childShapes":[],"outgoing":[{"resourceId":"Association_1fh67xn"}],"bounds":{"lowerRight":{"x":567.9917555757579,"y":445.43604456881826},"upperLeft":{"x":537.9917555757579,"y":415.43604456881826}},"dockers":[{"x":71.83123779296875,"y":78.39501953125}]}],"outgoing":[{"resourceId":"Preparado"},{"resourceId":"Event_0farfur"}],"bounds":{"lowerRight":{"x":1425,"y":1510},"upperLeft":{"x":165,"y":620}},"dockers":[]},{"resourceId":"Event_0farfur","properties":{"overrideid":"Event_0farfur","name":"","documentation":"","errorref":"","errorvariablename":"","errorvariabletransient":false,"errorvariablelocalscope":false,"cancelactivity":false,"executionlisteners":{"executionListeners":[]}},"stencil":{"id":"BoundaryErrorEvent"},"childShapes":[],"outgoing":[{"resourceId":"Flow_1ymw5qe"}],"bounds":{"lowerRight":{"x":369.2968993935324,"y":1525.7110903860867},"upperLeft":{"x":339.2968993935324,"y":1495.7110903860867}},"dockers":[{"x":190,"y":890}]},{"resourceId":"Propuesta","properties":{"overrideid":"Propuesta","name":"Registrar y Elaborar propuesta","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":{"assignment":{"type":"idm","idm":{"type":"user","assignee":{"id":"admin_boss","firstName":"admin","lastName":"boss","email":"admin_boss@gmail.com","fullName":"admin boss","tenantId":null,"groups":[],"privileges":[],"$$hashKey":"object:2352"}}}},"formkeydefinition":"","formreference":"","formfieldvalidation":true,"duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"main2"}],"bounds":{"lowerRight":{"x":600,"y":450},"upperLeft":{"x":460,"y":370}},"dockers":[]},{"resourceId":"Gateway_10gftrn","properties":{"overrideid":"Gateway_10gftrn","name":"Es viable?","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"sequencefloworder":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"ExclusiveGateway"},"childShapes":[],"outgoing":[{"resourceId":"Flow_0k38d9g"},{"resourceId":"Flow_0w8xn3l"}],"bounds":{"lowerRight":{"x":250,"y":425},"upperLeft":{"x":210,"y":385}},"dockers":[]},{"resourceId":"Event_18edb9q","properties":{"overrideid":"Event_18edb9q","name":"","documentation":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"EndNoneEvent"},"childShapes":[],"outgoing":[],"bounds":{"lowerRight":{"x":365,"y":530},"upperLeft":{"x":337,"y":502}},"dockers":[]},{"resourceId":"Activity_0iibzwu","properties":{"scriptformat":"groovy","scripttext":"// pendiente","overrideid":"Activity_0iibzwu","name":"Notificar Desición","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","skipexpression":null,"isforcompensation":false,"scriptautostorevariables":false},"stencil":{"id":"ScriptTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_00ve97r"}],"bounds":{"lowerRight":{"x":285,"y":560},"upperLeft":{"x":185,"y":480}},"dockers":[]},{"resourceId":"Confirmar","properties":{"scriptformat":"groovy","scripttext":"// pendiente","overrideid":"Confirmar","name":"Enviar confirmación","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","skipexpression":null,"isforcompensation":false,"scriptautostorevariables":false},"stencil":{"id":"ScriptTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_1topamj"}],"bounds":{"lowerRight":{"x":742,"y":1690},"upperLeft":{"x":642,"y":1610}},"dockers":[]},{"resourceId":"Fin","properties":{"overrideid":"Fin","name":"Liberar recursos.\\n Curso finalizado","documentation":"","executionlisteners":{"executionListeners":[]}},"stencil":{"id":"EndNoneEvent"},"childShapes":[],"outgoing":[],"bounds":{"lowerRight":{"x":1420,"y":1660},"upperLeft":{"x":1392,"y":1632}},"dockers":[]},{"resourceId":"Revisar","properties":{"overrideid":"Revisar","name":"Revisar propuesta","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":{"assignment":{"type":"idm","idm":{"type":"user","assignee":{"id":"admin_boss","firstName":"admin","lastName":"boss","email":"admin_boss@gmail.com","fullName":"admin boss","tenantId":null,"groups":[],"privileges":[],"$$hashKey":"object:2674"}}}},"formkeydefinition":"","formreference":"","formfieldvalidation":true,"duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_0upbxn5"}],"bounds":{"lowerRight":{"x":1305,"y":110},"upperLeft":{"x":1165,"y":30}},"dockers":[]},{"resourceId":"EnviarInforme","properties":{"overrideid":"EnviarInforme","name":"Enviar informe a empresa y Archivar expediente.","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"usertaskassignment":{"assignment":{"type":"idm","idm":{"type":"user","assignee":{"id":"admin_boss","firstName":"admin","lastName":"boss","email":"admin_boss@gmail.com","fullName":"admin boss","tenantId":null,"groups":[],"privileges":[],"$$hashKey":"object:3325"}}}},"formkeydefinition":"","formreference":"","formfieldvalidation":true,"duedatedefinition":"","prioritydefinition":"","formproperties":"","tasklisteners":{"taskListeners":[]},"skipexpression":"","categorydefinition":"","taskidvariablename":""},"stencil":{"id":"UserTask"},"childShapes":[],"outgoing":[{"resourceId":"InformeArchivar"}],"bounds":{"lowerRight":{"x":1310,"y":1690},"upperLeft":{"x":1210,"y":1610}},"dockers":[]},{"resourceId":"Activity_1eg7zcl","properties":{"scriptformat":"groovy","scripttext":"// pendiente","overrideid":"Activity_1eg7zcl","name":"Habilitar acceso de la empresa","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","skipexpression":null,"isforcompensation":false,"scriptautostorevariables":false},"stencil":{"id":"ScriptTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_1ffpwga"}],"bounds":{"lowerRight":{"x":1315,"y":550},"upperLeft":{"x":1215,"y":470}},"dockers":[]},{"resourceId":"Enviar","properties":{"scriptformat":"groovy","scripttext":"// pendiente","overrideid":"Enviar","name":"Enviar propuesta","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","skipexpression":null,"isforcompensation":false,"scriptautostorevariables":false},"stencil":{"id":"ScriptTask"},"childShapes":[],"outgoing":[{"resourceId":"main3"}],"bounds":{"lowerRight":{"x":580,"y":310},"upperLeft":{"x":480,"y":230}},"dockers":[]},{"resourceId":"sid-21C1F633-A6E5-4BB7-9F18-61A5D655EEDF","properties":{"overrideid":"Activity_1xw400l","name":"Evaluar Viabilidad","documentation":"","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]},"multiinstance_type":"None","multiinstance_variableaggregations":"","multiinstance_cardinality":"","multiinstance_collection":"","multiinstance_variable":"","multiinstance_condition":"","isforcompensation":false,"decisiontaskdecisiontablereference":{"id":"113178bf-e2c7-11f1-87a6-06295b567284","name":"Evaluar Vialidad Cursos","key":"decisionVialidad"},"decisiontaskdecisionservicereference":"","decisiontaskthrowerroronnohits":"false","decisiontaskfallbacktodefaulttenant":"false","type":"http://b3mn.org/stencilset/bpmn2.0#BusinessRule","ruletask_class":null,"ruletask_rules":null,"ruletask_variables_input":null,"ruletask_exclude":"false","ruletask_result":null},"stencil":{"id":"DecisionTask"},"childShapes":[],"outgoing":[{"resourceId":"Flow_0kbnm1d"}],"bounds":{"lowerRight":{"x":125,"y":450},"upperLeft":{"x":25,"y":370}},"dockers":[]}],"outgoing":[],"bounds":{"lowerRight":{"x":1505,"y":1740},"upperLeft":{"x":30,"y":0}},"dockers":[]}],"outgoing":[],"bounds":{"lowerRight":{"x":1660,"y":1990},"upperLeft":{"x":155,"y":80}},"dockers":[]},{"resourceId":"FechaDictar","properties":{"overrideid":"FechaDictar","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Dictar"}],"bounds":{"lowerRight":{"x":976.1758995721917,"y":1908.9103984549567},"upperLeft":{"x":900.7342566778083,"y":1907.7497577950433}},"dockers":[{"x":15.5,"y":15.5},{"x":70,"y":40}],"target":{"resourceId":"Dictar"}},{"resourceId":"Flow_1sdjeh6","properties":{"overrideid":"Flow_1sdjeh6","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Informe"}],"bounds":{"lowerRight":{"x":1184.125,"y":1910},"upperLeft":{"x":1117.875,"y":1910}},"dockers":[{"x":70,"y":40},{"x":70,"y":40}],"target":{"resourceId":"Informe"}},{"resourceId":"InformeEnviar","properties":{"overrideid":"InformeEnviar","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"EnviarInforme"}],"bounds":{"lowerRight":{"x":1445,"y":1910},"upperLeft":{"x":1325.765625,"y":1770.375}},"dockers":[{"x":70,"y":40},{"x":1445,"y":1910},{"x":50,"y":40}],"target":{"resourceId":"EnviarInforme"}},{"resourceId":"Flow_0lscijk","properties":{"overrideid":"Flow_0lscijk","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Fecha"}],"bounds":{"lowerRight":{"x":869.1877382779212,"y":1908.9039523914394},"upperLeft":{"x":820.1989804720788,"y":1907.8343288585606}},"dockers":[{"x":50,"y":40},{"x":15.5,"y":15.5}],"target":{"resourceId":"Fecha"}},{"resourceId":"main3","properties":{"overrideid":"main3","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Esperar"}],"bounds":{"lowerRight":{"x":980.07437260799,"y":349.11331821461386},"upperLeft":{"x":765.54086176701,"y":345.34957241038614}},"dockers":[{"x":50,"y":40},{"x":20,"y":20}],"target":{"resourceId":"Esperar"}},{"resourceId":"VolverEsperar","properties":{"overrideid":"VolverEsperar","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Esperar"}],"bounds":{"lowerRight":{"x":1610,"y":329.65485749985464},"upperLeft":{"x":1001.7311607460425,"y":290}},"dockers":[{"x":50,"y":40},{"x":1610,"y":290},{"x":1005,"y":290},{"x":20,"y":20}],"target":{"resourceId":"Esperar"}},{"resourceId":"wait3","properties":{"overrideid":"wait3","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Plazo"}],"bounds":{"lowerRight":{"x":1197.9649697025163,"y":370},"upperLeft":{"x":1019.0427682064677,"y":346.7311607460425}},"dockers":[{"x":20,"y":20},{"x":1055,"y":350},{"x":1055,"y":370},{"x":15.5,"y":15.5}],"target":{"resourceId":"Plazo"}},{"resourceId":"wait0","properties":{"overrideid":"wait0","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Aceptar"}],"bounds":{"lowerRight":{"x":1196.445417503413,"y":590},"upperLeft":{"x":1000.4110289146626,"y":365.14041681846345}},"dockers":[{"x":20,"y":20},{"x":1005,"y":590},{"x":15,"y":15}],"target":{"resourceId":"Aceptar"}},{"resourceId":"wait1","properties":{"overrideid":"wait1","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Rechazar"}],"bounds":{"lowerRight":{"x":1196.445417503413,"y":490},"upperLeft":{"x":1000.6985247758398,"y":365.2572184993536}},"dockers":[{"x":20,"y":20},{"x":1005,"y":490},{"x":15,"y":15}],"target":{"resourceId":"Rechazar"}},{"resourceId":"wait2","properties":{"overrideid":"wait2","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Modificar"}],"bounds":{"lowerRight":{"x":1196.4454839236748,"y":350},"upperLeft":{"x":1018.96378719021,"y":207.28804659400603}},"dockers":[{"x":20,"y":20},{"x":1050,"y":350},{"x":1050,"y":210},{"x":15,"y":15}],"target":{"resourceId":"Modificar"}},{"resourceId":"CerrarSolicitud","properties":{"overrideid":"CerrarSolicitud","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"FinSinCurso"}],"bounds":{"lowerRight":{"x":1551.3128750937867,"y":488.0663630162681},"upperLeft":{"x":1490.5777499062133,"y":486.4023869837319}},"dockers":[{"x":70,"y":40},{"x":14,"y":14}],"target":{"resourceId":"FinSinCurso"}},{"resourceId":"main2","properties":{"overrideid":"main2","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Enviar"}],"bounds":{"lowerRight":{"x":715,"y":449.625},"upperLeft":{"x":715,"y":390.375}},"dockers":[{"x":70,"y":40},{"x":50,"y":40}],"target":{"resourceId":"Enviar"}},{"resourceId":"Flow_0upbxn5","properties":{"overrideid":"Flow_0upbxn5","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Enviar"}],"bounds":{"lowerRight":{"x":1349.4638671875,"y":309.9375},"upperLeft":{"x":715,"y":150}},"dockers":[{"x":70,"y":40},{"x":715,"y":150},{"x":50,"y":40}],"target":{"resourceId":"Enviar"}},{"resourceId":"OtroRecord","properties":{"overrideid":"OtroRecord","name":"No","documentation":"","conditionsequenceflow":"${recordatorios < 2}","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Recordatorio"}],"bounds":{"lowerRight":{"x":1539.429913769943,"y":368.92404071850945},"upperLeft":{"x":1375.277117480057,"y":365.43142803149055}},"dockers":[{"x":20,"y":20},{"x":50,"y":40}],"target":{"resourceId":"Recordatorio"}},{"resourceId":"PlazoLimite","properties":{"overrideid":"PlazoLimite","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Limite"}],"bounds":{"lowerRight":{"x":1335.07437260799,"y":367.21878696461386},"upperLeft":{"x":1228.52914301701,"y":365.34957241038614}},"dockers":[{"x":15.5,"y":15.5},{"x":20,"y":20}],"target":{"resourceId":"Limite"}},{"resourceId":"SinRespuesta","properties":{"overrideid":"SinRespuesta","name":"Sí","documentation":"","conditionsequenceflow":"${recordatorios >= 2}","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Archivar"}],"bounds":{"lowerRight":{"x":1420,"y":449.21875},"upperLeft":{"x":1356.648388342153,"y":384.12130476897494}},"dockers":[{"x":20,"y":20},{"x":1360,"y":423},{"x":1420,"y":423},{"x":70,"y":40}],"target":{"resourceId":"Archivar"}},{"resourceId":"Rechazado","properties":{"overrideid":"Rechazado","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Archivar"}],"bounds":{"lowerRight":{"x":1349.1251039963488,"y":488.97776592302426},"upperLeft":{"x":1227.6248960036512,"y":487.22535907697574}},"dockers":[{"x":15,"y":15},{"x":70,"y":40}],"target":{"resourceId":"Archivar"}},{"resourceId":"ModificarProp","properties":{"overrideid":"ModificarProp","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Revisar"}],"bounds":{"lowerRight":{"x":1420,"y":210},"upperLeft":{"x":1227.6248960036512,"y":190.375}},"dockers":[{"x":15,"y":15},{"x":1420,"y":210},{"x":70,"y":40}],"target":{"resourceId":"Revisar"}},{"resourceId":"Flow_175t1j3","properties":{"overrideid":"Flow_175t1j3","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Event_0w2kitf"}],"bounds":{"lowerRight":{"x":741.1879322455356,"y":1728.5018509483982},"upperLeft":{"x":670.9370677544644,"y":1726.4356490516018}},"dockers":[{"x":50,"y":40},{"x":14,"y":14}],"target":{"resourceId":"Event_0w2kitf"}},{"resourceId":"Flow_1ymw5qe","properties":{"overrideid":"Flow_1ymw5qe","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Activity_12e0et1"}],"bounds":{"lowerRight":{"x":569.625,"y":1730},"upperLeft":{"x":539.3733557705586,"y":1605.8576075289213}},"dockers":[{"x":15,"y":15},{"x":540,"y":1730},{"x":50,"y":40}],"target":{"resourceId":"Activity_12e0et1"}},{"resourceId":"Preparado","properties":{"overrideid":"Preparado","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Confirmar"}],"bounds":{"lowerRight":{"x":901.5707394601488,"y":1689.0249143489038},"upperLeft":{"x":884.2144167898512,"y":1590.4477419010962}},"dockers":[{"x":630,"y":445},{"x":50,"y":40}],"target":{"resourceId":"Confirmar"}},{"resourceId":"s1","properties":{"overrideid":"s1","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"ParInicio"}],"bounds":{"lowerRight":{"x":454.07840170172085,"y":996.632727098864},"upperLeft":{"x":405.60909829827915,"y":995.492272901136}},"dockers":[{"x":15,"y":15},{"x":20,"y":20}],"target":{"resourceId":"ParInicio"}},{"resourceId":"s2","properties":{"overrideid":"s2","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Nomina"}],"bounds":{"lowerRight":{"x":549.546875,"y":974.6643093221684},"upperLeft":{"x":475.45190423728513,"y":770}},"dockers":[{"x":20,"y":20},{"x":480,"y":770},{"x":70,"y":40}],"target":{"resourceId":"Nomina"}},{"resourceId":"s5","properties":{"overrideid":"s5","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Material"}],"bounds":{"lowerRight":{"x":549.8990315006464,"y":997.5827252241602},"upperLeft":{"x":495.2572184993536,"y":995.6985247758398}},"dockers":[{"x":20,"y":20},{"x":70,"y":40}],"target":{"resourceId":"Material"}},{"resourceId":"s6","properties":{"overrideid":"s6","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Activity_12i2hpf"}],"bounds":{"lowerRight":{"x":549.3159542417551,"y":1245.7763295201462},"upperLeft":{"x":475.4110289146625,"y":1015.1404168184634}},"dockers":[{"x":20,"y":20},{"x":480,"y":1240},{"x":50,"y":40}],"target":{"resourceId":"Activity_12i2hpf"}},{"resourceId":"or0","properties":{"overrideid":"or0","name":"Presencial","documentation":"","conditionsequenceflow":"${requiereAula}","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Aula"}],"bounds":{"lowerRight":{"x":829.859375,"y":1224.6255198856602},"upperLeft":{"x":705.657241294011,"y":1090}},"dockers":[{"x":20,"y":20},{"x":710,"y":1090},{"x":50,"y":40}],"target":{"resourceId":"Aula"}},{"resourceId":"oj0","properties":{"overrideid":"oj0","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"OrFin"}],"bounds":{"lowerRight":{"x":1183,"y":1224.6255198856602},"upperLeft":{"x":930.7109375,"y":1090}},"dockers":[{"x":50,"y":40},{"x":1183,"y":1090},{"x":20,"y":20}],"target":{"resourceId":"OrFin"}},{"resourceId":"or1","properties":{"overrideid":"or1","name":"Virtual","documentation":"","conditionsequenceflow":"${requierePlataforma}","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Virtual"}],"bounds":{"lowerRight":{"x":829.6839223190905,"y":1248.1970236492075},"upperLeft":{"x":725.8043589309095,"y":1245.5334451007925}},"dockers":[{"x":20,"y":20},{"x":70,"y":40}],"target":{"resourceId":"Virtual"}},{"resourceId":"oj1","properties":{"overrideid":"oj1","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"OrFin"}],"bounds":{"lowerRight":{"x":1157.453286701881,"y":1248.7320172967964},"upperLeft":{"x":970.499838298119,"y":1245.3695452032036}},"dockers":[{"x":70,"y":40},{"x":20,"y":20}],"target":{"resourceId":"OrFin"}},{"resourceId":"or2","properties":{"overrideid":"or2","name":"Equipamiento especial","documentation":"","conditionsequenceflow":"${requiereEquipamiento}","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Equipo"}],"bounds":{"lowerRight":{"x":829.234375,"y":1440},"upperLeft":{"x":705.5334451007925,"y":1265.8043589309095}},"dockers":[{"x":20,"y":20},{"x":710,"y":1440},{"x":70,"y":40}],"target":{"resourceId":"Equipo"}},{"resourceId":"oj2","properties":{"overrideid":"oj2","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"OrFin"}],"bounds":{"lowerRight":{"x":1183,"y":1440},"upperLeft":{"x":970.64453125,"y":1265.8043589309095}},"dockers":[{"x":70,"y":40},{"x":1183,"y":1440},{"x":20,"y":20}],"target":{"resourceId":"OrFin"}},{"resourceId":"s11","properties":{"overrideid":"s11","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"ParFin"}],"bounds":{"lowerRight":{"x":1390,"y":1250},"upperLeft":{"x":1198.874721992088,"y":1014.9255890716568}},"dockers":[{"x":20,"y":20},{"x":1390,"y":1250},{"x":20,"y":20}],"target":{"resourceId":"ParFin"}},{"resourceId":"s12","properties":{"overrideid":"s12","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"SubFin"}],"bounds":{"lowerRight":{"x":1491.7656591489235,"y":995.8823608194126},"upperLeft":{"x":1404.9062158510765,"y":995.1645141805874}},"dockers":[{"x":20,"y":20},{"x":14,"y":14}],"target":{"resourceId":"SubFin"}},{"resourceId":"Flow_0r6hcyb","properties":{"overrideid":"Flow_0r6hcyb","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"OrInicio"}],"bounds":{"lowerRight":{"x":685.1339443622755,"y":1247.6086848505845},"upperLeft":{"x":650.2176181377245,"y":1245.9460026494155}},"dockers":[{"x":50,"y":40},{"x":20,"y":20}],"target":{"resourceId":"OrInicio"}},{"resourceId":"Flow_099pqle","properties":{"overrideid":"Flow_099pqle","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Event_1rvo4k6"}],"bounds":{"lowerRight":{"x":1401.9765625,"y":1457},"upperLeft":{"x":1342.974609375,"y":1457}},"dockers":[{"x":15.25,"y":15},{"x":15,"y":15}],"target":{"resourceId":"Event_1rvo4k6"}},{"resourceId":"Flow_0h5si5f","properties":{"overrideid":"Flow_0h5si5f","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Event_0snigbc"}],"bounds":{"lowerRight":{"x":1491.0938131173668,"y":1456.8247022541277},"upperLeft":{"x":1432.6014993826332,"y":1456.1674852458723}},"dockers":[{"x":15,"y":15},{"x":14,"y":14}],"target":{"resourceId":"Event_0snigbc"}},{"resourceId":"Flow_0pbsav2","properties":{"overrideid":"Flow_0pbsav2","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"ParFin"}],"bounds":{"lowerRight":{"x":1364.576193233622,"y":999.5393626293865},"upperLeft":{"x":690.4775177038781,"y":995.1334889331135}},"dockers":[{"x":70,"y":40},{"x":20,"y":20}],"target":{"resourceId":"ParFin"}},{"resourceId":"Flow_1q09oq9","properties":{"overrideid":"Flow_1q09oq9","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"ParFin"}],"bounds":{"lowerRight":{"x":1390,"y":974.6643093221684},"upperLeft":{"x":1160.140625,"y":770}},"dockers":[{"x":70,"y":40},{"x":1390,"y":770},{"x":20,"y":20}],"target":{"resourceId":"ParFin"}},{"resourceId":"Flow_1j917g3","properties":{"overrideid":"Flow_1j917g3","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Lista"}],"bounds":{"lowerRight":{"x":1019.234375,"y":770},"upperLeft":{"x":690.765625,"y":770}},"dockers":[{"x":70,"y":40},{"x":70,"y":40}],"target":{"resourceId":"Lista"}},{"resourceId":"Association_0oqohax","properties":{"overrideid":"Association_0oqohax","name":"","documentation":""},"stencil":{"id":"Association"},"childShapes":[],"outgoing":[{"resourceId":"Activity_1m08pcl"}],"bounds":{"lowerRight":{"x":1000,"y":1520},"upperLeft":{"x":900,"y":1496.625}},"dockers":[{"x":15,"y":15},{"x":900,"y":1520},{"x":0,"y":40}],"target":{"resourceId":"Activity_1m08pcl"}},{"resourceId":"Association_0f6fnvw","properties":{"overrideid":"Association_0f6fnvw","name":"","documentation":""},"stencil":{"id":"Association"},"childShapes":[],"outgoing":[{"resourceId":"Activity_02hrooc"}],"bounds":{"lowerRight":{"x":1000,"y":1330},"upperLeft":{"x":900,"y":1306.625}},"dockers":[{"x":15,"y":15},{"x":900,"y":1330},{"x":0,"y":40}],"target":{"resourceId":"Activity_02hrooc"}},{"resourceId":"InformeArchivar","properties":{"overrideid":"InformeArchivar","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Fin"}],"bounds":{"lowerRight":{"x":1576.3128750937867,"y":1728.628863016268},"upperLeft":{"x":1495.0464999062133,"y":1726.402386983732}},"dockers":[{"x":50,"y":40},{"x":14,"y":14}],"target":{"resourceId":"Fin"}},{"resourceId":"Flow_0g8vm9l","properties":{"overrideid":"Flow_0g8vm9l","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"sid-21C1F633-A6E5-4BB7-9F18-61A5D655EEDF"}],"bounds":{"lowerRight":{"x":259.22881966076864,"y":449.89862235997015},"upperLeft":{"x":257.54852408923136,"y":362.52325264002985}},"dockers":[{"x":15.25,"y":15},{"x":50,"y":40}],"target":{"resourceId":"sid-21C1F633-A6E5-4BB7-9F18-61A5D655EEDF"}},{"resourceId":"Flow_0kbnm1d","properties":{"overrideid":"Flow_0kbnm1d","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Gateway_10gftrn"}],"bounds":{"lowerRight":{"x":394.6255198856603,"y":488.36619620598907},"upperLeft":{"x":310.6479176143397,"y":485.65724129401093}},"dockers":[{"x":50,"y":40},{"x":20,"y":20}],"target":{"resourceId":"Gateway_10gftrn"}},{"resourceId":"Flow_00ve97r","properties":{"overrideid":"Flow_00ve97r","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Event_18edb9q"}],"bounds":{"lowerRight":{"x":521.4068440006464,"y":598.2467877241602},"upperLeft":{"x":470.8431559993536,"y":596.5032122758398}},"dockers":[{"x":50,"y":40},{"x":14,"y":14}],"target":{"resourceId":"Event_18edb9q"}},{"resourceId":"Flow_1topamj","properties":{"overrideid":"Flow_1topamj","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Activity_1018bdz"}],"bounds":{"lowerRight":{"x":877,"y":1869.6640625},"upperLeft":{"x":770,"y":1770.84375}},"dockers":[{"x":50,"y":40},{"x":877,"y":1815},{"x":770,"y":1815},{"x":50,"y":40}],"target":{"resourceId":"Activity_1018bdz"}},{"resourceId":"Flow_05hw5hu","properties":{"overrideid":"Flow_05hw5hu","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Activity_1eg7zcl"}],"bounds":{"lowerRight":{"x":1399.7266419340765,"y":589.366302209253},"upperLeft":{"x":1227.8749205659235,"y":587.200104040747}},"dockers":[{"x":15,"y":15},{"x":50,"y":40}],"target":{"resourceId":"Activity_1eg7zcl"}},{"resourceId":"Flow_1ffpwga","properties":{"overrideid":"Flow_1ffpwga","name":"","documentation":"","conditionsequenceflow":"","executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Preparar"}],"bounds":{"lowerRight":{"x":1415.8478902463376,"y":699.8032808028561},"upperLeft":{"x":1357.0134378786624,"y":630.3285551346439}},"dockers":[{"x":50,"y":40},{"x":630,"y":445}],"target":{"resourceId":"Preparar"}},{"resourceId":"Association_1fh67xn","properties":{"overrideid":"Association_1fh67xn","name":"","documentation":""},"stencil":{"id":"Association"},"childShapes":[],"outgoing":[{"resourceId":"Activity_16zz91p"}],"bounds":{"lowerRight":{"x":1010,"y":1180},"upperLeft":{"x":900,"y":1146.148527044165}},"dockers":[{"x":15,"y":15},{"x":900,"y":1180},{"x":0,"y":40}],"target":{"resourceId":"Activity_16zz91p"}},{"resourceId":"Flow_0w8xn3l","properties":{"overrideid":"Flow_0w8xn3l","name":"no","documentation":"","conditionsequenceflow":{"expression":{"type":"static","staticValue":"${viable == false}"}},"executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Activity_0iibzwu"}],"bounds":{"lowerRight":{"x":418.2378127757237,"y":559.4696938416449},"upperLeft":{"x":415.8637497242763,"y":504.8662436583551}},"dockers":[{"x":20,"y":20},{"x":50,"y":40}],"target":{"resourceId":"Activity_0iibzwu"}},{"resourceId":"Flow_0k38d9g","properties":{"overrideid":"Flow_0k38d9g","name":"si","documentation":"","conditionsequenceflow":{"expression":{"type":"static","staticValue":"${viable == true}"}},"executionlisteners":"","defaultflow":"false","skipexpression":""},"stencil":{"id":"SequenceFlow"},"childShapes":[],"outgoing":[{"resourceId":"Propuesta"}],"bounds":{"lowerRight":{"x":644.8595138599604,"y":488.830991897666},"upperLeft":{"x":435.3357986400396,"y":485.338929977334}},"dockers":[{"x":20,"y":20},{"x":70,"y":40}],"target":{"resourceId":"Propuesta"}}],"stencil":{"id":"BPMNDiagram"},"stencilset":{"namespace":"http://b3mn.org/stencilset/bpmn2.0#","url":"../editor/stencilsets/bpmn2.0/bpmn2.0.json"}}	\\x89504e470d0a1a0a0000000d494844520000011f0000016808060000006e70ff34000046a549444154785eed9d0b9814d5b5ef5104931b2fc6434ea246639263eef178f3d03caedee42631895edf31e7461886814150411098195e028a8c1a5f441ed3c35b91444111303e400499e90614111f20684c224704541e0aa222ca43dc77ff6bba49cf9ad535d55dbb77efee5abfef5b5f77afdebdba6ad55effde555db5ab4d1b41100441100441100441100441100441c8234a4c4c4c2c470b051780f3098220a4135a27b8009c4f1004219dd03ac105e07c822008e984d6092e00e71304414827b44e7001389f200859a0946abf71e3c6b9ab56ad3ad0d8d8a8962e5d6ac474accf57ac58b1351e8f5f46bfd332a175820bc0f90441c8022d3cf3d62eba5eedd8b1437dfae9a76afffefd460cb11073d9b2651f6a31ba987eaf4542eb041780f30982900518f1ac7b62a87a65f1c8160262c2b66ddbb6538bcff3f47b2d125a27b8009c4f10842cc0ae96c9110f35c4d6e2b38f7eaf4542eb041780f309829005383e4305c3b4e13be8f75a24f4777301389f20085920e2d33a5c00ce2708421688f8b40e1780f309829005223eadc305e07c8225ba74e9a2c44ac7a8609834111fc128e8b0d427141f32f2691d2e00e7132c21e2531a88f8b40e1780f3099610f1290d7019449ecff3d92ae7f9084611f1290d70fd152e83a0a261ca366fde3c47ce70168c22e2531ae0c24f5c7f85cb204c8e8074ac6d9b366d7a400bcf96a5726d976012119fd201e280d189b6fd383e63c8100b310b293c20743fe502703ec112223ef9a55bb76e3fedd9b3e79aae5dbb7e545e5efe78a74e9d8ea56d0ac185175e78b45e9e07cbcaca76e3397ddf4142f7532e00e7132c21e2933ffaf6edfbcb6f7deb5b87dab56ba74e3ae92475f9e5977fd4a3478f7b69bb42a1c5a79bb6c5d4ef28a1fb291780f3099610f1c94cf5f8e5ff511d8bbf79f8752ceee5aa6a42c34f6a62f18dfaf54efa5e0a9dd7d103060cd8d8b66d5b75f0e041b566cd1ad5a14307d5ab57af8fd2dbf941639a462fe3637ae45341fd8e123a175c00ce2758a254c5a76652e254146f4d7de2c7295f755d7cd080318fb4382b3893f5aabe59f5b9614a0b7fdfda99eaca41b7b5f053abacac543ffde94f3de1a9a8a8f05eebddb043b45d214d2f5787f4bc394ce87eca05e07c8225d001a9af14a88ac5076af1d95a5317ef8dd7d5131bfeb77ebdbdf78858e0f5d5ed1faaa94bf460fcef55d52dfd06f553faf5ebf7fa88112354c78e1d95dedd529b366d523d7bf6fc80b62b144572ac2745e0ed96092e00e7132c51c2e2f364552c719d168aa983ef4a7c45ef263554c71a1fe971cd50555b3bb77d4d2c51afdfdbad6d474d7dbc2b3e533b33f105fdfa3e6d1f55d737fe0162357862e329d5e3579c807668a31f37614405abaa8f9f9ffe5ed3fb8dd5faf5066d9f55d535ecd462b3f7b9e79efbece6992bbdcf544f58ba5f8fc046b0ed63f16d9e2f2d66a6654db6d122189fa41ff756d7c7a735b54f1ca5d7750c961defebf8e55efbfac4efb4ffafda77a069d91b3ba596a14808dd4fb9009c4fb044298a4fcdb867bfa80becc3eaf1892feba25cae9f3f3ab02efe23fdf84e79d76eaaaa2e71bb2ee8b903622bfe75502c71b6f6efc2e7e0d7cf67e17335f58dc3ab93c77b6a628d9756c7128b9a9e37fc5c8bce1387bf2bfd3dfd195de02b07c41a4eafadad3d12beb2b2b2b3cbcbcb57ea3c7fdaa5bcfca93ea3effb31962d537b1a33d3b27a6deae36fe3b8148444fbbdb38fd15e0bd26cac43b27d4a347741e8fa4d4a1c93fa9e2223743fe502703ec112a5283e7ad472a12eb684f73c96785e8f80fae8023e17058df585080d99b2e4ab78bf6a42c3d7f4eb2d4d6de39b864e4a1cef3daf6b1ca08b7566f279adfefc2d5efb587ca81eb9dcdcf44dcddfabc66edef8866fa7de4ba1c5eab7fabd7510886a1c878ac537fab52731f965d56db4f8dc86e74deb167f21d97e07be23cdbc03dc7a5dfaeaef7d51bffea02ad67857d3371515a1fb291780f30996284df189c7b40d6be68bc527425092e2b313a3826b273674d4cfe7e851c41dc9367baa26c4cfc2c16a0844ea784f4d5de302ecb624db3c5c53f7cfdbc8a4bfa73ff37ed5c486f33acd9ddb36f53ec0f761170d22a2db4c87f9b527dfc72e2bdaa49603bb653ad6c864fbdd18e5b551ea887f466c02a32b0815be97be570484eea75c00ce2758a224c52716df30b02ef15de27b0ba282f585a8e8d7ef5663d72c169f8ce32a5e9bfaf828fdfa635dd4f3f5e30e1cef497e76eba049cb4f4eb6793bf5bcc57b758dddf5eb2dda3ed7a6b0ab043fc4468f983ed5bea5da566b21fabd5ffbf498199735fd7b758cc1f589d392cf7be1d811e2c1fad72fff164648c9d707f408687dd5c4c425685b6484eea75c00ce2758a214c5c78fa8ad6f09117abb7101389f6089a81563d4d6b78408bdddb8009c4fb044d48a316aeb5b4284de6e5c00ce2758226ac518b5f52d21426f372e00e7132c11b5628cdafa9610a1b71b1780f30996885a31466d7d4b88d0db8d0bc0f9044b44ad18a3b6be2544e8edc605e07c8225a2568c515bdf62a053a74ecd4eb2cc40e8edc605e07c82254aad18b13e62c567010428743fe502703ec112d8f0d457ccb4b63eadbd2fd8458bceb7f436d944fd0ca1b71b1780f3099628b5626c6d7d5a7b5fb04be7ce9d7fa5b7c932ea6708bdddb8009c4fb080dee8a34bad185b5b9fd6de17ec525656d6536f933f513f43e8edc605e07c82019452ed87cc597768d5aa55071a1b1be92d517c0d77c0c48de8703f281ad7655a1397d6de17ec525e5e7e93de26b5d4cf107abb7101389f60808d1b37ce1bf4e0cb0a96ed8de4d01e77c0c48de81cb86753508e6e4d5c5a7b5fb08b169f3feb6d7205f53384de6e5c00ce271800239eb0b7d0c51d3071d3381adb417ef9fdef7fffe3d6c4a5b5f705bb68f159aeb7c939d4cf107abb7101389f6000ec6a653be2a186cf6bf1f1a6e874985f6ac374a1bd92e23253db7f6bdea409119ffc83dd7d3dea9e1b6477ffaaabae528f3cf24890ddfdd0db8d0bc0f95a803b3df6eddb77ee35d75cb30f1d088fda1e72e50e902e828d49c52417431c1adb2152c2834700d181f8bcaaedf454a314223ef907bbfb43e6bcecedb6fbfdf8e13ddcd5e3934f3e69e6cbb0bb1f7abb7101385f0bf4f06ce1f4e9d33f7af7dd7715c0e3b469d33eecdab56b9cb6159a2865f1c14969975f7ef90dfae9bbda7ad1f735e3db3489d297d39d252e3e4edc0a07239ed4b146da97a865122766773ff476e30270be16e05ed77bf7eef58427055e6bff5eda5668c2a4f8e8626fffdbdffef6bf57565676d4057c224e0ed3f6effa47e1fbfaf58f3b77eefc339cb3a15f5f5056567699b64eb81daf7eaf977ede575b957e3d4cbf1ea5ed16fd7c8cb609faf9146d33f4f359dae67669ba8be662fd3cae9fe3ae0f2fe8d7ebf5ebbfebe76f6adbaa6da7b63dda3ed3ef7ddea6699493be9b45474387e952bae2935ae71ef40ddbe469773ff476e30270be1674efdefdb9e79f7ffef379f3e679c28347fdfa50b76edd56d1b64213a6c40705ab6dbf16808f9285ff8eb68d4941580781d0f64c52309ed4f6585248eed73643db64088d168a3bf5f35bb4dda09f0f8520e9e7d7746912a80a08967efe5bfd83727ef2e4b39f6afb714545c5f72074faf937b59d0801d4af8f812026577566d2c061e1e9d2b4dcac25dbe61ddd3fcfb9eaaaab5ed5eb74403f7f1acb4fdb1820b5ce18014288910bf698970d4cf53b32e20ebdcdb8009caf05baf3feef9e3d7beed182e38d782044575c71c547f0d3b6421379ea042e824243d14d689361c4938e2df1e9d7afdfffbdf4d24bd589279ea82eb9e412dc9a787fdfbe7d1fa1ed4272586c93af7d8f79d9204ffd2ef436e302703e96a400add5bf209fa00389f0f893a74ee02a28341cfff1151e60437cf4778ceedfbfffa6e38f3f5e75ebd9570d9fdca03a74e8a0fa8d9a823b930ea5ed73418f0e716fafac8e79d9204ffd2ef436e30270be56b1d1818a9d3c750297393648bfa0bb60d9da5543ff987e533ed5e3da112ddac0f4eea137e2993c6b91ba66d454d567f8787565f5cd9fd37661ad4d86635efabd43da3ed5bbb3bbbb341d2bc3aef25ff5e34bda9ed1d6a06d417217f93e6dd3b4d569bb435badb6eb92bbc6bdf56365f238dea55af4ced58fff47ef4afe48effa9eae1fbfad070427e8c7e3b4fff6a79e7aaa451fcac5447c8a189c3361e0c0df5672e0cf696cf48beabac45383eae217513f45ef62fdd7c89123d5effafc41f51e748bdab2658bead5abd727b49d0166260d78c2937c6c73c515577c41db97210ec93f0920163f4afe4170ae16944b92c7daba4364b40d84e87469baeeef0e1cab8328e9c73f27450a62b5b44b9378bd9814b337ba3489dbfbda0e6a5f8b7e948b89f8143138592bec19ce9b376f9eb3b438ce70f6c877bfc05d3f9337f03be8dd2b3d16ff7f2ddacc4c7c41fbefab8a35eced7743ece0f02909f5ce8ef7d5a4a9f7ee18386ec9a7a976b82b6a72f4f461755d7c047cb853a9f6ffb5e9067f7185fbb0ff337246b23ae6956ff234e20ebd5db9009caf55f2ddc94a019c258a93b570ce44b62320dd7edba64d9b1ed01d60cbd2e2b9b6cb5abfc02d8e6beae29db5406ca5ef55d5256ed7fe59d5e3135fbef6d607a70d1cbb709f1e0decef3960d4faaaf14f35366bacd4115513e2ff0e01c24bfdb8ab3ad658dd6f52e29866ed5ac73be6656bfdfd10f1113c201c18b968db8f8d9985a13d3e5734c2036cf68b9a718bff85bbefb916904d4327258ef79ed7350ed0623233f9bcb62696c041e23655f5f1dfea76ebb4edc30807a3a0a6cf36f6d5cf5fd4be0faa628d77fd336a20021df3ca3779dadd0fbd5e5c00ced72a2e24b91428b53cda5a9f9a718d5fd7423217f741a7ef69e1d8a3473367e1def01015dc6fddfb4c5de302ec5625dbecd40274fe90294bbe8a7bb9c3529fc7ae9d8e7d2e276cad616bfdfdc8d3ee7ee8f5e20270be567121c9a540a9e531dfeba345e3dde4719a77b490fcb1b63671548b36f5f151fafd8ff56ed97cfdb863f0c4c653929fdd3a68d2f293f11c6253158b7faa7d4bb5add642f47b085932f6013d025a5f35317149f3c8ad93eff50f429e76f743af171780f3b58a0b492e054a2d8fa5b63ed9e2cafa433892bbeda676f743af171780f3b58a2b492e764a2d8fa5b63ed952c2eb1f7abdb8009caf554a38c95629b53c96dafa644b36ebdfbb77ef76d4e73081d72b135c00ced72ad92459c84ca9e5b1d4d6275bb0fed9d885175ee8c4341c0108bd5db9009caf55a2dec94c516a792cb5f5c9276565656bb5fd84fa1d25f476e50270be56914e668652cb63a9ad4f3ed1b9ba47db35d4ef28a1b72b1780f3b58a743233945a1e4b6d7df24959d3246f7fa67e4709bd5db9009ccf972e2578b3bb42516a792cb5f5c917389151e7ea612d3e6fd2f71c25f476e50234f3a92c66bea7e633f37d24c825772856eaa3564c798daaf8e4b2ed839843db3ef476e50234f361e67bbdb2adce7ccf99cfccf79100b95bbbe8fa9c72e767c594d7a88a4f04b67de8edca0568e68372ffe217bf50bffef5af5b2422a83133df87a528fe8e44eed63d3154bdb278648b9c98b03ce4d53851159f086cfbd0db950bd0cc97a799efc3f0cb368edc15a0354ce4cecf0ce7352f44557c5cddf69d3a753abe4bd34465b86b4959daa4ffd9127abb72019af9b09f49573c17439cf4b83992121e27ee0ad01aa672e76786f29a375c139fe9d3a777afa9a9d95a5959b9bf4f9f3e2bf275934b17b73da654d586a95cd34f6c5c93a30065f5dd1c5c0057c527253c780405bf2b406b98ca9d9f19c86b5e71497ca64c9952f1ed6f7f5bb56bd74e9d74d249aa5bb76e9f57555599be7b85876bdb1eb73fc2b6a8a8a85013264c50f3e7cf575a843d21d282d499b60f40e0efce0417c039f171f5ae00ad3166cc981679306d61f26a0357c4472fc7e8418306bdf3bdef7d4f1d3c78508daf9fa67adffa30ee4d9e979b5cbab6edf5fa2fc1b6983163c6e19b7cce99332735fab98eb60f40e0efce0417206fe243867b595b9b0c7705c0236deb92d15c98b46c3a6021a0b90863dd7af6397c878aaaf18bd595836f6fd1c6cfba77efae4e3ef964b566cd1ad57bf02daa5fed0c8c7ee86e8851a3dbcba4e55253fdfbf7577bf6ecf1c4a7aeae2ee5bf826eb70084ee775c80bc894f7adc1c999934705878fef9b65b98ca9d9f19ca6bde40e7a6be5ca98ac50756c71aefc6f39a58e3ffc20c85b48d1f575e79e5eacacaca43c71d779cea37fa6e35ebf16770a3cb2db49d095cdbf6388951ef7a2d4b09104640fa356e1b741007a169fb0004feee4c70015c169fc3770538e288239c161e602a777e6628af79c3b0f83c891906315b614d7dbc6b4d2cde00bff73a161fa3c568bbb6f7b44095a73e83c9dfb56f83b6cfaaea1ab7ebc29b7ff5d557ef19f0c7c755df1b26eeaeae6bd85355dff860aa3d77070b4c4e8fcfa7465dd5f5f1376a6be7b6af8925eaf5ebddda7660795231808bdbbebcbcfc6bda12e923211c84a6ed0292d5777370015c161f70ba169e77cbcacaf66bc56e4bdf740953b9f3338379cd0ba6c4a766dcb35fd445fec9e1ddae58e39a01b1451df01eee4e5155179f8dbb530c8a25ce8618789fa96f1caec564e58058c3e9f8e54fc5d2edbe8958fabd5fd6d435fea77edefc2f6b72078b1455131a7fa17defd5d4277e8cefc49cd103622bfe35f99dbbd2dbbabaed9187ce9d3bff4a8bce306de7d1f7b320ebefa670019af9f234f37d587057806dda4ea46fb88489dcf9591ef26a1c53e2535ddf7861552c11c773dca54217fbdf07d625beebbda7c5e6f0a8a4c93e4afab7d68c6ff8767a1ca045a9a77e6f0e9e0faa6bf8957efe029e67ba8345d367123fd6bedd35754d9735e8e7ef60b279ef73131abea65f37db7d8bc0b60fbd5db900cd7c799af93e34ba53bf843b3d52bf4b98c89d9fe523afa631273ef158fa3dd5b14ba45fdfe83dd7a230b02efe238c58fef9096f17eafdaa890de761b729ddafdbff590b599f649b3a6d23937ef60e163513e3ff13efe95dab9ab4183b31e2b97662434708594dacf18ed47b2002db3ef476e50234f3e569e6fbd0e84ebd500f1b2fa57e9708933b3fcb675e4d634c7c62f10da9918ef77a7ce20c2d0e2f26dfeba585681b462bb0fef5cbbfe5f9eb1abb6344a2ed73f8b18b946cbf09bb55c9e75b06d7274ec373ee0e16c936ff958a0dc3dd2f70fb9deaa63b67e06ea993710ca869c99a88c0b60fbd5db9002d7c5849a8ec527333df874677eae9da7a53bf6b60dd9339c836777e96b7bc9ac694f81423d83ec9ed548adb3ef476e502703ee7d09dba1646fd825b44597c4a9cd0db950bc0f99c43ef72f5c1e887fa05b710f12959426f572e00e7730e1cefd11d7b01f50b6e21e253b284deae5c00cee71cba53ff18b3fd53bfe016223efe8499f1b0c0b31a86deae5c00cee71cba534fd3f601f50b6e21e2e3cf9039eb0e15e94ca1a1b72b1780f359a5887f0d0482888f3f831e7c59c1a8b06463059ad530f476e502703eab60fedb21735e2ec65f038120e2e38f89190ff1f9a5f6cf760ebd5db9009ccf2a18f184fd4528d0af8140704d7cc68e1dfbfbaaaaaa2d959595fbaebcf2ca78be66320c0a46ebb4efe662884363e799d0dfc705e07c56b1fd6b80692475919475699ad7b67b8e530c080c2e89cf8409133a91990c0f5d7bedb5f3683b9b88f83487f359c5e606490acf1a1449ca30cf6d88a90684345c111fbd1ca36b6a6ade4ecd64585f5faf3a74e890d34c86b8c422fd75555d7c5cfa756741c132d9eceb8609fd7d5c00ce67159b1b04f3d7a240060d1ae4cd6b8bf96d31cf2d7c98f796b617b2235dd483da5543ee54fd6e7db0853fac5556f650fdc73ea95e5ab346f5e8d143bfaeccfb4c86ad99cdbe6e98d0dfc705e07c56b1b941b4f82c4527c07cb62930cb1b7cfabdc1b4bd905f06c5969f8949c2f4e8e2e3f439784cd067c0b057fadf3e5761264388cfead5ab55cf9e3ddfa2ed6c62b3af1b26f4f77101389f554c6e10fa4b93c9309f2dc0fcb69866123e4cba44974dc81fb533135fa88e259ec7645f984b2775e539683623612cbecd6b9f6106c39a49895393579c3f0c11abae8f8f6a8ad174753bac67552d846773d58425a9abe10fcf5c98e9fbaac7af38a13a395159a6990c936dded3bb6293f4e35efdddd35231394cf6751a3bcf84fe3e2e00e7b38acd0d92bc89da41cc678b114f4a78f4a8276efa9757f0a7baae71426ace1c0847557da20ccf33cd48986906c3a6b99ee32f636a0d2d60675527e77aae9a98b8443f9f9afafc61c8cc8599beaf26d678a916c745789e692643af4d7dfcedeaf1cbffa3aabeb153359d259160b3af1b26f4f77101389f556c6f101c5c4e1f05417830df2d6d27e48f8175f1df54a78d4c602870bc579d614642884d7afbeae40c8698ebb9a62eeedd8baa7ffd53276aff763cd7bef9faf9e173bf32cd5c98f1fbea1a6bb5e0e0364e68c3ce6488365a7c6ec373ddf6dceae42c89993031e3618166350c545b7e7001389f556c8b0fc07cb698d716bb5a32e2b10b462e7a37e7758c34523e8c2020224dcf33ce48d86206c3e45ccf1f57c512d7f59dfcf471dec8a8bef10fc9f67bb14b97f6797ee6c20cdf5753d7b8a0ba3ef1bbd467b9990cd12635d52a76cb52b32466c2c48c87059ad530706d65820bc0f9ac52c4bf06420ee0ee117a77ab5fba6f402c71d2e1632d9967246c318321e67ad6cf9721264448dbac01b14547a7be47bf3ea83f732b5e679cb930f3f76d1d3469f9c9de6733cc6498de063152b3246622cc8c87059ed530b44e7001389f558af8d740283098eb19c76ca8df65201ce8ab8b162dca76c6c342ce6a185a27b8009ccf2a45fc6b2014986afc43353e7106f5bb4e5959d90fbb74e9f2e6a5975e9a7e475e9709ad135c00ce671d084752d58be9d74010b2a653a74e5fd7c2f3567979b9773ca94808ad135c00ce2708421ee8debdfb97b4f0acd1239fac2fcf2830a175820bc0f90441300cfe55d5a2f388169f19f4bd2220b44e7001389f200886d1bb5963b4f0247af7eedd8ebe570484d6092e00e71304c1205a74aed4f68f4e9d3afd0b7daf4808ad135c00ce270882217022ab169eed5dbb76fd0e7daf8808ad135c00ce27088201cacacafe078447db39f4bd2223b44e7001389f200821c12e96169dd7b5f5a2ef1521a175820bc0f9044108010e2ae3e0b21ef9dc49df2b5242eb041780f309821082f2f2f27bf1b7ba7e7af822d82227b44e7001389f200859a277b3be585151d101b325e851cf4b4574e9441042eb041780f3d9a2edf1c71f7fd357bef2958d6ddbb6fdac4dd3b2888915a5e93eac2eb9e41275d96597a92f7ef18b2dde77c5506b5ffdea57377de73bdfc12e61b369447cc06743c105e07c36687bc20927bc7ac105171c78e18517bc8b4405a198d9b76f9f1a306080dab871237dcb29506ba8b98b2fbef8732d406fa21669713284d6092e00e7cb3ba79d76da5d175d74d1219a184128662040c584162075e18517cea6f5c9105a27b8009c2fef9c72ca29dba0be8220140ed4e0e9a79feecd79dd0aa175820bc0f9f24ebb76ed0ec9ae96201416d4e0d1471f1d440382b4f1850bc0f96c40f35070b66cd9a256ad5aa570fb6666dea09c0cb19e7efa69f5c61b6fd0af8b049253f7412dd2e26408d2c6172e00e7b301cd41414191ac58b142613ad76c6753f433c442cc442211b962414ed72eba5e72ea38a8455a9c0c41daf8c205e07c36a0392828f8751e9db8dbebdcb7afbabf45870f6bdbb76f57f1789c7e6d49839cae7b62a87a65f1c816f9306151cc693e402dd2e26408d2c6172e00e7b301cd4141c150dee4af3335c4c62e4394909c1607a8455a9c0c41daf8c205e07c36a0392828e8c4b4739bb6a8158ae4b438402dd2e26408d2c6172e00e7b301cd41419142318fe4b438402dd2e26408d2c6172e00e7b301cd41419142318fe4b438402dd2e26408d2c6172e00e7b301cd41c1b8f9e69ba5500c23392d1e508bb4381982b4f1850bc0f96c4073608c2e5dba646db60a857e6f299be4b4b9b90a6a911627439036be7001389f0d680e8c91cb86b65528514272dac4debd7b55797939753b036a911627439036be7001389f0d680e8c21e2e30692d32676edda95539fb4056a911627439036be7001389f0d680e8c91cb86967352cc23396de2edb7df96914f1b3e00e7b301cd813172111f5c2b8453f669073765e880513b1b5772da042e01e9dab52b753b036a911627439036be7001389f0d680e8c918bf8a083e05a219cb26ff2d71ab150240d0d0d91bb0e4972dac46bafbda62a2a2aa8db19508bb4381982b4f1850bc0f96c4073608c5cc407a023e397144379938698c55024f94072aad44b2fbda4ba75eb46ddce805aa4c5c910a48d2f5c00ce67039a0363e42a3e82900f70816df7eedda9db19508bb4381982b4f1850bc0f96c4073600c111fc125b0eb79c5155750b733a0166971320469e30b1780f3d980e6c018223e824b3cf9e493aa57af5ed4ed0ca8455a9c0c41daf8c205e07c36a0393086888fe0128f3df698baeaaaaba8db19508bb4381982b4f1850bc0f96c4073600c111fc125e6ce9dabfaf4e943ddce805aa4c5c910a48d2f5c00ce67039a036388f8082e317bf66cd5b76f5fea7606d4222d4e86206d7ce102703e1bd01c1843c44770897befbdd7bb99a0aba0166971320469e30b1780f3d980e6c018223e824b4c993245d5d4d450b733a0166971320469e30b1780f3d980e6c018223e824bd4d7d7ab21438650b733a0166971320469e30b1780f3d980e6c018223e824b8c1d3b565d77dd75d4ed0ca8455a9c0c41daf8c205e07c36a0393086888fe01277dc7187bae1861ba8db19508bb4381982b4f1850bc0f96c4073600c111fc125fef0873fa8d1a34753b733a0166971320469e30b1780f3d980e6c018223e824b40782040ae825aa4c5c910a48d2f5c00ce67039a036388f8082e815d2eec7ab90a6a911627439036be7001389f0d680e8c21e223b8040e368f1b378eba9d01b5488b9321481b5fb8009ccf063407c610f1115c62f0e0c16ae2c489d4ed0ca8455a9c0c41daf8c205e07c36a0393086888fe012d5d5d56adab469d4ed0ca8455a9c0c41daf8c205e07c36a0393086888fe012fdfbf7573367cea46e67402dd2e26408d2c6172e00e7b301cd8131447c0497e8d7af9f9a356b16753b036a911627439036be7001389f0d680e8c21e223b844efdebdd5bc79f3a8db19508bb4381982b4f1850bc0f96c4073600c111fc12530911826147315d4222d4e86206d7ce102703e1bd01c1843c44770094ca18aa9545d05b5488b9321481b5fb8009ccf063407c610f1115c0293c763127957412dd2e26408d2c6172e00e7b301cd8131447c0497c06d7370fb1c57412dd2e26408d2c6172e00e7b301cd8131447c0497c00d0371e34057412dd2e26408d2c6172e00e7b301cd8131447c0497c0ad9271cb6457412dd2e26408d2c6172e00e7b301cd8131447c0497e8dab5abd3b776462dd2e26408d2c6172e00e7b301cd813172159f2d5bb678fbe68d8d8d2dee0d9eab21d6d34f3fed74e713f24b7979b9daba752b753b036a911627439036be7001389f0d680e8c918bf84078d62eba5eedd8b1437dfae9a76afffefd460cb11013ff768800451388cfae5dbba8db19508bb4381982b4f1850bc0f96c407360840f3ffc3027f1c18867dd1343d52b8b47b6101013b67dfb76158fc7e9d70a254e6d6dadd71ff123e42aa8455a9c0c41daf8c205e07c36a039084d5d5d9d3af2c82373121fec1e991cf150436cec8609d121d51fcf3aeb2cfa56280e1d3aa4162e5ca8eebcf34e23674ea3166971320469e30b1780f3d980e6c013005c8487f322708747bc0e4a6a43f7ecd9531d7df4d1ead4534f55efbdf71e6d96110803150cd326e2131dc2f6c74ce0f0002ed7c00f6cca6ebcf146da2c2b508bb4381982b4f1850bc0f96cd02c01101a6ca8d5ab57abbd7bf77a8f781d4480521b1a8f001b191b1b1bfdf1c71f27ad79447c045398e88f1c18f1a48407d374cc9831c3fb1b1fc794366fde4c9b0706b5488b9321481b5fb8009ccf06cd1280a44270d2c1eb2bafbcb2998f82f97153bf309433cf3cd37b6fd3a64df4ad66dc7cf3cd223e821176efdead8e3aeaa850fd3113d8d54a09cf9e3d7b3c1f040ebe309395a1166971320469e30b1780f3d9a05902702e04463ce9e075faf03293619f1abf2ae9c3daf4e33f41cca6f8e0170caf711c08eb8883e4e8b4f847e4dd77dff50e4ebffdf6dbde101bbf68f8976cc3860dea1ffff88777b2daabafbeaad6ad5ba7d6ae5dab5e7cf145f5fcf3cfabe79e7bce3b688ebff557ac58a1962d5be68d1a9f7aea29b564c912efc24674de050b1678c7091e7df451f5f0c30f7b533dcc9d3b573df8e083de9c33f7df7fbfbaefbefbbcc9af708f71fcba4e9f3eddebdc53a74e5593274ff6a604457e274c98a0c68f1fefdd14efaebbee527ffce31fbd89d26fbffd7675db6db779776c80b0df74d34dde8157d8a851a3bc1f0cd8c89123d5881123bc398e870d1be6ddd513866947717b61cc0008abaaaaf2ee758ea2bbf6da6b3dc36e39ec9a6bae517dfaf4f1a6ad80e1470c861f2d182eea8410c0708d558f1e3d0e5b6565a5b78b0fc359c8308c2452863e996e1861a42cd56fe8eb547f3cf6d863d9fe98128b30866d9262ce9c399e0f39cf15d4222d4e86206d7ce102703e1b344b003a0c3a368a0fe071d2a4495ee70a0286b5304087bd41b0253eb423c1d23b70fa63cad20b205518a96249154fcad28b0bc586a24301c2508ca9e284a50a16c58b3ce3781b0cc58d4247c1c350fc29218028401c860e1dea194463f8f0e19e88404c52c20291c12d63203c10a05b6eb9c5132388120a052205b1826861727588582c16f36e2d0c71435f80d841f4207e283808e29ffef4274f1c67cf9ead1e78e0014f34219e105188294415e20aa15db4689127ba10e08686064f8c21ca10678834c41ac20d01c7e50f10f3f5ebd77be20e9187d843f421fef811c00f02ced7c18fc3ce9d3bbd1f0bfc68e0c7033f22f8313978f0a0f7e312b63f7260ddd037d00f20fcf3e7cff7b6077cc849aea0166971320469e30b1780f3d9a05902b021d189510c48261ef18b18f4fc08fcca60f473c61967e4b4a16d898f100dc2f6c74ce0e032fdf1c2082ecc5ff9a8455a9c0c41daf8c205e07c36a039080d0ee6e5fa57bb888f601af4471cfff9f5af7f4ddf0a05466177df7db7379ac448308cf000d4222d4e86206d7ce102703e1bd01c1801c74972111f39cf47c807a9fe883ee02aa8455a9c0c41daf8c205e07c36a03930462ee2836300b80c828a8629c3f10239c3399aa03fe2b890aba0166971320469e30b1780f3d980e6c018b9880f0e2ae2fa2b1c4c343902422c080f0e78cab55dd1047f1aa05fb90a6a911627439036be7001389f0d680e8c918bf80088034627d83d32698829c2135df0ef54989300f30d6a911627439036be7001389f0d680e8c91abf808423ec0a911f8dbde55508bb4381982b4f1850bc0f96c4073600c119fdce72692f987cc83f3b170fe90aba0166971320469e30b1780f3d980e6c01851179f410fbeec592e7313c9fc43e6c1c99f3891d155508bb4381982b4f1850bc0f96c4073600c119f26f1a1c2928dc9fc43e690bb5734c105e07c36a0393046d4c5c7c4394b725e923970a90b2eeb7015d4222d4e86206d7ce102703e1bd01c1823eae203d1a062928b89f89801d7d7e1fa3257412dd2e26408d2c6172e00e7b301cd8131447c447c5c0217f4e2425757412dd2e26408d2c6172e00e7b301cd81318a457c70f5733e10f1718babafbe5afde52f7fa16e67402dd2e26408d2c6172e00e7b301cd81318a417c203c584e18ce80c5b920383089693030dd05e6aac1741698df065355606a8a3163c6785747e3a2424c2781291670e634e6f2c13410f87bfdfaebaf372a3e78c4a50198e204f1f10f18a69bc0f413988ee299679ef18e3161ea0a4c6581692d30cd05a678b8e79e7bd4942953bc2932306506a6d0c0741ab82012d36d60ea0d4cc581a939304d07a6ecc03a634a0f4cf1919a9f07d381a4e6e249cdbd939a6f87cea5e3e2b6c7ba2027ae825aa4c5c910a48d2f5c00ce67039a0363b8d80139b09c286c14350a1a2202314111435c30870de6b781e8604e1c080bc468e0c0819e38a130713c0105999a4e13314d890f3769566a4ea1d45c4298ce01c20081c0f2e0571ec50601c1724250202c98f72735df0f2615c3dc3e1022cce783b969205098bb07139841b850ac1032e402c2963aff088207e143be2084b8740573eb208f586617b73d721166be9d7c835aa4c5c910a48d2f5c00ce67039a0363b8d80139f2b59ca6c4a71877bbf295d3304084310a7415d4222d4e86206d7ce102703e1bd01c18c3c50ec891afe514f1710bcc3688dd4f57412dd2e26408d2c6172e00e7b301cd81315cec801cf95ace289fe793af9c8601bb9dd8ad7415d4222d4e86206d7ce102703e1bd01c18c3c50ec891afe5cc766e22cc3b0cc31cc9387e025fb1ce3f94af9c8601c7bb70c0dd55508bb4381982b4f1850bc0f96c4073600c173b2047be9633e8dc447ffdeb5fd5cf7ffe73d5be7d7b75f2c9277b079031697f31cf3f94af9c860107daf14f9faba0166971320469e30b1780f3d980e6c0182e76408e7c2e6790b989f01777dbb66dbd51cf9a356b54870e1dbc3b5914f3fc43f9cc69aee04e1eb86b87aba0166971320469e30b1780f3d980e6c0182e76408e422f27463a18f1e0b631a9fb58e1aff462a6d039e548dd3ec855508bb4381982b4f1850bc0f96c4073600c173b2047a1971327f1e164bf8e1d3b7ae2833b69b6768758d729744e396ebdf5d6d0f753cf27a8455a9c0c41daf8c205e07c36a03930868b1d90a3d0cb89d9f5529778e0d8100e8a6257cc04a9693d6c4f6656e89c72e024519c20ea2aa8455a9c0c41daf8c205e07c36a03930868b1d90c395e584f0e0ec658c7af06f575870c6764a7cfc0e78731676323357729a0eeec88a7fbc5c05b5488b9321481b5fb8009ccf063407c670b10372b8b29cb86401974b9802136765f3573f67b94e66e64a4ed3c1393e38d7c755508bb4381982b4f1850bc0f96c4073600c173b20872bcb89bb5ee25a315314f2244757729a0ece6ec659ceae825aa4c5c910a48d2f5c00ce67039a0363b8d801395c594e5ce8897f644c01d1a062928b958af8e0ba2e5cdfe52aa8455a9c0c41daf8c205e07c36a03930868b1d90c395e5c4a8c7e455d7223ecd416e7165bbaba0166971320469e30b1780f3d980e6c0182e76400e579613c77b70dcc714f877870a492e562ae283e94130cd88aba0166971320469e30b1780f3d980e6c0182e76400e179613458ee5c8875131c9d64a457c302f11cea97215d4222d4e86206d7ce102703e1bd01c18c3c50ec8e1ca72a2d04d22bb5dcd59b0608137d19aaba0166971320469e30b1780f3d980e6c0182e76408e6259ce6c11f169ce92254bbc991e5d05b5488b9321481b5fb8009ccf063407c670b1037214cb72668b884f7370c224a69a7515d4222d4e86206d7ce102703e1bd01c18c3c50ec8512ccb992d729e4f7356ae5ce95dc4eb2aa8455a9c0c41daf8c205e07c36a0393046ae1d109705e0ec5c5bd723e5ba9c41c8755dfc2ce87a663b991967b94e6696cf9ce60aeed32ee2c307e07c36a03930462e1d10c5ba76d1f55ed164fbab9debf548b92c6710d62fbe5ead58b122a775f1b3a0eb19743233ced03ecc6466f9ca6918d6af5f6ff4f215d3a0166971320469e30b1780f3d980e6c018b974408c12d63d3154bdb278648b82086a41af47c26d5e402ecb1904acc7fa2747b4583e5316643d834c6696c9729dcc0cd356e42ba761c0ec01b8dd90aba0166971320469e30b1780f3d980e6c018b974405bc72970d3bf238f3cd2fbeb3597e50c828975f1b320eb699b545ef395d3306cdebcd9e949da508bb4381982b4f1850bc0f96c4073608c5c3a208a8916592ee65794a902c18dfe8e3efa6875eaa9a7aaf7de7b8f360b8da975f133bff5b48dadbce60a468a98b2c455508bb4381982b4f1850bc0f96c4073600c17c52755207804280e14098ae5f1c71f27adc3616a5dfc2cd37adac6665e7365f7eedd223e6df8009ccf0634074648bf073a0ef2e1d710d7d5604a03dcaaf7ce3bef5493274ff6aeb779eaa9a7bc5bef5e77dd75c60a962b4a1ce3f9c10f7ee02d0be5cc33cff48a67e3c68df4ad9c31b52e7ec6ada74d30e93daec44f8d7828a9bc626ad84283ddd45c7e106d815aa4c5c910a48d2f5c00ce67039a0363408030d485b040601e7ae8213575ea544f78309d25ee1f0e4142a78540a163982ad894f065b2f4dd81d4af36a62fc57ba97ba1639970521a6616c472623a064c6f8a03aab80b02da4f9f3eddbb9f3b4edd5fb66c99b7ae38483b62c40863ebe267c8ebdebd7bbd990ff1ef140eaae25f1d5ca08ae5c1fbb8cffabc79f3d4ecd9b3bd7bb0631b609d717f76ac07c403eb347cf8706ffdf0033160c000d5af5f3fef9eefa97bd1637ee9d4fde8919ff47bc89f75d659de2887cb2bcd7da1cd55508bb4381982b4f1850bc0f96c407350504c15acdf8800bb03304077172098bb76ed526fbef9a627242860080b4668109a09132678058bdbb0a050abaaaa3c61428142a82058284c747253eb92c9f6eddbe77d0f44206510061844026201d1c0b2e1824a4cd9015181e863d92190101ddcd101eb3476ec582f0f98740b22356bd62c4fb4b0fe10319c36005183b86dd8b0c1133be40ae2d75a5e85d6412dd2e26408d2c6172e00e7b301cd41413155b07ee2835f67fc4a9f71c619792d1053ebe2677eeb691b5b792d55508bb4381982b4f1850bc0f96c407350504c156c6b458983a0f92e1053ebe267adada76d6ce4b554412dd2e26408d2c6172e00e7b301cd414131716e4cd0f35f703635c8d7710013ebe26741d7d336b84344be725acaa0166971320469e30b1780f3d980e6a0a014e27aa47c154a36eb72e0c001b578f162ef58128ea9d0f739cb763d6d92af9c9632a8455a9c0c41daf8c205e07c36a039282885b81e295f8512645db0bc975f7eb96adfbebd77cb649c6e8003d8ebd6ad6bd136ec7ada245f392d65508bb4381982b4f1850bc0f96c407350706c5f8f94cf42696d5df0f77ddbb66dbdf365d6ac59a38e3df658f5c20b2f1cfeab3e93e5b29e36c9674e4b15d4222d4e86206d7ce102703e1bd01c448e42160afe1e3fe9a4933ce1c15fe33008517d7d3d6d9a15b94ee51174ba8ed628644e8b15d4222d4e86206d7ce102703e1bd01c448e42160aa6f5c4c97c1d3b76f48467cf9e3d6af5ead5de898db902e11932e7e59ca6f240fb20d375b44621735aaca0166971320469e30b1780f3d980e6207214b25030d2481fe5e0443e9c2088f9867305239ed43ddaa9b804b520d375f851c89c162ba8455a9c0c41daf8c205e07c36a039881cae140aae3dc3b22c5cb890be951526fee20ffb37be2b392d26508bb4381982b4f1850bc0f96c407310395c29145c83c55d9c992d100d2a26b998888f5d508bb4381982b4f1850bc0f96c407310395c2914dcab7df4e8d1d49d35223ec5096a911627439036be7001389f0d680e22872b8582510f2ee20c8b884f71825aa4c5c910a48d2f5c00ce67039a83c8e142a1a4e69a3161223ec5096a911627439036be7001389f0d680e22872b8502013281884f71825aa4c5c910a48d2f5c00ce67039a83c8516a8522e2539ca0166971320469e30b1780f3d980e62072945aa188f81427a8455a9c0c41daf8c205e07c36a039881ca55628729e4f71825aa4c5c910a48d2f5c00ce67039a83c8516a8592cd541e992cec741da596531ba0166971320469e30b1780f3d980e62072945aa10499ca2393999aaea3d4726a03d4222d4e86206d7ce102703e1bd01c448e522c94d6a6f2f03313d37594624ef30d6a911627439036be7001389f0d680e2287148a7924a7d9835aa4c5c910a48d2f5c00ce67039a83c82185621ec969f6a0166971320469e30b1780f3d980e6207248a19847729a3da8455a9c0c41daf8c205e07c36a039881c5228e6919c660f6a911627439036be7001389f0d680e2287148a7924a7d9835aa4c5c910a48d2f5c00ce67039a83c891af4259b76858ce7329fb99a97996f349be725acaa0166971320469e30b1780f3d980e62072e4ab50d63d31540bd0f09ce652f63353f32ce713d339adacac5477de79a73ae5945354fffefdd537bff9cda27bc46d91702757cc58c9815aa4c5c910a48d2f5c00ce67039a83c861ba505260c413f64c633f0b3bcf723e319553142a26d39f3d7bb637da2b66f6eeddabce3cf3cc8cf373a3166971320469e30b1780f3d980e62072982a148a896bacfc2cecf557f9c4544e714ba173cf3d97ba8b1adcb1e437bff90d758bf84411538542813050c1306da52e3e3ff8c10fd4d6ad5ba9bba879fdf5d7bd113105b5488b9321481b5fb8009ccf06340791c354a150447cc2d3ae5d3b6f3d4b8943870ea9238e3882ba457ca288a94249e7e69b6f16f131c039e79c435dcef0d9679fa97beeb9470d1e3c584d9b368dbeed0b77fc0ab5488b9321481b5fb8009ccf063407910385920fb3213ef43b5d321364129fb7de7acbbbc32b6e37ddbb776f3567ce1cdaa455f0197cb6a2a2425d71c5155ecca0bcf6da6bdee7d2d717779e0dca51471d455d223e82396c888fab231f5364129faaaa2a3563c60cef1fa4e79f7f5e5d7df5d5eaa1871ea2cd323277ee5cf5b39ffd4c5d7ef9e5eaa4934ef2c4037f890701239e94f0e033580ebc8610befaeaabb4398b8c7c9aa039100c21e2139e4ce203b1d9b973e7e1d710a0010306a4b5c80cdac1dab66dab66ce9ce9fda3d6a14307ef2ffd2060570bc283d1121e213a387f07cf71efb520c8c8a7099a03c110223ee1c9243e186960f402e6cd9be78d80702222ddf5f3b3934f3ed9131eecbee1b3ddba756bd1c6cf30e249815d38f86a6a6a0efbfc90914f1334078221b23dcf67d1a2456ad4a8516afdfaf52ddee3cce5f37c4c91497c304aa1231f1cbf094a9f3e7dd488112354c78e1d3df1d9b46953e05b554f9d3ad5131a08e0840913d4fcf9f3d5a041833c1fcec20e828c7c9aa039100c11642e654c598ae30eeddbb7f77e89870d1ba6aeb9e61ab56eddba166da9859d67b918c8243e109ab163c7aa8f3ffed83b931c02f2e0830fd2661979e08107bccf3cfbecb35e8c3163c6a8abaeba8a36cb080e2ed3911076bff6ecd9439bb2c8c8a7099a03c11041e652bee1861bbc630f070f1e542fbdf4923af6d863d50b2fbce0fd82d2b6293335cf723190497cf0cf546a37a96bd7ae59094f0a08103e9b1ac564f36f17c0c1659c523170e04075fbedb707161e20239f26680e0483b43697328e35a41f7b804188a64c99d2a26dbab536cf72ae57d3bb76c57c26f1297664e4d304cd8160115ce7838394a9630ff8f5c4c8279be3171408cfda45d7e77435bd6b57cc97aaf8c8c8a7099a03c1221869dc7df7dd875f3ff7dc73de81cf4c573e0701231e4ce7f1cae2912dc425a8b972c57ca98a8f8c7c9aa039100a04463d3868b970e142fa565664fb2f1b67aefc9356aae223239f26680e8402f1d8638f05febbd70f880615935c4cc4277fc8c8a7099a03a140e0ecd8d1a3475377d69492f8602e1f8cc24a09fca180abf529a8455a9c0c41daf8c205e07c36a039100a04463d0b162ca0eeac2925f1b9f8e28bd5eeddbba9bba8d9b56b97dab87123758bf80885019707a44e54c3b927388705d70ee14c5e9c74887349860e1daa6ebcf14675db6db7a9f1e3c7abe9d3a77be7aa40b0962d5ba6d6ae5debfd43554ae2f3f8e38fabb3cf3e9bba8b1acc6288134b29a8455a9c0c41daf8c205e07c36a039100a040408bf8a6fbef9a627241014080b4ea083d0e0547e080f2ec18010e1ca6e0813cecc855041b0205ca5243e98c379dcb871de7abff8e28bf4eda2029388fdf0873ff46632e44e48442dd2e26408d2c6172e00e7b301cd8150e49492f8a4b8f4d24bd5134f3ca1bef4a52f7917741e73cc3145f778efbdf77a138f65da8d442dd2e26408d2c6172e00e7b301cd8150e494a2f84401d4222d4e86206d7ce102703e1bd01c08454e299de71325508bb4381982b4f1850bc0f96c407320143941aea66fcda270c5bc6ba0166971320469e30b1780f3d980e6402872825c4d9fc9a274c5bc6ba0166971320469e30b1780f3d980e64028015abb9adecf5abb625ec80fa8455a9c0c41daf8c205e07c36a0391004a100a0166971320469e30b1780f3e59d76edda1dc2705b1084c2811a6cdfbefde7b43e1942eb041780f3e59d6f7ce31b5b317f4ca1c00957b89e09f3dae011af05216aa0064f3bedb40f697d3284d6092e00e7cb3b279c70c22de79f7ffe019a0c1b4068feeddffecdbbc80ef74ec259bb98d85b0448881a175d74d1e73ffde94fa7d1fa6408ad135c00ce6783b6c71d77dc4be79d77de5ea8afcd5d305cc5fd939ffcc4bbca17d73461fee2d5ab5707bef75129821bd209d100b5869abbe0820b0e7cfdeb5f7f0db5488b9321b44e7001389f2ddaeafdcde1c71c73ccdf8e3cf2c8836d9a9625efd6b973e716f317e3faa64e9d3ab5681b05d3b9f72e383ce288235abc27567a865aebd0a1c33f74dd5ddf2698f0007c36145c00ce57d2545454ac1c366cd8fef4f98b57ae5cf9be1e053d4ddb4681b2b2b2ef76e9d205bf80829089d03ac105e07c258d2eb6b3bb77efbefbd9679fdd83118f169eddddba757b1f7eda360a68e1d1ab5e369ffa05218dd03ac105e07c250f844617dd33c91baf3d1355e1017afd6fd6a3be9ba85f10d208ad135c00ce1719203ed4173530ead1e2d399fa05218dd075c205e07c9141c4c7cbc1df70dc87fa05218dd075c205e07c9121eae2d3a953a7f63a079fe291be27086984ae132e00e78b0c51171ff9a74b0848e83ae10270bec81075f1917fba848084ae132e00e78b0c223ef24f971088d075c205e07c9121eae223ff740901095d275c00ce1719a22e3ef24f971090d075c205e07c9121cae223ff74095910ba4eb8009c2f3244597ce49f2e210b42d7091780f34586288b8ffcd3256441e83ae10270bec81071f1917fba84a084ae132e00e78b0c51159f4e9d3a1d2bff74095910ba4eb8009c2f3244557cb4f054e875c734223fa0ef090243e83ae10270bec890497c9452ed376edc3877d5aa5507701b607a8f293fd3ed3f5fb162c5d6783c7e198d9b6f8a75b9a340916f1bb64eb2810bc0f9224326f1193267dd21bdb1bddbffe672f74d7c6ed9b2651fea8e73318d9d4f74e79e3764cecb45b7dc5100db66eda2eb8b75dbb075920d5c00ce17193289cfa0075f5630da09b2b16ddbb6edd41de5791a3b9fe05735ecb21762b9a300b6cdba2786aa57168f6c91f3a056c06dc3d649367001385f64c8243e181667fbeb440d9fd71d651f8ddd1ac993ffcab48dd2d65dbf3e9eb6c94421975bf0c7856d13a26fb175920d5c00ce171932890ff6b3e986cfc51087c6f623d939d660b9d2ecb3f2f2f2db695b8e422db7d03a85de3621fb564edf990e1780f34506d7c4077f7d6399060d1aa4e6cf9faf264c98a0ba76edfa397cfaf17cda9e52a8e5165aa7d0db2643df3a14b06fe5f49de97001385f64e0c4a7b6b6f6c8427594b2b2b2a558a63973e61cbec9db8c1933bc5f29dd7906d3f694422db7d03a85de36baffb4e85b77df7df7c1807d2ba7ef4c870bc0f922c139e79c735472e8892bbb71c2dd4d5d9a2e3998bd64c992161b3d174b1bde66657575755ee7c03dc5faf7efeff93a77eefc2bba0e944277702133a6b60ded2bd95a7adfbaf6da6bbd914f80be15ba3f7001385f64c07e302eb0c49014e2a337c2637a63bc535959a93ef9e493161b3e5bcbb6887100502fc767151515de8827253cda17c7888cb6a798eae0d92eb7d03a85de36e85bd8cdcab16fe5f49de97001385fe43135f2c9a5a3e00060fa2f153a87b6afd1761c85eee042665cd83621fa56cedf99820bc0f9224fa13b8aee10e7691b86e170805fa5c3147ab985ccb8b26d72ec5ba1be137001385fe4c1e9ec06cec9d8ba34c43919b950accb1d058a7cdb84d6092e00e78b3cb88e06a7b3d38d9f8d6ddebc79ce52cb67a316eb72478122df36a175820bc0f9220f2ee0c37534389d3ddb5f2bdd7edba64d9b1ed09d64cb52cbd7e114eb72478122df36a175820bc0f98436de3efac5f895d1b61ffbd95918dae37385e82445bbdc5100b94de6b8d8b64d689de002703ea184c1bf1cd427141ebd5d463bbc6d422f171780f309258cc31d3cf238bc6d422f171780f309258cc31d3cf238bc6d422f171780f309258cc31d3cf238bc6d422f171780f309258cc31d3cf238bc6d422f171780f309258cc31d3cf238bc6d422f171780f309258cc31d3cf238bc6d422f171780f309258cc31d3cf238bc6d422f1717003e31c70d9dd2a4d1f8626e98e3db26145c00ce273846b2530a258ec3db39f4727101389fe0180e774ac1200e6fe7d0cbc505e07c826338dc29058338bc9d432f171780f3098ee170a7140ce2f0760ebd5c5c00ce273886c39d523088c3db39f4727101389fe0180e774ac1200e6fe7d0cbc505e07c826338dc29058338bc9d432f171780f3098ee170a7140ce2f0760ebd5c5c00ce27584429d57ee3c68d7357ad5a75a0b1b191ce60a7c68c19e39d7c46fd304c4a8eb9813145278d9b6f5a5bee5c2dec3ab9ba5c4110f111aca20b65deda45d72b4c2e9e696e5f744aea4bceedeb7d0e73032fb53cc56690e5cec5c2ae93abcb1504111fc12af8855ef7c450f5cae2912d3a7c50c3a4e44b2ddfd5c0c472fb59aeebe4ea720541c447b00a760dc2fe42e3f34b2ddfcfc9c472fb59aeebe4ea720541c447b00a8e27d00e9e8b210e8d4dd19dfb446d096dfbb4adecdcb9f32f689ba0985a6e3f0bb24e1457972b08223e82554c154b9082e8d1a3c7accb2ebbecb3134f3c515d74d145eaacb3cefa34570132b5dc7e16649d28ae2e5710447c04ab982a962005d1ab57afbd279c70827700fbd1471f55c71c738ceaddbbf7df68bb20985a6ecededafe81ba69e6ca40eb44c9e772a52c97e50a82888f9035359312a756c7e22acddea36d3261aa585a2b08ddb1475754547c7ec9259778c2535e5eaeba75eba62a2b2bf7d3b641c0290074194cd9b2359bd4ac25afb6ba4e14aca3a97cfa59b6cb1514111f216baa62f18135b1f874ea0f82a96241c70d62e3c68d531d3b76547a174cad58b1420d183060336d938dd1e53061f73eb15e3dbbfe2dafc8e9f7b566a6f2e967f43b4d1aed1f8e107ab9b8009c4fc8122d3e4f56d7277e97eeabad4d1ca505698c1e056dc748a83ad6589e7a4f3fafd6be0dda3e33552c88a3e33dacede3eafaf828ef7bc6af3841bfde555517bf572fe3b6eaea414fdd366dc1e7c3a72e57c3a72c53fd86dd7a68e8d0a197b451ea889afac6e1baed166def56c51afbebc737e9e71153afd3468cee864c8cabc5cfbde17df7cedd1fabebef7e5a3dd4f837356cf272352ffe37f5f74defaa3b663de7bdfecbf27f1c5ece9bf5ee143e3f7cea8ac39fdffbc9a7eabec5afaaebf4723dfeccebea061d6bc7ae8fbc754a7d9fb60fabebe2235239cc84a97cfa59be463e0e137a7db9009c4fc8829a71cf7e5117c627c902f1ecda890d1dabea12b7eba29d5d3d3ef1e541b1c4d9dabfc36baf8b5c17d4ca01b186d36b6b6b8f34552c88d3bf7ef9b7aa26c4cfd2dfb5c7fbae58e3a59e78681f5e0f18bba8beff2db37655545e79f0dac137be5d5dd7f811fc55b1c475ba5da2667cc3b7fb4d4a1c5353179faf05ec4ff4f387d162f5c8c2a59e80e0bb5f7e7d9bbaf19e67bc63352f6fd8ae06d527d413cffe97dafde1c76aed3fb6a9219396355bd67ddadedef1c1e1cf3fbae275f5e7275f511f7cb4572d59fd8677bc27b54ea9efd3cbf0ef10a066cbc1602a9f7e26e2933d5c00ce276441757de385ba78e32dfc5a6cd205499b57e8fa712b8a3cd50ea7ed873d2fe5fd0f3fdea70be200e2f5af7fea44fd1ddbbdefaa6bacc5e82bf55ddaffce90294bbe8ae755131abea65f6ff1fcf5f1b7b5487ef370bbfa78ac3a96b8827ebeaa3efe5bfd9975daf6619d308ac1f72f5cb9413df6f4ebde738c786ebd6fd5e165c3eb310facf69eafd52275e7ecd59e18a57fbef6de956ad7071f7bcf132f351defd139d97aff5f1a0ea47f1f4641a965c984897cfa19966b699ecef37198d03ac105e07c4216a050f52ec9d016fe587cf7c0baf88ff0ab9deed705f47ed5c486f33acd9ddb16af71bd104edba79d3c1b5bfaecab07172c6a78abefe4a78ff3465bf58d7ff0beabae7181b6ff4c7db75ea69d18856164a69fcfd1239b3b92fe0ff4677e8d515c4d5de202bcc6288afbbc16a0f32160e3ef5fb6f74f0bd77adf3fedd1b5de0807cfb1cb85514f6ad9f07ad1aaa6d7d74f7f5abdf2c60e88a57a70e96b9ec17fdd94e56ac3969d6aeb7b1f7a8284e33d9b376f9e337462fc60eafb704c2dc8713513f9f4332cd7d23c9de1ec30a175820bc0f9842cd005b961605de2bb8cbf97779c2539f241317bfebac6eed54dc7563e877fc1e27825ae17dafcd63b87b2fdc5d6edb7ad7f6d4362e1934bf7dd757fc3f26a1cef89c5670d882d3a3ab90c5b074d5a7e726a99b4b0f4d0be77ab71fc24169f5c5b3bb7bde7af6fbcc61345bdbcfaf126fddedfd9cfebe2d76d3ed5fea5c326275e9ffdd8b24f70b9c1a87b9e56efbebfc7db9d1a3de319b565fb6e6ff952afb13b86d7101b8c7a263efc921a3be705f5e2dfb77a7e88d3302d403316ac5323a73d7de8a5f5af3fa60b7ccba8a9f1c5a9efd3b65a0bd1ef53cb92095cf8897c62b9b2cda79f21d79b366d7a00cbb5344fd776394c689de002703ec132e8ccf835d5b61fc713b2b0fd8f3db174fbc4071afe4463668d1ea10dac5bfe1d5de48d5a2007d0b739422cb79f211662e65ce0f86c328653cb55c484d6092e00e7138a886afc6b363e7106f5070507983102d376a81aff7005f84749881ca175820bc0f9044110d209ad135c00ce270882904e689de002703e4110847442eb041780f3098220a4135a27b8009c4f1004219dd03ac105804f4c4c4cac350b050d2626262616d404411004411004411004411004411004411004411004411004411004411072e7ff0317d0a878b755c4470000000049454e44ae426082	0	
7aa14150-e2cc-11f1-87a6-06295b567284	App Cursos	appCursos			2026-11-17 21:18:48.378	admin	2026-11-17 21:56:29.54	admin	10	{"models":[{"id":"07465075-e1d8-11f1-b51a-4227cbba929c","name":"Organizar curso de capacitación","version":1,"modelType":0,"description":"Modelo conceptual, no ejecutable. Los recordatorios se cuentan por versión de propuesta. La fecha programada se obtiene de la propuesta aceptada. Para cada participante se espera una respuesta de encuesta; el enunciado no fija un vencimiento. La empresa se representa como pool de caja negra; los mensajes internos del subproceso se expresan con tareas de envío/recepción y eventos de mensaje.","stencilSetId":null,"createdBy":"admin","lastUpdatedBy":"admin","lastUpdated":"2026-11-17T20:39:02.230+00:00"}],"theme":"theme-1","icon":"glyphicon-book"}	\N	3	
\.


--
-- Data for Name: act_de_model_history; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_de_model_history (id, name, model_key, description, model_comment, created, created_by, last_updated, last_updated_by, removal_date, version, model_editor_json, model_id, model_type, tenant_id) FROM stdin;
74217a62-e2cd-11f1-87a6-06295b567284	App Cursos	appCursos			2026-11-17 21:18:48.378	admin	2026-11-17 21:25:46.972	admin	\N	1	{"models":[{"id":"07465075-e1d8-11f1-b51a-4227cbba929c","name":"Organizar curso de capacitación","version":1,"modelType":0,"description":"Modelo conceptual, no ejecutable. Los recordatorios se cuentan por versión de propuesta. La fecha programada se obtiene de la propuesta aceptada. Para cada participante se espera una respuesta de encuesta; el enunciado no fija un vencimiento. La empresa se representa como pool de caja negra; los mensajes internos del subproceso se expresan con tareas de envío/recepción y eventos de mensaje.","stencilSetId":null,"createdBy":"admin","lastUpdatedBy":"admin","lastUpdated":"2026-11-17T20:39:02.230+00:00"}],"theme":"theme-1","icon":"glyphicon-book"}	7aa14150-e2cc-11f1-87a6-06295b567284	3	
84ec5639-e2cd-11f1-87a6-06295b567284	App Cursos	appCursos			2026-11-17 21:18:48.378	admin	2026-11-17 21:26:15.145	admin	\N	2	{"models":[{"id":"07465075-e1d8-11f1-b51a-4227cbba929c","name":"Organizar curso de capacitación","version":1,"modelType":0,"description":"Modelo conceptual, no ejecutable. Los recordatorios se cuentan por versión de propuesta. La fecha programada se obtiene de la propuesta aceptada. Para cada participante se espera una respuesta de encuesta; el enunciado no fija un vencimiento. La empresa se representa como pool de caja negra; los mensajes internos del subproceso se expresan con tareas de envío/recepción y eventos de mensaje.","stencilSetId":null,"createdBy":"admin","lastUpdatedBy":"admin","lastUpdated":"2026-11-17T20:39:02.230+00:00"}],"theme":"theme-1","icon":"glyphicon-book"}	7aa14150-e2cc-11f1-87a6-06295b567284	3	
8aa9c220-e2cd-11f1-87a6-06295b567284	App Cursos	appCursos			2026-11-17 21:18:48.378	admin	2026-11-17 21:26:24.775	admin	\N	3	{"models":[{"id":"07465075-e1d8-11f1-b51a-4227cbba929c","name":"Organizar curso de capacitación","version":1,"modelType":0,"description":"Modelo conceptual, no ejecutable. Los recordatorios se cuentan por versión de propuesta. La fecha programada se obtiene de la propuesta aceptada. Para cada participante se espera una respuesta de encuesta; el enunciado no fija un vencimiento. La empresa se representa como pool de caja negra; los mensajes internos del subproceso se expresan con tareas de envío/recepción y eventos de mensaje.","stencilSetId":null,"createdBy":"admin","lastUpdatedBy":"admin","lastUpdated":"2026-11-17T20:39:02.230+00:00"}],"theme":"theme-1","icon":"glyphicon-book"}	7aa14150-e2cc-11f1-87a6-06295b567284	3	
8745c4b7-e2cf-11f1-87a6-06295b567284	App Cursos	appCursos			2026-11-17 21:18:48.378	admin	2026-11-17 21:40:38.08	admin	\N	4	{"models":[{"id":"07465075-e1d8-11f1-b51a-4227cbba929c","name":"Organizar curso de capacitación","version":1,"modelType":0,"description":"Modelo conceptual, no ejecutable. Los recordatorios se cuentan por versión de propuesta. La fecha programada se obtiene de la propuesta aceptada. Para cada participante se espera una respuesta de encuesta; el enunciado no fija un vencimiento. La empresa se representa como pool de caja negra; los mensajes internos del subproceso se expresan con tareas de envío/recepción y eventos de mensaje.","stencilSetId":null,"createdBy":"admin","lastUpdatedBy":"admin","lastUpdated":"2026-11-17T20:39:02.230+00:00"}],"theme":"theme-1","icon":"glyphicon-book"}	7aa14150-e2cc-11f1-87a6-06295b567284	3	
c87a9eae-e2d0-11f1-87a6-06295b567284	App Cursos	appCursos			2026-11-17 21:18:48.378	admin	2026-11-17 21:49:36.975	admin	\N	5	{"models":[{"id":"07465075-e1d8-11f1-b51a-4227cbba929c","name":"Organizar curso de capacitación","version":1,"modelType":0,"description":"Modelo conceptual, no ejecutable. Los recordatorios se cuentan por versión de propuesta. La fecha programada se obtiene de la propuesta aceptada. Para cada participante se espera una respuesta de encuesta; el enunciado no fija un vencimiento. La empresa se representa como pool de caja negra; los mensajes internos del subproceso se expresan con tareas de envío/recepción y eventos de mensaje.","stencilSetId":null,"createdBy":"admin","lastUpdatedBy":"admin","lastUpdated":"2026-11-17T20:39:02.230+00:00"}],"theme":"theme-1","icon":"glyphicon-book"}	7aa14150-e2cc-11f1-87a6-06295b567284	3	
d810cb15-e2d0-11f1-87a6-06295b567284	App Cursos	appCursos			2026-11-17 21:18:48.378	admin	2026-11-17 21:50:03.125	admin	\N	6	{"models":[{"id":"07465075-e1d8-11f1-b51a-4227cbba929c","name":"Organizar curso de capacitación","version":1,"modelType":0,"description":"Modelo conceptual, no ejecutable. Los recordatorios se cuentan por versión de propuesta. La fecha programada se obtiene de la propuesta aceptada. Para cada participante se espera una respuesta de encuesta; el enunciado no fija un vencimiento. La empresa se representa como pool de caja negra; los mensajes internos del subproceso se expresan con tareas de envío/recepción y eventos de mensaje.","stencilSetId":null,"createdBy":"admin","lastUpdatedBy":"admin","lastUpdated":"2026-11-17T20:39:02.230+00:00"}],"theme":"theme-1","icon":"glyphicon-book"}	7aa14150-e2cc-11f1-87a6-06295b567284	3	
e5e0413c-e2d0-11f1-87a6-06295b567284	App Cursos	appCursos			2026-11-17 21:18:48.378	admin	2026-11-17 21:50:26.295	admin	\N	7	{"models":[{"id":"07465075-e1d8-11f1-b51a-4227cbba929c","name":"Organizar curso de capacitación","version":1,"modelType":0,"description":"Modelo conceptual, no ejecutable. Los recordatorios se cuentan por versión de propuesta. La fecha programada se obtiene de la propuesta aceptada. Para cada participante se espera una respuesta de encuesta; el enunciado no fija un vencimiento. La empresa se representa como pool de caja negra; los mensajes internos del subproceso se expresan con tareas de envío/recepción y eventos de mensaje.","stencilSetId":null,"createdBy":"admin","lastUpdatedBy":"admin","lastUpdated":"2026-11-17T20:39:02.230+00:00"}],"theme":"theme-1","icon":"glyphicon-book"}	7aa14150-e2cc-11f1-87a6-06295b567284	3	
8188bc33-e2d1-11f1-87a6-06295b567284	App Cursos	appCursos			2026-11-17 21:18:48.378	admin	2026-11-17 21:54:47.446	admin	\N	8	{"models":[{"id":"07465075-e1d8-11f1-b51a-4227cbba929c","name":"Organizar curso de capacitación","version":1,"modelType":0,"description":"Modelo conceptual, no ejecutable. Los recordatorios se cuentan por versión de propuesta. La fecha programada se obtiene de la propuesta aceptada. Para cada participante se espera una respuesta de encuesta; el enunciado no fija un vencimiento. La empresa se representa como pool de caja negra; los mensajes internos del subproceso se expresan con tareas de envío/recepción y eventos de mensaje.","stencilSetId":null,"createdBy":"admin","lastUpdatedBy":"admin","lastUpdated":"2026-11-17T20:39:02.230+00:00"}],"theme":"theme-1","icon":"glyphicon-book"}	7aa14150-e2cc-11f1-87a6-06295b567284	3	
be630b1b-e2d1-11f1-87a6-06295b567284	App Cursos	appCursos			2026-11-17 21:18:48.378	admin	2026-11-17 21:56:29.54	admin	\N	9	{"models":[{"id":"07465075-e1d8-11f1-b51a-4227cbba929c","name":"Organizar curso de capacitación","version":1,"modelType":0,"description":"Modelo conceptual, no ejecutable. Los recordatorios se cuentan por versión de propuesta. La fecha programada se obtiene de la propuesta aceptada. Para cada participante se espera una respuesta de encuesta; el enunciado no fija un vencimiento. La empresa se representa como pool de caja negra; los mensajes internos del subproceso se expresan con tareas de envío/recepción y eventos de mensaje.","stencilSetId":null,"createdBy":"admin","lastUpdatedBy":"admin","lastUpdated":"2026-11-17T20:39:02.230+00:00"}],"theme":"theme-1","icon":"glyphicon-book"}	7aa14150-e2cc-11f1-87a6-06295b567284	3	
\.


--
-- Data for Name: act_de_model_relation; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_de_model_relation (id, parent_model_id, model_id, relation_type) FROM stdin;
f5498de1-e2cc-11f1-87a6-06295b567284	7aa14150-e2cc-11f1-87a6-06295b567284	07465075-e1d8-11f1-b51a-4227cbba929c	process-model
b7a14e9a-e2d1-11f1-87a6-06295b567284	07465075-e1d8-11f1-b51a-4227cbba929c	113178bf-e2c7-11f1-87a6-06295b567284	decision-table-model
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
1	activiti	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.535835	1	EXECUTED	8:c8701f1c71018b55029f450b2e9a10a1	createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE		\N	4.9.0	\N	\N	4844472384
2	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.567847	2	EXECUTED	8:47f94b27feb7df8a30d4e338c7bd5fb8	createTable tableName=ACT_DMN_HI_DECISION_EXECUTION		\N	4.9.0	\N	\N	4844472384
3	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.578627	3	EXECUTED	8:ac17eae89fbdccb6e08daf3c7797b579	addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION		\N	4.9.0	\N	\N	4844472384
4	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.587806	4	EXECUTED	8:f73aabc4529e7292c2942073d1cff6f9	dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE		\N	4.9.0	\N	\N	4844472384
6	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.599266	5	EXECUTED	8:646c6a061e0b6e8a62e69844ff96abb0	createIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE		\N	4.9.0	\N	\N	4844472384
7	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.61671	6	EXECUTED	8:215a499ff7ae77685b55355245b8b708	dropIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE; renameTable newTableName=ACT_DMN_DECISION, oldTableName=ACT_DMN_DECISION_TABLE; createIndex indexName=ACT_IDX_DMN_DEC_UNIQ, tableName=ACT_DMN_DECISION		\N	4.9.0	\N	\N	4844472384
8	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.637707	7	EXECUTED	8:5355bee389318afed91a11702f2df032	addColumn tableName=ACT_DMN_DECISION		\N	4.9.0	\N	\N	4844472384
9	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.658754	8	EXECUTED	8:0fe82086431b1953d293f0199f805876	createIndex indexName=ACT_IDX_DMN_INSTANCE_ID, tableName=ACT_DMN_HI_DECISION_EXECUTION		\N	4.9.0	\N	\N	4844472384
1	activiti	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.535835	1	EXECUTED	8:c8701f1c71018b55029f450b2e9a10a1	createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE		\N	4.9.0	\N	\N	4844472384
2	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.567847	2	EXECUTED	8:47f94b27feb7df8a30d4e338c7bd5fb8	createTable tableName=ACT_DMN_HI_DECISION_EXECUTION		\N	4.9.0	\N	\N	4844472384
3	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.578627	3	EXECUTED	8:ac17eae89fbdccb6e08daf3c7797b579	addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION		\N	4.9.0	\N	\N	4844472384
4	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.587806	4	EXECUTED	8:f73aabc4529e7292c2942073d1cff6f9	dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE		\N	4.9.0	\N	\N	4844472384
6	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.599266	5	EXECUTED	8:646c6a061e0b6e8a62e69844ff96abb0	createIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE		\N	4.9.0	\N	\N	4844472384
7	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.61671	6	EXECUTED	8:215a499ff7ae77685b55355245b8b708	dropIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE; renameTable newTableName=ACT_DMN_DECISION, oldTableName=ACT_DMN_DECISION_TABLE; createIndex indexName=ACT_IDX_DMN_DEC_UNIQ, tableName=ACT_DMN_DECISION		\N	4.9.0	\N	\N	4844472384
8	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.637707	7	EXECUTED	8:5355bee389318afed91a11702f2df032	addColumn tableName=ACT_DMN_DECISION		\N	4.9.0	\N	\N	4844472384
9	flowable	org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml	2026-11-16 15:54:32.658754	8	EXECUTED	8:0fe82086431b1953d293f0199f805876	createIndex indexName=ACT_IDX_DMN_INSTANCE_ID, tableName=ACT_DMN_HI_DECISION_EXECUTION		\N	4.9.0	\N	\N	4844472384
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
bea480f8-e2d1-11f1-87a6-06295b567284	Evaluar Vialidad Cursos	1	decisionVialidad	\N	bea19ac6-e2d1-11f1-87a6-06295b567284		dmn-decisionVialidad.dmn	\N	decision_table
\.


--
-- Data for Name: act_dmn_deployment; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_dmn_deployment (id_, name_, category_, deploy_time_, tenant_id_, parent_deployment_id_) FROM stdin;
bea19ac6-e2d1-11f1-87a6-06295b567284	App Cursos	\N	2026-11-17 21:56:29.95		be67c60c-e2d1-11f1-87a6-06295b567284
\.


--
-- Data for Name: act_dmn_deployment_resource; Type: TABLE DATA; Schema: public; Owner: flowable
--

COPY public.act_dmn_deployment_resource (id_, name_, deployment_id_, resource_bytes_) FROM stdin;
bea19ac7-e2d1-11f1-87a6-06295b567284	dmn-decisionVialidad.dmn	bea19ac6-e2d1-11f1-87a6-06295b567284	\\x3c646566696e6974696f6e7320786d6c6e733d2268747470733a2f2f7777772e6f6d672e6f72672f737065632f444d4e2f32303139313131312f4d4f44454c2f2220786d6c6e733a646d6e64693d2268747470733a2f2f7777772e6f6d672e6f72672f737065632f444d4e2f32303139313131312f444d4e44492f2220786d6c6e733a64633d22687474703a2f2f7777772e6f6d672e6f72672f737065632f444d4e2f32303138303532312f44432f2220786d6c6e733a64693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f444d4e2f32303138303532312f44492f222069643d22646566696e6974696f6e5f31313331373862662d653263372d313166312d383761362d30363239356235363732383422206e616d653d224576616c756172205669616c6964616420437572736f7322206e616d6573706163653d22687474703a2f2f7777772e666c6f7761626c652e6f72672f646d6e22206578706f727465723d22466c6f7761626c65204f70656e20536f75726365204d6f64656c657222206578706f7274657256657273696f6e3d22362e382e30223e0a20203c6465636973696f6e2069643d226465636973696f6e5669616c6964616422206e616d653d224576616c756172205669616c6964616420437572736f73223e0a202020203c6465636973696f6e5461626c652069643d226465636973696f6e5461626c655f64336336303663302d386538392d346631322d623638652d3665626136656165396463382220686974506f6c6963793d224649525354223e0a2020202020203c696e7075743e0a20202020202020203c696e70757445787072657373696f6e2069643d22696e70757445787072657373696f6e5f39623561333863642d336365662d343564382d386531612d6130646135396464356239372220747970655265663d226e756d626572223e0a202020202020202020203c746578743e6f74726173496e7374616e636961733c2f746578743e0a20202020202020203c2f696e70757445787072657373696f6e3e0a2020202020203c2f696e7075743e0a2020202020203c6f75747075742069643d226f757470757445787072657373696f6e5f63313736653264632d333731382d343363382d383237392d36303533663439316465343922206e616d653d22766961626c652220747970655265663d22626f6f6c65616e223e3c2f6f75747075743e0a2020202020203c72756c653e0a20202020202020203c696e707574456e7472792069643d22696e707574456e7472795f39623561333863642d336365662d343564382d386531612d6130646135396464356239375f31223e0a202020202020202020203c746578743e3c215b43444154415b3c20355d5d3e3c2f746578743e0a20202020202020203c2f696e707574456e7472793e0a20202020202020203c6f7574707574456e7472792069643d226f7574707574456e7472795f63313736653264632d333731382d343363382d383237392d3630353366343931646534395f31223e0a202020202020202020203c746578743e3c215b43444154415b747275655d5d3e3c2f746578743e0a20202020202020203c2f6f7574707574456e7472793e0a2020202020203c2f72756c653e0a2020202020203c72756c653e0a20202020202020203c696e707574456e7472792069643d22696e707574456e7472795f39623561333863642d336365662d343564382d386531612d6130646135396464356239375f32223e0a202020202020202020203c746578743e3c215b43444154415b3e3d20355d5d3e3c2f746578743e0a20202020202020203c2f696e707574456e7472793e0a20202020202020203c6f7574707574456e7472792069643d226f7574707574456e7472795f63313736653264632d333731382d343363382d383237392d3630353366343931646534395f32223e0a202020202020202020203c746578743e3c215b43444154415b66616c73655d5d3e3c2f746578743e0a20202020202020203c2f6f7574707574456e7472793e0a2020202020203c2f72756c653e0a202020203c2f6465636973696f6e5461626c653e0a20203c2f6465636973696f6e3e0a20203c646d6e64693a444d4e44493e3c2f646d6e64693a444d4e44493e0a3c2f646566696e6974696f6e733e
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
1	activiti	org/flowable/form/db/liquibase/flowable-form-db-changelog.xml	2026-11-16 15:54:32.860558	1	EXECUTED	8:033ebf9380889aed7c453927ecc3250d	createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE		\N	4.9.0	\N	\N	4844472793
2	flowable	org/flowable/form/db/liquibase/flowable-form-db-changelog.xml	2026-11-16 15:54:32.871312	2	EXECUTED	8:986365ceb40445ce3b27a8e6b40f159b	addColumn tableName=ACT_FO_FORM_INSTANCE		\N	4.9.0	\N	\N	4844472793
3	flowable	org/flowable/form/db/liquibase/flowable-form-db-changelog.xml	2026-11-16 15:54:32.878876	3	EXECUTED	8:abf482518ceb09830ef674e52c06bf15	dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION		\N	4.9.0	\N	\N	4844472793
5	flowable	org/flowable/form/db/liquibase/flowable-form-db-changelog.xml	2026-11-16 15:54:32.890141	4	EXECUTED	8:b4be732b89e5ca028bdd520c6ad4d446	createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION		\N	4.9.0	\N	\N	4844472793
6	flowable	org/flowable/form/db/liquibase/flowable-form-db-changelog.xml	2026-11-16 15:54:32.906411	5	EXECUTED	8:384bbd364a649b67c3ca1bcb72fe537f	createIndex indexName=ACT_IDX_FORM_TASK, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_PROC, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_SCOPE, tableName=ACT_FO_FORM_INSTANCE		\N	4.9.0	\N	\N	4844472793
1	activiti	org/flowable/form/db/liquibase/flowable-form-db-changelog.xml	2026-11-16 15:54:32.860558	1	EXECUTED	8:033ebf9380889aed7c453927ecc3250d	createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE		\N	4.9.0	\N	\N	4844472793
2	flowable	org/flowable/form/db/liquibase/flowable-form-db-changelog.xml	2026-11-16 15:54:32.871312	2	EXECUTED	8:986365ceb40445ce3b27a8e6b40f159b	addColumn tableName=ACT_FO_FORM_INSTANCE		\N	4.9.0	\N	\N	4844472793
3	flowable	org/flowable/form/db/liquibase/flowable-form-db-changelog.xml	2026-11-16 15:54:32.878876	3	EXECUTED	8:abf482518ceb09830ef674e52c06bf15	dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION		\N	4.9.0	\N	\N	4844472793
5	flowable	org/flowable/form/db/liquibase/flowable-form-db-changelog.xml	2026-11-16 15:54:32.890141	4	EXECUTED	8:b4be732b89e5ca028bdd520c6ad4d446	createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION		\N	4.9.0	\N	\N	4844472793
6	flowable	org/flowable/form/db/liquibase/flowable-form-db-changelog.xml	2026-11-16 15:54:32.906411	5	EXECUTED	8:384bbd364a649b67c3ca1bcb72fe537f	createIndex indexName=ACT_IDX_FORM_TASK, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_PROC, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_SCOPE, tableName=ACT_FO_FORM_INSTANCE		\N	4.9.0	\N	\N	4844472793
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
be681432-e2d1-11f1-87a6-06295b567284	1	Process_Curso.bpmn	be681431-e2d1-11f1-87a6-06295b567284	\\x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c646566696e6974696f6e7320786d6c6e733d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f4d4f44454c2220786d6c6e733a7873693d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d612d696e7374616e63652220786d6c6e733a7873643d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d612220786d6c6e733a666c6f7761626c653d22687474703a2f2f666c6f7761626c652e6f72672f62706d6e2220786d6c6e733a62706d6e64693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f44492220786d6c6e733a6f6d6764633d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f44432220786d6c6e733a6f6d6764693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f44492220747970654c616e67756167653d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d61222065787072657373696f6e4c616e67756167653d22687474703a2f2f7777772e77332e6f72672f313939392f585061746822207461726765744e616d6573706163653d22687474703a2f2f666c6f7761626c652e6f72672f7465737422206578706f727465723d22466c6f7761626c65204f70656e20536f75726365204d6f64656c657222206578706f7274657256657273696f6e3d22362e382e30223e0a20203c636f6c6c61626f726174696f6e2069643d22436f6c6c61626f726174696f6e223e0a202020203c7061727469636970616e742069643d22506f6f6c5f496e737469747563696f6e22206e616d653d22496e73746974756369c3b36e2064652063617061636974616369c3b36e222070726f636573735265663d2250726f636573735f437572736f223e3c2f7061727469636970616e743e0a20203c2f636f6c6c61626f726174696f6e3e0a20203c6d6573736167652069643d224d73675f736f6c22206e616d653d22536f6c69636974756420646520637572736f223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f70726f7022206e616d653d2250726f707565737461223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f61636570746122206e616d653d224163657074616369c3b36e223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f72656368617a6122206e616d653d2252656368617a6f223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f6d6f6422206e616d653d22536f6c696369747564206465206d6f64696669636163696f6e6573223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f7265636f726422206e616d653d225265636f726461746f72696f223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f6e6f6d22206e616d653d224ec3b36d696e61206465207061727469636970616e746573223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f636f727222206e616d653d22436f727265636369c3b36e206465206461746f73223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f706564636f727222206e616d653d22536f6c69636974756420646520636f727265636369c3b36e223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f636f6e73756c746122206e616d653d22436f6e73756c7461206465206176616e6365223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f7265737022206e616d653d22526573707565737461206465206176616e6365223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f63616e63656c22206e616d653d2243616e63656c616369c3b36e223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f63696572726522206e616d653d224e6f7469666963616369c3b36e20646520636965727265223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f636f6e6622206e616d653d22436f6e6669726d616369c3b36e2064656c20637572736f223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f656e6322206e616d653d22456e637565737461223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f726573656e6322206e616d653d2252657370756573746120646520656e637565737461223e3c2f6d6573736167653e0a20203c6d6573736167652069643d224d73675f696e666f726d6522206e616d653d22496e666f726d6520646520726573756c7461646f73223e3c2f6d6573736167653e0a20203c70726f636573732069643d2250726f636573735f437572736f22206e616d653d22496e73746974756369c3b36e2064652063617061636974616369c3b36e2220697345786563757461626c653d2274727565223e0a202020203c6c616e655365742069643d226c616e655365745f50726f636573735f437572736f223e0a2020202020203c6c616e652069643d224c616e655f3073713570686c22206e616d653d22446f63656e746573223e0a20202020202020203c666c6f774e6f64655265663e4469637461723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e46656368613c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e496e666f726d653c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e41637469766974795f3130313862647a3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e46656368614469637461723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f3173646a6568363c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e496e666f726d65456e766961723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f306c7363696a6b3c2f666c6f774e6f64655265663e0a2020202020203c2f6c616e653e0a2020202020203c6c616e652069643d224c616e655f303479767a7a7a22206e616d653d2241646d696e69737472616369c3b36e223e0a20202020202020203c666c6f774e6f64655265663e457370657261723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e496e6963696f3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e5265636f726461746f72696f3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e4c696d6974653c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e506c617a6f3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e416365707461723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e4d6f646966696361723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e41637469766974795f313265306574313c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e4576656e745f3077326b6974663c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e41726368697661723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e46696e53696e437572736f3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e52656368617a61723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e50726570617261723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e4576656e745f306661726675723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e50726f7075657374613c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e476174657761795f3130676674726e3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e4576656e745f313865646239713c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e41637469766974795f306969627a77753c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e436f6e6669726d61723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e46696e3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e526576697361723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e456e76696172496e666f726d653c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e41637469766974795f316567377a636c3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e456e766961723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e41637469766974795f3178773430306c3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e6d61696e333c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e566f6c766572457370657261723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e77616974333c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e77616974303c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e77616974313c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e77616974323c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e436572726172536f6c6963697475643c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e6d61696e323c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f30757062786e353c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e4f74726f5265636f72643c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e506c617a6f4c696d6974653c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e53696e5265737075657374613c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e52656368617a61646f3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e4d6f6469666963617250726f703c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f31373574316a333c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f31796d773571653c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e50726570617261646f3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e496e666f726d6541726368697661723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f306738766d396c3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f306b626e6d31643c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f303076653937723c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f31746f70616d6a3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f303568773568753c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f316666707767613c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f307738786e336c3c2f666c6f774e6f64655265663e0a20202020202020203c666c6f774e6f64655265663e466c6f775f306b33386439673c2f666c6f774e6f64655265663e0a2020202020203c2f6c616e653e0a202020203c2f6c616e655365743e0a202020203c757365725461736b2069643d2244696374617222206e616d653d224465736172726f6c6c617220637572736f2220666c6f7761626c653a61737369676e65653d22247b646f63656e746553656c656363696f6e61646f7d2220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a2020202020203c657874656e73696f6e456c656d656e74733e0a20202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a2020202020203c2f657874656e73696f6e456c656d656e74733e0a202020203c2f757365725461736b3e0a202020203c696e7465726d65646961746543617463684576656e742069643d22466563686122206e616d653d2246656368612070726f6772616d616461223e0a2020202020203c74696d65724576656e74446566696e6974696f6e3e0a20202020202020203c74696d65446174653e247b6665636861437572736f7d3c2f74696d65446174653e0a2020202020203c2f74696d65724576656e74446566696e6974696f6e3e0a202020203c2f696e7465726d65646961746543617463684576656e743e0a202020203c757365725461736b2069643d22496e666f726d6522206e616d653d22456c61626f72617220696e666f726d6520646520726573756c7461646f732220666c6f7761626c653a63616e64696461746555736572733d227465616368696e675f6c65616465722220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a2020202020203c657874656e73696f6e456c656d656e74733e0a20202020202020203c6d6f64656c65723a757365722d696e666f2d656d61696c2d7465616368696e675f6c656164657220786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b7465616368696e676c656164657240676d61696c2e636f6d5d5d3e3c2f6d6f64656c65723a757365722d696e666f2d656d61696c2d7465616368696e675f6c65616465723e0a20202020202020203c6d6f64656c65723a757365722d696e666f2d66697273746e616d652d7465616368696e675f6c656164657220786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b7465616368696e675d5d3e3c2f6d6f64656c65723a757365722d696e666f2d66697273746e616d652d7465616368696e675f6c65616465723e0a20202020202020203c6d6f64656c65723a757365722d696e666f2d6c6173746e616d652d7465616368696e675f6c656164657220786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b6c65616465725d5d3e3c2f6d6f64656c65723a757365722d696e666f2d6c6173746e616d652d7465616368696e675f6c65616465723e0a20202020202020203c6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d7573657220786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d757365723e0a20202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a2020202020203c2f657874656e73696f6e456c656d656e74733e0a202020203c2f757365725461736b3e0a202020203c757365725461736b2069643d2241637469766974795f3130313862647a22206e616d653d22446566696e697220446f63656e746520717565206465736172726f6c6c6120656c20637572736f2220666c6f7761626c653a61737369676e65653d227465616368696e675f6c65616465722220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a2020202020203c657874656e73696f6e456c656d656e74733e0a20202020202020203c6d6f64656c65723a61637469766974692d69646d2d61737369676e656520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d61737369676e65653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d656d61696c20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b7465616368696e676c656164657240676d61696c2e636f6d5d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d656d61696c3e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b7465616368696e675d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b6c65616465725d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d653e0a20202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a2020202020203c2f657874656e73696f6e456c656d656e74733e0a202020203c2f757365725461736b3e0a202020203c6576656e744261736564476174657761792069643d224573706572617222206e616d653d224573706572617220726573707565737461223e3c2f6576656e744261736564476174657761793e0a202020203c73746172744576656e742069643d22496e6963696f22206e616d653d22536f6c69636974756420726563696269646122206973496e74657272757074696e673d2274727565223e0a2020202020203c6d6573736167654576656e74446566696e6974696f6e206d6573736167655265663d224d73675f736f6c2220666c6f7761626c653a6d65737361676545787072657373696f6e3d22736f6c6963697475644d7367223e3c2f6d6573736167654576656e74446566696e6974696f6e3e0a202020203c2f73746172744576656e743e0a202020203c7363726970745461736b2069643d225265636f726461746f72696f22206e616d653d22456e76696172207265636f726461746f72696f2220736372697074466f726d61743d2267726f6f76792220666c6f7761626c653a6175746f53746f72655661726961626c65733d2266616c7365223e0a2020202020203c7363726970743e3c215b43444154415b2f2f2070656e6469656e74655d5d3e3c2f7363726970743e0a202020203c2f7363726970745461736b3e0a202020203c6578636c7573697665476174657761792069643d224c696d69746522206e616d653d22c2bf536520656e766961726f6e2032207265636f726461746f72696f733f223e3c2f6578636c7573697665476174657761793e0a202020203c696e7465726d65646961746543617463684576656e742069643d22506c617a6f22206e616d653d22352064c3ad6173223e0a2020202020203c74696d65724576656e74446566696e6974696f6e3e0a20202020202020203c74696d654475726174696f6e3e5035443c2f74696d654475726174696f6e3e0a2020202020203c2f74696d65724576656e74446566696e6974696f6e3e0a202020203c2f696e7465726d65646961746543617463684576656e743e0a202020203c696e7465726d65646961746543617463684576656e742069643d224163657074617222206e616d653d224163657074616369c3b36e223e0a2020202020203c6d6573736167654576656e74446566696e6974696f6e206d6573736167655265663d224d73675f6163657074612220666c6f7761626c653a6d65737361676545787072657373696f6e3d2261636570746163696f6e4d7367223e3c2f6d6573736167654576656e74446566696e6974696f6e3e0a202020203c2f696e7465726d65646961746543617463684576656e743e0a202020203c696e7465726d65646961746543617463684576656e742069643d224d6f6469666963617222206e616d653d224d6f64696669636163696f6e6573223e0a2020202020203c6d6573736167654576656e74446566696e6974696f6e206d6573736167655265663d224d73675f6d6f642220666c6f7761626c653a6d65737361676545787072657373696f6e3d226d6f64696669636163696f6e65734d7367223e3c2f6d6573736167654576656e74446566696e6974696f6e3e0a202020203c2f696e7465726d65646961746543617463684576656e743e0a202020203c7363726970745461736b2069643d2241637469766974795f3132653065743122206e616d653d224e6f74696669636172204369657272652220736372697074466f726d61743d2267726f6f76792220666c6f7761626c653a6175746f53746f72655661726961626c65733d2266616c7365223e0a2020202020203c7363726970743e3c215b43444154415b2f2f2070656e6469656e74655d5d3e3c2f7363726970743e0a202020203c2f7363726970745461736b3e0a202020203c656e644576656e742069643d224576656e745f3077326b697466223e3c2f656e644576656e743e0a202020203c757365725461736b2069643d22417263686976617222206e616d653d22417263686976617220736f6c6963697475642220666c6f7761626c653a61737369676e65653d2261646d696e5f626f73732220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a2020202020203c657874656e73696f6e456c656d656e74733e0a20202020202020203c6d6f64656c65723a61637469766974692d69646d2d61737369676e656520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d61737369676e65653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d656d61696c20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b61646d696e5f626f737340676d61696c2e636f6d5d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d656d61696c3e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b61646d696e5d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b626f73735d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d653e0a20202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a2020202020203c2f657874656e73696f6e456c656d656e74733e0a202020203c2f757365725461736b3e0a202020203c656e644576656e742069643d2246696e53696e437572736f22206e616d653d22536f6c6963697475642063657272616461223e3c2f656e644576656e743e0a202020203c696e7465726d65646961746543617463684576656e742069643d2252656368617a617222206e616d653d2252656368617a6f223e0a2020202020203c6d6573736167654576656e74446566696e6974696f6e206d6573736167655265663d224d73675f72656368617a612220666c6f7761626c653a6d65737361676545787072657373696f6e3d2272656368617a6f4d7367223e3c2f6d6573736167654576656e74446566696e6974696f6e3e0a202020203c2f696e7465726d65646961746543617463684576656e743e0a202020203c73756250726f636573732069643d22507265706172617222206e616d653d22507265706172617220637572736f223e0a2020202020203c73746172744576656e742069643d22537562496e6963696f2220666c6f7761626c653a696e69746961746f723d22696e69746961746f722220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e3c2f73746172744576656e743e0a2020202020203c706172616c6c656c476174657761792069643d22506172496e6963696f22206e616d653d22507265706172616369c3b36e20656e20706172616c656c6f223e3c2f706172616c6c656c476174657761793e0a2020202020203c726563656976655461736b2069643d224e6f6d696e6122206e616d653d2252656369626972206ec3b36d696e61223e3c2f726563656976655461736b3e0a2020202020203c757365725461736b2069643d224c6973746122206e616d653d22436f6e66656363696f6e6172206c6973746120646566696e69746976612220666c6f7761626c653a63616e64696461746547726f7570733d2261646d2220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a20202020202020203c657874656e73696f6e456c656d656e74733e0a202020202020202020203c6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b41646d696e69737472616369c3b36e5d5d3e3c2f6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d3e0a202020202020202020203c6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f757020786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f75703e0a202020202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a20202020202020203c2f657874656e73696f6e456c656d656e74733e0a2020202020203c2f757365725461736b3e0a2020202020203c757365725461736b2069643d224d6174657269616c22206e616d653d225072657061726172206d6174657269616c65732220666c6f7761626c653a63616e64696461746547726f7570733d2261646d2220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a20202020202020203c657874656e73696f6e456c656d656e74733e0a202020202020202020203c6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b41646d696e69737472616369c3b36e5d5d3e3c2f6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d3e0a202020202020202020203c6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f757020786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f75703e0a202020202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a20202020202020203c2f657874656e73696f6e456c656d656e74733e0a2020202020203c2f757365725461736b3e0a2020202020203c696e636c7573697665476174657761792069643d224f72496e6963696f22206e616d653d225265637572736f73206e656365736172696f73223e3c2f696e636c7573697665476174657761793e0a2020202020203c757365725461736b2069643d225669727475616c22206e616d653d22536f6c6963697461722041756c61205669727475616c2220666c6f7761626c653a63616e64696461746547726f7570733d2261646d2220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a20202020202020203c657874656e73696f6e456c656d656e74733e0a202020202020202020203c6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b41646d696e69737472616369c3b36e5d5d3e3c2f6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d3e0a202020202020202020203c6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f757020786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f75703e0a202020202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a20202020202020203c2f657874656e73696f6e456c656d656e74733e0a2020202020203c2f757365725461736b3e0a2020202020203c757365725461736b2069643d2245717569706f22206e616d653d22436f6e747261746172206571756970616d69656e746f2220666c6f7761626c653a63616e64696461746547726f7570733d2261646d2220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a20202020202020203c657874656e73696f6e456c656d656e74733e0a202020202020202020203c6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b41646d696e69737472616369c3b36e5d5d3e3c2f6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d3e0a202020202020202020203c6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f757020786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f75703e0a202020202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a20202020202020203c2f657874656e73696f6e456c656d656e74733e0a2020202020203c2f757365725461736b3e0a2020202020203c696e636c7573697665476174657761792069643d224f7246696e22206e616d653d22546f646f73206c6f73207265637572736f732073656c656363696f6e61646f73206c6973746f73223e3c2f696e636c7573697665476174657761793e0a2020202020203c706172616c6c656c476174657761792069643d2250617246696e22206e616d653d22507265706172616369c3b36e20636f6d706c657461223e3c2f706172616c6c656c476174657761793e0a2020202020203c656e644576656e742069643d2253756246696e223e3c2f656e644576656e743e0a2020202020203c757365725461736b2069643d2241637469766974795f3132693268706622206e616d653d224576616c7561720a5265637572736f732220666c6f7761626c653a63616e64696461746547726f7570733d2261646d2220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a20202020202020203c657874656e73696f6e456c656d656e74733e0a202020202020202020203c6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b41646d696e69737472616369c3b36e5d5d3e3c2f6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d3e0a202020202020202020203c6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f757020786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f75703e0a202020202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a20202020202020203c2f657874656e73696f6e456c656d656e74733e0a2020202020203c2f757365725461736b3e0a2020202020203c73756250726f636573732069643d2241637469766974795f3034386435656d22206e616d653d2243616e63656c616369c3b36e222074726967676572656442794576656e743d2274727565223e0a20202020202020203c696e7465726d6564696174655468726f774576656e742069643d224576656e745f3172766f346b36223e0a202020202020202020203c636f6d70656e736174654576656e74446566696e6974696f6e3e3c2f636f6d70656e736174654576656e74446566696e6974696f6e3e0a20202020202020203c2f696e7465726d6564696174655468726f774576656e743e0a20202020202020203c73746172744576656e742069643d224576656e745f316734786d716f22206e616d653d22526563696269722043616e63656c616369c3b36e22206973496e74657272757074696e673d2274727565223e0a202020202020202020203c6d6573736167654576656e74446566696e6974696f6e20666c6f7761626c653a6d65737361676545787072657373696f6e3d2263616e63656c6163696f6e4d7367223e3c2f6d6573736167654576656e74446566696e6974696f6e3e0a20202020202020203c2f73746172744576656e743e0a20202020202020203c656e644576656e742069643d224576656e745f30736e69676263223e0a202020202020202020203c6572726f724576656e74446566696e6974696f6e20666c6f7761626c653a6572726f725661726961626c654c6f63616c53636f70653d2266616c73652220666c6f7761626c653a6572726f725661726961626c655472616e7369656e743d2266616c7365223e3c2f6572726f724576656e74446566696e6974696f6e3e0a20202020202020203c2f656e644576656e743e0a20202020202020203c73657175656e6365466c6f772069643d22466c6f775f30393970716c652220736f757263655265663d224576656e745f316734786d716f22207461726765745265663d224576656e745f3172766f346b36223e3c2f73657175656e6365466c6f773e0a20202020202020203c73657175656e6365466c6f772069643d22466c6f775f306835736935662220736f757263655265663d224576656e745f3172766f346b3622207461726765745265663d224576656e745f30736e69676263223e3c2f73657175656e6365466c6f773e0a2020202020203c2f73756250726f636573733e0a2020202020203c626f756e646172794576656e742069643d224576656e745f3167737971657222206174746163686564546f5265663d225669727475616c222063616e63656c41637469766974793d2266616c7365223e0a20202020202020203c636f6d70656e736174654576656e74446566696e6974696f6e3e3c2f636f6d70656e736174654576656e74446566696e6974696f6e3e0a2020202020203c2f626f756e646172794576656e743e0a2020202020203c626f756e646172794576656e742069643d224576656e745f3179706363316a22206174746163686564546f5265663d2245717569706f222063616e63656c41637469766974793d2266616c7365223e0a20202020202020203c636f6d70656e736174654576656e74446566696e6974696f6e3e3c2f636f6d70656e736174654576656e74446566696e6974696f6e3e0a2020202020203c2f626f756e646172794576656e743e0a2020202020203c757365725461736b2069643d2241637469766974795f316d303870636c22206e616d653d224c696265726172204571756970616d69656e746f22206973466f72436f6d70656e736174696f6e3d22747275652220666c6f7761626c653a63616e64696461746547726f7570733d2261646d2220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a20202020202020203c657874656e73696f6e456c656d656e74733e0a202020202020202020203c6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b41646d696e69737472616369c3b36e5d5d3e3c2f6d6f64656c65723a67726f75702d696e666f2d6e616d652d61646d3e0a202020202020202020203c6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f757020786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d63616e6469646174652d67726f75703e0a202020202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a20202020202020203c2f657874656e73696f6e456c656d656e74733e0a2020202020203c2f757365725461736b3e0a2020202020203c736572766963655461736b2069643d2241756c6122206e616d653d2252657365727661722061756c612220666c6f7761626c653a65787072657373696f6e3d22247b747275657d223e3c2f736572766963655461736b3e0a2020202020203c736572766963655461736b2069643d2241637469766974795f31367a7a39317022206e616d653d224c6962657261722041756c6122206973466f72436f6d70656e736174696f6e3d22747275652220666c6f7761626c653a65787072657373696f6e3d22247b747275657d223e3c2f736572766963655461736b3e0a2020202020203c7363726970745461736b2069643d2241637469766974795f303268726f6f6322206e616d653d224c6962657261722041756c61205669727475616c22206973466f72436f6d70656e736174696f6e3d22747275652220736372697074466f726d61743d2267726f6f76792220666c6f7761626c653a6175746f53746f72655661726961626c65733d2266616c7365223e0a20202020202020203c7363726970743e3c215b43444154415b2f2f2070656e6469656e74655d5d3e3c2f7363726970743e0a2020202020203c2f7363726970745461736b3e0a2020202020203c626f756e646172794576656e742069643d227369642d46464231303331302d314543372d343743432d384637312d36323744384443304445384622206174746163686564546f5265663d2241756c61222063616e63656c41637469766974793d2266616c7365223e0a20202020202020203c636f6d70656e736174654576656e74446566696e6974696f6e3e3c2f636f6d70656e736174654576656e74446566696e6974696f6e3e0a2020202020203c2f626f756e646172794576656e743e0a2020202020203c73657175656e6365466c6f772069643d2273312220736f757263655265663d22537562496e6963696f22207461726765745265663d22506172496e6963696f223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d2273322220736f757263655265663d22506172496e6963696f22207461726765745265663d224e6f6d696e61223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d2273352220736f757263655265663d22506172496e6963696f22207461726765745265663d224d6174657269616c223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d2273362220736f757263655265663d22506172496e6963696f22207461726765745265663d2241637469766974795f31326932687066223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d226f723022206e616d653d2250726573656e6369616c2220736f757263655265663d224f72496e6963696f22207461726765745265663d2241756c61223e0a20202020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e3c215b43444154415b247b726571756965726541756c617d5d5d3e3c2f636f6e646974696f6e45787072657373696f6e3e0a2020202020203c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d226f6a302220736f757263655265663d2241756c6122207461726765745265663d224f7246696e223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d226f723122206e616d653d225669727475616c2220736f757263655265663d224f72496e6963696f22207461726765745265663d225669727475616c223e0a20202020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e3c215b43444154415b247b7265717569657265506c617461666f726d617d5d5d3e3c2f636f6e646974696f6e45787072657373696f6e3e0a2020202020203c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d226f6a312220736f757263655265663d225669727475616c22207461726765745265663d224f7246696e223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d226f723222206e616d653d224571756970616d69656e746f20657370656369616c2220736f757263655265663d224f72496e6963696f22207461726765745265663d2245717569706f223e0a20202020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e3c215b43444154415b247b72657175696572654571756970616d69656e746f7d5d5d3e3c2f636f6e646974696f6e45787072657373696f6e3e0a2020202020203c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d226f6a322220736f757263655265663d2245717569706f22207461726765745265663d224f7246696e223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d227331312220736f757263655265663d224f7246696e22207461726765745265663d2250617246696e223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d227331322220736f757263655265663d2250617246696e22207461726765745265663d2253756246696e223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d22466c6f775f307236686379622220736f757263655265663d2241637469766974795f3132693268706622207461726765745265663d224f72496e6963696f223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d22466c6f775f307062736176322220736f757263655265663d224d6174657269616c22207461726765745265663d2250617246696e223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d22466c6f775f317130396f71392220736f757263655265663d224c6973746122207461726765745265663d2250617246696e223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d22466c6f775f316a39313767332220736f757263655265663d224e6f6d696e6122207461726765745265663d224c69737461223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d224173736f63696174696f6e5f306f716f6861782220736f757263655265663d224576656e745f3179706363316a22207461726765745265663d2241637469766974795f316d303870636c223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d224173736f63696174696f6e5f306636666e76772220736f757263655265663d224576656e745f3167737971657222207461726765745265663d2241637469766974795f303268726f6f63223e3c2f73657175656e6365466c6f773e0a2020202020203c73657175656e6365466c6f772069643d224173736f63696174696f6e5f3166683637786e2220736f757263655265663d227369642d46464231303331302d314543372d343743432d384637312d36323744384443304445384622207461726765745265663d2241637469766974795f31367a7a393170223e3c2f73657175656e6365466c6f773e0a202020203c2f73756250726f636573733e0a202020203c626f756e646172794576656e742069643d224576656e745f3066617266757222206174746163686564546f5265663d225072657061726172223e0a2020202020203c6572726f724576656e74446566696e6974696f6e20666c6f7761626c653a6572726f725661726961626c654c6f63616c53636f70653d2266616c73652220666c6f7761626c653a6572726f725661726961626c655472616e7369656e743d2266616c7365223e3c2f6572726f724576656e74446566696e6974696f6e3e0a202020203c2f626f756e646172794576656e743e0a202020203c757365725461736b2069643d2250726f70756573746122206e616d653d22526567697374726172207920456c61626f7261722070726f7075657374612220666c6f7761626c653a61737369676e65653d2261646d696e5f626f73732220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a2020202020203c657874656e73696f6e456c656d656e74733e0a20202020202020203c6d6f64656c65723a61637469766974692d69646d2d61737369676e656520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d61737369676e65653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d656d61696c20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b61646d696e5f626f737340676d61696c2e636f6d5d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d656d61696c3e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b61646d696e5d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b626f73735d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d653e0a20202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a2020202020203c2f657874656e73696f6e456c656d656e74733e0a202020203c2f757365725461736b3e0a202020203c6578636c7573697665476174657761792069643d22476174657761795f3130676674726e22206e616d653d22457320766961626c653f223e3c2f6578636c7573697665476174657761793e0a202020203c656e644576656e742069643d224576656e745f31386564623971223e3c2f656e644576656e743e0a202020203c7363726970745461736b2069643d2241637469766974795f306969627a777522206e616d653d224e6f7469666963617220446573696369c3b36e2220736372697074466f726d61743d2267726f6f76792220666c6f7761626c653a6175746f53746f72655661726961626c65733d2266616c7365223e0a2020202020203c7363726970743e3c215b43444154415b2f2f2070656e6469656e74655d5d3e3c2f7363726970743e0a202020203c2f7363726970745461736b3e0a202020203c7363726970745461736b2069643d22436f6e6669726d617222206e616d653d22456e7669617220636f6e6669726d616369c3b36e2220736372697074466f726d61743d2267726f6f76792220666c6f7761626c653a6175746f53746f72655661726961626c65733d2266616c7365223e0a2020202020203c7363726970743e3c215b43444154415b2f2f2070656e6469656e74655d5d3e3c2f7363726970743e0a202020203c2f7363726970745461736b3e0a202020203c656e644576656e742069643d2246696e22206e616d653d224c696265726172207265637572736f732e0ac2a0437572736f2066696e616c697a61646f223e3c2f656e644576656e743e0a202020203c757365725461736b2069643d225265766973617222206e616d653d22526576697361722070726f7075657374612220666c6f7761626c653a61737369676e65653d2261646d696e5f626f73732220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a2020202020203c657874656e73696f6e456c656d656e74733e0a20202020202020203c6d6f64656c65723a61637469766974692d69646d2d61737369676e656520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d61737369676e65653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d656d61696c20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b61646d696e5f626f737340676d61696c2e636f6d5d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d656d61696c3e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b61646d696e5d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b626f73735d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d653e0a20202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a2020202020203c2f657874656e73696f6e456c656d656e74733e0a202020203c2f757365725461736b3e0a202020203c757365725461736b2069643d22456e76696172496e666f726d6522206e616d653d22456e7669617220696e666f726d65206120656d7072657361207920417263686976617220657870656469656e74652e2220666c6f7761626c653a61737369676e65653d2261646d696e5f626f73732220666c6f7761626c653a666f726d4669656c6456616c69646174696f6e3d2274727565223e0a2020202020203c657874656e73696f6e456c656d656e74733e0a20202020202020203c6d6f64656c65723a61637469766974692d69646d2d61737369676e656520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b747275655d5d3e3c2f6d6f64656c65723a61637469766974692d69646d2d61737369676e65653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d656d61696c20786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b61646d696e5f626f737340676d61696c2e636f6d5d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d656d61696c3e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b61646d696e5d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d66697273746e616d653e0a20202020202020203c6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d6520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b626f73735d5d3e3c2f6d6f64656c65723a61737369676e65652d696e666f2d6c6173746e616d653e0a20202020202020203c6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c65746520786d6c6e733a6d6f64656c65723d22687474703a2f2f666c6f7761626c652e6f72672f6d6f64656c6572223e3c215b43444154415b66616c73655d5d3e3c2f6d6f64656c65723a696e69746961746f722d63616e2d636f6d706c6574653e0a2020202020203c2f657874656e73696f6e456c656d656e74733e0a202020203c2f757365725461736b3e0a202020203c7363726970745461736b2069643d2241637469766974795f316567377a636c22206e616d653d22486162696c697461722061636365736f206465206c6120656d70726573612220736372697074466f726d61743d2267726f6f76792220666c6f7761626c653a6175746f53746f72655661726961626c65733d2266616c7365223e0a2020202020203c7363726970743e3c215b43444154415b2f2f2070656e6469656e74655d5d3e3c2f7363726970743e0a202020203c2f7363726970745461736b3e0a202020203c7363726970745461736b2069643d22456e7669617222206e616d653d22456e766961722070726f7075657374612220736372697074466f726d61743d2267726f6f76792220666c6f7761626c653a6175746f53746f72655661726961626c65733d2266616c7365223e0a2020202020203c7363726970743e3c215b43444154415b2f2f2070656e6469656e74655d5d3e3c2f7363726970743e0a202020203c2f7363726970745461736b3e0a202020203c736572766963655461736b2069643d2241637469766974795f3178773430306c22206e616d653d224576616c7561722056696162696c696461642220666c6f7761626c653a747970653d22646d6e223e0a2020202020203c657874656e73696f6e456c656d656e74733e0a20202020202020203c666c6f7761626c653a6669656c64206e616d653d226465636973696f6e5461626c655265666572656e63654b6579223e0a202020202020202020203c666c6f7761626c653a737472696e673e3c215b43444154415b6465636973696f6e5669616c696461645d5d3e3c2f666c6f7761626c653a737472696e673e0a20202020202020203c2f666c6f7761626c653a6669656c643e0a20202020202020203c666c6f7761626c653a6669656c64206e616d653d226465636973696f6e5461736b5468726f774572726f724f6e4e6f48697473223e0a202020202020202020203c666c6f7761626c653a737472696e673e3c215b43444154415b66616c73655d5d3e3c2f666c6f7761626c653a737472696e673e0a20202020202020203c2f666c6f7761626c653a6669656c643e0a20202020202020203c666c6f7761626c653a6669656c64206e616d653d2266616c6c6261636b546f44656661756c7454656e616e74223e0a202020202020202020203c666c6f7761626c653a737472696e673e3c215b43444154415b66616c73655d5d3e3c2f666c6f7761626c653a737472696e673e0a20202020202020203c2f666c6f7761626c653a6669656c643e0a20202020202020203c666c6f7761626c653a6669656c64206e616d653d2273616d654465706c6f796d656e74223e0a202020202020202020203c666c6f7761626c653a737472696e673e3c215b43444154415b66616c73655d5d3e3c2f666c6f7761626c653a737472696e673e0a20202020202020203c2f666c6f7761626c653a6669656c643e0a20202020202020203c666c6f7761626c653a6465636973696f6e5265666572656e63655479706520786d6c6e733a666c6f7761626c653d22687474703a2f2f666c6f7761626c652e6f72672f62706d6e223e3c215b43444154415b6465636973696f6e536572766963655d5d3e3c2f666c6f7761626c653a6465636973696f6e5265666572656e6365547970653e0a2020202020203c2f657874656e73696f6e456c656d656e74733e0a202020203c2f736572766963655461736b3e0a202020203c73657175656e6365466c6f772069643d2246656368614469637461722220736f757263655265663d22466563686122207461726765745265663d22446963746172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f3173646a6568362220736f757263655265663d2244696374617222207461726765745265663d22496e666f726d65223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22496e666f726d65456e766961722220736f757263655265663d22496e666f726d6522207461726765745265663d22456e76696172496e666f726d65223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f306c7363696a6b2220736f757263655265663d2241637469766974795f3130313862647a22207461726765745265663d224665636861223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d226d61696e332220736f757263655265663d22456e7669617222207461726765745265663d2245737065726172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22566f6c766572457370657261722220736f757263655265663d225265636f726461746f72696f22207461726765745265663d2245737065726172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d2277616974332220736f757263655265663d224573706572617222207461726765745265663d22506c617a6f223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d2277616974302220736f757263655265663d224573706572617222207461726765745265663d2241636570746172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d2277616974312220736f757263655265663d224573706572617222207461726765745265663d2252656368617a6172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d2277616974322220736f757263655265663d224573706572617222207461726765745265663d224d6f64696669636172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22436572726172536f6c6963697475642220736f757263655265663d22417263686976617222207461726765745265663d2246696e53696e437572736f223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d226d61696e322220736f757263655265663d2250726f70756573746122207461726765745265663d22456e76696172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f30757062786e352220736f757263655265663d225265766973617222207461726765745265663d22456e76696172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d224f74726f5265636f726422206e616d653d224e6f2220736f757263655265663d224c696d69746522207461726765745265663d225265636f726461746f72696f223e0a2020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e3c215b43444154415b247b7265636f726461746f72696f73203c20327d5d5d3e3c2f636f6e646974696f6e45787072657373696f6e3e0a202020203c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22506c617a6f4c696d6974652220736f757263655265663d22506c617a6f22207461726765745265663d224c696d697465223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d2253696e52657370756573746122206e616d653d2253c3ad2220736f757263655265663d224c696d69746522207461726765745265663d224172636869766172223e0a2020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e3c215b43444154415b247b7265636f726461746f72696f73203e3d20327d5d5d3e3c2f636f6e646974696f6e45787072657373696f6e3e0a202020203c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d2252656368617a61646f2220736f757263655265663d2252656368617a617222207461726765745265663d224172636869766172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d224d6f6469666963617250726f702220736f757263655265663d224d6f6469666963617222207461726765745265663d2252657669736172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f31373574316a332220736f757263655265663d2241637469766974795f3132653065743122207461726765745265663d224576656e745f3077326b697466223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f31796d773571652220736f757263655265663d224576656e745f3066617266757222207461726765745265663d2241637469766974795f31326530657431223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d2250726570617261646f2220736f757263655265663d22507265706172617222207461726765745265663d22436f6e6669726d6172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22496e666f726d6541726368697661722220736f757263655265663d22456e76696172496e666f726d6522207461726765745265663d2246696e223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f306738766d396c2220736f757263655265663d22496e6963696f22207461726765745265663d2241637469766974795f3178773430306c223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f306b626e6d31642220736f757263655265663d2241637469766974795f3178773430306c22207461726765745265663d22476174657761795f3130676674726e223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f303076653937722220736f757263655265663d2241637469766974795f306969627a777522207461726765745265663d224576656e745f31386564623971223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f31746f70616d6a2220736f757263655265663d22436f6e6669726d617222207461726765745265663d2241637469766974795f3130313862647a223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f303568773568752220736f757263655265663d224163657074617222207461726765745265663d2241637469766974795f316567377a636c223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f316666707767612220736f757263655265663d2241637469766974795f316567377a636c22207461726765745265663d225072657061726172223e3c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f307738786e336c22206e616d653d226e6f2220736f757263655265663d22476174657761795f3130676674726e22207461726765745265663d2241637469766974795f306969627a7775223e0a2020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e3c215b43444154415b247b766961626c65203d3d2066616c73657d5d5d3e3c2f636f6e646974696f6e45787072657373696f6e3e0a202020203c2f73657175656e6365466c6f773e0a202020203c73657175656e6365466c6f772069643d22466c6f775f306b333864396722206e616d653d2273692220736f757263655265663d22476174657761795f3130676674726e22207461726765745265663d2250726f707565737461223e0a2020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e3c215b43444154415b247b766961626c65203d3d20747275657d5d5d3e3c2f636f6e646974696f6e45787072657373696f6e3e0a202020203c2f73657175656e6365466c6f773e0a20203c2f70726f636573733e0a20203c62706d6e64693a42504d4e4469616772616d2069643d2242504d4e4469616772616d5f436f6c6c61626f726174696f6e223e0a202020203c62706d6e64693a42504d4e506c616e652062706d6e456c656d656e743d22436f6c6c61626f726174696f6e222069643d2242504d4e506c616e655f436f6c6c61626f726174696f6e223e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22506f6f6c5f496e737469747563696f6e222069643d2242504d4e53686170655f506f6f6c5f496e737469747563696f6e223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d22313931302e30222077696474683d22313530352e302220783d223135352e302220793d2238302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224c616e655f3073713570686c222069643d2242504d4e53686170655f4c616e655f3073713570686c223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d223137302e30222077696474683d22313437352e302220783d223138352e302220793d22313832302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22446963746172222069643d2242504d4e53686170655f446963746172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d223937372e302220793d22313837302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224665636861222069643d2242504d4e53686170655f4665636861223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233312e30222077696474683d2233312e302220783d223836392e302220793d22313839322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22496e666f726d65222069643d2242504d4e53686170655f496e666f726d65223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d22313138352e302220793d22313837302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f3130313862647a222069643d2242504d4e53686170655f41637469766974795f3130313862647a223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d223732302e302220793d22313837302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224c616e655f303479767a7a7a222069643d2242504d4e53686170655f4c616e655f303479767a7a7a223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d22313734302e30222077696474683d22313437352e302220783d223138352e302220793d2238302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2245737065726172222069643d2242504d4e53686170655f45737065726172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2234302e30222077696474683d2234302e302220783d223938302e302220793d223332352e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22496e6963696f222069643d2242504d4e53686170655f496e6963696f223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e352220783d223234322e302220793d223333322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d225265636f726461746f72696f222069643d2242504d4e53686170655f5265636f726461746f72696f223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d22313534302e302220793d223333302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224c696d697465222069643d2242504d4e53686170655f4c696d697465223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2234302e30222077696474683d2234302e302220783d22313333352e302220793d223334352e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22506c617a6f222069643d2242504d4e53686170655f506c617a6f223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233312e30222077696474683d2233312e302220783d22313139372e302220793d223335322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241636570746172222069643d2242504d4e53686170655f41636570746172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e302220783d22313139372e302220793d223537322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224d6f64696669636172222069643d2242504d4e53686170655f4d6f64696669636172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e302220783d22313139372e302220793d223139322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f31326530657431222069643d2242504d4e53686170655f41637469766974795f31326530657431223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d223537302e302220793d22313639302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224576656e745f3077326b697466222069643d2242504d4e53686170655f4576656e745f3077326b697466223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2232382e30222077696474683d2232382e302220783d223734322e302220793d22313731322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224172636869766172222069643d2242504d4e53686170655f4172636869766172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d22313335302e302220793d223435302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2246696e53696e437572736f222069643d2242504d4e53686170655f46696e53696e437572736f223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2232382e30222077696474683d2232382e302220783d22313535322e302220793d223437322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2252656368617a6172222069643d2242504d4e53686170655f52656368617a6172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e302220783d22313139372e302220793d223437322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d225072657061726172222069643d2242504d4e53686170655f5072657061726172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d223839302e30222077696474683d22313236302e302220783d223335302e302220793d223730302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22537562496e6963696f222069643d2242504d4e53686170655f537562496e6963696f223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e302220783d223337352e302220793d223938322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22506172496e6963696f222069643d2242504d4e53686170655f506172496e6963696f223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2234302e30222077696474683d2234302e302220783d223435352e302220793d223937352e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224e6f6d696e61222069643d2242504d4e53686170655f4e6f6d696e61223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d223535302e302220793d223733302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224c69737461222069643d2242504d4e53686170655f4c69737461223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d22313032302e302220793d223733302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224d6174657269616c222069643d2242504d4e53686170655f4d6174657269616c223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d223535302e302220793d223936302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224f72496e6963696f222069643d2242504d4e53686170655f4f72496e6963696f223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2234302e30222077696474683d2234302e302220783d223638352e302220793d22313232352e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d225669727475616c222069643d2242504d4e53686170655f5669727475616c223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d223833302e302220793d22313231302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2245717569706f222069643d2242504d4e53686170655f45717569706f223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d223833302e302220793d22313430302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224f7246696e222069643d2242504d4e53686170655f4f7246696e223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2234302e30222077696474683d2234302e302220783d22313135382e302220793d22313232352e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2250617246696e222069643d2242504d4e53686170655f50617246696e223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2234302e30222077696474683d2234302e302220783d22313336352e302220793d223937352e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2253756246696e222069643d2242504d4e53686170655f53756246696e223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2232382e30222077696474683d2232382e302220783d22313439322e302220793d223938322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f31326932687066222069643d2242504d4e53686170655f41637469766974795f31326932687066223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d223535302e302220793d22313231302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f3034386435656d222069643d2242504d4e53686170655f41637469766974795f3034386435656d223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d223132302e30222077696474683d223330302e302220783d22313238302e302220793d22313431302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224576656e745f3172766f346b36222069643d2242504d4e53686170655f4576656e745f3172766f346b36223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e302220783d22313430322e302220793d22313434322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224576656e745f316734786d716f222069643d2242504d4e53686170655f4576656e745f316734786d716f223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e352220783d22313331322e302220793d22313434322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224576656e745f30736e69676263222069643d2242504d4e53686170655f4576656e745f30736e69676263223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2232382e30222077696474683d2232382e302220783d22313439322e302220793d22313434322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224576656e745f31677379716572222069643d2242504d4e53686170655f4576656e745f31677379716572223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e302220783d223838352e302220793d22313237362e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224576656e745f3179706363316a222069643d2242504d4e53686170655f4576656e745f3179706363316a223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e302220783d223838352e302220793d22313436362e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f316d303870636c222069643d2242504d4e53686170655f41637469766974795f316d303870636c223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d22313030302e302220793d22313438302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241756c61222069643d2242504d4e53686170655f41756c61223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d223833302e302220793d22313035302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f31367a7a393170222069643d2242504d4e53686170655f41637469766974795f31367a7a393170223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d22313031302e302220793d22313134302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f303268726f6f63222069643d2242504d4e53686170655f41637469766974795f303268726f6f63223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d22313030302e302220793d22313239302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d227369642d46464231303331302d314543372d343743432d384637312d363237443844433044453846222069643d2242504d4e53686170655f7369642d46464231303331302d314543372d343743432d384637312d363237443844433044453846223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e302220783d223838372e393931373535353735373537392220793d22313131352e34333630343435363838313833223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224576656e745f30666172667572222069643d2242504d4e53686170655f4576656e745f30666172667572223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2233302e30222077696474683d2233302e302220783d223532342e323936383939333933353332342220793d22313537352e37313130393033383630383637223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2250726f707565737461222069643d2242504d4e53686170655f50726f707565737461223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d223634352e302220793d223435302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22476174657761795f3130676674726e222069643d2242504d4e53686170655f476174657761795f3130676674726e223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2234302e30222077696474683d2234302e302220783d223339352e302220793d223436352e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d224576656e745f31386564623971222069643d2242504d4e53686170655f4576656e745f31386564623971223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2232382e30222077696474683d2232382e302220783d223532322e302220793d223538322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f306969627a7775222069643d2242504d4e53686170655f41637469766974795f306969627a7775223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d223337302e302220793d223536302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22436f6e6669726d6172222069643d2242504d4e53686170655f436f6e6669726d6172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d223832372e302220793d22313639302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2246696e222069643d2242504d4e53686170655f46696e223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2232382e30222077696474683d2232382e302220783d22313537372e302220793d22313731322e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2252657669736172222069643d2242504d4e53686170655f52657669736172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223134302e302220783d22313335302e302220793d223131302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22456e76696172496e666f726d65222069643d2242504d4e53686170655f456e76696172496e666f726d65223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d22313339352e302220793d22313639302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f316567377a636c222069643d2242504d4e53686170655f41637469766974795f316567377a636c223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d22313430302e302220793d223535302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22456e76696172222069643d2242504d4e53686170655f456e76696172223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d223636352e302220793d223331302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2241637469766974795f3178773430306c222069643d2242504d4e53686170655f41637469766974795f3178773430306c223e0a20202020202020203c6f6d6764633a426f756e6473206865696768743d2238302e30222077696474683d223130302e302220783d223231302e302220793d223435302e30223e3c2f6f6d6764633a426f756e64733e0a2020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d224f74726f5265636f7264222069643d2242504d4e456467655f4f74726f5265636f72642220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313337342e353330333933353836303035392220793d223336352e3431353632353030303030303033223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313533392e393939393939393939393939332220793d223336382e3933363137303231323736353934223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d2250726570617261646f222069643d2242504d4e456467655f50726570617261646f2220666c6f7761626c653a736f75726365446f636b6572583d223633302e302220666c6f7761626c653a736f75726365446f636b6572593d223434352e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223930312e363439353732363439353732362220793d22313538392e39343939393939393939393938223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223838342e303333393331363233393331362220793d22313639302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d2252656368617a61646f222069643d2242504d4e456467655f52656368617a61646f2220666c6f7761626c653a736f75726365446f636b6572583d2231352e302220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313232362e393438343236353335333931372220793d223438372e32313536303331353834323431223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313334392e3939393939393939393939362220793d223438382e39393033383436313533383436223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d2253696e526573707565737461222069643d2242504d4e456467655f53696e5265737075657374612220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313335362e353833333333333333333333332220793d223338332e3335333336373637303336343535223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313336302e302220793d223432332e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313432302e302220793d223432332e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313432302e302220793d223435302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f306b3338643967222069643d2242504d4e456467655f466c6f775f306b33386439672220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223433342e363139373838353933383938392220793d223438352e33323730343931383033323739223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223634342e393939393939393939393938392220793d223438382e38333333333333333333333333223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f316a3931376733222069643d2242504d4e456467655f466c6f775f316a39313767332220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223638392e393439393939393939373630332220793d223737302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313032302e302220793d223737302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d224173736f63696174696f6e5f3166683637786e222069643d2242504d4e456467655f4173736f63696174696f6e5f3166683637786e2220666c6f7761626c653a736f75726365446f636b6572583d2231352e302220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d22302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223930322e303837393439333231333130322220793d22313134352e33353933353333333330373037223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223930302e302220793d22313138302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313031302e302220793d22313138302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f30307665393772222069643d2242504d4e456467655f466c6f775f303076653937722220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2231342e302220666c6f7761626c653a746172676574446f636b6572593d2231342e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223436392e393439393939393939393936352220793d223539382e32373538363230363839363536223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223532322e303038313535383534303631372220793d223539362e34383037353432363732393035223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d224665636861446963746172222069643d2242504d4e456467655f46656368614469637461722220666c6f7761626c653a736f75726365446f636b6572583d2231352e352220666c6f7761626c653a736f75726365446f636b6572593d2231352e352220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223839392e393438313337383733303739382220793d22313930372e37333736363438333631363538223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223937362e393939393939393939393931382220793d22313930382e393233303736393233303737223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f30393970716c65222069643d2242504d4e456467655f466c6f775f30393970716c652220666c6f7761626c653a736f75726365446f636b6572583d2231352e32352220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d2231352e302220666c6f7761626c653a746172676574446f636b6572593d2231352e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313334322e343439393937363136343633392220793d22313435372e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313430322e302220793d22313435372e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d227331222069643d2242504d4e456467655f73312220666c6f7761626c653a736f75726365446f636b6572583d2231352e302220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223430342e39343539343530353334303434342220793d223939362e36343731353435353331333332223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223435352e343539373730313134393431332220793d223939352e343538363230363839363535223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d227332222069643d2242504d4e456467655f73322220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223437352e343333363935363532313733392220793d223937352e34333437383236303836393536223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223438302e302220793d223737302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223535302e302220793d223737302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f307738786e336c222069643d2242504d4e456467655f466c6f775f307738786e336c2220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223431352e38333132352220793d223530342e31313131333635353238373236223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223431382e323630383639353635323137342220793d223536302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d227335222069643d2242504d4e456467655f73352220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223439342e323738373937343638333534342220793d223939352e36363530303030303030303031223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223535302e302220793d223939372e35383632303638393635353137223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d227336222069643d2242504d4e456467655f73362220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223437352e3339392220793d22313031342e35343731373131333135343735223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223438302e302220793d22313234302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223534392e393939393939393939393939312220793d22313234352e38333333333333333333333333223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f30723668637962222069643d2242504d4e456467655f466c6f775f307236686379622220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223634392e393439393939393939393938322220793d22313234372e36313930343736313930343737223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223638352e393039303930393039303839322220793d22313234352e39303638313831383138313836223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d224173736f63696174696f6e5f306636666e7677222069643d2242504d4e456467655f4173736f63696174696f6e5f306636666e76772220666c6f7761626c653a736f75726365446f636b6572583d2231352e302220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d22302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223930302e302220793d22313330352e39343939383830303639333039223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223930302e302220793d22313333302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313030302e302220793d22313333302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d226f7230222069643d2242504d4e456467655f6f72302220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223730352e363233343337352220793d22313232352e363235223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223731302e302220793d22313039302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223833302e302220793d22313039302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d226f7232222069643d2242504d4e456467655f6f72322220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223730352e34393837352220793d22313236342e34343635313432343238373837223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223731302e302220793d22313434302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223833302e302220793d22313434302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d226f7231222069643d2242504d4e456467655f6f72312220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223732342e343436353134323432383734332220793d22313234352e3439383735223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223832392e393939393939393939393938392220793d22313234382e32303531323832303531323832223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22496e666f726d65456e76696172222069643d2242504d4e456467655f496e666f726d65456e766961722220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313332342e39352220793d22313931302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313434352e302220793d22313931302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313434352e302220793d22313736392e3935223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d226d61696e32222069643d2242504d4e456467655f6d61696e322220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223731352e302220793d223435302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223731352e302220793d223338392e3935303030303030303030303035223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d226f6a30222069643d2242504d4e456467655f6f6a302220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223932392e393439393939393939393932352220793d22313039302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313138332e302220793d22313039302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313137382e363233343337352220793d22313232352e363235223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f31373574316a33222069643d2242504d4e456467655f466c6f775f31373574316a332220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2231342e302220666c6f7761626c653a746172676574446f636b6572593d2231342e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223636392e393439393939393939393939392220793d22313732382e35323934313137363437303539223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223734322e3030353933323036393930372220793d22313732362e34313031323034313639333937223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d226f6a32222069643d2242504d4e456467655f6f6a322220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223936392e393439393939393939393939392220793d22313434302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313138332e302220793d22313434302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313137382e34393837352220793d22313236342e343038343636373333333637223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d226d61696e33222069643d2242504d4e456467655f6d61696e332220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223736342e393439393939393939393939392220793d223334392e3132323830373031373534333833223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223938302e333434383237353836323035362220793d223334352e33343339363535313732343134223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d226f6a31222069643d2242504d4e456467655f6f6a312220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223936392e393439393939393939393839392220793d22313234382e37343130303731393432343435223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313135382e333533333536383930343531332220793d22313234352e33353234373334393832333332223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f30683573693566222069643d2242504d4e456467655f466c6f775f306835736935662220666c6f7761626c653a736f75726365446f636b6572583d2231352e302220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d2231342e302220666c6f7761626c653a746172676574446f636b6572593d2231342e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313433312e393439303735373235353337382220793d22313435362e383331343731303933393931223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313439322e303030383632393930343533372220793d22313435362e313536373331393834393431223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f306738766d396c222069643d2242504d4e456467655f466c6f775f306738766d396c2220666c6f7761626c653a736f75726365446f636b6572583d2231352e32352220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223235372e35333734343935393335323130352220793d223336312e39343732383539323936343939223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223235392e323330373639323330373639322220793d223435302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22566f6c76657245737065726172222069643d2242504d4e456467655f566f6c766572457370657261722220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313539392e393837352220793d223333302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313631302e302220793d223239302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313030352e302220793d223239302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313030312e363632343939393939393939392220793d223332362e36363636363636363636363637223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f30757062786e35222069643d2242504d4e456467655f466c6f775f30757062786e352220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313335302e302220793d223135302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223731352e302220793d223135302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223731352e302220793d223331302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f306b626e6d3164222069643d2242504d4e456467655f466c6f775f306b626e6d31642220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223330392e39343939393939393939393939332220793d223438382e3338373039363737343139333534223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223339352e3632352220793d223438352e3632333433373439393939393937223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22506c617a6f4c696d697465222069643d2242504d4e456467655f506c617a6f4c696d6974652220666c6f7761626c653a736f75726365446f636b6572583d2231352e352220666c6f7761626c653a736f75726365446f636b6572593d2231352e352220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313232372e393437363730373635303335312220793d223336372e3232383131313137313434383233223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313333352e333434383237353836323035362220793d223336352e33343339363535313732343134223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d224d6f6469666963617250726f70222069643d2242504d4e456467655f4d6f6469666963617250726f702220666c6f7761626c653a736f75726365446f636b6572583d2231352e302220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313232362e3934383432363533323039322220793d223230372e3231353630333039363034313833223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313432302e302220793d223231302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313432302e302220793d223138392e3935223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f31796d77357165222069643d2242504d4e456467655f466c6f775f31796d773571652220666c6f7761626c653a736f75726365446f636b6572583d2231352e302220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223533392e333732333632373939303437332220793d22313630352e3636303837363632393032223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223534302e302220793d22313733302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223536392e393939393939393939373432342220793d22313733302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f30706273617632222069643d2242504d4e456467655f466c6f775f307062736176322220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223638392e393439393939393939393832382220793d223939392e35343234383336363031333039223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313336352e313239383730313239383638332220793d223939352e31323935343534353435343536223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f306c7363696a6b222069643d2242504d4e456467655f466c6f775f306c7363696a6b2220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2231352e352220666c6f7761626c653a746172676574446f636b6572593d2231352e35223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223831392e393439393939393939393931332220793d22313930382e39303832393639343332333133223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223836392e303033363137323736323935322220793d22313930372e38333732353737303233313239223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22733131222069643d2242504d4e456467655f7331312220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313139372e343835393339363539313336322220793d22313234352e34353936373734313933353439223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313339302e302220793d22313235302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313338352e3338333635333834363135342220793d22313031342e35323139343131333132303434223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22496e666f726d654172636869766172222069643d2242504d4e456467655f496e666f726d6541726368697661722220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2231342e302220666c6f7761626c653a746172676574446f636b6572593d2231342e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313439342e393439393939393939393933372220793d22313732382e36333031333639383633303133223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313537372e303035313436363337393835352220793d22313732362e33383230353134303033323639223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f31746f70616d6a222069643d2242504d4e456467655f466c6f775f31746f70616d6a2220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223837372e302220793d22313736392e3935223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223837372e302220793d22313831352e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223737302e302220793d22313831352e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223737302e302220793d22313837302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22733132222069643d2242504d4e456467655f7331322220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2231342e302220666c6f7761626c653a746172676574446f636b6572593d2231342e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313430342e373738343339383033343330352220793d223939352e31363335323435393031363339223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313439322e303030313830353836303033312220793d223939352e38383433303133393036323938223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f31666670776761222069643d2242504d4e456467655f466c6f775f316666707767612220666c6f7761626c653a736f75726365446f636b6572583d2235302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d223633302e302220666c6f7761626c653a746172676574446f636b6572593d223434352e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313431362e3132363132363132363132362220793d223632392e39343939393939393939393939223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313335362e383034353034353034353034342220793d223730302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f3173646a656836222069643d2242504d4e456467655f466c6f775f3173646a6568362220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2237302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313131362e39352220793d22313931302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313138352e302220793d22313931302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d227761697430222069643d2242504d4e456467655f77616974302220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2231352e302220666c6f7761626c653a746172676574446f636b6572593d2231352e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313030302e3339392220793d223336342e3534373137313133313534373433223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313030352e302220793d223539302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313139372e303031353339313631363735352220793d223538372e32313636343434363938363337223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d227761697433222069643d2242504d4e456467655f77616974332220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2231352e352220666c6f7761626c653a746172676574446f636b6572593d2231352e35223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313031382e323733363638383835313931322220793d223334362e3636323439393939393939393937223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313035352e302220793d223335302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313035352e302220793d223337302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313139372e303031393039373538363535352220793d223336372e3734353230373833373832353433223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d227761697431222069643d2242504d4e456467655f77616974312220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2231352e302220666c6f7761626c653a746172676574446f636b6572593d2231352e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313030302e3636352220793d223336342e32373837393734363833353434223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313030352e302220793d223439302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313139372e303031353339313631363735352220793d223438372e32313636343434363938363337223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d227761697432222069643d2242504d4e456467655f77616974322220666c6f7761626c653a736f75726365446f636b6572583d2232302e302220666c6f7761626c653a736f75726365446f636b6572593d2232302e302220666c6f7761626c653a746172676574446f636b6572583d2231352e302220666c6f7761626c653a746172676574446f636b6572593d2231352e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313031382e313231353531373234313337382220793d223334362e38313336333633363336333634223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313035302e302220793d223335302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313035302e302220793d223231302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313139372e303032353136303836343136362220793d223230372e3237363830353830313037393532223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d224173736f63696174696f6e5f306f716f686178222069643d2242504d4e456467655f4173736f63696174696f6e5f306f716f6861782220666c6f7761626c653a736f75726365446f636b6572583d2231352e302220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d22302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d223930302e302220793d22313439352e39343939383830303639333039223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d223930302e302220793d22313532302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313030302e302220793d22313532302e30223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f30356877356875222069643d2242504d4e456467655f466c6f775f303568773568752220666c6f7761626c653a736f75726365446f636b6572583d2231352e302220666c6f7761626c653a736f75726365446f636b6572593d2231352e302220666c6f7761626c653a746172676574446f636b6572583d2235302e302220666c6f7761626c653a746172676574446f636b6572593d2234302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313232362e393438373938323436353130332220793d223538372e31383834333039393533313931223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313339392e393939393939393939393936362220793d223538392e33363937343738393931353936223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22436572726172536f6c696369747564222069643d2242504d4e456467655f436572726172536f6c6963697475642220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2231342e302220666c6f7761626c653a746172676574446f636b6572593d2231342e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313438392e393439393939393939393936362220793d223438382e303832313931373830383232223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313535322e303035313436363337393839362220793d223438362e3338323035313430303332363933223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22466c6f775f317130396f7139222069643d2242504d4e456467655f466c6f775f317130396f71392220666c6f7761626c653a736f75726365446f636b6572583d2237302e302220666c6f7761626c653a736f75726365446f636b6572593d2234302e302220666c6f7761626c653a746172676574446f636b6572583d2232302e302220666c6f7761626c653a746172676574446f636b6572593d2232302e30223e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313135392e39352220793d223737302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313339302e302220793d223737302e30223e3c2f6f6d6764693a776179706f696e743e0a20202020202020203c6f6d6764693a776179706f696e7420783d22313338352e343333363935363532313733382220793d223937352e34333437383236303836393536223e3c2f6f6d6764693a776179706f696e743e0a2020202020203c2f62706d6e64693a42504d4e456467653e0a202020203c2f62706d6e64693a42504d4e506c616e653e0a20203c2f62706d6e64693a42504d4e4469616772616d3e0a3c2f646566696e6974696f6e733e	f
be9dca33-e2d1-11f1-87a6-06295b567284	1	Process_Curso.Process_Curso.png	be681431-e2d1-11f1-87a6-06295b567284	\\x89504e470d0a1a0a0000000d4948445200000686000007d00806000000efbcedb60000800049444154785eecdd0b9c1d65793070bc54bc96521414f152e90ddbcfcfaaa0f5ab8a5aada902ad7673ce49082404920001126e41e492902a2d5035092050aba25590a080621093ec62408280784110b904154808247253134032dffb9eb31b37b39b4d4e92ddf79dddfffff77b7e33e73d73e6397bf6d9c9cc3c9933db6d0700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007f50082184104208218410420821841062d002b292aa2853e5050000000080a1e25c38d9495594a9f20200000000c050712e9ceca42aca5479010000000060a838174e76521565aabc000000000030549c0b273ba98a32555e0000000000182ace85939d5445992a2f00000000000c15e7c2c94eaaa24c95170000000000868a73e164275551a6ca0b000000000043c5b970b293aa2853e5050000000080a1e25c38d9495594a9f20200000000c050712e9ceca42aca5479010000000060a838174e76521565aabc000000000030549c0b273ba98a32555e0000000000182ace85939d5445992a2f00000000000c15e7c2c94eaaa24c95170000000000868a73e164275551a6ca0b000000000043c5b970b293aa2853e5050000000080a1e25c38d9495594a9f20200000000c050712e9ceca42aca5479010000000060a838174e76521565aabc000000000030549c0b273ba98a32555e0000000000182ace85939d5445992a2f00000000000c15e7c2c94eaaa24c95170000000000868a73e164275551a6ca0b000000000043c5b970b293aa2853e5050000000080a1e25c38d9495594a9f20200000000c050712e9ceca42aca5479010000000060a838174e76521565aabc000000000030549c0b273ba98a32555e0000000000182ace85939d5445992a2f00000000992a8ae279cb962dbb64e9d2a54f2d5ebcb858b870a1101b44a88b754b962c59ded9d9b95fb97e2053ce85939d5445992a2f00000000995ab66cd9fc254b96142b57ae2cd6ac59533cf9e493426c10b12e627d5c73cd358f2d5cb8f083e51a820c39174e76521565aabc00000000642a5e29144ffa979b01429463c58a15ab162e5c7863b9862043ce85939d5445992a2f00000000998a5f1fe74a21b13911eb64e1c2856bcb350419722e9ceca42aca547901000000c854bc874cb90120c4c622d64bb9862043ea94eca42aca547901000000c8d4e636867ef3e88a62d94d9f2f6e5b745a33e27c1c2b2f278677680c5111ea94eca42aca547901000000c8d4e634869e78e481e2a7579f5cfcf85bc76d10712c3e575e5e0cdfd018a222d429d9495594a9f20200000090a9cd690cdd77db37fa34857ae2fedbbed96779317c4363888a50a764275551a6ca0b00000040a636a731f4b3aeffecd310ea89f85c7979317c4363888a50a764275551a6ca0b00000040a636a731f4d38533fb34847a223e575e5e0cdfd018a222d429d9495594a9f20200000090298d21d14e680c5111ea94eca42aca547901000000c8d4e634866e5b745a9f86504fc4e7cacb8be11b1a4354843a253ba98a32555e0000000032b5398da1bbbe77769f86504fc4e7cacb8be11b1a4354843a253ba98a32555e0000000032b5398da1d50ffca4f8e9774eedd3148a63f1b9f2f262f886c61015a14ec94eaaa24c9517000000804c6d4e6328c6bd377fb14f63288e959713c33b3486a808754a76521565aabc00000000646ab31a436bd716775dff993e8da138169febb3bc18b6a1314445a853b293aa2853e50500000020539b6a0c3df1c803c59ddf9bd7a729d413f1b9b84cf975627886c61015a14ec94eaaa24c9517000000804c6db431b4766db1e2aecee2d66f9fd8a719548eb84c5cd6d543c33f3486a808754a76521565aabc0000000064aabfc6d0a6ae12da58b87a68f887c61015a14ec94eaaa24c9517000000804cf5d718da9cab843616f1b5e5f589e1131a4354843a253ba98a32555e0000000032d55f63a8dcec6937caeb13c3273486a808754a76521565aabc0000000064aabfc690101b0b8d212a429d929d5445992a2f0000000099d21812ed84c61015a14ec94eaaa24c9517000000804c690c89764263888a50a764275551a6ca0b00000040a63486443ba1314445a853b293aa2853e50500000020531a43a29dd018a222d429d9495594a9f20200000090298d21d14e680c5111ea94eca42aca547901000000c894c69068273486a808754a76521565aabc00000000644a6348b4131a4354843a253ba98a32555e0000000032a53124da098d212a429d929d5445992a2f0000000099d21812ed84c61015a14ec94eaaa24c9517000000804c690c89764263888a50a764275551a6ca0b00000040a63486443ba1314445a853b293aa2853e50500000020531a43a29dd018a222d429d9495594a9f20200000090298d21d14e680c5111ea94eca42aca547901000000c894c69068273486a808754a76521565aabc00000000644a6348b4131a4354843a253ba98a32555e0000000032a53124da098d212a429d929d5445992a2f0000000099d21812ed84c61015a14ec94eaaa24c9517000000804c690c89764263888a50a764275551a6ca0b00545cbd5e2f8410420821c4f08df2c97f2136161a4354843a253ba98a32555e00a0e2e2c982f2180000c3438e570c6dd73a8fd5675ca40f8d212a429d929d5445992a2f0050711a430000c3d7963686b6eb6edec478f18b5f5cbced6d6f2baebbeeba3ecb6d49f4acb73c2e362f06f3f3d318a222d429d9495594a9f2020015a7310400307c6d6d6328ce7fe31bdf68ceefb1c71e7d9613431fbd7f37db3a3486a808754a76521565aabc0040c5690c01000c5fdba231f4c4134f34e75ff08217ac7f7ed5aa55c521871c52ecb2cb2ec50e3bec50ecb3cf3ec5b265cb8a152b56142f7ce10b8bdd77dfbd58bb766d73d9387dddeb5e57bce8452f2a1e7cf0c13e8d8d4b2eb9a4f8cbbffccbe28ffee88ffa3cd7fbbdbce4252f29defef6b76f70e552cf73fdbdaebf659ef5ac67157bedb55771f7dd77f7fb7ccf3ae2fbdc7ffffd8b97bef4a5cd183b766c73acbfd70cb4ce8d3dded8e7d7f3fcc63e93f27bed2f477f9fd3e686c61015a14ec94eaaa24c951700a8388d210080e16b5b34867aae18fae77ffee7f5cf4f9830a13976d9659715d75f7f7d73fe3def794ff3b9c99327371f5f71c515cdc7975f7e79f3f1942953faac3bc6cb5ef6b2660364c182057dde47efb8f5d65b9baf7bfdeb5fbf7eac675de79e7beefa4654397a96f9d297be547ce10b5f68ceefb7df7e7d9eefbd8ed8142abf268e955f33d03a9ffdec67f759bee7f1409f5f8c813e93f2bacad1dfe7b4b9a1314445a853b293aa2853e505002a4e63080060f8dadac6504fbcea55af2aeebdf7def5cfc7ab68cacb6cbffdf6cde76ebbedb66653e4fdef7f7ff3f1fbdef7bee6e3db6fbf7d8375f7ac6bd75d776d3e7ecd6b5e534c9f3e7d832b67befded6f176f7ef39b9b571bf5bcaebf86cb638f3dd6e767282ff3e8a38f168f3cf248737ec71d77ecf37cef75ecb4d34e7d5e137fe6f26b065ae7739ef39c3ecbf73c1ee8f38b31d067525e578c4d7d4e9b1b1a4354843a253ba98a32555e00a0e23486000086afad6d0c3dfef8e3c511471cd19c2f5fd112c7eebffffe3eaf8df1c10f7eb0f9156bf16aa1388d5f95565e77cfe3ef7ffffbc5befbeebbfe6bd3def8c637ae7fee95af7c6573ec7bdffb5eb371537e6df9717fd1b3cc404d9cf23ab64563a8a731139729e7d8d4e737d067525e578c4d7d4e9b1b1a4354843a253ba98a32555e00a0e23486000086afad6d0cc5f9d8f8e8b9c2a5e7abcd264e9cd87c3c6ddab47eafd6e96e30142f7ef18b9bd3458b16f5bbeede11ef8913c75ff18a57ac1feb69a05c7bedb5c59c3973fabcb6fcb8bfe859a6f7d7bec5a64bf9f9deafd992af92ebbdce78efa03876c30d3734bfa2ae9c63539f5f4ff4f799fcf11fff7173acf7155c9bfa9c36373486a808754a76521565aabc0040c5690c01000c5fdba23114e3b4d34e6b3e7ec73bded17cbc7af5ea62ead4a9c56ebbedd6bc32a6bc7c8c37bde94dcdb1381d68dd3d8fe3d5317becb147f39e463dcf5d74d145c5cb5ffef2f5cb6cecb5bdd75f8edeaf8b572fedb9e79ec59d77ded9e7f9deaf79f0c1079b8da078e5508cb163c736c7caafd9d83a2fbcf0c262e79d77dee8fbded4e7d7f3b8bfcfe4f4d34f5f7f4553cf6b36f5396d6e680c5111ea94eca42aca547901808ad318020018beb6b431349c62bb2d6c920c1483b1ce1c4263888a50a764275551a6ca0b00549cc61000c0f0a53134384d9cc158670ea1314445a853b293aa2853e505002a4e63080060f8d21812ed84c61015a14ec94eaaa24c951700a8388d210080e14b6348b4131a4354843a253ba98a32555e00a0e234860000862f8d21d14e680c5111ea94eca42aca547901808ad318020018be3486443ba1314445a853b293aa2853e505002a4e63080060f8d21812ed84c61015a14ec94eaaa24c951700a8388d210080e14b6348b4131a4354843a253ba98a32555e00a0e234860000862f8d21d14e680c5111ea94eca42aca547901808ad318020018be3486443ba1314445a853b293aa2853e505002a4e63080060f8d21812ed84c61015a14ec94eaaa24c951700a8388d210080e14b6348b4131a4354843a253ba98a32555e00a0e234860000862f8d21d14e680c5111ea94eca42aca547901808ad318020018be3486443ba1314445a853b293aa2853e505002a4e63080060f8d21812ed84c61015a14ec94eaaa24c951700a8388d210080e14b6348b4131a4354843a253ba98a32555e00a0e234860000862f8d21d14e680c5111ea94eca42aca547901808ad318020018be3486443ba1314445a853b293aa2853e505002a4e63080060f8d21812ed84c61015a14ec94eaaa24c951700a8388d210080e14b6348b4131a4354843a253ba98a32555e00a0e234860000862f8d21d14e680c5111ea94eca42aca547901808ad318020018be3486443ba1314445a853b293aa2853e505002a4e63080060f8d21812ed84c61015a14ec94eaaa24c951700a8388d210080e14b6348b4131a4354843a253ba98a32555e00a0e234860000862f8d21d14e680c5111ea94eca42aca547901808ad318020018be3486443ba1314445a853b293aa2853e505002a4e63080060f8d21812ed84c61015a14ec94eaaa24c951700a8388d210080e16bf1e2c5ebd6ac59d3a701204439429d2c5fb870e1da720d41861cc3929d5445992a2f0050711a430000c3d792254b96af5cb9b24f13408872fcf297bfbc78e1c28537966b0832e41896eca42aca547901808ad318020018be3a3b3bf7bbe69a6b1e5bb162c52a570e89fe22d4c58a5ffce2175f59b870e1af427cb05c439021c7b064275551a6ca0b00549cc61000c0f0164ff6c72b41423c19ef21234429625dc4fad014a22a1cc3929d5445992a2f0050711a4300008c2461ffb7cb3e30549abf5fb293aa2853e505002ace413100e4ad288a672f5dbaf4c35ffce217bf336bd6ac553366cc5873e8a187ae8bff864f9932e5e9638f3df6f13076f7ecd9b3cf9a3061c2abcaaf07fe20fcddec1dff76ba63eff2f340253886253ba98a32555e00a0e234860060684dfbd477f79836b7f3def58fe77636ff2d3eead38bf69c3eb7735978bc2a3e2e8ae2f9f1b9934f3ef9a9830f3eb838f7dc738b1b6eb8a1b8e79e7b8ad5ab5717519cc6c7713c3e3f71e2c4678e38e28865871c72c83ff5acbfac271f8c443d570b754757f979a012fc3b4676521565aabc0040c5690c01c0e69b7e4ed79fc7c6caf4795d6fe9199b36a7f3e8697317dfd97bb98184650f0df1f9f2f8f4398bbf19d715e76fb8e186c367cf9ebd66dab469c5d2a54b8bc71f7fbc983f7f7e316edcb862cf3df72c76db6db7f8ef77731a1fc7f1f87c5c2e2e7fe491473e7dd86187dd52abd5762fa58111ab74b590ab86a0ba1cc3929d5445992a2f0050711a4300b0f98e9adb79e4b4b99dcba7cfe99c141f4f3b7bd1df87c70f4e9fdb39a7bcecc684e5bf3a7d4ed781fd8c3f7cccd98b5f73f5d5577f79f2e4c9c582050b8a55ab5615279c7042b1c30e3b141ff8c0078a0b2eb8a0b8e9a69b8afbeebbaf79c5509cc6c7713c3e1f978bcbc7d7c5d78f1f3ffe378d46e37de55c301295ae1672d51054976358b293aa2853e505002a4e63080036df51733baf3a6a6ed78c69733bcf3be6acae974e9fdbb968dadcc5974d9fd3f58199332f79def4b95df3c2738f8458397d5ee798f89a999fef8a5f09f7c5108f4f9bb7f8df6323293680a67d6ac92be272719930fd45bc1229c6e1c7cd2a6ef9f1edc571672f2e76de79e762d2a449c53797dc56fcfb854b8ba3e77515277ff6ba6653289afd85eb9baf39e1bc25c5c29b7e51ac58b1a2b9fc3b3e746071c2390b9bcb1ff9c905ebc68c1933b177be8dbdd7ee651e3e6a4ee73961fadb69f33acf6f2ddff5dcf0b39e11df7b7c3efccc8de6f2f3bafe258cdf16c69e8aefe3a8798b3b5a9f14e46523570bb96a08aac9312cd9495594a9f2020015a73104009b67fa27af7fc1b4b99d8f4dfb54d79f4c9bd7f9dd307ff991733adf1ca60fc4e78e9ad375faf4b95d971c3177c9cb8e9edbf5b630be3abe2e8e87f9ff8daf9b3e6ff109d3baef2f347deee27da6cded5ad09a5ff48e53ff7bf10353a64c291e7cf0c1e2a44fcc2b1ad3e714b7dc724bb1e8e65f1473e6ffa058b1fa37c5ba75ebd637857ac49195bffe6db33914c5e53ff18525c5dfbee9ef8b59b36635d73761c28427267fecdc937af26decbd36dfd3bccefbe37d906293278cafed59fea8399d5f8e3f43f7f23d0dadd5d3e62e9e76d8395d2f8e8f21571bb95ac85543504d8e61c94eaaa24c951700a8388d2100d83cd3e62d1e356d6e67f304f2b4b95d371e35b76bf2f4b95dffd8d36c890da2633f73f5ce71fea84f2fda253cfe55f7f82f8e3ba7ebe5cdf9398b8fe8b9bf50989f195e3f3bce9ff5a56b2e9b7af2d9c51d77dcd16ce67ce4e0138bf98b6e6d367a4ef99feb8a558ffeae572ba8e5d6650f17677ce5c6e2d873ae695e3514af1e8a7a965fb97265b1d75e7b35d717d6bb6ef2473fbde6c833bf71ce80ef35bca769f33a3f11e75b3f5be74dddcbaf8c397ac5e3adf1c5874e9fdb797378fce85173179f15c72037f18aa07e9a41e5d8bbfc3a205b8e61c94eaaa24c951700a8388d2100d83cd3e675ce0d71fc0663733bcf8ecd9eeef955f16a9ac3cf5eb45398bf78fadcc5ffd13dfec4519fee7cebf473bafe7cfadcce653df7179a3e67f137e357b11545f1fce33f79e9ef2f9c7f7571e9a59716af7ded6b8bb3e7df58fce49e879b8d9e13cf5f52dcf1abd5c533a5ab853e76c1b5c5cf7eb9ba78e2774f165f5d7c4733cacbc7e6505c5f5cefec0bbef3d44147cdba65a0f71adfd3f4399dfb35e7e776cd0beff7c4eee51f8957476d5714cf8a8f7b9b3973e6b36313292cfbebf27390837845503f8da072b86a08aac3312cd9495594a9f2020015a73104009b67dadccebb8e9cd3f5b7a5b1fb62c327cec7864f78fcd0b4f87573733bcf8df7f1692e33aff3e4f0f837d3e7745e1aa62be3fd85ba5fbbfce873befbaaabaebaeafc699f5a502cfbd58a62975d76697e7ddc91ff756531f6c0839b27ac271c717271c499df28a6cd59dcbc5a67ccb809cdf1c91f3bb738ead30b8b434ffb6271f827be5a1c78f84737587e7af7d53dd77fff07cdf59ef4df4b8a49874f5b3d7af4e8776ff4bd76bfa7eef95f1d33afebafbbe70f3a6a6ee78ab8be1853e77df7cfe29545dd8f9f9a3677f14f8e3abbeb43ad4f05f2671f182acddf2fd9495594a9f2020015e7a01800d2298ae2d9279d74d2534b972e2d66cc98514c9e3cb979d54ffcf779ead4a9eba7f3e7cfdf64f45e3e4e7b8beb8debbfeebaeb1e0dcf5d5b7e1f30d2d807864af3f74b76521565aabc0040c5392806806d6bcc98313b867f5f4f6b341a2f2d3f5776fdf5d7ffeb21871c523cf6d863c58e3bee582c5fbe7c7d63a8a7e1d3333f90decbf5ccf716d71bd71ff38c1d3bf6d18e8e8e5796df0b8c24f681a1d2fcfd929d5445992a2f0050710e8a0160dbeae8e8f8d3f8ef6b88dfd46ab54f0dd484b9f0c20b179e7beeb9cd7b008d1a356a7d23a777336853cda1f2f3fd3586a2b8fe9867d6ac593f0defebd0f27b8191c43e30549abf5fb293aa2853e505002ace4131006c5bfbeebbef4bba1b433df164ad56fbef3163c6fc4579d9d9b3673f1cbf466edcb871c5f9e79fbfbe89536e04959b3f038d6fac3114d71ff32c5ab4e8b6f0fcd7cbef054612fbc05069fe7ec94eaaa24c951700a83807c500b06d8d1f3ffef9a5c6504ffc3ec4576bb5daffed59f6f8e38f5fb36cd9b2e22d6f794b71f3cd37af6fe2949b3d51b909547e5c5eae2cae3fe6f9f9cf7ffe8bf0fc4dbddf338c34f681a1d2fcfd929d5445992a2f0050710e8a0160dbeae8e8784e3f4da10da256ab7dabd168fcc3942953d6fdfad7bf2e76dd75d7e281071e58dfc419a8e11363d6ac59ebe737b65c595c7fccb37af5ea27c2f30f94df378c24f681a1d2fcfd929d5445992a2f0050710e8a01a8b2499326fdd13efbecf3c28e8e8e1d42bc2cfcbbb6eb9831635e13e6ff3cc4ebe3d53961ec2d8d46e3ef478f1efdce10ff18c64685b17dc3d8474234c2e303c2e38921a68438320c1d13c64e08f32787382dc47f84b1ff0a6373c3fc6742fc4f882f86b18bc2d8a561fe8a1057855814c6be1ba6d7d7fb690695e29910bf8f5fedf6f4d34f17db6fbf7df1e4934fae6fe2c465fafb7ab838ddd87c79d9b2b8fe9827e47bbcfb3dc42b98d686f84d884743ac0af16088fb43c4ab8aee0e3fcf1d61fad3103f0a7173881b425c17e29a108bc2cfffed30bd32c4e5dd9fc5c5e135ff1ba65f08f1d930765e989e1dc63e1de6cfaab73ecb7f0fd399214eeafe9c8f0d313d8c1f11ef7d14e60f09d309613aaefbf7d311e6ff35ccee137f7761fabef07b7c77187b4798fffb30b66798ffbbb163c7fe9f30bf47fccabef0bbffb330f6aafdf7dfff15b12ec2d88ef12bfec2fc0b62cd84d27956b9961859eaf681a1cafcfd929d5445992a2f0050710e8a0146ae8c9b2ab101f1e310b787b8abde6a522c0ff170bdd5c0f86d88a743ac0bf154f7e338fe508807ba97bf2bac2fde4b2736346e0a717d5c7f8885617e41882bbaf37f258c5d18a69f0df199f83e439c15c64eafb7de7ffc396684b1a3c3d811f5d6cf197fde7161ac1e3f877aebf3f84098be377e4ef1f30af34fd6fb368362fc2cc498f8b9efbdf7decf9d3c79f2d39bba62a8bfe6cf6db7ddb67ebefcfcc61a433d570c3dfcf0c37787e71f8857368d1a356afb71e3c6bd28d6c001071cb05378efbb84f957c63a083fdfee61feafc2d8dfc45a08636f0eaf7b6bf819ff5f187b57fc79c3d83f85e907c3f3fb757f1661b63636cc1f18e62786e9e4303d3c8c1d15e68fa9b73ecb8f85e9a92166777fce6786b14fc5cf3ecc9f1be28230feb930fd62bdf5fbb9244cbf1e9eff46bdf5bbfb4e18eb0cd325f556bddc18e296f0fc4feaad9ab933c4b210bfaab7ea26d6c5afc36b6243ec77f556cdc4da89cdb9f87b8af5f35888d52156d65b35f4cb10f784f879a35547b11e7f10e2fb21bed768d5eae2105787bcdfea7e6f5fef7eaf5fa9b76a3cfe0c178438b7fb67fb64183b234c3f11e2b430764a989e18c68e0ff347d75b7f3f8785e9a41007d55a7f5b63c2d8e830ffe130bf6ff8bcff39ccbf3f8cbd27d65a187b7b18db2b8cbd298cbda1fbeff62fc3d8ebc2fcabc3f3bb86dfefce61fe4fc78e1dfbc7dd7fefcf9b3973e6b3cbdb8391a66e1f18aaccdf2fd9495594a9f2020015e7a01860cb68aa0c6a53257e6e6f08cbec113fcff8b9c62b3fc2d84be3e7ddd35429ff4e72d26835217a37846293615cf984fc31c71cf3f840f7182a377d36a6bfab88ca7aee3174fbedb7c71a19f1f7188abf8bd82489f5149b26b179129b28e1b3d93536556273253659e2df73773dbe293661c2f36fefaed5f784b1f7c7664dace330ffe1101d61bc117fd7b5d6554ff1eaa743bbeb7f7a983f2ecc7f34cc9f1ca6b3c2f4e361ec3fc3fc7f85f93961fe9c303d3fc4ff345a7f5b5f0ef1d5105fabb7feeebe15a6578758dc68fdcd7fafde6a56c5a6d58f1badbfdb9fd75bf5169b5bf16f3a36bb62d32b36bfe2df7b6c86c5a658cf362036cb9e08eb7ea4deda4eac08715f887bebad6d486c66de1a9eff61bdb53d581ae2da105d8dd636216e83be199ebf2c4ce787b18bc2f44b213e1fc6febbdeda76cd0bf39f0ad3331badedc3ec10a7d65a4dc2198dd6b6efa8307f78a3d54c8c4dc503c3d8d8305f0bf31f09f3fb85f90f763723df1bc6de159b9461feadb16919e28d6199bf0de37f1db71b61fcb5e1f7ba5b987f79187be9f8f1e3ff24ccbf38de032c6e3feaf681a1cafcfd929d5445992a2f0050710e8a01da17b79d754d1506506f9d888f75b2227cf687757f7d591f279e78e29d4b972e2de257ca9d7ffef9eb9b38f1b553a74eddaca6508f9e8650cfebcae2fa639ecb2ebbac79754bf9bd30e23c2bd665d82ebc207ecd5ed856ecd8bd9d78796ca8841a796ddc86c4464b6cb8c4c64bdcbe84f9b785b17f08f37bc78677dc0685b10f85e9bf84b17febde3eed1fe6c787e9c1613a258c4d0df3d3c2fcb1b556f3fba410331badaf15fc8fee6ddfa7c3fcd9b5d6d70fc6ede2171aadaf25bcb87b9b7979882b6badaf2f5c546f7d9d61fc5ac3f8f586b1d919b7b9b7d65b8dacd8d08a8dadd8e08a8dae876badc657bcbfd69a7aab396e1f18aacbdf2fd9495594a9f2020015e7a018a07db69d6c4a3c391d4f80c7465cf9b9de66cd9a75d6b9e79e5b5c7ae9a5c5a851a3d63771628dc5884d9e9eab8036277a9a4231cae2fa639eb0cc82f0de0e2dbf1700a808fb6164275551a6ca0b00549c939b00edb3ed6453e25518e5b1fe4c9830e155071f7cf0338f3df658b1e38e3b16cb972f6f36717a9a3b5b13bdc5f5c6f53ffae8a3f16bc51e0eefef95e5f7020015613f8ceca42aca547901808a8b278eca63000cccb6936de988238eb8377e9ddc8c19338ac993276fd0d0d956e27ae3fa2fbef8e2f8d55cd796df03005488fd30b293aa2853e505002acec94d80f6d976b22d1d72c821ff74e491473ebd6ad5aa62975d76296eb9e596725f67abc4f5c5f53ef4d043f13e58778d1e3dfadde5f7000015623f8ceca42aca547901808a737213a07db69d6c6b53a74ebd65c18205ebe23d805efbdad7162b57ae2cf777b6485c4f5c5f58efba33ce38e3f3a1761794730340c5d80f233ba98a32555e00a0e29cdc04689f6d27db5a4747c79f4f9830e1893beeb8a398356b56b1d75e7b6d757328be3eae27aeefbbdffdee85a16e57c43ce5dc005031f6c3c84eaaa24c951700a838273701da67dbc96068341aef3be8a0837ef7e0830f369b39af79cd6bb6f86be5e2ebe2ebe37a962d5bf6cd50b3cb478f1efd8fe59c005041f6c3c84eaaa24c951700a838273701da67dbc960193366ccc40913263c1eaf1c8a5f2bb7f3ce3b1793264d2a56ac5851eefdf42b2e17978faf8bafefbe5228de5be8a0722e00a828fb6164275551a6ca0b00549c939b00edb3ed6430c52b7bc68d1bf7c815575cf1c8aa55ab8a134e38a1d861871d8a0f7ce003c505175c50dc74d34dc57df7ddd76c04c5697c1cc7e3f371b9b8fc430f3df440f73d851e74a51000c38cfd30b293aa2853e505002acec94d80f6d97632d86ab5daee63c68cb9fae0830f7ef8baebae7bf4f1c71f2fe6cf9f5f8c1b37aed873cf3d8bdd76db2dd660731a1fc7f1f8fc638f3df6d0c5175ffce550a37785b82aaea7bc6e00a838fb6164275551a6ca0b00549c939b00edb3ed64a88c1e3dfadda1de968c1d3bf6b1993367deba78f1e29ffefce73fffd5aa55ab7e5314c5130f3df4d0b2db6ebbede6cb2fbffc8a238e38e2aab0ecaab87c7c5d795d00304cd80f233ba98a32555e00a0e29cdc04689f6d2743ada3a3e395a1eea6d46ab56f84e98d21ee8b75d83dbdb17b7c4a5caefc5a001866ec87919d5445992a2f0050714e6e02b4cfb613002019fb6164275551a6ca0b00549c939b00edb3ed040048c67e18d9495594a9f2020015e7e42640fb6c3b010092b11f4676521565aabc0040c539b909d03edb4e008064ec87919d5445992a2f0050714e6e02b4cfb613002019fb6164275551a6ca0b00549c939b00edb3ed040048c67e18d9495594a9f2020015e7e42640fb6c3b010092b11f4676521565aabc0040c539b909d03edb4e008064ec87919d5445992a2f0050714e6e02b4cfb613002019fb6164275551a6ca0b00549c939b00edb3ed040048c67e18d9495594a9f2020015e7e42640fb6c3b010092b11f4676521565aabc0040c539b909d03edb4e008064ec87919d5445992a2f0050714e6e02b4cfb613002019fb6164275551a6ca0b00549c939b00edb3ed040048c67e18d9495594a9f2020015e7e42640fb6c3b010092b11f4676521565aabc0040c539b909d03edb4e008064ec87919d5445992a2f0050714e6e02b4cfb613002019fb6164275551a6ca0b00549c939b00edb3ed040048c67e18d9495594a9f2020015e7e42640fb6c3b010092b11f4676521565aabc0040c539b909d03edb4e008064ec87919d5445992a2f0050714e6e02b4cfb613002019fb6164275551a6ca0b00549c939b00edb3ed040048c67e18d9495594a9f2020015e7e42640fb6c3b010092b11f4676521565aabc0040c539b909d03edb4e008064ec87919d5445992a2f0050714e6e02b4cfb613002019fb6164275551a6ca0b00549c939b00edb3ed040048c67e18d9495594a9f2020015e7e42640fb6c3b010092b11f4676521565aabc0040c539b909d03edb4e008064ec87919d5445992a2f0050714e6e02b4cfb613002019fb6164275551a6ca0b00549c939b00edb3ed040048c67e18d9495594a9f2020015e7e42640fb6c3b010092b11f4676521565aabc0040c539b909d03edb4e008064ec87919d5445992a2f0050714e6e02b4cfb613002019fb6164275551a6ca0b00549c939b00edb3ed040048c67e18d9495594a9f2020015e7e42640fb6c3b010092b11f4676521565aabc0040c539b909d03edb4e008064ec87919d5445992a2f0050714e6e02b4cfb613002019fb6164275551a6ca0b00549c939b00edb3ed040048c67e18d9495594a9f2020015e7e42640fb6c3b010092b11f4676521565aabc0040c539b909d03edb4e008064ec87919d5445992a2f0050714e6e02b4cfb613002019fb6164275551a6ca0b00549c939b00edb3ed040048c67e18d9495594a9f2020015e7e42640fb6c3b010092b11f4676521565aabc0040c539b909d03edb4e008064ec87919d5445992a2f0050714e6e02b4cfb613002019fb6164275551a6ca0b00549c939b00edb3ed040048c67e18d9495594a9f2020015e7e42640fb6c3b010092b11f4676521565aabc0040c539b909d03edb4e008064ec87919d5445992a2f0050714e6e02b4cfb613002019fb6164275551a6ca0b00549c939b00edb3ed040048c67e18d9495594a9f2020015e7e42640fb6c3b010092b11f4676521565aabc0040c539b909d03edb4e008064ec87919d5445992a2f0050714e6e02b4cfb613002019fb6164275551a6ca0b00549c939b00edb3ed040048c67e18d9495594a9f2020015e7e42640fb6c3b010092b11f4676521565aabc0040c539b909d03edb4e008064ec87919d5445992a2f0050714e6e02b4cfb613002019fb6164275551a6ca0b00549c939b00edb3ed040048c67e18d9495594a9f2020015e7e42640fb6c3b010092b11f4676521565aabc0040c539b909d03edb4e008064ec87919d5445992a2f0050714e6e02b4cfb613002019fb6164275551a6ca0b00549c939b00edb3ed040048c67e18d9495594a9f2020015e7e42640fb6c3b010092b11f4676521565aabc0040c539b909d03edb4e008064ec87919d5445992a2f0050714e6e02b4cfb613002019fb6164275551a6ca0b00549c939b00edb3ed040048c67e18d9495594a9f2020015e7e42690dacc99339f5d1ecb9d6d270050351d1d1dcf2b8f5594fd30b293aa2853e505002acec94d20a5d8148adb21218410420831f8314c9a438e61c94eaaa24c951700a8b87870501e03182a1d1d1d2f0bdba187cbe3b9b3ed0400aa64f4e8d1ff18f65fae2d8f5794fd30b293aa2853e505002acec94d20a58e8e8ed787edd0ede5f1dcd976020055d26834fe3decbfcc2e8f5794fd30b293aa2853e505002acec94d20a5d1a347bfb3d1687cb73c9e3bdb4e00a04ac2becb7521de5b1eaf28fb6164275551a6ca0b00549c939b404a8d46e323613bf4b5f278ee6c3b0180aad8679f7d5e18f65d9ee8e8e87841f9b98ab21f4676521565aabc0040c539b909a414b641536ab5da79e5f1dcd97602005531ccee2f14d90f233ba98a32555e00a0e29cdc04520adba093abf87df7b69d0040550cb3fb0b45f6c3c84eaaa24c951700a83827378194c236684e8823cbe3b9b3ed0400aaa23ebcee2f14d90f233ba98a32555e00a0e29cdc04520adba0af8418531ecf9d6d27005005c3f0fe4291fd30b293aa2853e505002acec94d20a546a3b130c4fbcae3b9b3ed0400aa6018de5f28b21f4676521565aabc004085840382ae78327313d1557e1dc06009db9c1f8d1933e68de5f1dc690c010055300cef2f14d90f233ba98a32555e00a042c201c1defd3482cab177f9750083256c731ee8e8e87865793c771a43004015d487dffd8522fb6164275551a6ca0b00544c7de0ab865c2d040ca9b0dd7972d4a851db97c773a7310400e46e98de5f28b21f4676521565aabc0040c5c42b82fa6908b95a08187263c78efde346a3f17879bc0a34860080dc0dd3fb0b45f6c3c84eaaa24c951700a8a07865503f4d21570b0143aa56abed1eb63df794c7ab40630800c8dd30bdbf50643f8ceca42aca547901800a8a5706f5d318dabbbc1cc060aad56a6f0bdb9e1bcae355a0310400e4ae3e3cef2f14d90f233ba98a32555e00a0a2e21542bd9a42ae1602865cad56fb50d8fe5c591eaf028d21002067c3f8fe4291fd30b293aa2853e505002a2a5e21e46a2120a55aad36216c7f3e5f1eaf028d21002067c3f8fe4291fd30b293aa2853e505002aace7aaa1f238c05068341ac78738a33c5e05b69d0040ce86f1fd8522fb6164275551a6ca0b005458cf5543e57180a110b63f67d66ab5e3cae35560db0900e4ac3e7cef2f14d90f233ba98a32555e0018b18aa278deb265cb2e59ba74e9538b172f2e162e5c288638c2e7be6ec99225cb3b3b3bf72bff7e80fcc5af918b5f27571eaf028d21002057c3fcfe4291fd30b293aa2853e50580116bd9b265f3972c5952ac5cb9b258b3664df1e4934f8a218ef8b9c7cfff9a6bae796ce1c2851f2cff8e80bcd5ebf52b6bb5da87cae355a0310400e46a98df5f28b21f4676521565aabc003062c52b856253a2dcac10431f2b56ac58b570e1c21bcbbf23206ff57afdfb21de5a1eaf028d21002057c3fcfe4291fd30b293aa2853e50580112b7e7d9c2b85f288f87b58b870e1daf2ef08c85bbd5e5f3666cc98d795c7ab40630800c8d530bfbf50643f8ceca42aca54790160c48af7b829372844ba88bf8ff2ef08c85ba3d1787cdf7df77d4979bc0a348600801c8d80fb0b45f6c3c84eaaa24c95170046ac4d35866ebae7e162c6253f298ebee84703c6990bee2896af7ea2cfeb457ba13104d5326ad4a8edebf57a65aff4d3180200723402ee2f14d90f233ba98a32555e0018b1066a0c9d30ff27c5f7ef7ea858f8d3e57d1a41fdc5f95d77f75987682f3486205ff17facd6ebf57f0db177ad56dbbdd168bc74ecd8b1bb85c7f79797ad0a8d2100204723e0fe4291fd30b293aa2853e50580116ba0c650cf9540f7af7aa24f13a8bf38e5ebb7f65987682f3486206fb55aed27b199d23b1a8dc653617a7b88ae307f51984e2abf2e571a4300408eeac3fffe4291fd30b293aa2853e50580116b538da1e3befae33ee362f0426308f256afd70f2f37864af154a3d1f89bf2eb72a5310400e46684dc5f28b21f4676521565aabc0030626daa31b4b9517eadd8b2d01882bc757474ec50afd77fdb4f43a8e7eaa133caafc999c61000909b11727fa1c87e18d9495594a9f202c088a5319457680c41feeaf5faff941b42ddf1ab8e8e8e179797cf99c61000909b11727fa1c87e18d9495594a9f202c088a5319457680c41fec68c19b3573f4da118ff565e36771a4300406eea23e3fe4291fd30b293aa2853e50580114b6328afd018826aa8d56a3f2c3585ae2e2f53051a4300404e46d0fd8522fb6164275551a6ca0b002396c6505ea13104d550afd7a7f434851a8dc65363c68cf98bf23255a0310400e46404dd5f28b21f4676521565aabc003062690ce5151a43500d6f78c31b768eff9b3536566ab5da85e5e7ab42630800c8c908babf50643f8ceca42aca54790160c4d218ca2b3486a012de1562e5873ef4a16fc6ab85eaf5fadf9517a80a8d21002027f591737fa1c87e18d9495594a9f202c088d55f63e894afdfdaa7f13350c4e5cbeb105b161a4390bd665328c4b13bedb4d3ea5aadf6db46a3f1d2f24255a1310400e46284dd5f28b21f4676521565aabc003062f5d7183abfebee3ecd9f81222e5f5e87d8b2d01882acf53485e274bbe73ef7b9ef1e3d7af4ba38dd70b1ead01802007231c2ee2f14d90f233ba98a32555e0018b1fa6b0c2d5ffd4471e6823bfa3480fa8bb85c5cbebc0eb165a13104d9daa029d4a3bb29d467bc2a348600805c8cb0fb0b45f6c3c84eaaa24c95170046acfe1a43225d680c4196fa6d0af5b2a9e7b3a5310400e46284dd5f28b21f4676521565aabc003062690ce5151a43909dcd6dfa6cee7259d11802807c1545f1bc65cb965db274e9d2a7162f5edc3c5618ae71f5d55717071e786071d55557f5792e6584cf7ddd92254b96777676ee57fefd6c03f6c3c84eaaa24c95170046acb8b35b6e4e8874117f1fe5df11904cbbcd9e76974f4e630800f2b56cd9b2f94b962c2956ae5c59ac59b3a6cfb1c3708bdffef6b77dc65247fcdce3e77fcd35d73c168ed53e58fe1d6d25fb6164275551a6ca9b9dabaebaea9f2eb8e0822b4f3df5d4878f3beeb8df1d7ae8a1cfc483b62953a63c7dcc31c73cf1b18f7decfeb3ce3aeb73b367cfdea3fc5a006887c6505ea13104d9d8d226cf96be2e098d2100c857bc52283625cac70c62e863c58a15abc2b1da8de5dfd156b21f4676521565aabc59288ae2395ffdea573f3563c68cb593264d2ace3befbce2c61b6f2c962d5b56ac5ebdba88e2343e8ee3f1f9430e3964ddf4e9d3579f76da690795d707009b436328afd018822c6cd0dcb9ebaebb76bfecb2cbe67df2939ffc65d8575f73e8a187aeebf94f5b471f7df423279d74d2b5a79e7aeafea3468ddabebfd7e74c630800f215bf3e6e245c29548588bf8770acb6b6fc3bda4af6c3c84eaaa24c9537b9050b161c74ca29a7fcf6d8638f2d6ebef9e662ddba75cd46d0a6c4e5e2f2c71c73ccbaf0dafbc2f4cde57503c0403486f20a8d21486e7d5367f9f2e5afbee8a28bae3df4d0438b59b36615575e796571cf3df76cf09fb6e2e3381e9e5f3771e2c4df1e79e491c7efbdf7decfedbd9e0dd69e198d2100c89763b5bc62108ed5b6f5fa60aba52aca547993baf4d24b3f1baf105ab46851f1cc33cf945a3f9b27be2ebefee0830f7efaa4934e9a58ce01001be36023af1884830d60f3ad6fe6dc74d34d1367cc98f1ccc73ffef1e2de7bef2d7ef4a31f15279f7c72f1d6b7beb5d86db7dde2df69731a1fc7f1f87c5c6ef6ecd94f4f9c38f19e8e8e8e57f75e5fef2439d11802807c6dea58eda67b1e2e665cf293e2e88b7e34609cb9e08e62f9ea27fabc5eb4178370acb6add7075b2d5551a6ca9bcc85175e78dde1871fdefc7ab86d21aee7b0c30e7b261cc49e5ece0500fdd9d4c18618da1884830d60f3ac6fe27475759d19af125ab0604171f7dd77171ffef0879b4da0134f3cb1f8def7be57dc77df7dcd7def388d8fe3787c3e2e17970faf5b377efcf8476bb5da9ebdd7bb41b64c680c0140be063a563b61fe4f8aefdffd50b1f0a7cbfb3482fa8bf3bbeeeeb30ed15e0cc2b1dab65e1f6cb55445992a6f125ffbdad73e3f75ead4f55f45b1adc4f51d76d8614f1f73cc31e3ca3901a06ca0830d31f43108071bc0a6ad6fdec42b856253e8073ff84171d55557153befbc7371c61967146bd7ae2def766f203e1f978bcbc7d785d7af3be0800356e77ee590c61000e46ba063b59e2b81ee5ff5449f26507f71cad76fedb30ed15e0cc2b1dab65e1f6cb55445992aef90fbce77be33397e7d5cfc4ef2c110d73b71e2c4a7c68d1bf7b7e5dc00d0db40071b62e863100e368081ad6fdac47b0ac5af8f8b570ac578c52b5e512c5dbab4bcabddf4fbdfffbe3cd414978faf8bafbff2ca2bd7eebffffeb7e67ccf218d2100c8d740c76ab1d973dc577fdc675c0c5e0cc2b1dab65e1f6cb55445992aef900ac78bcf3be594537e17ef093498e2faa74e9dfab3727e00e86da0830d31f43108071bc0c66dd0acb9e8a28bae8df7148a5f07b7cb2ebbf4db148af7f6fcf4a73f5dbcec652f6b4efbbb47687c5d7c7d5ccf8c1933eeafd7eb93facb97038d2100c8d740c76ae52b82068af26bc596c5201cab6debf5c1564b5594a9f20ea9cb2fbffcbc638f3db6df83c86d29aeffe8a38f7e7af2e4c9fb95df0300f418e860430c7d0cc2c1060c5be3c78fff9346a371fab871e3762e3fb7193668d2dc79e79daf3becb0c38a7befbdb779afa0f8b57065b1d1f38e77bca319f13f61f5ccc7f1b2f8fab89eb0bedf8f1d3b76c5a851a3b6ef2f6f6a1a430090af818ed5cacd9f81a2fc5ab1653108c76adb7a7db0d5521565aabc43261c233eeba31ffde89337dd7453f9d8b18807655b1b6531cfa1871ebaacfc3e00a0c740071b62e863100e3660d81a3366cc8eddfbc16b6ab5dadceefbf96c8e3ecd99af7ded6be7cc9a35abf8d18f7e54bcfad5afdee09e421bbb4a6863e3517c7d5c4f5cdfd4a953ef0cef6fd41fd2f7cd9f4afcfcca6300401e063a562b377f068af26bc596c5201cab6debf5c1564b5594a9f20e99aeaeae7f993c7972b16eddbaf5078d3de2415938685c3f9d3f7ffe26a3f7f2fd3586629e8913273ed9c641320023cc40071b62e863100e3660d80afbb82f2efd47a9a7427c3e8cff5579d95efa6dca7cf2939ffce5b7bef5ade2e4934f2e4e38e184f5fbd3bdaf12eaefcaa06863cbc4f5c4f55d74d145b7d76ab5f37ae7db6e23ef63a8690c0140be063a562b377f068af26bc596c5201cab6debf5c1564b5594a9f20e99cf7dee730bcf3befbc5e87917f100fca7a1a3e3df303e9bd5ccf7c7f3ef399cf3c73f0c1071f577e2f00100d74b021863e06e1600386adf8f56ca5c6504f3c13627e88bf2bbd64a3cd98e38f3f7ecd3df7dc53bced6d6f2baebdf6dae67e74fc9bdc69a79d8ad9b3676ff26ba0e3f371b9b87c7c5d14d713d777c71d77fc22bc979bca39b71be0fd0c158d2100c8d740c76ae5e6cf40517eadd8b2188463b56dbd3ed86aa98a3255de2173da69a73d74c30d37940e235b7a378336d51c2a3f3f506328e69b3265ca92f27b018068a0830d31f43108071b306c7574743ca79fa6503916341a8d7fd86e134d98b0bfbceed7bffe75b1ebaebb160f3cf0c0fa7de9830e3aa838fdf4d37bed5d6f5c5c2e2edf23ae27ae6ff5ead54f84f7f1403967b701dfd760d318022aee85e501184e063a562b377f068af26bc596c5201cab6debf5c1564b5594a9f20e99e38e3b6ecdb265cb7a1d3efe41b911546efe0c343e506328e63be49043dc6708807e0d74b051e5d8aeb55fd1673cf71884830d685b6cb88c1f3ffef9fbeebbef4bc2fc9f8e1b376ee7307d65d8df7ced983163fea256abedd16834de10e6df1ce6df16c6df317af4e87787f9f787f90f86e7fe254cff2d4c1b61ec80303f31cc4e0ef353c3fcf4307f7c989e18e2d430ffef61fc3fc3f4bfe27d82c2d867427c363cbe304cbf1ca69784f1cbc2fc9561faed305d1c624988a5216eaaf76d0495235e3df4fb381f7eb463cb3f6b8ff033164f3ffd74b1fdf6db37ff167bc47b04bdea55af6a3e3790f87c5c2e2edf23ae27ae2f3cf778c8bfb69cb397f8be627368c84f70767f2e005594b4b10e4361a063b572f367a028bf566c590cc2b1dab65e1f6cb55445992aef90993c79f2ba471e79a4d721e41fc483b24d3581ca8fcbcbf527e63bf0c0031f2bbf170088063ad818ecd8aebb79538ef2725b12db725d43198370b0c1209a3973e6b3e3d799c57bdd8c1f3ffe4fc2f465619f6cd73163c6bc26ccff79a3d1f8ebb163c7fe9f5aadf6a630fed6d1a347ffbf30dd3b8cbf2f2cf3cf617edf30ff91f07c98ad8f0bd309613a29c4e1617c5a981e1ba61f0de3a784f9d921fe23cc9f15a673429c1be6ff3b4c3f1f96f9df30fd6a88af87b16f84e955211685f1ef86e9f742dc18c67f18a63f0d637784e93d217e1562458855211e0df1db7aeb1e3debeaad46ca9ab06c6c68ac0eb132c4fd21ee0d716788db43fc38c4cdf55683e6dab06c67985e5d6f35706223277e95db57ba1b3c9f0d63e785e9bc109f8c8da030fd78889961fe63b15114a64787e911616c4abdd5483a304cc784f18e46abd1f4c1f099fd53987f4f987f47add5907a4b8827eb7d9b41316e0fcbd7c3efe1057befbdf773b7dbc409c4b09ffe747f570c45ef7ce73bfbec7f97c5e7e372bdf55c31f4f0c30fdf5ddfc81543cf7ffef3dfb3dd00ef6bb0c5cfaa3c0650013ddbf49ec67a926d280cb6fe8ed54ef9faad7d1a3f03455cbebc0eb1653108c76adb7a7db0d5521565aabc43a6e77f22f6271e94950f387b1a3e3166cd9ab57e7e63cbf527e60b07c54f97df0b0044fd1d6c0c556c57d1e6cd60c6201c6ce4e2591d1d1dcfdb679f7d5e18a63b341a8d97eebffffeaf08f3af0efb29af0bd3bfaad56a7f1bf667fe2e4cf70cd3b78765de357af4e87f0cd30f84d8278c7f388c87496d6c988e0f7148183f2c3c3e2a4c8f09d313c2d8c9214e0bf189106786f14f87f173c2fcf961fe7361faa5101787b14bc3f48a7aeb6bc61686695788eb427c3fc42d216e0df1b310f184fe2f432c0ff15078dd2361fa9b7aab1911af4489b136c413ddcf3d14e28110f19e32f1b53f0be33f09d31f84b8a1deca11737d278c7f2b4caf88ef25bc878bc2fc17bbdfe3f921ce0ee39f0ad333437c228ccf0ad393e2cf187fd6307f64983f34cc1f1ce6c7c7cf24cc8f0ef3ff1a3fabf89985f9f786cfef9d61faf6f0fc9ee1737e6318ff9bf859c7cf3c8cbf2accbf3c8cbd34fe4ee2ef66d2a4497f147f57e55f5ecec2cf11bfa6ad7743e8aef879c4a65d79d9ed06680e1d7df4d18f96ef31d4a3bfa64f597fcda39e7b0cdd7aebadf1f7dee71e43b12914df7378bfb119b736c4af43fc223cfe61f8bdc41a894db5d8103c28fccede3976ecd8dd6223b2bc9ead11f397c7003257de96971fc3b0d1dfb1daf95d77f769fe0c1471f9f23ac496c5201cab6debf5c1564b5594a9f20e9970b0fdf4e65e31d4fbeaa08dcd9797ed4fcc77c001073c527e2f0010f577b03154b1dd261a433dcff7c42ebbec527ce94b5f2a56ac5851bcf0852f2c76df7df762eddab5cd65e3f475af7b5df1a217bda878f0c107fb5d77cfd84b5ef292e2ed6f7f7b71dd75d7f579aebfd70d65c4df473c391faf72183b76ec1f877fc3778a27efe309e130fdb35aadf697f1e47e98fedff06fff5bc2fcdfc793ff61fa9e78354518ff50bdd51c884d8231617a606c1e7437118e08d3a3c3f88c1027859819e2e361fc8cee26c4bc5aebaa8eff09f1c5105fa9b7aefab8bcd66a627ca7d1ba2ae4da7aabc9119b1df1aa9178f5c85df55633245e5512af2e8927b8e309fb35f5d6d527f1c4776ca6c4ab52e2d5290fd75bcd96d874b9a7d1ba8a2536636253e6c67aeb2a976b1aada6cd55b5d655305f0b7171a37575cce7435c506b357de684e95961fcf47aab29747298ff68981e5b6b358d0e0bf393c2fc8430bf7f98af85e947c274df30362a369fc2fcdef16a9ef019ee15e6ff2e5ee51396f9ebf0fceeb179d5ddc47a59bc2a68dcb8712f8a4dae8d341e1862b556432eee0bc7da9bd47d75d040deb55d3f27104f3ae9a46bbff5ad6f15279f7c7271c209276cb03fdddfd7c4f5b6b1af9b8beb89eb9b3b77eed7e2df56ef7cdb75bf8fe73ffff9ef0df5f4faf0deff35d66cbdd514bc2cd4dff561fee7215686f9d88c6cfe1dd55a4da4381fff96e2df5abc82ebfab04cbc4a2bbef6b8101f0ef1b658bf713b52cabb81f8d995c70032d6ef367c8071a8b4fe8ed596af7ea23873c11d7d1a40fd455c2e2e5f5e87d8b2d0186224485594a9f20e99a38f3efaf1cdb9c7507fcd9fdb6ebb6dfd7cf9f9811a4331df840913ee28bf170088fa3bd818aad8aed48ce989f2f3679f7d7671fdf5d737e75ffef297379f9b3c7972f3f115575cd17c7cf9e597371f4f99326583d79673c6b8f5d65b9bcfbdfef5afef93ebdc73cf5ddf6c4a118d4623fe9b1ebfceeb77211eabb7bee62b7eddd77d2196d55b278a7f1ae247f5d6fd55e209e1f875618b6badfbaf7c33c4d7c3d82561fae5105fa8b5be6e2c7eedd8dc30fe5f61fe3feaadab104e0d71623c911cc6a785e9d4309d1cc60e0a312ecc37c2f4dfc2f87ef16bcfc2f4fdf13e3261f81fc2f85bc3e33785f93784e91ef16bd3babf3eed95f17e34617ec78ed6d7ab3d3f4c9fb31d0c92508bb7873a3ca6cd2b69deb55de904e2c73ef6b171b366cd5a179b3caf7ef5ab9bdb81de4e3ffdf4e2a0830eda60ac471c8fcff7165f1fd7f3c31ffef0f7071c70c0d2f07732ea0fe9fbe6df1cf1ef29fcbcaf0df1def8b75a6b7d25df57c2b4abdeda2ec4666b6cc836efab149689db92d8448a8fe3f8f230765b987685697c5d7c7ddcee7c24369863832a3640353d814c6d6adbb9a9e7a172521eab89bea131c44890aa2853e51d3227fc7ff6ce044c8aeadcfb8d46bd51dca28022895ec9f5ba251745d4f061e072452508c6a5a7aa7a66601018904d0611902582445142880c8b8289e006080404914560109045595c100464539661df1594e57cef5bd5d5d69cee9ee9adbaaabaffbfe7f94fd559ea9c9aeed3677beb9cead973e3f2e5cbcb0c1a4d7850166d45502422ad228ac4b265cb4ee5e5e5cd90ef05000000609c1c6cf8ca31de58c30f1f3e2c4e9c3851263e3f3071ce39e788fbeebb4f77376ad44877af5bb72e62dab367cf16b56bd7d6571499611c5fceebc8912361f7914ed930d80020a389d32064a5becf3281c8e9b46ad5eaf8d6ad5bc5238f3c22060d1a54a64fbd6fdf3ef1cb5ffe32545758c5fe1c6e85afe7743efffcf329d44fdf61b9cf32f9da05af6ed334ed46cabb81dfefcfa7e3b39ab155e187aab1d28f5758f14a241e47b031990dccbcfa8f57f309188700002e23d6ba33d67800780227c76a50b86c18aba53a3d0092c6a942e954be69e3d9679ffdfbabafbe5a66d068c203b08e1d3bc6641432310d42e67591183c78f00e7e0258be17000000807172b0e1938c37b2e470d9dda4491351a952257db5101f9b366d1a35ee35d75ca3bb972c59a21b7fe470d9ed946c186c0000a253df679940ecdcb973f70103069cdab46993be75e5b265cbe4ae754cf0757cfdc68d1b8f376fde9c0d2e8591f27303910c403cae90fd0000c041e2ad3be38d0f806b7172ac0685cb86b15aaad30320699c2a944ee59b36788b95c2c2c23367cf9e95c78fba61c734f298ab80629169148a6418e27c68307a84f7c697ef05000000609c1c6cf82a30c6c8e1b23bd83117952b57d68ff3e6cd8b1ab74a952aba9b5f063f74e8d0b070d9ed946c186c0000caa7be2f3881c8ef276ad5aad5e69933679e2589abafbe3a6ee310c7e7eb388d810307f2368eab83ef3d0ae55326771702c310b093912347d61f3264c8943e7dfaece9dab5ebf7eddab5e3ed0e792bd8d3454545dff7eedd7befa04183a6911e90af055949a27567a2d701e02a9c1cab41e1b261ac96eaf400481aa70aa553f9a695f6eddb6f5bb162853c860c197792910c0d4cf70702814fe57b000000004c9c1c6cf882c6185972783437ebf6db6fd7fdf818296dd33d7efc78fdfd44b1e6e5946c186c00002aa6be2f3881c80f541514141c5eb56ad5d959b36689aa55abeadbc2c9ef1c92e1708ec7f1e9bab393274f1e45fdf39dc107b442e997c9d5a5f0b842f603201978651afd3e0676ecd8f1874e9d3a89d75f7f5dd06f4c6cdbb64d6cdc5a2a9e1bbb541c3c7850bc3163957873fa52f1d65b6f89ae5dbb8ad6ad5bffd8a74f9fd1fcce3a394d9015245b77267b3d008ee3e4580d0a970d63b554a70740d23855289dca37adb46cd9f2c1a2a2a21fcf9c39238f27530aa74f1de99d9aa6e1492b00000051c160c35db261b00100888dd004a2a228759a376f7e60c68c1927795b397e57508d1a3544af5ebdf4ed28b76fdfaef7b7f9c86ef6e7708ec7dbc705570aede474ace996c9cdc5c0300492a1a8b8a47f97e21261aad73f26bcdca953a763fdfbf717ebd7af17a5a5a5ba61e8b1c71e13b56ad5127f7cb0b9b82fb7bbb84fe92c1ef0178a871f7e58f0f6ebfcbeaf9d3b778a1123468856ad5afdf8e4934f0e8cb4f521c858525577a62a1d001c01633577c986b15aaad30320699c2a944ee59b76dab56bf7c5bc79f3c2f7934b21d3a64ddba469da02396f000000c00a061bee920d830d0040ec84261079a54f5e5ede9a1e3d7aecd8ba75ebe9cf3fff5cf4eddb57dc75d75dba1188e2e84776b3ff679f7dc671a604df29b4da8b2b854c601802c9d065e8820fbb0e2df9139ffff5af7f1d4163df33ab57af166c64cdcdcd15bffad5af442010d05705f1efea95292bc4a7eb4a7523d0175f7ca1aff02d2828d0b7646cd8b0a158b060816e4c1a3060c04f6ddbb65d4d63dc6a729e20e34875dd99eaf400481b18abb94b368cd5529d1e0049e354a1742adfb44303c59b69d0786cf3e6cdb23d27256cd8b061177598f7713e72de00000080150c36dc251b061b0080f8084d20f2bb8154552d0c0402bb3b76ecb871dcb871eba89ffdddfefdfb8f5397fbd8debd7bb7ac59b366f1cb2fbffc6feadb2fe355421cdf6bef1492816108240aafe8e9525c728474aa68e89c93dd9e1d72967e2782570bf1bbfe9e7ffe7971f8c851f1f687eb448f57178a0f966d167dfff9b13878f4843872fc47d1e7b58f4363da016397ea2b8e3a0e9e2902ed9f15bb76ed12a3de9e7eb6f3dfde3bdd65e8fc531cf6e4b0f97ef91e80e791ebce4aa416c1633cc8d7c9e902e009305673976c18aba53a3d0092c6a942e954be8e4003ae666ddab43976e0c0819f2d3a298006aafbf3f2f27671fa729e000000800c061bee920d830d0040fc9499406cdcb8f1058140e07eea5ff37b833e256d67e349f0c8ee511ccef1225def35601802c932e0f9e747767bf61f67fbbcb6483cfae8a3a25ebd7a62cf9e3dfa78f5fd259bc55b73d68a1f4e9e12f3566ed3df2fc47cb5659f1835ed0bebd056f0161ba5fb8f89a2a17345f5ead5c5d3234ac498298bce346fd96a1ffde6ae95f3059e47ae3bd9a8f32f9f3157c4c7588d43d1ae93d307c0f560ace62ed930564b757a00248d5385d2a97c1d83065d9d5bb66c7968cb962da7cbf4801364fdfaf51ba883cc4f2a7696f3020000002281c186bb64c36003009018894e20267a9d6b80610824c34b2fbd94dbb66ddb33df6edf259e1c324bdf3eeea79f7e0a8d59fb8f592a0e1dfd41ac5ab54a148f7d5ff4fac744d1ae5d3bd1b1ef30d177c83b62d2a449e2bdb9cbc54bef7c22ba8df8485f35c4ab87162e5c28eafd294f3c3b7abe786a78c9d9b6bd471c2e2828b84cce1f78964875670b9f314f642a16e390d52864aab9253c523e00b8168cd5dc251bc66aa94e0f80a471aa503a95afa3f0ca9ebcbcbc431f7cf0c1ae3367ce58cc3cb143d7fdf4ce3bef94505a7bb152080000403c60b051be7cc14905d9df2ed930d80000244ebc1388f1c67725300c8144e1ade43a75ea74ece3652b45f7c11385f2443fbd6db3d27de447a2e7b32f893efd078a6746ce131f2cfc52bcfbeebba2df2b33c5f4f92bf4f3a297e7881efdff2e366ede26de9dbf5e17f3f1c71f8b6ad5aa8919f33f115d877e7846519462f91e80278956774632f294671c8a14ff9f417f2bd1f203c07560ace62ed930564b757a00248d5385d2a97c1d47d3b45b480b5ab76ebd73d9b265a567cff2a2f98aa1783fce9b376f615e5ede46babe84d391d306000000ca03838df2e5836108806c27d609c458e3b91e188640a21415cffd9e57f8f41eb550dc1fe82a76ed2ab58e5dc58c193344c7bec5a2db880562cc076bf4770af1fb85789550f711f3c4a16327f5b86c08ea3aac44747a619cf8cba879e2b36ff688194b37ebab878a8ae78bd6fdde16cbd76c13f9f9f907680cfc7bf93e407ae1955bf43d0ca4efa3aa1c160315d59d918c3d918c4391e245320a9954942f00ae00633577c986b15aaad30320699c2a944ee5eb1a144569ccfb9407028103cf3efbecaa929292cf376cd8b069fffefdfc22a253fbf6eddbbe6eddbacfe6cc99f3d1d34f3f6dae10fa94af93d3020000006221d5830d9f65405ea9522571e79d778a4d9b36450c67b1dfeeddbb455e5e9eb8f2ca2b75f1b633ec17e99af2d28ce6a67654b469d3467fcaf8d24b2f154d9b36155bb66c09854f9c3851dc70c30de2bcf3ce2b73ad7caf91f2b8f8e28b45ddba75f5a798cdb06464c3600300903cf57de54f205614ee2960180289d2b163c71fd6af5f2f683c2b9e7ffef990518861a3d033cf3c23684c5bc69f59bb76ad2e198ecbd7f0b5561a376e2cfefef7bf8bf7de7bef1b2aafefcbf701d20b7ddf9773bd413ac1abb8fc7eff6fe4385188b5ee8c64f4b11a8722859767143289357f001c23d563352839d930564b757a00248d5385d2a97c5d0777a4a843d5913a5633482bd49f5f70cb62f70c0e8fa3c3050000004424d5830d5f7040fed65b6f89b163c7eae70f3df45058f8c89123c5c99327753f360ac9d7b09f7c4d79699e73ce3961f14d77cb962d75f7d4a953c5d2a54bf5f3860d1b86c2ab54a9a21b8566ce9c59e67f899496ac356bd6e8e137df7c73585822b261b00100480df57d912710a3f97b16188640220c1b36ac41a74e9d446969a9b8e28a2bc4f1e3c743869c1d3b76e8ef113a70809f778c0f360eb56ddb564fc364c3860d7adb7decd8b1b39aa61da171f1afe4fb01e9833effca96f90ad64ff4bdbc4efeff2dc7b5106fdd19c9f8c3ee7322f8c762143289f73e00482ba91eab41c9c986b15aaad30320699c2a944ee5eb19a8837586f76d96fd010000804449f560c3171c941f3e7c581c3a74483fbffcf2cbc3c28f1c3912f2e30924f91a5e39245f535e9ae79e7b6e587cd3cd69997ea62eb8e0825078f5ead575bf6bafbd5614151595594d24a7c59a3d7bb6a85dbbb6b8e8a28b42e156c35432b261b00100481df57d6527101b48ee8c00862160929b9b7b099587e18140e05a394c66c8902153c68c19235e7ffd75dd386072faf469d1ab572fb170e1c2909f0c6f25c78ac6e2c58bf534382d937af5eae90f7474ebd66d25e5d74abe1f903e1a376e7c8164183275863489ca4f2de912b92e8d9548c6a10d923b1ea39049a2f70340c270fd2afb4522d563352839d930564b757a00248d5385d2a97c3d033f79535858789eec0f000000244aaa071bbee0c0bc3c230ecb7a4d2a0c43a66186e3c879f053c5ece6a78de5fb657df2c927a259b366a1ade46ad5aa1596b735fe35d75ca3fb2d59b2443770458a93a86c186c0000524b7d9f3181f8b4a228fc7b65774601c31030a1b6f162eb0a904020f05f721c93be7dfb96ae5cb952f8fd7e7d85afc9aa55ab048585dc91a8c830c4701a9c96c9b061c3c4e38f3f2e3ef8e08315746f13e5fb01e983bef37323188564cda4efa99e2f79234c24e390a9448c4226c9de17007141bf87f5f4bb78ae220351aac76a5072b261ac96eaf400481aa70aa553f97a066a344e141414fc87ec0f000000244aaa071bbee0e0dcbaed1b1b5de470eb35896c25674d93df1dc47ecb972fd7b7a893f368d5aa95eeeed2a54b99954ab2f83d411cefeaabaf0ef95d72c925badfd6ad5b437ea6a1899f601e3a7468587ec9c886c1060020f5d43727cbf9497939d0ebf0ff26fb81ecc4eff7ff529adc3fad69da7845516e95e376eddaf5fb6ddbb689db6ebb4d7cfef9e721030e1b7cf85d7ee5118b61e8dd77df1593274f0eb9972d5b26eebefb6ef1d5575fada3fb5a26df4f26c0bb85701dc35bb5f17b7ce85885fed7eabc828bce7f4bdfc58db9b9b9bfa3efe376f2bf8b0d2f746c40c74614e74fe4ff10b91fa3231dd47cd2e314d6968e1de8d885fc9fa6f35ea4674903482f92ffdff93d4174fe0a1d5fa3e358d23b6c7ca3e314d2fbe43f9b8ef3498b484b5563bb7bd910248b570f9de673fad7bac9ff6b9cf02e2af24a217627bbbb4a3736f8d33dfe443a463a402a257d4be2f7597d455a4d5aae1afffb3c8aff01692a9dbf4b7a8bf44fd248fabc5e260d22fd95dc7d493d4845a40ea436744d73fe5e488f901e24dd4771eb93fe40df5d6dfe5e792b3e8a7b1da93af95fc90684e07c50a2c62fe02254e39de15cdef6d3f7fb54b4fe44aac76a6e912f85e3a774ca86b15aaad30320699c2a944ee5eb19a8c1389e9f9f7f91ec0f000000244aaa071b3ecb20bd52a54aa24e9d3a62e3c68d61e1d66b76efdead1b8278e5108b06beba9f7c4db434df78e30d51b56ad532f1ac79f03b0d3a76ec286ad4a8a1af2c92c34d37af18bae9a69bc4f4e9d3436103070e0cad6832af193f7ebcb8eaaaaba2e6978c6c186c00006c4035260e0f1714145c2687791d9ea892fd4076c2bb5504272e659d0d4e86df61897b9a57f5f2c315dc869b0c1a34487cf9e59721b7cc575f7d25dab76f2f9e78e209fdbd7dd1f8e28b2ff4b44cb66fdfaeb7ebfbf6eddb4df7b19def950d593c79debc79f32be8fc2a3aaf41c7ffa47bbd41d3b45b784b33be679e7ccfc9c9f9239dff1f9d3fc013f374fe309de7d0792e1d5b905ad3f913e4df99276d556362bf0f9df7a7e30ba4bf51f83fe8389c348afc5fa7e39b9a61389b4ce7d34833491f9216903e267d425a4de15fd2f16bd226d5303aec24ed25ff43743c4efa51350c29ac93a463c1309e48e6b8db54c350f17530ad55aa61ac58ac1a797d48fe1fd0f13dbe17be273a7f93f42f72bf4ac7e17cefe43f88ce9f27f523f521f520ffaee4df89ff77fe0cf8b320ff00b9fd747c988e0fd2e7783ff93724f73dfc59d2f10ed5b867b99cb0d6517c95bf9b060d1afcc297fcca9cf2560cb17fa24693d07d05cb52657e77159723d26f78b51cfdafb7d0ff731be92efedfa90cddcb0638f2ff3329879447feadf8b3233d49e295a5bdc9ef39d28ba421aa515e4653dc3782dfcbbf49ef93e6903e520d43db4afe5e356345c956d5f8cef7918ea84679e072718af4bd62948b3da4ef54a33cb1a1f473d5286b5c1ed880378b348dd29b487a9bf43a9703c53000fe4d35cac0b3e4ff0ce929c578df7521a98014203d46fe4df97ba7fff97f49ff8fe2d421bfdf936e24ffebf9b7969f9f5f953eab4bf9bbe65564f2070cca429feb61b5ec6f85bfc3c7e5cf2ed563b578e40bff8da56ccc93cab4d2291bc66aa94e0f80a471aa503a95af67a046e24845cb4c010000807848f560c3674327df8e34dd2a1b061b00001b508dc9dbdd3c692887791d9ea092fd4076c22b56a489cb3029c6ea917bf8018f53a74e89f3cf3f5ffcf4d34f21034ebb76edc4db6fbfadaf085abb766dc8dfe4e9a79f0ea5c5c62179f5105fc36e4e83d3323979f2a4febe40caeb64f07a36d6fea01a93e7fb5563a5c776d216d206d25774af9fa9c6ea96a59aa62da4e33cd59834e789795e0df32e4f9cd371ac62ac9619491a4ae7835563627f009dff8527d0e9bc1b1dbba8c60a9042f26f49c77c3aaae4ff289d37a3f3c674de88ce1bf0647a2010b893fc6ee7d5203ca14ee735d9e840e1d5e958850dcdfc20289d9fefb5770babc60a1b6bd9f886febfdc28ff477d5f62c6a148462179e55022c6a144efc731d8c8d6b469d30bb9cc5059aa469ff7afb93c916e22fd0f9735f2af476a487a20581efdfc9d705925bfb6a44e5c8e5563d5181b075f0896f561a451a431a477c86f32693a69365d53a21a464efe1d7da11a06cecdaaf15b63c3251b3bf877c8abc3d880c5e7ecc7613b54e3f7c8d7f0b59cc612d2024e3b98071b55c7a9c64a35be876194e7df490335c328cbf7caf7dc99d48ef478f07fe2ffed215263d530f8d6e3cf808dc1f47bba99fc6b92ffaff9b322bfcbf9771634543a866a7c366175aa6a7c3e8f99f1523d568b47be2c1a83c52a1bc66aa94e0f80a471aa503a95af67a0c6e1203762b23f0000009028a91e6cf86c1840d891a65b65c360030060038af194363fe97f9d1ce67578624af6033fc34f73f3963f3cb1c80fed05571554c9cbcbbb9a271eb94c90fbb7a4ffd634ed162a2bff43ba3d3851cbab2b78a5013f757f6f70c2b6094f68d2f9a3a41cd5589dc1db4cb1a1a10da91d9d77a4b02edacf2b577a91df5f546325c2f374fe12693085bfac1a2b125e21f76b5a70158b6a4cb4f25657bc3ae13dd20cc598e49dab1a2b4ccc2dc13e558dd5275f50d85acd58b1204f5aca3a4bf1ce141616eaeff9e315b5d615431519867af7ee1d4a8b570ec56a18e2f7065a560ced90bf27905e8275227f8f3cf95f18c3bb91e335c644320af13b85d8f024fbc7631c8af73e408cb05130b87a88571155215d43fa4faa2f6e24fd5e35569ad5253508ae426b1aac0799165c8eb8ee237525f5548d2d0f797513af721a4a7a85eb38cd5805c55b1d72ddc6abf4789514af96fa84aefb8ceb32d5584dc52b72b8be38a81a0f77f0aaabb3a49314e7a86a18947975d656d53026af518dfa90eb465ecdc5abff6690a650fcf1a437b89e258d508cd5836c3ce63a99571676578c5563bceab0956a6ce5a890ff9f799519d7ffaa613893ebd39028ee4a8a777faac76af1c857c118cc0c37c5db7bf3d6dfa5a5a5e2c20b2f14356bd6d48df81c978fd75f7fbdb8e8a28bf4362252daa6dfc5175f2cead6adab6ff32d8745ba2e9db261ac96eaf400481aa70aa553f97a066a1cf651e370a5ec0f000000248a93830d285c360c36000036a01a5bf76ca4bef98d7298d7e109a92c347ef0a4214f06f253efbcd2849f6ee7c9435e7df2bd6a6c93a5bf1f25783ca91a138b1cceef21e1f8bb5463e291d3f926982ebf9384b775e2fc786b27ce7f11859504ef8b57abf044a3bee5976adcff3baab12519ff5fa349af9086f1c423ffffaa31f9f8bc663c3ddf97d48bcebbf3e746e14faac60a96769ab1159abe8a4533e06dd2f87d26fcde9926c16da17872b2811adc128cc2ea906ed78c2da26ee1ef97dc3c791a3669a91a4ffc3f4c71cee7f2525454a4bf63a856ad5a65de31c4dbbff13670d158bf7ebd6e1ce29543bcad5c34e4ade4f8bd8277dd75171b8e78ebace5723906e985be83755c06e37c27727d5f6c4699684621d3f813293c16e350acf983cca512b775cd9a35bb98b7a0a4725c9d741dd57b37906e0dd6877fd08cf73ff1ea3f6ecbb81ee5f74335e77a96d45e35de1fc5ed16d7c9bcb2f025cd68ab78d521bf778adba809e43f5531b679e4d58a729d2aeb14a5c12b21c3c60be9924f32c69892c3870f1f2e962e5daa9ff3c3011cd6b66d5bdd3d6dda34ddfdde7befe96e36f05baf95f364f1b6a21c76f3cd3787e5c5ef93358d4d4ec886b15aaad30320699c2a944ee5eb19a841d84d0d4335d91f00000048141886dc251b061b00001b500d03c257bc4d8d1ce675821352d966fce06d86ae0bbe9386df295285776a60a3186fd7641a3fe4cf2a1b50a5ed8e34e3e9fbd03647267dfaf4d9bd6ad52af1c8238f88091326840c38bcdae7dd77df0db91385d3983c7972c8fdeaabaf8a162d5a8859b366b1a16f927c3f20bdf0e4baec1723f57de51b6722197dac46219348f1ca330e55942f00b6c1ed8ab55eb5880df1eff07693665c27c76abe728c37d6705e2d7ae2c48932f179b527bfdbf5befbeed3dd8d1a35d2ddebd6ad8b98f6ecd9b345eddab5f515456618c797f33a72e448d87da453368cd5529d1e0049e354a1742a5fcf400dc42e7e4a4ff60700000012c5c9c106142e1b061b00001b508df724f04be4ef96c300c82434638b259eb0e45555f951de19e31b3c78f034de42e895575e1105050521030e1b8bfaf6ed1b72270aa7c16999f024e394295344cf9e3d97d37db593ef07788afabec8469a48c69e4846219348f1231987a2e507405ae077434906a113a4e1bcd59e1cd7c9b19a4f32dec892c3657793264d44a54a95f4d5427c6cdab469d4b8d75c738dee5eb264896efc91c365b753b261ac96eaf400481aa70aa553f97a066a28b6f3536cb23f00000090284e0e36a070d930d80000d88066ac94e1d5310de430003209d578cf4685ef8c193c78f0fd4f3df594d8ba75abb8faeaabc5e9d3a775030e1f7bf5ea25162f5e1c32eac40b5fcb699869eed9b3475c76d965e2e8d1a3fc7ea383bcca4bbe1fe039eafbc28d352d7cc1c9e0a0ca330a9944320e35b78447ca0780b4929f9f5f950d428af16eae17d82dc7317172ace6abc0182387cbeee0b84654ae5c593fce9b372f6adc2a55aae86eaeef870e1d1a162ebb9d920d63b554a70740d23855289dcad7335083b12d10085c2bfb0300000089e2e460030a970d830d00800d288af225f5cd3fd634ed01390c804ca2228390854a6ddab4f971e7ce9da261c386fa0bc84d76ecd8a1bf6f62dfbe7d21bf58e16bf85a4ec3a443870ea2a8a8482c58b080df6bb350be11e059eafbca1a6dac469e588c4226d1ae93d307c01178bb52aabbbaf376a572988c9363355fd018234b0e8fe666dd7efbedba1f1f23a56dbac78f1fafbf9f28d6bc9c920d63b554a70740d23855289dcad733d0e073732010b85ef60700000012c5c9c106142e1b061b00001ba07ef92a455116d0f161390c806ca54f9f3ea3478c18c1061b71e38d378a3367ce848c393366cc10cf3cf34c44e310bf8b8225c371f91abed6e4ebafbf1655ab56157bf7eee5770c7dcbef9192ef03789afabe70e310aff889d52864225f27a70b8027c058cd5db261ac96eaf400481aa70aa553f97a061a786ea48eef7fc9fe00000040a260b0e12ed930d80000d800f5cb97913ed408390c806ca559b36617b76ad5ea646969a9fec2f1010306840c3a67cf9ed50d3cbcfa47de566ed2a449baac701c8ecbd7f0b5ccf1e3c745ad5ab5c4abafbe2a264f9efc95a228b3e57b001941aa8d38a94e0f80b481b19abb64c3582dd5e90190344e154aa7f2f50c34f8fc9ac69e37cafe00000040a260b0e12ed930d80000d8006f5f457df3998aa2b494c300c8668a8a8a5e1c3060c04fbca55cf5ead5c5c2850bcb187c784b387e5f50dfbe7dc5bbefbe2bbef8e20bf1f6db6febe273f6e3308e63dd3e8e8d430f3ffcb068d3a68dd8be7dfbe14020b08f7e7fb7caf9838c2155c69c54a503802360ace62ed930564b757a00248d5385d2a97c3d030d3ebfa241e82db23f0000009028186cb84b360c3600003640fdf2798aa24c273d21870190cdf4ebd7ef9cb66ddbae9e3469d2197ed178b56ad5c4c71f7f6c310d0971faf469b16ad52a5ef523060d1a24dab56ba78bcf79e51087711c135e29c446a1468d1a8983070f9e2a2828d849bfc17c396f9071246bd449f67a001c07633577c986b15aaad30320699c2a944ee5eb19a8f3fb85a669bf97fd0100008044c160c35db261b00100b0015e2d449a422a92c300c87668cc5aad458b1607972e5d7a9a8d43fc4e205e099408fc4e21de3eae75ebd6ba51e889279ed848e90f94f304194ba2c69d44af03c05564c258cd67ccf786f9db2d3bf2b561ac96eaf400481aa70aa553f97a061a78ae26dd26fb03000000899209838d4c920d830d00800d509ffc3dd2244dd39e91c300003e5f6e6eeeeff2f3f3f7ce9c39f37b5e0174cb2db788c68d1b8b8d1b37cab69f88ecddbb57b46fdf5e372af13b85b66fdf7e84570ab151885725c9f9818c265e234fbcf101702d993056f3c569a089377e34a52a1dab6c18aba53a3d0092c6a942e954be9e81069f2b4877c8fe00000040a264c260239364c360030060039aa64da47ef9bb74ec2f8701000c0281c0b57979799b860c19f2dde1c387c5e0c183c515575c21eeb9e71e316cd830b174e952f1dd77dfe986203e2e5bb64c8c1e3d5adc7befbde2d24b2f1545454562dfbe7dbce5dc5a4a6b3fb68fcb6a6235f6c41a0f004f900963355f9c069a78e3a753368cd5529d1e0049e354a1742a5fcf401de1e5a4bb647f00000020513261b09149b261b00100b001ea93bfa369da3845515e92c300003f5350507019fd4e8af3f2f20e4e9d3af59b63c78e899933678a162d5a883ffce10fe237bff98d3e01c8c7bbefbe5b503c3165ca1471f4e851b160c1827514ef5bfabdcda1346e95d306594745469f8ac201f01cf18ed57c41a38a29f6dbbf7fbf68d3a68dfece3736ba376dda546cd9b22574cd81030744870e1dc435d75c232a55aa54c628b37bf76ebd5ebef2ca2b75e5e6e6ea7ee5e5c72b43efbcf3ce505ad630f9ba8b2fbe58d4ad5b577f175da4f4cceb12b90f39df8ad28845368cd5529d1e0049e354a1742a5fcf401de2a53400fd83ec0f000000244abc830dc85ed930d80000d800f5cbc7b0718827bce530004038bcb51cfd66de0f0402479f7efae915b366cd5ab566cd9a757bf7eedd15dc3a6e17bbe7cc99b3b267cf9ecb68dc7b98b4907e63f7c96981aca6be2f82f1e717bff8c5ff46f207c0ebc43b56f3058d2123478e14274f9ed4fd5ab66ca9fb4d9d3a555fa9c9e70d1b360c5dd3aa552bddaf7bf7eeba51de9a1e1b5238ecadb7de1263c78ed5cfd9afbcfcd8f0245fc392ef9545f5be1e76f3cd3787a599ec7dc8e95494462cb261ac96eaf400481aa70aa553f97a06ea482fa6ce713dd91f000000489478071b90bdb261b00100b001ea978f22bd451a2d870100a2e3f7fb7f45bf9bc74993f8c14712af0812a4ef48cb48ffa6316f5b8a77957c2d0041eafb2c4620360ae5e4e49c0d1a8700c828e21dabf982c69023478e84fc78758ce96fea820b2e088557a95245f7dbb3674f587abcfd2787f176a0870e1dd2cf39bdf2f2bbecb2cbc2ae6199e1b367cf16b56bd716175d745128ec9c73ce094b33d9fb90d3a9288d5864c3582dd5e90190344e154aa7f2f50cd449fe883ac9f5657f0000002051e21d6c40f6ca86c10600c006a85f3e5c519437e8f8a61c060000c076785e848d43ddf848f5f191e6cd9b5f21c501c0f3c43b56f34530aa98869f1d3b7684c5b786276318b25e53916188b7ac63f792254b74438e1c2ebb13bd0fd9afa23462910d63b554a70740d23855289dcad733d0c073bea6690d657f0000002051e21d6c40f6ca86c10600c006a85f3e843496fae613e53000000069a1be2fb87288eae38d8aa2dc204700c0ebc43b56f3453090985bc575e9d2a5cc8a1a39bc67cf9e096f2567bde6c1071f0cbbc61ac734442d5ebc580c1d3a342cfc924b2ed1dd5bb76e4dea3e64bf8ad28845368cd5529d1e0049e354a1742a5fcf409d9d0f69f0d948f6070000001225dec10664af6c186c00006c80fae52f52bf7caca228d3e53000000069e342fec3db12e27dcc20138977ace68b60203970e080e8d8b1a3a851a386be659b1c87c33b74e820aa57af2e2a55aa54266cf7eeddbaf18457dbb072737375bff2f2dbb06183b8e38e3b4269c971c68f1f2faebaeaaa3261d6f08103078656f798fe89dc87ec57511ab1c886b15aaad30320699c2a944ee5eb19a8b3338b3a3b0fc8fe00000040a2cc9f3fffec891327c23abd50fa45dfc32e1a6c9c94bf230080fba07ef900d2187e704b0e030000905ea82e7e5f519407657f00bc4ebc8621c85ec13004b201a70aa553f97a06eaeccc203591fd010000804459b468d1ae48fb4943e9d7b7df7e3b81061b9fcadf1100c07d509fbc2f6f25475a2487010000482fc1fab840f607c0ebc030e42ec13004b201a70aa553f97a06eae84c233593fd010000804429292979e8a38f3e3a525a5aba1f2b879c117deea5dbb66d1b47038def48780004000f407df21e8aa2bc414718730100c061344dfb3be929d91f00af03c390bb04c310c8069c2a944ee5eb1968e03985f4b0ec0f00000024031b2378a50ae947eeec4269177feefcf9c3280480475014a52bf5cbdf24ad91c3000000a417aa8b7b915e90fd01f03a3c56908d139073e2ef43fe8e9224d5e90190344e154aa7f2f50cd4d199447a4cf607000000b2196a1b1790d08f0000a40d45513a92d830f48d1c06000020bd505d5c481a25fb03e07560187297601802d9805385d2a97c3d037574269014d91f000000c856a85d6cc046a1a01ac8e1000060073c09a969dadb74dc2e87010000482f541f3faa28ca64d91f00af03c390bb04c310c8069c2a944ee5eb1968e0398e3a3c9aec0f000000642be66aa1a016c8e10000600754df1450b77c3c1df7c961000000d24bf041a18f647f00bc0e0c43ee120c43201b70aa503a95af67a08ece5b3400cd93fd010000806c445a2d8455430080b4a1284aae6aace63f2687010000482fb9b9b9bf53f1ce379081c030e42ec13004b201a70aa553f97a06eae88cd534ad85ec0f0000006423bc4228826108ab860000b6a3288a5f35deff794a0e030000905ea82eae4eda25fb03e07560187297601802d9805385d2a97c3d037574fe457a5cf607000000b20d35f26a21ac1a0200a40545511ea2bae63dd269bfdf7fae1c0e0000207d346edcf802aa8f7f94fd01f03a300cb94b300c816cc0a942e954be9e813a3aa3496d647f00000020db5023af16c2aa2100405a0804027f5214e503aa6f8efbfdfeca7238000080f442f5f131d4c720d38061c85d82610864034e154aa7f2f50cd4d17985d44ef607000000b209b5fcd54258350400b09d9c9c9c7b354d9b4b75cd3e3a5e2987030000482f541f6f235d27fb03e06560187297601802d9805385d2a97c3d03757286933ac8fe0000004036a196bf5ac814560d01006c232727e78f9aa62da4ba667b6e6e6e0d391c0000407aa1fa78552010a82dfb03e06560187297601802d9805385d2a97c3d03757486923acbfe00000040b6c3c620d90f0000ec42d3b43f50bdb394f48ddfefffad1c0e000020bd507dfca1a228f7c9fe0078191886dc2518864036e054a1742a5fcf401d9d21a422d91f000000c87660180200a4137e2a9dea9d95a4358aa2dc2a87030000482f541f8fd308d91f002f03c390bb04c310c8069c2a944ee5eb19a8a3f3375237d91f000000c87660180200a493dcdcdcdf298af225d53d2b4877c8e1000000d20bd5c5c3a85eee28fb03e06560187297601802d9805385d2a97c3d0375745e24f590fd010000806c07862100403ad134ed46aa77be262da6f37a7238000080f442f5713f96ec0f80978161c85d82610864034e154aa7f2f50cd4c97981069ecfc8fe00000040b603c31000209d040281eba9ded94c7df3b9393939f7cae1000000d20bd5c79d78d590ec0f80978161c85d82610864034e154aa7f2f50cd4c91940ea23fb03000000d90e0c43008074929b9b5b83ea9deda4f7354d6b2a87030000482f541f0748e3647f00bc0c0c43ee120c43201b70aa503a95af67082e8d7e56f607000000b21d18860000e944d3b46a54efeca1e3444551fc7238000080f44275f17d542fcf91fd01f032300cb94b300c816cc0a942e954be9e813a397d49cfc9fe00000040b603c31000209d040281cba9de39487a93942f87030000482f542fd7a6fa78a5ec0f8097993f7ffed913274e841928a0f48bbe875d73e7ce3d297f474982312c701d4e154aa7f2f50cd4c9e9457a5ef607000000b21d18860000e9243f3fff22aa778e934693dac8e1000000d20bd5c5d791b6c9fe007899458b16eddab3674f9891024abfbefdf6db0973e7cefd54fe8e92046358e03a9c2a944ee5eb19a893d383f4a2ec0f000000643b300c0100d2496161e17954effca4284a31bff05c0e070000905e9a356b7631d5cbc7647f00bc4c4949c9431f7df4d191d2d2d2fd5839e48ce8732fddb66ddbb8b973e77e476a227f474982312c701d4e154aa7f2f50cd4c9e946fa9bec0f000000643b300c0100d20dd53b67354d1ba428cad37218000080f443f5f28f7ebfff7cd91f002fc3c6085ea942fa91df7103a55dfcb9f3e79f6aa31083312c701d4e154aa7f2f50cd4c929220d91fd010000806c0786210040bae115439aa6fd958e7de530000000e987eae35d79797957cbfe0000e052308605aec3a942e954be9e813a399d4943657f00000020db81610800906e54e31d43fd54bc031400005c01d5c76b1445b955f60700009782312c701d4e154aa7f2f50cd4c9e9401a2efb03000000d90e0c43008074a328ca21526face80700007740f5f147a406b23f0000b8148c6181eb70aa503a95af67a00e4e3bd22bb23f00000090edc0300400483754efecd134ad3b1d47ca61000000d20fd5c7ffa67af951d91f00005c0ac6b0c0753855289dcad7335027a790344af607000000b21d18860000e986ea9ded8aa274d534ed75390c000040faa17a7934cf9bc8fe0000e052308605aec3a942e954be9e813a38ad48ff94fd010000806c0786210040baa17a678b6abc03749c1c06000020fd507dfc82a669cfc8fe0000e052308605aec3a942e954be9e813a3905a431b23f00000090edc030040048379aa6ad5714a523d53f53e430000000e987eae5a7a85e1e2cfb0300804bc11816b80ea70aa553f97a061a74e693de94fd010000806c0786210040ba5114e54bd21354ffcc94c3000000a49fe0c3b463657f0000702918c302d7e154a1742a5fcf401d9c00e91dd91f000000c87660180200a41baa7756910a354d2b91c3000000a41faa8f9b52bdfcbeec0f00002e056358e03a9c2a944ee5eb19a883a39026c8fe00000040b603c3100020dd50bdb34cd3b4d6745c2a87010000483f541fd7459d0c00f01018c302d7e154a1742a5fcf401d9cc74893647f00000020db81610800906e344d5b48754f2b45513e93c3000000a41faa8f6fa07a7983ec0f00002e056358e03a9c2a944ee5eb19a883f3b08a97db0200000061c0300400483754efcc5314a5251dbf96c3000000a49fe6cd9b5f4175f27ed91f00005c0ac6b0c0753855289dcad7335007a719699aec0f000000643b300c0100d20dd53b3355e345e75be530000000e9a75fbf7ee7709f30db247f0e0000cf80df2f701d4e154aa7f2f50cd4e03721cd90fd010000806c0783620040baa17ae73dd5300c95ca610000009c818d43b25f26833e30009e06bf5fe03a9c2a944ee5eb19344d7b801afd59b23f00000090ed60500c004837d4379fc8862145510ec961000000403a401f18004f83df2f701d4e154aa7f2f50c34e8bc8f1afd39b23f00000090ed60500c00483754efbca3695a0b3a9e90c30000008074803e30009e06bf5fe03a9c2a944ee5eb19a8c1ff3fd23cd91f000000c87630280600a41baa77c6288ad2928e67e530000000201da00f0c80a7c1ef17b80ea70aa553f97a066af01b9016c8fe00000040b68341310020dd50bd338a54483ad9b871e30be470000000c06ed00706c0d3e0f70b5c875385d2a97c3d0335f8f79016c9fe00000040b68341310020dd50bd339cd48174b8a0a0e032391c000000b01bf48101f034f8fd02d7e154a1742a5fcf400d7e5dd212d91f000000c87630280600a41baa7786908a48a57ebfff2a391c000000b01bf48101f034f8fd02d7e154a1742a5fcf400dfe5da4e5b23f00000090ed60500c00483754efbc48ea41da4aba4e0e07000000ec067d60003c0d7ebfc0753855289dcad73350837f076985ec0f000000643b18140300d20dd53b03487d485f6b9a76a31c0e000000d80dfac000781afc7e81eb70aa503a95af67a006ff36d26ad91f000000c87630280600a41baa77fa929e5314e5b34020504b0e07000000ec067d60003c0d7ebfc0753855289dcad733689af67b6af4bf90fd010000806c0783620040ba518d6de4783bb9658aa2dc2d870300000076833e30009e06bf5fe03a9c2a944ee5eb19344dbb851afdaf647f00000020dbc1a01800906e1445e94a75cf10d2025203391c000000b01bf48101f034f8fd02d7e154a1742a5fcfc07b9753a3ffb5ec0f000000643b18140300d28da2281da9ee19469a45fdf407e470000000c06ed00706c0d3e0f70b5c875385d2a97c3d030d3e6fa0467f83ec0f000000643b18140300d20dd53b85a451d4479f4ac787e570000000c06ed00706c0d3e0f70b5c875385d2a97c3d030d3a6b52a3bf49f607000000b21d0c8a0100e986ea9d02d218d2388d90c301000000bb411f18004f83df2f701d4e154aa7f2f50cd4e05f47da2afb03000000d90e06c5008074a3284aaea6696f935ea7f39672380000006037e80303e069f0fb05aec3a942e954beaea4b0b0f03c6ae03773235f81fe255f0b000000641b18140300d28da2287e4dd32652fd3392ce9f90c3010000805442edcd82087342b216c8d701005c0bc6b0c0753855289dcad7b5d000b3798446deaa537ebfffb7f27500000040b6c1eda2ec07000076427df587a8ee798f348454248703000000a984da9a0611e685643590af0300b8168c6181eb70aa503a95af6bf1fbfde752a3fe7584865e176f5d215f030000006423dc2eca7e000060278140e04f8aa27c40f5cf0bd42f7f460e07000000528d5afeaa21ac1602c05b600c0b5c875385d2a97c5d0d35ec4a84c69e75c6eff7df2cc707000000b2116e1b653f0000b0939c9c9c7b354d9bab28ca5fe8d85f0e07000000528d5afeaaa106727c0080abc11816b80ea70aa553f9ba9d4ad4b87f11a1c19f244704000000b21518860000e9262727e78f9aa62d24755714e525391c000000b00335f2aa21ac1602c07b600c0b5c875385d2a97c5d0f0d36ff2c35f8670381402d391e00000090adc03004004837d447ff03d53d4b499d15452996c3010000003b5023af1a6a20c70300b81e8c6181eb70aa503a95af27a0467e85d9e0d3c073ba1c0e0000006433300c0100d24d2010a84d75cf4a521bd268391c000000b00bb5ecaa21ac1602c09b600c0b5c875385d2a97c3d81a2288d2d8dfe5d723800000090cdc03004004837b9b9b9bfa33efa9754ffe493de94c301000000bb50cbae1a6a208703003c01c6b0c0753855289dcad7335063bf847446f607000000b21d18860000e946d3b41ba9eef95a51143f9d4f94c3010000003be19542e80303e069f0fb05aec3a942e954be9e811afcff836108000000080783620040ba090402d753ddb359d3b4a6d8ea19000040ba31570dc9fe0000cf80df2f701d4e154adbf315429cbf65cb9689cb962dfb69fefcf962eedcb9509a459ffbd9458b16ed2a29297948fe7e000000540cdab2c8e241b1ec97ad425b0b407ac8cdcdad4175cf764dd31ad1f143391c000040ea401f18aa48e803030f62fb5c3800f1e254a1b43d5fea444ca24642ecd9b3479c387142fcf8e38f509ac59f3b7ffe1f7df4d1116ab89bc8df11000080f2415b065524b4b500a4074dd3aaa9aaba87740f69911c0e00002075a00f0c5524f4818107b17d2e1c807871aa50da9e2f3f59c28d84dc7840e9576969e97e6aa83f95bf23000000e583b60c8a55686b01b097402070b9aaaa071545a94347fcd60000c046d007866215fac0c043d83e170e40bc3855286dcf97971be3c9127788bf076aa84fcadf11000080f2415b06c52ab4b500d84b7e7efe45aaaa1ecfcdcdfd1d1dd7c8e10000005207fac050ac421f187808dbe7c2018817a70aa5edf9f29ea37283013927fe3ee4ef08000040f9a02d83e211da5a00eca3b0b0f03c55557ff2fbfdbfa5e3377238000080d4813e30148fd007061e01e514b80ea70aa5edf9a223e12ea1a1060080f889b52d3b7eb8546c593146ac9df79c2e3e673f391e94d9425b0b80bda8aa7a363737b7061db7cb610000005207fac0503c421f1878049453e03a9c2a94b6e71bad23b175eb56316ad4283162c48898c471b76ddb16960e149fd050030040fc446bcbac3a7668a7f86a4e5ff1c5074f9711fb71981c1fca5ca1ad05c05e78c5505e5eded574dc2787010000481de80343f1087d60e011504e81eb70aa50da9e6fb48e44ad5ab538efb874db6db785a503c52734d40000103fd1da32abb6af9d1e362036b563edfb61f1a1cc15da5a00ec85df31949f9f5f958ec7e430000000a9037d60281ea10f0c3c02ca29701d4e154adbf38dd691b8fcf2cb459d3a7544c3860d75b1bb66cd9a21379fb39fe9e6b8ec96d381e2131a6a0000889f686d99555f2f78296c306c8ac3e4f850e60a6d2d00f6a228ca214dd3ae5455f5941c0600002075a00f0cc523f4818147403905aec3a942697bbed13a126ce459bf7e7dc8fde8a38fea5bc6996e3e673fd3cd7161184a5e68a80100207ea2b565567d35b75fd860d81487c9f1a1cc15da5a00ec4555d53dc11543a7fd7effb97238000080d4803e30148fd007061e01e514b80ea70aa5edf946eb48b09167d6ac59bac187c5ab82faf6ed1b72f339fb996e8e0bc350f242430d0000f113ad2db30a8362c814da5a00ec4555d5edb9b9b935784b39bfdf5f590e070000901ad00786e211fac0c023a09c02d7e154a1b43ddf681d0936f254ae5c593fb2ce3df75c71c1051784dc7cce7ea6db8c2ba703c52734d40000103fd1da32abd6ce7b2e6c306c8ac3e4f850e60a6d2d00f6a2aaea16bfdfff9f74dcc75bcac9e10000005203fac0503c421f1878049453e03a9c2a94b6e71bad23c1469e75ebd685dc0f3ffcb018366c58c8cde7ec67ba392e0c43c90b0d350000c44fb4b6ccaa6f960c0f1b0c9be230393e94b9425b0b80bd689ab6deeff7ffb7b972480e070000901ad00786e211fac0c023a09c02d7e154a1b43ddf681d0918869c111a6a0000889f686d995507767e29befaf0d9b00131fb71981c1fca5ca1ad05c05e1445f9323737f777aaaa7ee3f7fb7f2b87030000480de80343f1087d60e011504e81eb70aa50da9e6fb48e04b692734668a83dc185b20700c059a2b565b2b6ae7c336c50cc7e723c28b385b616007b51557595a228b7d3710d1d6f95c3010000a406f481a178843e30f00828a7c0753855286dcf375a47828d3cb366cd12ebd7afd7d5b06143d1b76fdf909bcfd9cf74735c188692171a6ad7539fb427780400b884686d59199d3c29be59fa4ad8a098fd382c2c3e94b1425b0b80bda8aaba4c5194bbe9b88274871c0e00002035a00f0cc523f4818147403905aec3a942697bbed13a126ce461838fe97ef4d147c5881123426e3e673fd3cd7161184a5e68a85d8d6914ea163cc23804804b88d696993a7668a7d8b86458d880d81487711cf93a283385b616007bd1346d614e4ece1f55555d4ce7f5e470000000a9017d60281ea10f0c3c02ca29701d4e154adbf38dd691b8ebaebb449d3a75f455412c36fad4ac5933e4e673f633dd1cf7eebbef0e4b078a4f68a85d8bbc52487603001c245a5bc64f41967e5322d6ccee15361096c571382e9e9ccc7ca1ad05c05e54559d97939373afa66973f92887030000480de80343f1087d60e011504e81eb70aa50da9e6fb48ec4eeddbbc5c48913c5b871e36212c7e56be474a0f88486da9544330245f30700a499486d59454f4846139e9ccc7ca1ad05c05e54559da9284a633abeaf695a53391c0000406a401f188a47e803038f80720a5c875385d2f67c23752420e78486da755464fca9281c00900622b565b13c21194d7cad9c1e9439425b0b80bda8aafa9ea2280f699a36918e7e391c0000406a401f188a47e803038f80720a5c875385d2f67c23752420e78486da55c46af489351e00c02622b565f240375ec9e9419923b4b500d88b69105255f54d52be1c0e00002035a00f0cc523f4818147403905aec3a942697bbe913a1290734243ed1ae235f6c41b1f009042d09641f1086d2d00f6a2aaea3ba4006934a98d1c0e00002035a00f0cc523f481a3e3f7fbafa13e4b3b4551a6d3f153d27692081e3f0dfab7e378f2b520e5a09c02d7e154a1b43d5f7424dc2534d4ae2051234fa2d7010092046d19148fd0d602602faaaa8e2115288a52ac695a27391c00f033428873962d5bf6c89b6fbef961fffefdf7f7e8d1e3c4134f3c71962724dbb56b77aa5bb76e47c96fd380010306b76cd9f2d7f2f520bb411f188a47e80387939393f3bf54df2e0a1a8162d522be4e4e0ba40c9453e03a9c2a94b6e78b8e84bb8486da719235ee247b3d002001d09641f1086d2d00f6a2aaea2852a1a669831445795a0e0700e806a1ff983d7bf6e8be7dfbfed4ba756b3172e448b17cf972b179f36671e0c00171e0c809d17bf422ddcdfe1cdeaa55ab339d3a75dad2a64d9bfbe5f44076823e30148fd007fe19ea9fd4a4becaac08469f78348bd391d3064983720a5c875385d2f67cd1917097d0503b4aaa8c3aa94a0700102368cba07884b616007b51557538a903e939525f391c804ca568c482df76292e11411dea32aca4bb1c8759be7c79870103069ce8d2a58b58b66c99387af4a898346992c8cfcf1775ead411356ad410b7dcfd8078acfd40ddcdfe1ccef1387ee7ce9d4fb56fdf7e35262401fac0503c421fd8202727e75e4dd30e5b8d3c5ccf0e1c3850cc9f3f3f64a067f8c86ef6e7708e2719870e727a721e2029504e81eb70aa50da9e2f3a12ee121a6ac748b53127d5e90100ca016d19148fd0d602602faaaa0e2115917a919e97c301c8549e2c2ee9dca578fe6b7c5e543cffce2ec525c7ace142884a73e6cc79a76ddbb662e6cc9962fffefda267cf9ee2d24b2f150f3cf080183d7ab458b16285d8be7dbb78e7c37562c6a2af7437fb7338c7e3f87c1d5f5f5050705cd3b446d63c4076813e30148fd007d6fb288f53bd79da34ece4e6e68ad75e7b4d1c3a744837047f86b0a500008000494441545504c7e3f87c9dc538748ad395f3020993f5e514b80fa70aa5edf9a223e12ea1a17604d9885389d422788c07f93a395d00804da02d83e211da5a00ec4555d517493d1445e9ca4622391c804ce5c9e292594f0e2b79b45fbf05bf281a5612282a2e99c7febabbb86450b7e1f37f7af21fb3c48c8f3e1393274f1655ab5615ed9f192cfabffeb1e83a6c81e8fbcf8f43938ffdc72c1533966e16bd462d126fccfe4af72b2d2d154f0e9eaeaf487a6ad87c317ed64ad1ba75eb1f72f3f3db90dfe9d06aa561259bfbf59b787e51f18261facaa5e2923d7c3ff2fd02ef833e30148fb2bd0f1c5c2914320a75ecd8516cddba3554efc6035fc7d75b8d4358399432b2ba9c0277e254a1b43d5f7424dca56c6fa81d4036deb051e75f3ee3b7c7c7588d43d1ae93d30700d800da32281ea1ad05c05e54551d40eaa328ca13741c2987039089140d59facb2ec5253f98c699278be7afee543cf3120e7b72e88281cffd73fed676ed3b89d56bb78aa297e7886bafbd56bc397da9183a6995283d705c9c3d7b3634e1c8ef177a7ae44762d38e43e2cb4d7b45b7111f59a6238558b57ab5b8a5d65da268e85cb17bf76ed1b265cb633c21f9e4cbf3ff4879ef2b1ab6e00eceb3a878c1c44ec58baa742d5e7037f91f90ef19781ff481a17894cd7d60bfdfffdb402070c834e4f4eedd5b1c3972a44cdd1a2f7c3da763310e1de07ce4bc41dc646d3905eec5a942697bbee848b84bd9dc503b4024a34d0b9ff1bb33158b71c86a1432d5dc121e291f00400a415b06c523b4b500d88baaaa7d49cf298ad252d3b4d7e5700032912ec3e6377eb27841099f170d99fdab2ec525eb3b0f5d702bbb9f1abee0a8e5dd43a2d3905962cf9e3de22ffffa58ec3ffc833cd7283e59b74bbc31cb5825f4cdf683e2ef1356e8e76bb6ec1383c67daa1b8a389d275e982cfaf7ef2fd6af5f7ff6f1279ea23ce61f291a5af2907e3fc5253bbbbd32a72a9f3ff9f2bc6ae4feeee7bb059902fac0503ccae63e30f54b665a570a256b1432e174a4954333e5bc41dc646d3905eec5a942697bbee848b84bd9dc50a79968c69a48469ef28c4391e2ff33e86f255a7e00801480b60c8a47686b01b01755557b905ed4083a8e93c301c844ba0c2b297eb2b8e4e9907b68c933e4fe8b10e23f8a8ae79e9d3075b6983479b2b8eebaeb74a310c3dbc4adffee803863592dc4f0fb8596acd9a99f4f59b851cc5db14d3fef3d7ab1f8fadb03e2d80f3f8a77e7af1763677ca6a7f7e684a9a2dbf0f9670b7b0ef93a947f71c97e5e29d461f8bc2be87c4251f1fc17cd309039a00f0cc5a36ced03e7e4e4fcaf69b8e1770325ba7d5c34383deb3b87383ff91e405c64653905eec6a942697bbee848b84bd9da50a7998a8c34918c3d918c4391e245320a9954942f002041d09641f1086d2d00f662be5b88f430698a1c0e4026d2a5b8e41b738590eefec7825a45c5252b67cd9a35aa4bdf21a2f7e845a11543b90585fae461cb4e7d45a7bf4d175d86ced7fd03f92d757ff6cb6bd92eecbc6def91e2c997e78a279e7b530c7977a5f87cd35eb17af56ad1bafff850daaca786cfbfb668e8821674be9774843492df3964bd5f9019a00f0cc5a36ced0353fdb9d834dabcf6da6bb25d272570ba661e9c9f7c0f202eb2b29c0277e354a1b43d5f7424dca56c6da81341d3b42b49cff8fdfe4be5b07288d53813c9e863350e450a2fcf2864126bfe008038405b06c523b4b500d88ba2281d55551d46c7c62ab65401598c10e29c3e7dfafcb46cd932d1a3470fd1b66d5b7d0291270ecdad87f83869d2a40a658dcf472b9c2ea7fff1c71f1fc6846476813e30148f32a90fac695a35528bc2c2c2f3e4302b7ebfff1aaa17cf72bd999f9f2f0e1d3a54a6fe4c159c2ea71f340c9de57ce57b01319331e514640e4e154adbf34547c25dcaa486da6ea8a1ad126c748f288af212770ce43812f11a6522197fd87d4e04ff588c4226f1de0700a002d09641f1086d2d00f6427db342d228de4a85fa67fa3b5700c814f8a1342ad72fc732e9b774e9d287dbb469a3bf83e2f2cb2f17bb76edd22710790c631a7cccf3f2b0c633cfad70ba9c3ee7939b9b7b38967b039901fac0503ccaa43e30d573bf09ce07ede095cacd9a35bb588ec350d813c178e2c5175f2c5377a61a4edfcc8bf395ef05c44cc6945390393855286dcf171d097729931a6abbe14199d9e8067582343210085c2fc7f5256e8c89641cda20b9e3310a99247a3f006415050505ff21fb45026d19148fd0d602602fd41f2b208dd134ed0f745c2a8703e0657273732f098e3d7e248d5614a5a61cc7e48d37de983b72e4483179f264d1b871e3d0e4215f6f1a832a320ec9e1910c430ca7cff9f4efdfff2b4c487a1f1aebc6b4f51ffac0503ccaa43e707e7e7e55eb7c10d57b87e8f822fd76aeb2c623bf29669c79f3e6c955674ae1f42df784ad74132763ca29c81c9c2a94b6e78b8e84bb94490db5dd5083ff4b6b47c0a253a4719aa6fd3e183559234c24e3503246219364ef0b808c877ecbeb48dd2a3210a12d83e211da5a00ec4551945cea87bd4df5f76d74fe991c0e809769dab4e985f2d883cb3be91639ee800103f6f13672bcbdd0a851a34293877c9dd510241b7fcaf38f6618e2f4399f79f3e6ad553121e979a83cf1f7d8a1220311fac0503ccaa43e30af1092ea625327a9eff11afd866ee478e45e61866dd9b245ae3a530aa76fb98f15f23d8398c998720a3207a70aa5edf9664a47c2179ca897fdbda64c6aa8ed863ac9e746e804941175086656ab56ed2045ef265f1f27bc7d9cbc5288ddec9f0cdd82f7cac6ac1f484748fb49a5a4eda42da40d247ef2ef333a7e4a5a42fa88348f348bfca7d3f1dfa409a4b7a803f43a1d479186f3361774fc1be9053aef4fc73ea41ebcd49adc9df869423ab6e6bd79c93f406e3f9dff99ce9bd0f97d74de90ceefa1f3bb0381406d36b6d1f94df4d9ff96dcd7f23615fca40e9d5f4ee7951b376e7c41bf7efd92fd4c000841e5efa06afc467650f96b1b6d0f69a7db325f86b441e529deff31def8e914da5a00ec25d89f98c89332547f7f2d8703e06578a23ed83791c5efb098c27d66336ef7eedd4ff044e11d77dc2156ae5c199a3ce4f815198164b71c4f86d3e77c366cd8b04dc584a4e7518d71217fd7dba84e6dc9635f390ee3741f18f29632a90fcce3c208f5b05c27bf47da67fa1d3c7850ae3a530aa76fc97fa77ccf206632a69c82ccc1a942697bbee9ec48f8ca4eaaa774d22895693929af35d43c30628300e957bc6497f77965a3011b0f48ff43aa939393f3ff788f791a24ddaf695a53d2a39a410b6a2cdb903a908a483d487d4903e8ba9748ff208d508ca73dde20ff71743e99349d349bfc4a2c8d6e44519c3314f734893fd7faf2fdc748792b86d83fe915430d1a34f805af80e2ad299a376f7e057f9674ffbfa6e37fd2bddf40ffc72df4f9d5e2cf93fceb92bb3e7da6f7d2f101fe4cc9ff11f257e83c8f070eaab1b77f073a7f928eddc8ff193aff0b9d0f20bd48eebf93bb98ce47f2e74bc7b1a477c87f22b9a7d2f90cd21cd27cd222d232d24ad217aab182e31b120f3a7790f6a8c6e4fd31d249d299a0f8fcb8622ce9de4bda19bc86afe53438ad55a4e5a4c5c1ef93f39cc1f7c0f7a21a2bbff8bbff27e915be67be773a7f5135fe976749bdc8ff69f2efa21a65a9903f83e067a1d2f151f26b46e78d839f597d72d70d7e96fc24f3adf439ff376f41a81a9ff955fc1df077c14f8446334480f4a01ae5cafabbde44df59ae6c80aca82df3597eb7952b571677df7d37bfa0392c5ea232d396fd23299eb8e994f533b24a0e97af8ba678e3a7535e6b6b01f01a544f3fa41a9331d791b6cae1007819ee83487d93489a45baa75dbb766779a2b07af5ea62e7ce9da1c9438e13cde0c3eadfbf7fe83c5a3c194e9ff33970e000f79d3021e971e83bfcde5aa6680cb39e8e8a4f1a7b56d4078620ab1cee0357e25d204897e5e5e55d1d9cebb889caf56daa31c7d190c6e47f22bf4778bc477ead481dc8ff293af6a1e35fc97f309d0f27fd8bf48e6a187fe4fad7aad356f7a953a7e4aa33a570fa96fc4eca1f00881927cb29001171aa50da9e6f3a3b123e1b2789ec4c3b9de2efc305c6968f556365cae7aa3181bf89f41d69b76a18008e937e528d4698f7d6e6c1c701d558e5c2f1383e5fc7d7733a1f73ba9c7e309fc9e4374e358c11a355a3611fa21a93fdcfa946a3df9dd485d45e0bae6809fe7ffc7f36e5ff9bff7fd5c85f6efc591b294ef3fcfcfc8b8213fbf57d896ddb16c92824af1c4ac43894e8fd78021e30f3ea21fefcb9e347e5b70a7d27d583ab8cf4b2ac19ab8f6e27ffbbe8bc1e7f9fe4be8fdc4dc8fd67c578da58a36373d5e814b6d38c554e5d55a35cf3eaa77ea4e7c97f10976dd5284ba33463d5d45ba409c1f2368d3493fce7aac66a2b5e75f5a962acc25aa31903adcdaa517eb91cf3aa2d7e4a8f577199651dabba1c40350c8cf2ef9bb586fecf87cc7815b5653e4b1b317dfa74fdfca69b6e0a8b970e59efc54daae8be2a0a97156ffc74cae1413100194f7062e703eec7527d5d2a8783ec821f80e2c940ee8770bf90fa2a5772d9c8cdcdad41e5e33aeeb390df8d54666ee507a1c8ef0eeed7905f3d3a6f603e0c457e0f06fb408f29c6c33f79745ec0fd243ab623bf8e9af1a050373aefa906fb8ae4f7573abe487e8335a3df359cce5f558d078fc66ac6b687669f910d9afc90d26cd5e8c7717f8ec746fc20133f24c5e39bafd4f07e89ac3394ee19deda8d270a2fb8e002bdfd31e13891b687e363b47339ae0ca7cff9507e4783f7c013a2fc0ed6638af1a0163f356fedbf6e24ada3b02fe9b85a0df661e9be17aac6c36173f877ac1afd68bd1f1bfcac780cf7cfe067c89f25f7c1ff466103d5e0835be4d79bdcdd15a3dfde99cedbabc6836b8f93f2c9cd7d7c3f9d3fac190fb9e90f7091bb01b9eb91fb6e3abf83cb03b96fa132f2dfe457d3ecdb925f35eb835ce477be97fab7b1a0461fe77e419fc58366bc8afac01064d5871f7e286c30ce70fdc0636d9e4b5aaa1af5c9d7a4ada4d260fd7352351e1e3d1174735dc4f510cf1b717c1e3fcf578c3ae7dfc1ba86eb68ae63383f9ecfe27a85ef83e7bab82ee1b131a72bff4678e7986f49ed790c4cee5da63f560c79068cd580eb70aa50da9e6f3a3b12be289344a5a5a5e2c20b2f14356bd614274f9ed4fdf878fdf5d78b8b2eba48ecdebdbbccf5175f7cb1a85bb76e99a7bde5b42b72c79a5ea4ebec54b00171d4d8c246274aaf8e6218a1d8185593aeff35c5a9c60dabc5d8e238eacf4bec4d710720da52fbfabef88c31918c42fc4e211e74c8fef11887e2bd0fe002b0aacbb1555d7c9f619d7d8b3ea5efe4be8ada329fa52e3f76ec987efecb5ffe3214be7fff7ed1a64d1b51ad5a3571e9a5978aa64d9bea7b449be11b376e1477de79a7a854a952c4b641764f9c3851dc70c30de2bcf3ce2b1366bdb63c7f39dd44daa9bbeeba4bf77fe38d377437bf909addf5ead50b8b6b4d4ff62f2f3cd6fbe3cf8d3fbf4d9b3685c2b96da701a9b8f2ca2b75d1f7186aefe5ebadf9c69aa77caf56c1300480bd04ebf2b93cf1c46d8c1c9e6d64a26144331eaae1f189d9d7e007c8f8c199c3aaf110d949d5304c980fd74433506c558d7e074f22f2431ffc900dbf0f82fb358b490bb82ca9c60a9cf715a30f3489fcc6abc643406314a39ff40a699812c54841c71ee4f79462f4bb7892b32d1d5bd1b185624c7e721fed51c558edd684c74574fc3fcde8cffd3f3abf8b1fc0a1f0ff21bf5b54e3c121b94fc25a437a8c1fc4e1f148dbb66d4f55b4622892f167eddab5a173393c9a61c85c31b46fdf3efe5e7672fed1ca1df75fe9fff92ffa7f6e22f7ef546315bdde87a5fff78f14b721b9efe30962f26bc69f0d1d15feacf833538dcf8e3f43fe2c23963972bfa4197dc2a1743e42351e8ae289e43755a3ffc8fdc8298af10095f900d702d5f8def9fb5fa118e5215a79e3b1328f0579650d8f9fb9cfc8e58dbf1bf6e3308ec3fd60eee37e4bda144c8b8d7b5c96b94cebfd5c3542590bde238fb1dfd48c07bb789c3d923494ff37fe1f55e321357eb8ab6ff033e07e7d173aefa81a0fb6f1efb3803f3b354239237743feccc95d97dc7752d8ede4f77bb5e23ef0728ad7a8a23e300499e239b660d939a1a4d638f308d7153c9744617f508dfa848d4ddcbe5dc5f54f45ef8b4d14d5b24d5c50eceeccc6624b1cbc63c87b60ac065c875385d2f67cd3d991f0491336a6388c3acdfaf9b469d374f77befbda7bbdbb56b1796ce9a356bf4b09b6fbe392c6dabfb9c73ce891a1e6b7a23478e0c19abd2214c56c587a523b0973be03c0893e348d4f7c56694896614328d3f91c263310ec59a3f00b6e291555da14e7c39e249277ee973587d6a95cfd206982b86fef4a73f85c25bb66ca9fb4d9d3a552c5dba543f6fd8b061289c0d45ec3766cc18f1faebaf97494f4e9f55a54a15dd283473e6cc72ef45f68bd6e624d24ebdf3ce3b7af8830f3ea8bbcdfff1fdf7df0f8b6b4d4f961c2e5fc72aeffede7aeb2d3176ec58fdfca1871e0a85b351480e673ff9fa68ff5f797946bbc614da5a00ec2538b1bc902782a88e3e01c348e61946fc515670d0f9a5dcb7300d2372d9c81454699b2fd2d7f419e4f8a4b1c0534f3d75b4bc770cc9469f68445a452463be6368ddba755c4eb37542b2124f08f32a227e988bce7fc52be7e9f3a84ee7bfe132cb6597cb3097652ed35cb6b528758d12eceb5258be623cd8d5868e4fd0b1b362aceeefae1a0f40f1c35dcf057f777f0bfe0e87a9c64353fcfb8c58cfa8c187bc34639516f77d3f518d87b2f8e12cb9cf2b8b0d47a7b50afac0106455a6f58155a31de5df03b7bb03f8771f21ce14f377336fde3cb9ea4c299cbee5373a45be17103319554e4166e054a1b43d5f270c43b23f8b9f8a6243ce7df7dda7bb1b356aa4bba963abbb67cf9e2d6ad7aeadaf2032d329cff0c3e7e79e7b6ed4f058d33b72e448d8bddaa94c6ba8ed463306e5cf366bd6ec6239ac1ceafbca37ce4432fa588d422691e295671caa285f0080059e54b274accb0c84e9b73f91270fcdb815b565beb2bf53f1eb5fff5a6cddba3514ce2b56e438e6b62faccb2ebb4cf73b74e8902e338e9cbee9e62776d97dedb5d78aa2a2a232ab8fe4b8563f6b9b936c3bf5c30f3f88dffce637e2fcf3cfd757e2f06aa8db6ebb2d2c9e9c9eec1f2d3cd6fb3b7cf870e833bbfcf2cb43e1575c714558387f0ff2f5a9fc4c4ca1ad05c05e34e389e1a5745a29586fc33002320af5e75d0bb8fc1644fbae7bf5eab571d9b26582b7941b356a5468f290afedd8b1a37eacc82864621a84cceb64387dce67ead4a9bc020713921e868d5bc1f2258b0dcdffa6bae776336e457d6008b22ad3fac0aad17718c5dbe2c961268a61ccd57f432fbef8a25c75a6144edfcc8bf395ef05c44c46955390193855286dcf379d1d095f70c246f637d5a449137dbb195e2dc4477e42db0cbbe69a6bf46b972c59a24ff8c86945729b93453ce92487c79b5eba94690db5ddc46910b252df17d94813c9d813c9286412297e24e350b4fc000051a04171656930fc93a669aff3649c1cb7a2b6cc17fc7d1e3d7a5474ead4493fb7ae08e2153eecb763c78eb06b59a661c86ac460c9e99bee4f3ef94450fd14da4aae56ad5a51e346f34b453b3568d0203d8eb92a77c284096171624d4f0e8ff5fe92350c59ef21d63cadd74412da5a00ec25f814fe4ad91f804c4135568db5e7097c39cc4afffefd07f32a56deceb571e3c6a1c943b36fc3461e7315502c328d422c194e9ff3a138333121e96d78c593d40766e3fa5b54de6e96e356d4074eb77c15f4c52a0a7793e47b95dde5299eb8b12a1569665a1f981fca90fd64f8e10dd530aaeac6731e77d801a79b9797a7e7c3f971bef2bd8098c9a8720a3203a70aa5edf9a6b323e1aba0210b3652a272e5cafa9197619a61e6a4dde2c58bc5d0a143c3d292ddfc6434bb972f5fae6f292387c79b5eba94690db5cba9ef0b37d6b4f005bffba0ca330a9944320e35b78447ca0700500101e365a1dcb1fe813494f46b398e49456d99cf52a773a7dd5c21646ef5d6aa552bdddda54b9788ab4dccade4de7efbedd0b667667a72fa56f1fb6fd8ffeaabaf0ef95d72c925ba9f75c552a4eb53d14eeddbb74f7f170f3f6c71e38d378a13274e84c589353d393cd6fbb36e15c7c632333cd6ade4acf7106b9ed66b22096d2d00f6c2ef2c5114e54bd91f804c21d6f7adb66cd9f2d7ad5bb73ec37d0b7e3862d7ae5dfa04a234e99f90ac70ba9cfee1c387f97d3afb3021e96d78e561f07b3e4975e9abd427be5e8e6352511f3816f1fb287d967e9b1c1e8fcc7464ff58c3dd24f95e65777992e3caee44948a34b2b50fac1a2b90f5baf3b5d75e2b537fa60a4ed752472f96ef01c445569653e06e9c2a94b6e79b8a8e44acf2051b3259d638b7df7ebbeec747abfff8f1e3c555575d15f55ad9cd9d9baa55ab468d1f6f7ae952b636d40e52df57d6686335f2c462143289769d9c3e002046f83d14d4a97e81f78697c3642a6acb7c529dfedc73cfe9ee7beeb947771f3870407f0ab7468d1afa6a5339fec68d1bc59d77dea91b58cc306b783437af18bae9a69bf4f71a996103070e0cad9631af91af67a5aa9d32570bfdeb5fff0a0bb34ace474e5f76c77a7f2cfedcead4a9a37f8e66386f6fc78620fe2c58b9b9b9ba9f7cbdf51e63cdd37a4d24a1ad05c05e344dbb91eaefaf657f00b2914e9d3a6de5ede47af4e8a1b7c976c0e972fa13264ce0f7d86042d2e3040d434348d5e530998afac0b188579bfde217bfd0657d076722f2c5d817f38252f9bfa422ad54a491ad7d607e57ae69b4e131073fa0974a38bd402060ae16129c9f7c0f202eb2b29c0277e354a1b43ddf547424a0d4295b1b6a87a9ef0b370ef18a9f588d4226f27572ba00009b48575bc62b6eccd5adfcfe2039dc6d6283176f6357b3664df1fdf7df878567abd0d602602ffc74bbaaaa9b657f00b291366ddadcdfb973e753fbf7efd777b558bd7ab53ca798149c1ea7bb77efde9df4bbfb061392d945b27d605e6dc60f32dd7ffffdfafb9ef99cfdcc705fd018618afdb87fd9a143077d8b5ff3a1a968f1b96c5a572199fea5a5a5e2c20b2fd4fba8274f9ed4c3f878fdf5d7ebef92341f1632e3f30af8ba75ebeaabf1e5b4acf7266be2c489e2861b6e086def6c8d673ea4c43b09b02a7a484976c7f23944ba4fd93fd235ac8a1e4c4b44d9dc07a6fa71a669b8e107027925672ae074a81c9c31d3e67ce4bc41dc646d3905eec5a942697bbec97624a0d42a9b1b6a87a9ef4bad1127d5e90100ca211d6d992f3818e3ade078a5116f6726c77193d810c4f7cb83d5458b16858567b3d0d602602fb9b9b9355455dd2efb0390ad74ecd871f5cc9933cff23b80aebbee3ab167cf1e796e3121381d4e8fd23d3b68d0a0319890cc3e92ed03171717ebfd45de71c5dcda77d8b061a17076b3787b7ed380636ec1dcbd7b77fdfd9dd6f4ccf8c3870f17bc528ecf79b5b71ccee7e6aaf669d3a6e96e7ed734bbdbb56b17769f6bd6acd1c36ebef9e6b0b4acf7268bb72166a390b97db455f16e6b2cbb63f91ca2b94d3ff3bdd891e2985b595bef4f4e235e65731fd8eff7ff96eac803a601a777efde491b87f8fa5ebd7a85560a71fa9c8f9c37889bac2da7c0bd3855286dcf37d98e04945a657343ed02eafb5263cc49553a008018415b06c523b4b500d80bbf0c5a5555ee0b01007cc68464cb962d8fad5fbf5ef4efdf5f5f0590ac7188afe77438bd850b17be41bfb9524c48661fc9f68179150ebfe399dfc1c9e2f37af5ea85c27d416384f51d9ce63b1fb90ccae999f10f1f3eacafb437dd72389faf5dbb56378cf04a2576376ad44877af5bb74e77cf9e3d5bd4ae5d5b5f41645e17c99012e9fda0a6aa57afaec7e195fe45454562cb962da130736b67be57fedff99c570ec9e94773c7f23944739b7ee79e7b6ed438975d7659d8fdc969c4ab6cef03e7e4e4dc4b75e529ebcaa144b795e3eba49542a7387d394f9010595d4e813b71aa50da9e6fb21d0928b5caf686da05d4f72567d449f67a004002a02d83e211da5a00ec2510085caeaaea41d91f806c46d3b4468f3ffef80fbc55151b7378a23ad16de5f83abe9ed3d9b265cbfbf47bdb8509c9ec24993ef037df7c13b64d198bfd366ddaa4c731fdacd725631091dd4d9a34d1f3e3d5427ce455326618af7ae7b84b962cd18d3ff2b5b23b923ef9e413d1ac59b3d05672bcc5b219e606c39069e8e27b90e3c030640f545f3e6e350ef11682afbdf69afe19c702c7e3f8d6770a05d37b5cce0b244cd69753e03e9c2a94b6e79b4c472211f9e26ccc2a8a2f8757e496555178454af67a5968a85d417d5f62c69d44af03002449badb32c8db425b0b80bde4e7e75fa4aaea71d91f806c271008b46ad9b2e5515e39c4dbca55ad5a55141616eaef5b89058ec7f1f93abe3eb85288df2d8409c92c25993ef0800103f4b90c9ed836fd72727274bfe79f7f5e77f339cb7a9db9855acf9e3de3de424d7607fb64fa4a253ece9b372f14661a5e78fbe6a14387865d2bbbcb13bf9b88e35e7df5d521bf546d2517cbe7c05b51b39b5799987efcfe25f65bbe7cb9be1d9e7ccd830f3e18767fd6f044843eb04170e5d0418b614750df450c1c3850cc9f3f5f6cdebc597f8714c34776b33f875319b11a84580761984f3928a7c0753855286dcf37998e84ac5b6eb9456fa83efcf0c3901f2fff65bf5b6fbd5577f3394bbe369a2a8a2f8757e496555178454af67a5968a85d437d5f7c469e78e3030052482adb32a862f952dcf6a55b686b01b097c2c2c2f35455fd49f60700181392f9f9f987a64d9b7668fffefdfaa4f2a5975e2a1e78e001317af468b162c50ab17dfb767d42928fec667f0ee7781c7fefdebd3b83ef14da8d09c9ec26993eb0397f337dfaf4901fbfef87fdca9bbfe189f20e1d3ae8dbb4992b8ecc30397e456ed6edb7dfaefbf1d1ea3f7efc78fdfd44e635f2b5b23b92cc38bc62e8ffb3772760525577feff1b8c92c4b81077c16534a3517fc94f47d1c424231ae73f120592cc54df73ab6d020aa8618f6b3426a0f94793cc98004aa224e31e0cc47d824bd30d8280a231a3688228b8219baca2823ae1feceb7ba6ea738b5753555f79c7bebfd7a9ecf5355e7debaa7aafbc039754edf5bc71c73cc0eef55cede93852039734822678e4899f9dc628f2bf939c88242788652582edfeb248bbcb9ef2df7392fbffc7270d24927e59dd5156eef4a1803ff9de77947eaff431f3116792acd23721cf3d8d869b45338c756a3ac79bd3b33903013fec5c9e8d1a33bca468d1a95290bffe2a4d2c873256679b1d47a7f333bfb7c3374d44e39ada1738b3d9ddd0f408d54b32f23e5d350e5be2fead0d702b5a794da6e960168271389e974fab1a14387bef3e4934f6e92b30d66cc9891f98bf53e7dfa04bd7bf7cef4b3722b8fa55cb66fdebc79ed3df7dc73b7fef7f50a1392108c814925610c9cafb1b1f174fdffe9dc028b3ea532579e671e0b55433b85736c35ca9ad75bcd8144788dda238f3cb2a34cee97bb466d58b6c71e7b64befc504ef335b749e438f2059be1b10a1dafdce3a54b97668e51eaaf2e4abd9ece3c7f674247ed9cd31a4a2ffa94db0e2002d5eccb6a91869cfea2545f1646cac2bf62946b9d4b8afd1563b963167b2c7fa53c6cd8b0cc652ce42f90e59aeeb95fc83b7dfaf4e0a8a38eeab8267bf85cf3b516aaa350ffe952e86b81da534a7d24670e99e500fe2e9c90d47dfce6f1e3c72f6e6d6d7df1e5975f7e53f7d1ef0541b065eddab5cb5f7ae9a5671f78e08107478d1a257fd9be8e0949e4727d0c4cdc0a63e0e252a9542ffdffeb859ee73da46f17e9bc955d0492db45d9f20b653ff3b9a83ada299c63ab51d6bcde6a0f246422481f3678e1851782e79f7f3e73ffab5ffd6ac776792c319f2759bc787166dbb1c71e9bb77fee7555070e1c98b7bdb38f65e2cb3c5e25afa792e7772574d44e3aada1f0e24fb1720011ab765f56ed3474b22f93eb8b6fdbb62d53d6d9eb9e973a66f885b6b9fb878f870c1992797cfffdf7070b162cc8dc3fe38c333ab6cb75dd655168e6cc993bbc9742c73253a8ff7429f4b540ed29a5de93ef1a32cb01e46342125de5fa1898b815c6c08809da299c63ab51d6bcde6a0f24264d9a94990cbafefaeb33d75195fb93274feed82e8f25e163f90ea2134f3c31d87df7dd3bb6159ac8dab46953b071e3c6ccfd9e3d7be66defece3bdf7de3bef7895bc9e72cfdfd9d0513bebb4861d1781fa1a8f015854edbeacda69c8f615e5fab2cd9b37779485d721cf7d8e9c39643ea7d43177d96597bcfdc3c772acb02c4c8f1e3d3ab6cbf5d2a5ecb0c30e0bc68d1bb7c3d944e6b124e5fa4f97425f0bd49ee7791b070f1ebcb7590e00a81ed7c7c0c4ad3006464cd04ee11c5b8db2e6f5567b20b172e5cacc5f187fed6b5fcb9c2924f7a52cdcde604c26f5ead52bf378fefcf9990931737bf8b8d4c457a1fd8b3d2eb7b053eef5947bfece868eda69a735b42f065dea799efc9efaeeb819802dd5eecbaa9d866c5fd1d9be4c528d85a1706146f631eb903382e4f18a152bf25eafe4e9a79f0e060c18d07129b9e38f3f3eafeedcfdcbf59f2e85be16a83da5d49ae6e6e6fdcd720040f5b83e06266e8531306282760ae7d86a9435afb71603897efdfa65fe4a59f28d6f7c63876d0d4526a6e6cd9b174c9c38316f7bf838f752393251656eefece373ce3927ef7895bc9e72cfdfd9d0513bef349d359ee77d3878f0e04f9a1b01d8518bbeac9a69c8f6159dedcb245db9945cee31e5bb83a4eca9a79eca5ca2ceace3fcf3cfcf3c1e3b76ec0e672a9991ef0992fd0e3ae8a08eb23df7dc3353f6da6baf759495eb3f5d0a7d2d507b7209aca6a6a6de663900a07a5c1f0313b7c2181831413b85736c35ca9ad75b8b81c41d77dcd1312124f773b785e5e1e369d3a605071e786047b9b93db74cbe5cbb4f9f3ec1d2a54bf3b677f6f1cb2fbf1c9c74d249996315aaafdceb29f7fc9d0d1d752c7c5a29b521954a7dd6dc00c08e5af465d54c434e7fd199be4cb27af5eacc42909c3924696a6aca9499cf2976ccdb6fbf3dd87ffffd8bf667ebd7af0f468e1c19f4eedd3b736691b93d7c2c670c1d73cc31c1430f3dd4b14d2e151b9ed1143ea75cffe952e86b81dad363a5e57aacf40f663900a07a5c1f0313b7c2181831413b85736c35ca9ad7cb40c2add051c783526a055ffe0ab8c3f5beaca1068b24b53866bd84be16a83ddff797e8b1d2d1663900a07a5c1f0313b7c2181831413b85736c35ca9ad7cb40c2add051c78352ea95542af539b31c801daef7650d3558c4a9c531eb25f4b540ed799ef7425353d317cc720040f5b83e06266e8531306282760ae7d86a9435af9781845ba1a38e07263b00b7d097914a425f0bd49e52ea4f7abcf44f663900a07a1803934ac2181831413b85736c35ca9ad7cb40c2add051c78352eae9743a7db2590ec00efa325249e86b81dad363a5859ee77dc92c0700540f636052491803232668a7708ead4659f37a1948b8153aea78504acdf17dff34b31c801df465a492d0d702b5a7c7494f343636feb3590e00a81ec6c0a4923006464cd04ee11c5b8db2e6f53290702b74d4f1a0947ac4f7fdb3cc720076d097914a425f0bd49e1e2bcd6a6c6c3cd32c0700540f636052491803232668a7708ead4659f37a1948b8153aea78504adde779deb7cd720076d097914a425f0bd49e1e2bcdd463a57e663900a07a1803934ac2181831413b85736c35ca9ad7cb40c2add051c783effb77799ed7649603b083be8c5412fa5aa0f694520fe8b1d240b31c00503d8c814925610c8c98a09dc239b61a65cdeb6520e156e8a8e3c1f3bca9beef0f35cb01d8415f462a097d2d507b7a9c345d8f9752663900a07a1803934ac2181831413b85736c35ca9ad7cb40c2add051c783e779937cdf1f659603b083be8c5412fa5aa0f6945277eba4cd720040f5300626958431306282760ae7d86a9435af9781845ba1a38e07cff37eeafbfe656639003be8cb4825a1af056a4f2975abce60b31c00503d8c814925610c8c98a09dc239b61a65cdeb6520e156e8a8e34129355ee7476639003be8cb4825a1af056a4f8f936ed6196e960300aa873130a9248c811113b45338c756a3ac79bd0c24dc0a1d753c28a52ed7b9de2c0760077d19a924f4b540ede971d28d3a23cc720040f5300626958431306282760ae7d86a9435af9781845ba1a38e07a5d468f99e21b31c801df465a492d0d702b5a7c74a37e88c33cb0100d5c318985412c6c08809da299c63ab51d6bc5e06126e858e3a1e7cdf1fea79de54b31c801df465a492d0d702b5276756cb19d6663900a07a1803934ac2181831413b85736c35ca9ad7cb40c2add051c783e7794dbeefdf659603b083be8c5412fa5aa0f69452d7eafcc02c0700540f636052491803232668a7708ead4659f37a1948b8153aea78f03cefdb4aa97bcd720076d097914a425f0bd49e1e275dad738d590e00a81ec6c0a4923006464cd04ee11c5b8db2e6f53290702b74d4f1e0795e3fa5d44cb31c801df465a492d0d702b527979193cbc999e50080ea610c4c2a096360c404ed14ceb1d5286b5e2f0309b742471d0f4aa9be3ab3cd720076d097914a425f0bd49ee779dfd363a51bcc720040f5300626958431306282760ae7d86a9435af9781845ba1a38e07a5d4293a4f99e500eca02f239584be16a83dcff346eab1d264b31c00503d8c814925610c8c98a09dc239b61a65cdeb6d6d6dddbe75ebd6bc0e83441ffd7b58a93bea6de6ef08eef17dff8b9ee7bd609603b083be8c7436f4b540349452c3756e36cb0100d5c3189874368c811123359f0b072a65ab51d6bcdeb973e7ae5cb3664d5ea741a2cf1b6fbc718feea81799bf23b827954a7d4e29f58a590ec00efa32d2d9d0d702d1d0e3a4c13ab79ae50080ea610c4c3a1bc6c088919acf850395b2d5286b5e6f5b5bdbc03973e66c5eb56ad53afed2c44ef4cf7dd5ebafbffe3bdd49bfa973b6f93b827b52a9542fa5d40ab31c801df465a45ce86b8168799ed7e4fbfe5d663900a07a18039372610c8c18aaf95c3850295b8d32927aa57390bf1cd0f950ae394a228ffcdce5e74f271d13a954eab34aa9f56639007be4ffd0ecffa5f465a450e86b8108799e97f27d7fba590e00a82e19db64c7388c8149a1300646dc4432170e54c256a3b4552f801252a9d4a794521f98e5000000c82c0c0dd463a507cc72000000a004e6c2e11c5b8dd256bd004aeba694fa9bdc9a1b000000ea5d3a9dfe86e7797f34cb0100008012980b87736c354a5bf502284329b575f0e0c19f34cb010000ea5d6363e399beefb798e50000004009cc85c339b61aa5ad7a0194a194da20df356496030000d4bbc6c6c67ff67dff09b31c0000002881b97038c756a3b4552f803294522b52a9542fb31c0000a0def9beff653d565a6096030000002530170ee7d86a94b6ea05508652ea95542af539b31c0000a0dea5d3e913f558e959b31c0000002881b97038c756a3b4552f80323ccf7ba1a9a9e90b6639000040bd9331928c95cc72000000a004e6c2e11c5b8dd256bd00ca504a3d9d4ea74f36cb010000ea9deffb9fd763a5bf9ae50000004009cc85c339b61aa5ad7a0194a1949ae3fbfe696639000040bd4ba7d347e8b1d232b31c0000002881b97038c756a3b4552f803294528ff8be7f96590e000050ef9a9a9a7aebb1d25b6639000000500273e1708ead4669ab5e006528a5eef33cefdb6639000040bdf37dff003d565a6396030000002530170ee7d86a94b6ea055086effb77799ed76496030000d4bb743add5329b5c12c070000004a602e1cceb1d5286dd50ba00ccff3a6fabe3fd42c070000a877cdcdcdbb2ba5de33cb0100008012980b87736c354a5bf50228c3f3bc49beef8f32cb010000eaddf0e1c377554a7d6496030000002530170ee7d86a94b6ea055086e7793ff57dff32b31c00000099ef63dc6e96010000002530170ee7d86a94b6ea055086526abcce8fcc7200000064c64a1fc999436639000000500473e1708ead4669ab5e006528a52ed7b9de2c0700004066acf49e7cd790590e00000014c15c389c63ab51daaa1740194aa9d1f23d4366390000003297dddd3878f0e0bdcd72000000a008e6c2e11c5b8dd256bd00caf07d7fa8e77953070c18b08752ea70c9a04183f631f7030000a8477a6cb4a6b9b9797fb31c0000002882b97038c756a3b4552f801ce974fa08a5d4329dd7b2f99b4e60c6f3bc94f95c0000807aa4c7466f353535f536cb0100c81504c16ecb972f9fbe70e1c28f5a5b5b839696161271f4cf7dfbdcb97357b6b5b50d347f3f40c4980b87736c354a5bf5023028a5ee3017828cbc9a4aa576319f070000508ff4d868b91e1bfd83590e0040aee5cb97cf983b776eb066cd9a60ebd6adc1871f7e48228efcdce5e73f67ce9ccd2d2d2d679bbf232042cc85c339b61aa5ad7a0118d2e9f4614aa9ad051684c28c309f03000050af7cdf5f924aa58e36cb0100c825670ac9a284b95841a2cfaa55abd6b5b4b42c327f474084980b87736c354a5bf502284029f5f3020b429275fdfbf7ffb4b93f000040bdf23cef85a6a6a62f98e50000e492cbc771a6901b91df434b4bcb36f377044488b97038c756a3b4552f8002d2e9744fa5d47a7361c8f7fd09e6be000000f54c8f91fee479de3f99e50000e492efb831172888bdc8efc3fc1d0111a2fdc139b61aa5ad7a0114a194bac45818faa0b9b9797f733f0000807aa6c7480b3dcffb92590e0040ae720b43cf2c7b27b87cfa0bc1f7a6fd4fc9fc7ce69260e5fa2d79cf27958585215846fb83736c354a5bf50228a25fbf7e3d9452af870b439ee7fddadc070000a0def9beff446363e33f9be50000e42ab53074c58c1782a75f5d1bb4bcb8326f21a8506e9efd6ade31486561610896d1fee01c5b8dd256bd004af07dffdc7061289d4effa3b91d0000a0dee971d2acc6c6c633cd72000072955a180acf045ab16e4bde2250a1fcf0bec579c720958585215846fb83736c354a5bf5022861fcf8f1dde50b9595521f9adb0000009059189aa9c74bfdcc72000072955b18baf4f7cfe79593da8585215846fb83736c354a5bf50228c3f3bc739452dbcc720000006416861ed0e3a58166390000b9ca2d0c7536e67349d7c2c2102ca3fdc139b61aa5ad7a81480441b0dbf2e5cba72f5cb8f0a3d6d6d6cc0084441bfd73df3e77eedc956d6d6d4cdc000080aaf17d7fbae77929b31c00805cf2b9d45c9c08632efe948af95cd2b5c8efc3fc1d0111a2fdc139b61aa5ad7a81482c5fbe7cc6dcb97383356bd6045bb76ecd1b9090da477eeef2f39f3367ce663d003cdbfc1d010000748552ea6e9db4590e00402e1686dc0a0b43b08cf607e7d86a94b6ea052221670ac9a284391021d167d5aa55ebf4007091f93b020000e80aa5d4ad3a83cd72000072b130e45658188265b43f38c756a3b4552f1009b97c1c670ab911f93de80120df99040000aa422975b3ce70b31c00805c2c0cb91516866019ed0fceb1d5286dd50b44a2d40090441f06800000a05a945237ea8c30cb0100c8556a5ec05cfc2915f3b9a46b615e0096d1fee01c5b8dd256bd40244a0d0025cf2c7b27b87cfa0b79033e333f9fb92458b97e4bdef349656100080000aa45297583ce38b31c00805ca5e605cccffea5623e97742dcc0bc032da1f9c63ab51daaa178844a901e015335e089e7e756dd0f2e2cabc015fa1dc3cfbd5bc6390cac200100000548b52ea7a9dcbcd72000072159a17f8e17d8bf33ef3978aec6f1e83742dcc0bc032da1f9c63ab51daaa178844a101601819dcc999402bd66dc91bf4150a03c19d0f03400000502d4aa96b757e6096030090abd0bc80fce1a7f999bf54f843d1ea8579015846fb83736c354a5bf502912834000c2383bb4b7fff7c5e39a95d18000200806a514a5dad738d590e0040ae42f30272a978f943517301a850b8b47c75c3bc002ca3fdc139b61aa5ad7a8148141a008631077ba5623e97742d0c00010040b5c865e4e4727266390000b94acd0b90e8c3bc002ca3fdc139b61aa5ad7a8148941a009a8b3fa5623e97742d0c00010040b5789ef73da5d40d66390000b94acd0b90e8c3bc002ca3fdc139b61aa5ad7a8148941a009a8b3fa5623e97742d0c00010040b5789e37522935d92c07002057a97901127d98178065b43f38c756a3b4552f108952034073f1a754cce792ae8501200000a816a5d4709d9bcd72007f170441f7850b177efb8e3bee787cc28409eb2ebffcf2ad175d74d176fd6f27b8f0c20b3fbee4924bded565af5e7bedb5ff3164c89043cce70349506a5e80441fe6056019ed0fceb1d5286dd50b44a2d400d05cfc2915f3b9a46b6100080000aa45293558e756b31c406641e8938f3efae82d575f7df54743870e0da64c99123cf5d453c1b265cb82f5ebd707426ee5b194cbf6f3cf3fff6fa3468d5a3e6cd8b07f358f976beca4b61dc6f46326b6dd306652dba5b965804b4acd0b90e8c3bc002ca3fdc139b61aa5ad7a8148941a009a8b3fa5623e97742d0c00010040b5789ed7e4fbfe5d66391077e326b55d396652db42b3bcb39e7aeaa911d75e7bedd6b163c7060b172e0cde7df7dd60c68c19c1a041df0946ddf06870c8a187ca983ce8ddbb77d0a74f9fa0b9b939b35df693fd478f1efdf177bffbdde7f4bfb123cd639bc64e6cbb66eca4b6f3cc72c025a5e60548f4615e0096d1fee01c5b8dd256bd40244a0d00cdc59f52319f4bba1606800000a05a3ccf4bf9be3fdd2c07e2ec7b939e3861dca4b6596327b5bd377efcf8eee6f6528220e8f6d8638fdd7dc10517043367ce0cd6ad5b175c71c515c15e7bed159c75d659c1e45fdf165cf3db39c15b6fbd953963486e9f79e699e0965b6ec96c97fd647f799e3c7ff0e0c1efe97f63ff62d603c44da97901127d98178065b43f38c756a3b4552f10894203c01fdeb7386fe1a754647ff318a46b6100080000aac5f3bc814aa907cc7220aec6df3afb936327cd5e34f617b30f1f37a96df9985fb61d1d6e1b3ba975ecd8496dafe8fcef98496dab32fb8f9ffd09bddfcf74d96a9d776ebce3bf5fbde8a28b82457f7e29b8f4c659c1bf7df7fa60cc2f1f0fee6d5b9c5908d2fb06721938c98217dfce945d7bdb82cce32b7e3d37b84fef377cf8f060fffdf70f26def670f0c3a94f046327b606637ef1f8a6cc6bf8c5dc83f4be6bdaeb9ebedbb849b327ebc71ba56cdce4b674ce3eef8c99d87693be7d7fece436be070cd6159a1720f6c2bc002ca3fdc139b61aa5ad7a8148141a00de3cfbd5bcc59f5291fdcd6390ae8501200000a896743afd0dcff3fe68960371357662eb2fc74d6e1b97b93fa9edde3193677b727fdce4d62bc64d6a9b3f6ad2ac6373cf221a3371f6756326b6dd3df617b3f7beebbe96c7c6dcf048b07af5eae0fbd74f0d865c7d7bf0c4826783d7576d0e2effd5139945a0175f5b174c6f5b92b99f6bbbce9a0def671687c41d0f2d08065d714bf0c31fff3c58b56a553064c8902d8d8d8d678e9bd4da7feca4d933c3bac74d9a3d7dd4a4b9fb7d6fd2ec2fe9d7bb3ef35a659fc96d2bc6fee28963c64c6e4de9f26de1eb056c29342f40ec8579015846fb83736c354a5bf502912834005cb97e4bf0f3994bf216800a45f693fdcd6390ae8501200000a81699a8f67dbfc52c07e268f4c4b6af8f9dd4b63d3ca347228b2fb24ddf5f39ee17b38e309f2367eae4ee7fe994d9c184091382ef5cf1ab60ce334b338b3c9bdedb165cfd9b2733f76ffde3e2e0a5d7d685eb41c1e2e5ef043ffbdda2e0929be6649e2f670f891ffef6c9e0e5656f05279f7c72e6784b962cd93e68d0a08d237ff6c0a47193665f9badfbed4b7ef5d8fe727fcc2f671da01fbf99299fd83a7eece4b69fc87dbdef99bafc99bfbf62c08e42f302c45e98178065b43f38c756a3b4552f100906806e8501200000a896c6c6c67ff67dff09b31c881b39e367eca4d6a5724650582667de8c99d4f648fbfdb60d636e9cf52fa9e9d377f9fbb3328b331baffeedfc2f5ffbe31f6f95ef04fac31ffe101cf9b9a3824ba7cc09663dfb46f0feb68f833b1e7d29f8e3c26599059fcba63c11acdfbcb56361e8aa5be6057f7d637db0e5830f83dfb72ec9445c79f3dc60c99beb8355ab5707871f7e78e6b80f3ef8e0c6113ffedddab193677f335bf73a395368c48db3f6d1f7efd1aff7facc6b9dd8faf0b8896d03db5ff7ecc9fab55f99fb9a011be2302fd0d03e3f97575e6c7bb9c72e8779015846fb83736c354a5bf5029188c300b09ec200100000548beffb5f564a2d30cb81b81933b975dab8c96ddfcd2d1b356976eff0bb84c64e6c6d963372c666cf2892cbb765ca27b59d77c98dadef87670c1d71f41782875b9f0ebefbe3bb830b7e784be6fb852eb8fae6c04f3705fadf4a7bd9c459c1d0cbfeb3fdf15553f43e2dc145d7dc118cf8c9ef83ef8cf87ea67cc8a8ab83f1ff35bfe33b890efd877f0cd6ad5b178cb9e18f7f1b32f2aaf6cbdb4d9cfd1dbd6dadce669d29f29d43d9d7b4f27b373d7148f6fe9b174f9efdf9f03d01b6d47a5ea0a1c0a24ca1b25229b7bfb9bdd2c72e8579015846fb83736c354a5bf50291a8f5009054967a1c00a652a95efa03f6859ee73da46f17e9bc251fb8b3b78bb2e517ca7ee67301004071e974fa44dd873e6b9603f5220882ee3ff8c10f3e5ab8706170f9e59707175c704170ef134b83a1975c1f8c1c3932b3c823b73366cc289bdcfde536971c578effe4934f6ed2dbe699af03705dade7051a0a2cc2142a2b956aef5f6ebbcdd4e3bc009c42fb83736c354a5bf50291a8f5009054967a1a003636369eae3f38cfcd2e02753673e579e6b1000040bea6a6a62f789ef782590ec4592a95dacbf7fd5f76e68f86162c58f0ad61c386059b376f0e7af6ec19ac5cb932f8f1ed0b8373cf1bd1b1e023634cb92d2577bff07e2e39ae1c5fead1ffee3675e6b5012ea9f5bc404381459852657becb14770eaa9a7ca626bde3649b76edd32dff1f5eaabafe66defcce3dc6315dbafdc6bc87d4eb5534ff3027012ed0fceb1d5286dd50b44a2d603405259ea6100e879de91fac3f42305167d2ac923721cf3d80000e0ef7cdfffbcee33ff6a960371d6d4d4b467763cf8a1ce2da5c684b7df7e7bcb94295332df01d4af5fbf8e851c797eb818546e71c8dc5e686148c8f1a59e091326bca85fd345e66b016c48a5523b7cef5631b59e176828b01013c6dc57b278f1e2ccb6638f3d36ef1877de796770db6db765ee0f1c38306f7b571f9b29f51ae4ff956ddbb6e53da75aa9877901388df607e7d86a94b6ea052251eb0120a92c491f003636369ee9fbbe5c62a36391a7b9b939b8eebaeb82d6d6d660d9b265c1faf5eb331faee5561e4bb96c97fd8cc5a10d723cb30e0000d02e9d4e1fa1fbcb6566391067fdfbf7ffb43126fc588f2fefd239cedcf7da6baf7d472e2327e3c89b6fbeb96311c75c0832177f4a95175b1892e34b3db366cd7a496fbfcf7c2d800dba2dfe8ffeb7f19d720b44b59e176828b00863963dfae8a3c189279e18ecbefbee1ddbba77ef9eb7ffa64d9b828d1b3766eecb997ae6f6ae3eaee435c8d981b9cfab76923e2f00e7d1fee01c5b8dd256bd40246a3d00249525c90340fda1e43cfda1e47fc30ff14d4d4dc1d4a9533383face90fd647f795eee44801cd7ac0b000064ceace8adfbc9b7cc7220ce52a9d46e3963c1dc6c970519f96ead70dfcb2ebb6cebf2e5cb83934e3a2978f6d9673bc695b27fb94520f3b1b99f498e2ff5bcfcf2cbafebedcfe4be66c016dd16df97f6aa3f872df13c4fe9a26ee63ea2d6f3020d051661ccb25ebd7a651ecf9f3f3fb3f0626e0f1fd77261a8b3af21f739b54892e705100bb43f38c756a3b4552f10895a0f00496549ea00307ba650c7a2907c69ef6bafbd667e9eee14795ef8a5bfd97ccc99430000e4d37def01ba9f5c63960371367efcf8ee39e3c06291cb167fedc20b2fdcbe61c386e0e0830f0ede7efbed8ef1a4ec536cc1473261c2848efbc5f633c9f1a59ef5ebd76fd1dbdf365f3760836e8bdb72ff6dc8f7cee9bee19be67eb59e176828b0a06296edb7df7e99c7f3e6cd0b264e9c98b73d7c9c7b29b9010306e46defece33df7dc33f3583e5f56fa1ac2c7b54a52e705101bb43f38c756a3b4552f10895a0f00496549e20030954a7d2e9d4e6f0c3f8c5c75d55599bfbeda19f27c394ece879cf5528f59370000f54cf7bf3d751fb9c12c477de9dbb7ef27060f1efc493d56fa8cbedddbf7fd7df5fd03b367941d2e6328f93e2acff3fe8f6e33c7ebb293f4fd2fe9b2afeafb7db37fe073962e3b47269475d9bfcb9907fafeb9fafe607d3b54df5ea8cb46eafb63f5fd4bf4fd2bf4ed0f74c6ebb21febdbeb75d97fe8fbbfd4f76fd4f77fad6f7fa3739b2ebb4bdfdea3cbfea06f1fd0f96f7dff517d3b4b678ece933a4fe93cabf33f3a2faa1d17810ae56ffab87f934bbb7dfcf1c7418f1e3d3263ed90ec53e8f270725becbeb9af498e2ff5e8fade0d5f83ce473a5b75ded3d9acb341e71d9dd53a6febbca9f39aceab3a2febfc4567b16a7f9f7fd259a4dadffb7c9db93ab355fbcfe5319d993a0fabf69fd9bdfafd4ed799263f4f9ddb75fe4bff1ca7cacf5ae7269d493abf90df83ce4ff5737ea273adde6f827efc439dabe4f7a673a9cef774c6e88cd4b948ef375ce77c9dc13acd3a691d4fe7df75bea53340e76c69273affa27386ce693a5fd5f9b2de768ace493a27e8c75fd4394ee7f3babdfda35cf252e730698fe79e7bee41fa77b6ffa04183f691b63a60c0803de4d281fdfaf5eb21edb8a1c8d92e284eb55f61c1fcf72179567e5fe17eb59e176828b0a062964d9b362d38f0c0033bcacdedb965ddba750bfaf4e9132c5dba346f7b671fcbe5caf7d9679f1dca3bfb1ac2c7b54a12e705102bb43f38c756a3b4552f10895a0f00496549e20050b57f68cd7c0091337d7676512824c731ce1c9a69d60d00403d6b6e6ede5df78fef99e5f526890b23fa394b54fb62825cb66c856a5f6858a7b349b52f426cd391b3b5e5f26a32312c8b135bf471e58f7564616295ce5baa7d51e2159dbfea2cd6dbffac6f9fd159a8334f67b6aeab45b59f81f3b0de7ebfbe9da1cba6e9db3b756ed56553f5edaf7426ebfbbfd0b73fd7dbafd3b7d7eafc48975da56f2fd76517ebfb63f4fd11fafe05faf67c7dfb1d5dd6a4ef7bfafebfe9fb03f5fdb3f5efe15ff5edd775d969fae7ff157dff14b9449cdefe7f75d971aa7dc1c59ce896c8a2cabfcb42827ca7ca05175cf071b933860a2dfebcf4d24b1df7cdedc51686c23386de79e71df9bdbc2d67360d1f3e7c57697bf26f51b7b73d65b156bffe7dfdf6b3f90ed63944e770fdbe8ed4394ae7189dff23ef53e79f74faa8f645955375bea6d357e7ebbafcffd3e9a7738efccc74bead93d2513a4d3a837486e87a86cacf5ae7bb3aa374c6caef41e7329defabf636fa237d7f82ce8f75aed3f999ce7ffaed6d75b2ce149d9b557b7bbd55e70e9dbb75eed199a1739fce833affaddadbc9e33aadaabded4a1b5aa0f3b46a6f57cfe93cafda17f7a4cd2dd559a6dadbb1b4c7953a6b74d6e9d7bf51bf065964934ba16d53eded58da73d8a6a5ec7dd947f6d5f7d7ebac55ed6d5bfe4dbca1b35ce715bdcf129d97f47e2f78ed6d5cfe2dc96b92d726af515eabbc6679edf21ee4bdc87b92f726ef51deabbc6769f3b7e9fc56e716d5deee6fd499a87383cecf75aed7f9ff75aed1f991ce0fe4679dfd99cbcf5e7e07f2bb90df89fc6e86caef4a7e67fafeb97ebb469d7fd3f9a64e7fdd6ebe21ff26e4ff229dd375fe59fe5de8e77c49a78fd7de56a4cd48db9136246de9485df7e1aafde765fe3bc98d2c3a7e9d7901b792c47901c40aed0fceb1d5286dd50b448201a05b49da00503eb8841f3ae4bb81ba7af9b862e478b9df3924f599af0100807a2593d2ba7ffc888591e42d8ce8dfd9d1fafe9172a685bedf4b971d206759e8fb7bc92244b83062b689a450d9ef4dc9c95ff5cfa0b1c138a3e4e28b2f7eb7d4770c998b3ec5143a8bc8147ec7d05ffef21769a77cc750ed7493ffd3a48dcbd944725691fcbfa6dbfb6775f693ffdbe4df84cea13aff20ffbfc9bf179d63f5ff795f90ffe3e4df92cec9bacd7cd96f3fab49ce6e92b39ce46ca7b3e4dfa06a3f0b4ace8692b3a2e4eca8b4dfbe70f31d7dff3c9d613a17ea8cd019ad334ee7129dcb75aed4b95a67bc6aff7fe027fadfeb4fe5ff40f93fc26b3f7b4bcee292b3b9a6ea63fe97df7e9697fc5ff83b9ddfebf23fe8dcaff390ce1f751ed5db5b74da749e50edff2fcaff537256999c5d26ff37cac2a89c7526679fc9ff8ff2ff5beebf93429133dbfec6bc805b49dabc006287f607e7d86a94b6ea0522c100d0ad246d00a8da2754321f3aa64e9d6a7e7eae0a396ece079b79e66b0000a09e65fb4716469028aafdb26cd2b6a5fd0e2ef6bbbef2ca2b972e5cb830904bcadd7cf3cd1de347796e78e679b945a150b820143ecf24c7977aeebffffe87f4f6fbccd702444d16d0b2ff4ef2220b4eb23816eecbbc805b49dabc006287f607e7d86a94b6ea0522c100d0adc4610028d7fef67dbf7f43996b7ccb248dca5eba403e246fdcb8d1fcfc5c15725c397ef643ce76a9d77c2d000000480ed57ed6d877f5b86f37735bae091326fcc7942953823ffce10f41bf7efd3ac68fe1e4b82cf28467017526b9973136c9f1a51ebdcf4ccff32e325f0b10355920371684e4eca019b2c06eeecbbc805b89c3bc00128df607e7d86a94b6ea0522c100d0adc46100289763c87eb090bf2c1e261f38cc7d847c200e3f845c7ffdf5e667e7aa92e38775f1411c000020d9e4328966592143860c3964e8d0a17f93efa6ecd9b367b072e5caccd8d1982cef5272c971e5f89b366d92efc779873f54820be4527bd9f6fab1effb77c9e5f4cc7d42f53e2fd0d03ef79757ded9ececf3cdc4615e008946fb83736c354a5bf50291a8f701a06b89c30050b57f516eee0763b9a6ffd572f916633ff9b2d6cc3eb366cddae1c373b5c9f1735e0f97ee00000040c6a851a35e93cbc95d7ef9e5c105175c600e23ab428e2bc7bfe79e7be43b62b8b4319c2097d5d4edf137f2877de63653bdcf0b34ece4c2cece3edf4c1ce6059068b43f38c756a3b4552f10897a1f00ba96380c00e5cb5d8d85a1301fe8dc187ef050eddf4f90d9265ffa5b4b72fc9cd7c197fd0200002063d8b061ff3a7af4e88fd7ad5b171c70c001c173cf3d670e25778a1c4f8ebb76eddab7f538f495c6c6c6d3cdd700b8aedee7051a76726167679f6f260ef3024834da1f9c63ab51daaa1788445c07800dc6c0ebde7bef0d8e38e288a07bf7ee1de5e63e71481c068005ae556d46ae5d7daf6aff62eb4cd9860d1bcccfd05525c7cfa9ff6df335030000a07e8d1c39f2b99933676e97ef003afcf0c383356bd698c3c92e91e3c8f1f471b7ffec673fbb558f43679a75037150e9bc4043f6b3f61e7bec119c7aeaa9c1934f3ed9b16dfdfaf5c1881123825ebd7a05ddba75dbe13379a96db2783b6cd8b0cc42eb5e7bed15f4efdf3ff30780e1f6e9d3a707471d7554b0ebaebbe67dd65fbd7a7570eeb9e706fbeebb6f264d4d4d9932f3758759ba746970f2c92777bc06f378e55e8b19f3f9b965857e46e512877901241aed0fceb1d5286dd50b44a2d20160a569c80e862ebef8e2bc3273df6229b4bf5976c82187641efff9cf7f2eba4f1c12e100b09b5c73daf7fd7df507d84352a9d4d1faf684c6c6c6afe8b27ff13c6fa08e2e52e7e9db91baec327d7fbcbefd99bebd51677bce424ca17c9cfbf8e38f3f363f4757951c3fa7be6de69b05000040fd9233da870c19b265c99225c18409133213c23bbb3824cf97e3c8f19e78e289dbf5187455672ed905b8a8abf3028b172fce7ce63ef6d8633bcace3ffffc4cd965975d16bcfbeebb3bec5f6a9bfe379ad976fffdf7070b162cc8dc3fe38c333ab6efb7df7e9945a1993367e6bd0e591492fdefbcf3cee0b6db6ecbdc973273bf30b2d063ee2fe9ec6b31633e3f37857e46e512e1bc005008ed0fceb1d5286dd50b44a2ab03c0cea6213b4092419c7ce96b6e99b96fb17466ffceec13873cfef8e33248dd99059bdfeafbd3f4ed83fab645dfced7fbfd59df5fa2efbfa9b34eb55ff24dceea793ffbf8cdecf6e7749ed4793cfb7c39ce6f7526eb63fc54dffe48df5e9aad77abca5f0c92acd419a707d2fb65ef67ca39630800000036c958fabcf3cefb40ce2290c59cc30e3baccb979593e7c9f3e538cb972f7f58c6bd7abc7ea65927101795cc0b3cfae8a3c189279e18ecbefbee1d9fc3e5ca1de176f9ec2f65b2786a3eb7d43639d3273c5e981e3d7a746c3ff8e0833365f26f6fdcb8713b9cc1b3cf3efb64b66ddab429d8b87163e6be1ccfac23ccde7bef9db7bfa4b3afc58cf9fc723fa37261610896d1fee01c5b8dd256bd40242a190076250dd941d039e79c13fce637bfd9a12cdca7d469dfe1beb9318f616e37cbc37a4a9db69ebb7fa153bd0b1dbfdad9b66d5ba03fb0cac24697176c54fb8291be5103e4c3a9be3d55e784ec02d32183060dda47dfff947e0fdd1a76823ed66ab5e382d0265def1583070ffe64ce3e7cc7100000009c914ea7cf1f3264c8bb72e6905c566efffdf70f860f1f1eac5ab5ca1c5e1624fbc9fef23c797ef64c21f96ea1f3ccba8038a9645e403e4feba704f3e7cfcffcf1a7dc9784db4b2dfe7466db8a152bf2b6499e7efae960c080011d97923bfef8e33bb6557b61a8dc6b31633ebfdccfa85c58188265b43f38c756a3b4552f10894a06805d49437600247f3173d24927ed5016ee53eeb46f73ff4265e6e34265a54e5bcf4da153bdc3634d993225b380633ea75a9133861a62407ff85d9e5d84f95067a22c3815d8e7be70b166d6ac59e6e7eaaa92e3e72c0cdd67be1600000040c81f4f3537376f7cf0c10737caf7885c71c51599ef1039ebacb3825b6eb92578e6996782b7de7a2b33c6945b792ce5b25df693fdd7ae5dfb76f63b855673a61092a092798170d164debc79c1c489138b7eee967f2be6e7eece6c1b3b766cc7d5460a45fe8053f63be8a0833acacacd2998913f5c35f72ff41ecabd9630e6f3cbfd8cca8585215846fb83736c354a5bf50291a86400d89534e40c8064a1251cc4856592727fdd63ee5fa8cc7c5ca8acd45f27953bd53b2cebcca07067129701a0effb2fe90fc2bff73cef48735b486fbb285cacb9fefaeb8da59cea92e3877549bde66b010000004232864da7d38f0d1d3af41dfdf964934c50cf983123686e6e0efaf4e913f4eedd3b33f6975b792ce5b25d7f16587bcf3df7dcadc79cafe83c526a2c0cc44925f302d3a64d0b0e3cf0c08ecfc861c2ede1953ae4d26fe6953aca6d1b397264e6df9d7c16378f1b3e9633868e39e698e0a1871eead8165e8544e61624b957212994975f7e39f387abe16b30eb2af75acc98dbcbfd8cca252ef302482cda1f9c63ab51daaa1788442503c0aea421670074e38d3776fc254f5826716161a8dca9dee6e35a252e0340fd41fa08b3cc944aa57ae90fccdb65b1463e4ccbefb616e4b8ba5d65ea91faa45ef3b500000000a6c6c6c6d3f5f8716e5353d3e6f1e3c72f6e6d6d7df1e5975f7e73ddba75efe961e696b56bd72e7fe9a5979e7de081071e1c356ad423aafd72cf73e579e6b18038abf5bc00a92c7199174062d1fee01c5b8dd256bd40246a3d006cc859509109fcdcbf9a09f72977daf79e7bee99297bedb5d70a1eb7d0e34265a54e5b2f77aab7f9b85649da00507f709e179ec93375ea54734da72ae4b8611d529ff91a0000008052b27fd074a1e7790fe9db453a6f65c79672bb285b7e217f8084a4aaf5bc00a92c499b1740ecd0fee01c5b8dd256bd40246a3d006c301654c68d1b975756eeb4efebaebbaee3aca2f079e631ccc785ca4a9db65eee546ff371ad92b40160f6af30338b36f27b95c5bd6a92e3a5d3e9f06ca180bfde0400000080cad47a5e805496a4cd0b2076687f708ead4669ab5e20120c00dd4a1207804aa999e1c28d5ca7592ed5570d729c112346fc2d3cb6d463d60d00000000288d7901b792c47901c40aed0fceb1d5286dd50b448201a05b49e20030954a7d4e29b53e5cc0b9eaaaab767a71489e7fe59557769c2924c7977accba0100000000a5312fe05692382f8058a1fdc139b61aa5ad7a81483000742b491d003636369ea994fa38f7cca1ae5e564e9e679c29f4b11cdfac1300000000501ef3026e25a9f302880dda1f9c63ab51daaa1788040340b792e401a052eabcdcc521f9cea1a953a7061b376e34d77e0a92fd64ffdcef14ca1eef3cb32e0000000040e7302fe056923c2f8058a0fdc139b61aa5ad7a8148246100d8d0feef34afbc508aed2b8b0ec71c738c5c9e2c6f5b9449fa00307be6d0869c859da0b9b939b8eebaeb82d6d6d660d9b265c1faf5eb330b41722b8fa55cb69f7beeb9b90b42920d9c2904000000003ba7d6f302ebd6ad0b860d1b161c70c001c15e7bed15f4efdf3f58be7c79c7f686ece7f4309ffef4a783134e382138f4d04383dd76db2de8ddbb77307dfaf4bc7dbb75eb169c7cf2c9c1abafbe5af4589da95f8e7dd4514705bbeeba6bc13983b06c8f3df6084e3df5d4e0c9279fcc7b8fd54cd2e705e03cda1f9c63ab51daaa178844ad07809286ec204a0659fbeebb6f70e6996766063ae67e5d4d787cb3bc508aed2b8b13175f7c715e79d4a98701a0e779472aa51e3116792acd23721cf3d80000000080ca54f3f379a10c193224f339fcfefbef0f162c5890b97fc61967746c97c7929b6eba2958b468d10e8ffff4a73f65ee1f7cf0c13bec7be79d7706b7dd765be6fec08103f38e3565ca9460dbb66d9daa7fbffdf6cbcc57cc9c3933efb5e766f1e2c599e71e7becb179dbaa997a981780d3687f708ead4669ab5e2012b51e004a1ab203b3ad5bb7660679c71d775cb0cb2ebb048f3df658debef59e7a1a003636369eae949a5b60d1a754e6caf3cc630100000000baa6d6f302f207a20dd97981303d7af4e8d81e966ddab429f8e0830f3a1ecb953d72b79bfbca76b9dfb367cfbc636ddebcb9d3f5cba293941d76d861c1b871e376389be8d1471f0d4e3cf1c460f7dd77ef786ef7eeddf3de6335534ff3027012ed0fceb1d5286dd50b44a2d60340494376f0143e9681953ceedbb76f47d9ce9cda6d3e964b908d183122e8d5ab57e6d4f252fbae5ebd5a2e519619284ae47b6fa4ccdc3f8cbc3ef9cba4707bb5538f03c0542ad54b2975a1e7790fe9db453a6f651781e47651b6fc42d9cf7c2e0000000060e7d47a5e40cec8d1d5042b56acc8db26916d92ce3c0eef975b18aaa4fea79f7e3a18306040c77cc3f1c71fdfb14de615a46cfefcf999c5a642c7af76ea715e004ea1fdc139b61aa5ad7a8148d47a00286930064eefbcf34ee6f13efbecd351b633a7769bc73ffffcf3338f2fbbecb2e0dd77df2db9af2c0ac9e3dcd3d0a5ccdcffc61b6fec785d071e7860de6ba85618000200000000a254eb7981f033fad8b163773893278c6c9374e671783ff733bc2cea14dab7b3f58791ef0e92fd0e3ae8a08eb2705169debc79c1c489130b1ebfda615e0096d1fee01c5b8dd256bd40246a3d0094341803a7b56bd7661ecb193a61d9ce9cda6d1e3f1cb8ad59b3a6ec6b91c529799cfbd746b9af2bdc5fb6cba5f0cce7573b0c00010000000051aaf5bc805cd563e4c89141efdebd3397616b303e5757f238bc2f912b84f4e9d32758ba7469c17d2bad5ffe18f598638e091e7ae8a18e6dd3a64dcbfc71686ebde6f1ab1de6056019ed0fceb1d5286dd50b44a2d60340498331702a7429b99d39b5db3c7e2d16868a3dae7618000200000000a214c5bc40b5d250e3cfe42e8479015846fb83736c354a5bf50291886200d8901db8c919378b162d0a8e3beeb860975d76091e7becb18e7d76e6d4eef0f8e6b1aeb8e28aaa5d4aaed8e36a87012000000000204a51cc0b542b0d35fe4cee4298178065b43f38c756a3b4552f10892806800dd981db273ef189cc193aa79f7e7a66a093bbcfce9cda6dee2bc71a316244e6f273726a79a1e3848f57af5e9d590892d725696a6aca9415dbdf7c5ced3000040000000044c9fc7c4eec8679015846fb83736c354a5bf502916000e85618000200000000a2c4bc805b615e0096d1fee01c5b8dd256bd40241800ba150680000000008028312fe05698178065b43f38c756a3b4552f100906806e85012000000000204acc0bb815e6056019ed0fceb1d5286dd50b448201a05b610008000000008812f3026e8579015846fb83736c354a5bf502916000e85618000200000000a2c4bc805b615e0096d1fee01c5b8dd256bd40241800ba150680000000008028312fe05698178065b43f38c756a3b4552f100906806e85012000000000204acc0bb815e6056019ed0fceb1d5286dd50b448201a05b610008000000008812f3026e8579015846fb83736c354a5bf502916000e85618000200000000a2c4bc805b615e0096d1fee01c5b8dd256bd40241800ba150680000000008028312fe05698178065b43f38c756a3b4552f100906806e85012000000000204aadadaddbb76edd9af7f994441ffd7b58d9d2d2b2cdfc1d0111625e0aceb1d5286dd50b44828521b7c2c21000000000204a73e7ce5db966cd9abccfa724fabcf1c61bf7b4b4b42c327f474084989782736c354a5bf502916061c8adb030040000000088525b5bdbc03973e66c5eb56ad5baae9c39f4eebbefe69591caa27feeab5e7ffdf5dfb5b4b4bca973b6f93b0222c4bc149c63ab51daaa1788040b436e8585210000000040d4643142ce54d1f9503e977636d3a64d0b860e1d1a3cf2c82379db4845919fbbfcfc5914826dcc4bc139b61aa5ad7a8148c800c45c9c20f622bf0ff3770400000000806b945207ebbca9f32d731b80d8625e0aceb1d5286dd50b44828521b7c2c21000000000c075fdfbf7ffb452ea599dcbcd6d00628d792938c756a3b4552f10091686dc0a0b430000000000c775534addab73abb90140ec312f05e7d86a94b6ea0522c1c2905b61610800000000e032a5d44f7cdf7f22954aed666e03107bcc4bc139b61aa5ad7a8148b030e45658180200000000b8caf7fdef28a55e1d3468d03ee6360089c0bc149c63ab51daaa1788040b436e85852100000000808b94525fd359e3fbfee7cd6d001283792938c756a3b4552f1089d6d6d6ed5bb76ecd5ba020d147ff1e56b6b4b46c337f470000000000d8944ea78f504aad6a6c6c3cd3dc062051980b87736c354a5bf50291983b77eeca356bd6e42d5290e8f3c61b6fdcd3d2d2b2c8fc1d0100000000604b2a95da4b29f5179d0bcd6d001287b97038c756a3b4552f1089b6b6b68173e6ccd9bc6ad5aa759c396427fae7beeaf5d75fff5d4b4bcb9b3a679bbf2300000000006ce8dbb7ef2794528ff9beff4b731b8044622e1cceb1d5286dd50b44461623e44c159d0fe53b6e48e4919fbbfcfc5914020000000038c3f3bc9b94523353a9d42ee6360089c45c389c63ab51daaa17000000000000b0c2f7fd514aa9c503060cd8c3dc0620b1980b87736c354a5bf50200000000000091f37dff2ca5d44a9dc3cd6d00128db97038c756a3b4552f0000000000001029dff78f534aadd1b75f36b701483ce6c2e11c5b8dd256bd000000000000406452a9d47e4aa9e53a69731b80bac05c389c63ab51daaa170000000000008844bf7efd7a28a5e6eb5c636e035037980b87736c354a5bf50200000000000091504adda9f37b7db79bb90d40dd602e1cceb1d5286dd50b000000000000d49ce7795729a59e4ea5529f32b701a82bcc85c339b61aa5ad7a010000000000809af23c2fa5947a23954a1d686e035077980b87736c354a5bf50200000000000035e3795e1fa5d45a7dfb7fcd6d00ea1273e1708ead4669ab5e000000000000a0269a9a9a7a2ba556f8bedfdfdc06a06e31170ee7d86a94b6ea05000000000000aaaeb9b97977cff3feecfbfec5e63600758db97038c756a3b4552f0000000000005055e3c78fefae947ac0f3bca9e63600758fb97038c756a3b4552f0000000000005055beefff4ca76df8f0e1bb9adb00d43de6c2e11c5b8dd256bd00000000000040d528a5ced3599a4aa53e6b6e038006e6c2e1205b8dd256bd0000000000004055f8be7f9a526ab5e7794799db00208bb97038c756a3b4552f000000000000b0d352a9d4e76451a8b1b1f174731b00e4602e1cceb1d5286dd50b000000000000ec94c18307efedfbfe12a5d430731b0018980b87736c354a5bf5020000000000005dd6b76fdf4f28a566f9beff9fe636002880b97038c756a3b4552f000000000000d0654aa99b3dcf7b68fcf8f1ddcd6d00500073e1708ead4669ab5e000000000000a04b9452e3749e4fa5529f31b7014011cc85c339b61aa5ad7a010000000000808a29a5ced6793b954a1d6a6e038012980b87736c354a5bf50200000000000015696a6afa82526aadce29e636002883b97038c756a3b4552f000000000000d069beef1fa0947a4dc733b701402730170ee7d86a94b6ea050000000000003a65f0e0c19f544a2df43cef87e63600e824e6c2e11c5b8dd256bd00000000000040a728a57e2731cb01a002cc85c339b61aa5ad7a01000000000080b294523f92b385e4ac21731b005480b97038c756a3b4552f0000000000005092e7794abe57a8b9b9797f731b005488b97038c756a3b4552f000000000000509452ea149d354d4d4d5f30b701401730170ee7d86a94b6ea050000000000000a4aa552872aa5de4ea7d3df30b701401731170ee7d86a94b6ea05000000000000f2a452a9cf28a59ef77d7facb90d00760273e1708ead4669ab5e0000000000006007e3c78fefae947ad8f3bc5f9bdb00602731170ee7d86a94b6ea0500000000000076a094bac1f7fd96be7dfb7ec2dc06003b89b97038c756a3b4552f000000000000d0412935dcf7fd2583070fdedbdc060055c05c389c63ab51daaa17000000000000c8f07dff0ca5d4aa542af539731b00540973e1708ead4669ab5e000000000000a0c1f3bca39452ab7ddf3fcddc060055c45c389c63ab51daaa17000000000000752e954a7d5629b5d4f3bc21e63600a832e6c2e11c5b8dd256bd000000000000a863c3870fdf552935dbf3bc9f9adb00a006980b87736c354a5bf5020000000000a08e29a57ee379defde3c78fef6e6e03801a602e1cceb1d5286dd50b0000000000803aa594ba44e7b9e6e6e6ddcd6d005023cc85c339b61aa5ad7a010000000000508794520374de6a6a6aea6d6e03801a622e1cceb1d5286dd50b0000000000803a934ea78f574aadd539c9dc060035c65c389c63ab51daaa1700000000000075e4dc73cf3d4829f586cebf9bdb002002cc85c339b61aa5ad7a010000000000502752a9d4a794528b3ccfbbcadc060011612e1cceb1d5286dd50b000000000080fad0cdf7fde94aa93bcc0d001021e6c2e11c5b8dd256bd000000000000a8034aa96b759eecd7af5f0f731b004488b97038c756a3b4552f00000000000012cef3bc26a5d4b2542ab59fb90d0022c65c389c63ab51daaa1700000000000009a6943a55674d2a953ad6dc06001630170ee7d86a94b6ea050000000000404229a50ed759994ea7ffd5dc06009630170ee7d86a94b6ea050000000000408cf9be7f6e5353d317cc725db6a752ea45cff3469adb00c022e6c2e11c5b8dd256bd0000000000008831a5d47ffbbeffaebe3d3b2c4ba552bbe8c733756eccdd17001cc05c389c63ab51daaa1700000000000031357efcf8ee9ee76d544a053affab334ecaf5ed449dc76481c87c0e0058c65c389c63ab51daaa1700000000000031954ea78fcf2e0ae5669ece5f52a9d45ee6fe00e000e6c2e11c5b8dd256bd0000000000008829a5d4e8020b4392f9e974baa7b93f003880b97038c756a3b4552f000000000000624a2935a3c0a25026beef2f49a7d3ff683e07002c632e1cceb1d5286dd50b00000000008098524aad3617848c3cdfdcdcbcbbf93c00b088b97038c756a3b4552f0000000000006228954a1d5d602128cc939ee7a5faf6edfb09f37900601973e1708ead4669ab5e000000000000c490526a98b118b4cdf7fddb3dcffb27735f00700873e1708ead4669ab5e000000000000c49052ea8eec82d0473ad7343737ef6fee03000e622e1cceb1d5286dd50b00000000008018524acdf77d7fdda041830e35b70180c3980b87736c354a5bf50245ad5cb9f2b03163c6fcf98b5ffce247bbedb69bb45142082184104208218438905d76d925e8dfbf7fd0b367cfbc6d84906464d75d77dd7ee491476e38e490437eac1fefd2901cf2fe00a7d86a94b6ea050a9245a1af7ef5ab1f9d73ce39c133cf3c137cf8e18701000000000070c7b66ddbcc22000922f371322f77d659677df4a94f7d6a4143721687980b87736c354a5bf502058d1e3dfacf679f7db6d91f0100000000000088d829a79cf2764343c365e61c5e4c31170ee7d86a94b6ea050a3afef8e33f92bf480000000000000060d782050bd63634343c63cee1c51473e1708ead4669ab5ea0a01e3d7a70f938000000000000c001324fd7d0d0b0cd9cc38b29e6c2e11c5b8dd256bd403166ff03000000000000c01299af3327f0622a29ef030962ab51daaa1728c6ec7b000000000000005822f375e6045e4c25e57d20416c354a5bf502c5987d4f51b26f986eddba05071c7040904ea783952b579abb02000000000000e882ecfc5b1224e57d20416c354a5bf502c5987d4f51b26fb8bf5cef74e2c48999c75ffffad78d3d010000000000007445760e2e0992f23e9020b61aa5ad7a8162ccbea728d93777fff7de7b2ff3f8339ff9cc0edb73f77bf7dd77830b2eb82038f0c00383bdf6da2b18387060f0d65b6f751c23777f390be994534e09de78e38d8eedb9fbecb1c71ec157bef295e0e9a79fcedb66beb6ae3c27d7962d5b82d1a34707bd7bf7cebcae42c72ef738b7fcbefbee0b8e3efae860d75d77cddb7fc3860dc1a04183827df7dd3793e6e6e64c19000000000000ea4f76ee280992f23e9020b61aa5ad7a8162ccbea728d937dc3ff78ca133ce386387edb7dc724bb07dfbf64cd9f9e79f9f297bf8e18783679e792673ffcc33cfcc3be6b469d382bbeeba2b73ff5bdffa56c7f65c4b962cc96c3feeb8e33aca0ad599ab2bcf11c3860dcbecf3fdef7f3fd8b66ddb0edba4bc7bf7ee3b3c96988f738fbffffefb6716851e7ffcf18efd42b22864fe0ca40c000000000000f5273bb7940449791f48105b8dd256bd403166df5394ec1b46cea291c50ecff382152b56ecb07debd6ad1dcf913360729f27e9d1a347c7f6b0ec830f3e08de7ffffdccfd9e3d7b766c9f356b5670d2492705bbefbe7bc7be85166572ebecca734cfbedb75f669f8d1b379a9b32e5bbecb2cb0e8f25e6e3dce3f7ead52b5376f8e18707975c72c90e674dedb3cf3e996db93f03f9b9010000000000a0fe64e796922029ef030962ab51daaa1728c6ec7b8a927d4bed5f687bb8c0b276edda1dca43e1738a2d0cc9a5dca46cd1a245998516b30ef3b1e8ca734ce51686c2852679dde6f1ccc7e2b9e79e0bbef9cd6f765c4aee84134ee8d8c6c21000000000000042d9b9a52448cafb4082d86a94b6ea058a31fb9ea264df52fb17da1e5e92ede28b2f2e78864ef89cdccba8c9024a48ce4a92b2a79e7a2ab8e9a69bf2ea301f8bae3cc714beeeabaeba2aef5272f27d49b2ed4f7ffa53e67271e6f1ccc7b9e4bb8e64dbc1071fdc51c6a5e400000000000010cace2d254152de0712c456a3b4552f508cd9f71425fb96dabfd0f62d5bb60463c68c090e39e490cc5936e63ee163895c9eeee4934f0e5e7bedb58eed3366cc080e3ae8a01df62bf4fc5c5d798e495ef7e8d1a333978093d795bbffdd77df1d1c70c001151d3f2c9333868e3df6d860e6cc991ddb366cd890590892338724cdcdcd9932000000000000d49fec3c521224e57d20416c354a5bf502c5987d4fa4a47edbaf01000000000000704576be2c0992f23e9020b61aa5ad7a8162ccbe275252bfedd700000000000000b8223b5f960449791f48105b8dd256bd403166df03000000000000c01299af3327f0622a29ef030962ab51daaa1728c6ec7b000000000000005822f375e6045e4c25e57d20416c354a5bf502c5987d0f000000000000004b64bece9cc08ba9a4bc0f2488ad4669ab5ea018b3ef010000000000006089ccd7991378319594f78104b1d5286dd50b1463f63d000000000000002c91f93a73022fa692f23e9020b61aa5ad7a8162ccbe070000000000008025325f674ee0c55452de0712c456a3b4552f508cd9f700000000000000b044e6ebcc09bc984acafb4082d86a94b6ea058a31fb1e0000000000000096c87c9d3981175349791f48105b8dd256bd403166df03000000000000c01299af3327f0622a29ef030962ab51daaa1728c6ec7b000000000000005822f375e6045e4c25e57d20416c354a5bf502c5987d0f000000000000004b64bece9cc08ba9a4bc0f2488ad4669ab5ea018b3ef010000000000006089ccd7991378319594f78104b1d5286dd50b1463f63d000000000000002c91f93a73022fa692f23e9020b61aa5ad7a8162ccbe07408e37df7c3358b87061d0dada1ab4b4b410b243a45dcc9b372f58b66c99d974000005d0af9252a15f0500a09dccd7991378319594f78104b1d5286dd50b1463f63d00b264f26aeedcb9c19a356b82ad5bb7061f7ef821213b44da85b48fd9b3673389050065d0af9272a15f0500a09dccd7991378319594f78104b1d5286dd50b1463f63d00b2e42f9a6572c29cb420c4ccead5ab83b6b636b309010072d0af92ce867e150050ef64bece9cc08ba9a4bc0f2488ad4669ab5ea018b3ef0190259733e12f9a496722ed442e810300288e7e957436f4ab00807a27f375e6045e4c25e57d20416c354a5bf502c5987d0f802c999030272a08291626b000a034fa555249e8570100f54ce6ebcc09bc984acafb4082d86a94b6ea058a31fb1e00598526b0f69fd27fa7631e9324234c6001406985fad542796fd3aa60f933b7062fcdba2613b92f65e67e24d9a15f0500d43399af3327f0622a29ef030962ab51daaa1728c6ec7b0064159ac092859d13ee38afe3f6ba8577964deefe2c0c25374c6001406985fa55335b36be1dbcf8d8d5c1f37fbc748748996c33f727c90dfd2a00a09ec97c9d3981175349791f48105b8dd256bd403166df0320abd004962cec840b3ee17d739fdce4ee17de37f721c908135800505aa17ed5cc5b2f3d94b7281466c54b0fe7ed4f921bfa5500403d93f93a73022fa692f23e9020b61aa5ad7a8162ccbe074056a109acdcc5a0728b43e6761686921d26b000a0b442fdaa99bfcefe69de825018d966ee4f921bfa5500403d93f93a73022fa692f23e9020b61aa5ad7a8162ccbe074056a1092c7321c85cfc2955cec250b2c30416009456a85f35f362cbf8bc05a130b2cddc9f2437f4ab00807a26f375e6045e4c25e57d20416c354a5bf502c5987d0f80ac421358e6628fc45c04321f9bfb99c724c908135800505aa17ed50c0b43240cfd2a00a09ec97c9d3981175349791f48105b8dd256bd403166df0320abd00456a9051fc9c0fbafe8b85f6c3ff398241961020b004a2bd4af9a7969d635790b4261649bb93f496ee8570100f54ce6ebcc09bc984acafb4082d86a94b6ea058a31fb1e00598526b0cc059fdcb3838add37f7358f49921126b000a0b442fdaa9957e6df98b7201446b699fb93e4867e150050cf64bece9cc08ba9a4bc0f2488ad4669ab5ea018b3ef0190556802abdc25e39e78e3b98efbe6761686921d26b000a0b442fdaa99f56fbf10bcf8f88ff21685a44cb699fb93e4867e150050cf64bece9cc08ba9a4bc0f2488ad4669ab5ea018b3ef0190556802abd419418552e82c22731f928c30810500a515ea570be5b567efc85b189232733f92ecd0af0200ea99ccd7991378319594f78104b1d5286dd50b1463f63d00b20a4d60c9c2ce09779cd7a945a130e18250f83c733b494698c00280d20af5ab79d9b62d7865c1aff21686a44cb6e5ed4f121bfa5500403d93f93a73022fa692f23e9020b61aa5ad7a8162ccbe074056a1092c59d8091779c2b3803a9370518885a1e486092c0028ad50bf9a9b2d1bdf0e96ce9f9cb7281446b6c93ee6f3483243bf0a00a867325f674ee0c55452de0712c456a3b4552f508cd9f700c82a3481152eeeec4ccc63926484092c0028ad50bf9ac9b66dc1aa57da82c58f5e99b7186446f6917d397b28f9a15f0500d43399af3327f0622a29ef030962ab51daaa1728c6ec7b0064159dc022a44098c00280d20af5abe5ce122a16ce1e4a7ee8570100f54ce6ebcc09bc984acafb4082d86a94b6ea058a31fb1e00598526b008291626b000a0b442fd6a67ce122a1679ae793c929cd0af0200ea99ccd7991378319594f78104b1d5286dd50b1463f63d00b20a4d6011522c4c6001406985fa5573b1a7d298c723c909fd2a00a09ec97c9d3981175349791f48105b8dd256bd403166df0320abd0041621c5c20416009446bf4a2a09fd2a00a09ec97c9d3981175349791f48105b8dd256bd403166df03208b092c524998c00280d2e8574925a15f0500d43399af3327f0622a29ef030962ab51daaa1728c6ec7b00643181452a09135800501afd2aa924f4ab00807a26f375e6045e4c25e57d20416c354a5bf502c5987d0f802c26b0482561020b004aa35f2595847e150050cf64bece9cc08ba9a4bc0f2488ad4669ab5ea018b3ef0190c50416a9244c60014069f4aba492d0af0200ea99ccd7991378319594f78104b1d5286dd50b1463f63d00b298c0229584092c00288d7e955412fa5500403d93f93a73022fa692f23e9020b61aa5ad7a8162ccbe0740161358a49230810500a5d1af924a42bf0a00a867325f674ee0c55452de0712c456a3b4552f508cd9f700c862028b541226b000a034fa555249e8570100f54ce6ebcc09bc984acafb4082d86a94b6ea058a31fb1e00594c60914ac20416009446bf4a2a09fd2afe1f7bf703245755267e7f6057f90f5288f807757f6e955b52bfaa9fca4a59546dd5caeefad6bb82d6af5cd664c649866126243b61369104432226922c98d52c067004223a3fdc4d56d80803c82012623104302f2ebbc39f97410346b338c18490e5c5b02b78de7e6efa0e3d4ff7edb9b7a7fb9e3ecffd7eaa9e9aee73efed3367faf49c7b9ed37d1b008a4cf2753a8117282bed8021be3aa5af7a81247aec015046028bc81224b000a03ec655224b30ae02008a4cf2753a8117282bed8021be3aa5af7a81247aec015046028bc81224b000a03ec655224b30ae02008a4cf2753a8117282bed8021be3aa5af7a81247aec015046028bc81224b000a03ec655224b30ae02008a4cf2753a8117282bed8021be3aa5af7a81247aec015046028bc81224b000a03ec655224b30ae02008a4cf2753a8117282bed8021be3aa5af7a81247aec015046028bc81224b000a03ec655224b30ae02008a4cf2753a8117282bed8021be3aa5af7a81247aec01ccbbf0c20bdddd77dfad8bab90c022b204092c004515fab8ba75eb56f7bef7bdcf1d79e4915112466f6f66c8e3b7ba8eaca17f277ddf5730ae02008aac3c1e5b60a51d30c457a7f4552f90448f3d807973e6cc8962a64456bb26b088f60c1258008aaad5e3eabffddbbfb9bffaabbf72a79e7aaa7bd39bdee4def6b6b7b93ffff33fafdaafd178f7bbdf1d255f1e7becb1aa6dcd0ea9474297fb0cfd3be9fbf522cbbe59837115005064e531d6022bed8021be3aa5af7a81247aec01cc8b13583325b21a4d6011c50c1258008aaa95e3ea238f3ce28e3beeb868f1e6073ff881dbbf7fbf7bf8e187dd5ffff55f57eddb68c8f9b0842e2f4acca6fdb33976a6605c05001459798cb5c04a3b6088af4ee9ab5e20891e7b00f374022b2991d548028b286e90c00250547a3c6de6b8fa677ff6675162e45ffee55faab6c5313939e93efbd9cfbab7bef5ad517475754565f17639be324e3bed34f79def7ca7e6360929dfb76f9febefef8ff63de9a493dc79e79de79e7df6d9a9c79405aa818101f7ae77bdcb1d71c411d31647ea6dabac63b6bfbbdee784134e70679f7db67bf0c107abb6e97a6b1d9f74ff965b6e71ef7ffffba34f6b556ed38f5deb316afd4e69837115005064e5b1d4022bed8021be3aa5af7a81247aec01ccd3892b1d7122ab91041651dc208105a0a8f438aa6336e3aa7c5a48ce572b174b74c8c28aec230b26c3c3c3d16d298bb7cb7d89ebaebbce3df4d043d1edb7bffded55db2b1ff3820b2e88ca6ebbedb6a963ce39e79ca9edd22629bbf4d24bdd7ffee77f4e3bb6de365dd76c7ff7ca78fcf1c7a3ed679c7146d5f1434343eed5575fad3aa6d6efa4efc797f093e770a66375d4fa9dd206e32a00a0c8ca63ac0556da01437c754a5ff50249f4d88302d2091ce2703492c0228a1bbaff10044110d3a3917135cdc2d029a79c12edf3d24b2fb903070e44b7e5d337f176b91f6f3f74e850d56286be2f21c7c7e5711c75d45153db65b144caf6eedd5bf5fbd4dba6eb9aedef7ecf3df7b833cf3c73eaef2471e49147561d7ff0e0c1aadf45ef9374ff9def7c6774ffbdef7daf5bba74e9b44f4ee97d2566fa9dd286ee3f0441b44700c847790cb5c04a3b6088af4ee9ab5e20891e7b5030926428da09be9edcc4d18c4bdeb453c8eb5b22e9be8e99b6cf2624d9f5810f7cc0ad5cb9b26a5bda68e5efd78ce09dcd008a4a8fa7cd1c57d35c4a2eede24adafb12f1e2ce9e3d7baaeaabdc5e6bf1a7de365dd76c7f77b95c9ddcdfb16347b4f8a3b7ebfbb542efa3effff8c73f769ffce427a72e25f7c10f7e30715f89997ea7b4c1b80ab49722ce1b019fcae3a70556da01437c754a5ff50249f4d883829124c4dcb97375b1693325ae628d24b0b286bc06e338fef8e3dd473ffad186aec35f2be2c74dbaaf63a6edb389eeee6e77c925975495678956fe7ecd081258008aaa95e3eac30f3fec8e3df658f7ee77bfdbdd7befbdeec5175f743b77ee8cea89f7497b39b6b4f725e2cbc12d59b2a4e6a76de2ed2b56aca8ba5c5cbd6dbaaed9feeef122d4d8d898dbb87163d5767dbf56e87df4fd38e4fc44cadff18e774c959d78e28951d973cf3d375536d3ef9436185781f652c47923e05379fcb4c04a3b6088af4ee9ab5e20891e7b5030726996a29de0cf94b88a3592c0ca1af21a9490db77dc7147745b3e59a3f76b4654d645343f48600128aa568fab8f3df698fbf4a73f1d2d38fcfeefff7ef4299b8f7dec6353dbe55c461653a45ca2abab6bdaa5e7f4f837d37d89fdfbf7bbc58b17bbd34f3f3dba0c9ade47b60f0c0c4497593be28823526fd38f33dbdf7dcb962dd1770ec5e57abbbe5f2bf43e49f7e51343728e22e72bf1b6abaeba6aea534ff13133fd4e69837115682f459c37023e95c74f0bacb40386f8ea94beea0592e8b10705b37bf7eec29de0cf94b88a359ac0ca12f21a9490db2fbffc7274fb98638e99dabe6fdf3ed7dfdfef4e3bed3477d24927b9f3ce3b6fdab5fde3e4935cb665a6e4537c5f42f63debacb3dccf7ef6b3aaedfabe2eaf0cbd8ffc9ef2aee7787b9cf092cbe2482425bce29077857fe8431f72ef79cf7bdc9bdffce6282177cb2db7a4fafd74dd95fb9c70c209eeecb3cf6edaa7b16a05092c0045d54ee32a6127185781f652c47923e053792e6b819576c0105f9dd257bd40123df6a0602626265c6767a72e86cb278125af4109b91d7f62e82ffff22fa7b65f70c10551d96db7dde61e7ae8a1e8f639e79c33b53dbe5ccda5975e3ae3e56ae2fb9597abf9d4a73e55b55ddf1f1a1a72afbefaeab4c7d6fb5c77dd7553bf9fbc4b38de9ef612395ffffad7a34b0355deffc94f7e12dd96775cd7fbfd92eaae8cc71f7f3cda7ec61967546d6b5690c00280faf21857093bc1b80ab417e68d40becaf35d0bacb40386f8ea94beea0592e8b10705333e3e1e7d8a03d5f24860c96bb032e43b142aafd32f9fb2d1fb1c75d45153dbb37cc1757cbff20bae4f3ef9e4aaedfa7eadef56d0fbc863ca17d2eac748fba5dab2fd37bff9cdd47dd957ff4efab167aafb9e7bee71679e79a63beeb8e3a6b6c9e580741b9a1524b000a0be3cc655c24e30ae02ed85792390aff21cd6022bed8021be3aa5af7a81247aec41c1c8a734babbbb75315c3e092c790d4ac8a77d2ebef8e2e876e52782e2859f3d7bf6541d5bb9bd950b43fa71d3d411df4fbb3094e67ebd6db5eecbe5f5e4fe8e1d3ba2c52dbdbdd941020b00eacb635c25ec04e32ad05e983702f92acf5f2db0d20e18e2ab53faaa1748a2c71e14ccd8d8989b3f7fbe2e86cb278125af4109b92d0b27f12784e4bb1aa42cbe54dc92254b6a7e7227debe62c58a862e25f7c94f7eb26a7bd2fd5aa1f7d1f7d35e4a2ecdfd7adb6add8f17cda48f6fdcb8b16a7bb383041600d497c7b8daecc83a766cddbad5bdef7def8b3ea19a347ecd1469f64fb34fe8c1b80ab417e68d40beca63bd0556da01437c754a5ff50249f4d88382d9b66d9bebe9e9d1c570f924b0e4352811dfbfe28a2ba2fb7ff2277f12dddfbf7fbf5bbc78b13bfdf4d3a7924c95fbcbf6818181e87b788e38e28869dbf4bef17d09d9f7231ff9887be69967aab627ddaf157a1f7d7f7272325a08924f0e49c8e527a42c69ff7af7eb6dab757fcb962dd1770ec5e57a7bb383041600d497c7b8daecc83a76c8256165ffc71e7bace1c7d0fbebfb4965d6827115682fcc1b817c95c77a0bacb40386f8ea94beea0592e8b10705333a3aea7a7b7b75315c98092cc25f90c00280fa421c57e55c5942972745d6fdd3442b1e3384605c05da0bf346205fe5f1df022bed8021be3aa5af7a81247aec41c18c8c8cb8bebe3e5d0c1766028bf01724b000a0be10c655f924ed59679d35f529dc38e2edfbf6ed73fdfdfdeeb4d34e73279d74923befbcf3dcb3cf3e1b6dabdcbff238fd187a1f792cb9e4aade5e6b5f5dfeab5ffdca1d7becb1ee0ffff00fddabafbe1a6d939f7239bbe38e3b6eea53baf1fe279c70823bfbecb3dd830f3e58d5f6760bc655a0bd306f04f2551ebb2db0d20e18e2ab53faaa1748a2c71e14ccadb7deea162c58a08be1c2486011ed1324b000a0be10c65559e891f3e3caefc69388b75f70c105d1fddb6ebbcd3df4d043d1ed73ce39676abbdebf56597cffbaebae9b7a0cb9f4a9de9e745f975d74d145d16d49dacafddb6fbf3dbabf70e1c269c7483cfef8e3d1b633ce38a36a5bbb05e32ad05e983702f92a8ff5165869070cf1d5297dd50b24d1630f0a66f3e6cd6ed1a245ba182e8c0416d13e41020b00ea0b615c7dcb5bde1225625e7ae92577e0c081aa4599b7bef5ad5365711c75d45153dbf5feb5cae2fb52c7a1438712b727ddd7654f3ef964f43d841ffff8c7a3fb7ff1177f11dd7feaa9a7a2fbf7dc738f3bf3cc33a34f10c5c7c9f6cac76bc7605c05da0bf346205fe531db022bed8021be3aa5af7a81247aec41c1c8bb6107060674315c18092ca27d82041600d417c2b83ad3c2d0a9a79e1adddfb3674fd5b1127aff5a65b3bd5fabec139ff84474f93bf9b490fc944f3ec5dbdef5ae7745fbeed8b1c31d3c78b0ead8760dc655a0bd306f04f2551eaf2db0d20e18e2ab53faaa1748a2c71e14cca64d9bdce0e0a02e860b238145b44f90c00280fa421857cf3df7dc2811937429b90b2fbc30babf64c9926891451faff7af5596f5fe89279e18dd7feeb9e712f791bfaddc3ffef8e3a39ff7dd77dfd4b678316b6c6ccc6ddcb8b1ead8760dc655a0bd306f04f2551eaf2db0d20e18e2ab53faaa1748a2c71e14ccd0d0905bba74a92e860b238145b44f90c00280fa421857272626dc1ffff11f479fba91f3e438e2edfbf7ef778b172f76a79f7e7a743936bd5ddfaf5596f5fe55575de54e39e59469e57a1f890f7ff8c35199fcac2cdfb2654bf41d46f131b58e6dc7605c05da0bf346205fe5f1da022bed8021be3aa5af7a81247aec41c15c73cd356ed9b265ba182e8c0416d13e41020b00ea635c25b204e32ad05e983702f9927c9d4ee005ca4a3b6088af4ee9ab5e20891e7b50301b366c702b56acd0c57024b0886c41020b00ea635c25b204e32ad05e983702f9927c9d4ee005ca4a3b6088af4ee9ab5e20891e7b5030ebd7af77ab56add2c57024b0886c41020b00ea635c25b204e32ad05e983702f9927c9d4ee005ca4a3b6088af4ee9ab5e20891e7b50306bd7ae756bd6acd1c57024b0886c41020b00ea635c25b204e32ad05e983702f9927c9d4ee005ca4a3b6088af4ee9ab5e20891e7b5030ab57af76ebd6add3c57024b0886c41020b00ea635c25b204e32ad05e983702f9927c9d4ee005ca4a3b6088af4ee9ab5e20891e7b5030723900b92c00aa91c022b204092c00a88f7195c8128cab407b61de08e44bf2753a8117282bed8021be3aa5af7a81247aec41c1c81788ca1789a21a092c224b90c00280fa1857892cc1b80ab417e68d40be245fa7137881b2d20e18e2ab53faaa1748a2c71e14ccf2e5cbddc68d1b75311c092c225b90c00280fa1857892cc1b80ab417e68d40be245fa7137881b2d20e18e2ab53faaa1748a2c71e14ccd2a54bddd0d0902e86238145640b125800501fe32a9125185781f6c2bc11c897e4eb74022f5056da01437c754a5ff50249f4d88382191c1c749b366dd2c57024b0886c41020b00ea635c25b204e32ad05e983702f9927c9d4ee005ca4a3b6088af4ee9ab5e20891e7b50300303036e78785817c391c022b205092c00a88f7195c8128cab407b61de08e44bf2753a8117282bed8021be3aa5af7a81247aec41c12c5cb8d06dd9b24517c391c022b205092c00a88f7195c8128cab407b61de08e44bf2753a8117282bed8021be3aa5af7a81247aec41c1f4f7f7bbad5bb7ea6238125844b620810500f531ae1259827115682fcc1b817c49be4e27f00265a51d30c457a7f4552f90448f3d2898bebe3e373232a28be1486011d982041600d4c7b84a6409c655a0bd306f04f225f93a9dc00b949576c0105f9dd257bd40123df6a0607a7b7bdde8e8a82e86238145640b125800501fe32a9125185781f6c2bc11c897e4eb74022f5056da01437c754a5ff50249f4d88382e9e9e971dbb76fd7c57024b0886c41020b00ea635c25b204e32ad05e983702f9927c9d4ee005ca4a3b6088af4ee9ab5e20891e7b5030f3e6cd733b76ecd0c57024b0886c41020b00ea635c25b204e32ad05e983702f9927c9d4ee005ca4a3b6088af4ee9ab5e20891e7b5030ddddddeed1471fd5c57024b0886c41020b00ea635c25b204e32ad05e983702f9927c9d4ee005ca4a3b6088af4ee9ab5e20891e7b50305d5d5d6e7c7c5c17c391c022b205092c00a88f7195c8128cab407b61de08e44bf2753a8117282bed8021be3aa5af7a81247aec41c1c809fec4c4842e86238145640b125800501fe32a9125185781f6c2bc11c897e4eb74022f5056da01437c754a5ff50249f4d88382e9ecec74bb77efd6c528d9b66d9b3b74e85055a2822074483f21810500f531ae1269837115683fcc1b817c49be4e27f00265a51d30c457a7f4552f90448f3d2898b973e7bac9c9495d8c92b1b131b777efdeaa640541e8d8b3678fbbfffefb7517020054605c25d206e32ad07e983702f9927c9d4ee005ca4a3b6088af4ee9ab5e20891e7b503072827fe0c0015d8c925dbb76b9eddbb7471320dee14cd40ae91792bcba617bd3220000800049444154efbefba2fe020048c6b84acc148cab40fb62de08e44bf2753a8117282bed8021be3aa5af7a81247aec41c1cc9933279a84a336494ac83b56e5722604512ba47f90bc02807418578999827115684fcc1b817c49be4e27f00265a51d30c457a7f4552f90448f3d281839c107000000002009f346205f92afd309bc405969070cf1d5297dd50b24d1630f0a44def1c5093e000000002009f346207f92afd309bc405969070cf1d5297dd50b24d1630f0a44ae112dd78a0600000000a016e68d40fe245fa7137881b2d20e18e2ab53faaa1748a2c71e14887cf93327f8000000008024cc1b81fc49be4e27f00265a51d30c457a7f4552f90448f3d2890ddbb7773820f0000000048c4bc11c89fe4eb74022f5056da01437c754a5ff50249f4d88302999898709d9d9dba18000000008008f346207f92afd309bc405969070cf1d5297dd50b24d1630f0a647c7cdc757575e962000000000022cc1b81fc49be4e27f00265a51d30c457a7f4552f90448f3d28909d3b77baeeee6e5d0c0000000040847923903fc9d7e9045ea0acb40386f8ea94beea0592e8b10705323636e6e6cf9faf8b010000000088306f04f227f93a9dc00b949576c0105f9dd257bd40123df6a040b66ddbe67a7a7a7431000000000011e68d40fe245fa7137881b2d20e18e2ab53faaa1748a2c71e14c8e8e8a8ebededd5c5000000000044983702f9937c9d4ee005ca4a3b6088af4ee9ab5e20891e7b5020232323aeafaf4f1703000000001061de08e44ff2753a8117282bed8021be3aa5af7a81247aec4181dc7aebad6ec18205ba18000000008008f346207f92afd309bc405969070cf1d5297dd50b24d1630f0a64f3e6cd6ed1a245ba18000000008008f346207f92afd309bc405969070cf1d5297dd50b24d1630f0a647878d80d0c0ce862000000000022cc1b81fc49be4e27f00265a51d30c457a7f4552f90448f3d28904d9b36b9c1c1415d0c0000000040847923903fc9d7e9045ea0acb40386f8ea94beea0592e8b10705323434e4962e5daa8b010000000088306f04f227f93a9dc00b949576c0105f9dd257bd40123df6a040aeb9e61ab76cd9325d0c0000000040847923903fc9d7e9045ea0acb40386f8ea94beea0592e8b10705b261c306b762c50a5d0c0000000040847923903fc9d7e9045ea0acb40386f8ea94beea0592e8b10705b27efd7ab76ad52a5d0c0000000040847923903fc9d7e9045ea0acb40386f8ea94beea0592e8b10705b276ed5ab766cd1a5d0c0000000040847923903fc9d7e9045ea0acb40386f8ea94beea0592e8b10705b27af56ab76edd3a5d0c0000000040847923903fc9d7e9045ea0acb40386f8ea94beea0592e8b1070522970390cb020000000000500bf346207f92afd309bc405969070cf1d5297dd50b24d1630f0a44be4054be481400000000805a983702f9937c9d4ee005ca4a3b6088af4ee9ab5e20891e7b5020cb972f771b376ed4c5000000000044983702f9937c9d4ee005ca4a3b6088af4ee9ab5e20891e7b50204b972e75434343ba18000000008008f346207f92afd309bc405969070cf1d5297dd50b24d1630f0a647070d06ddab4491703000000001061de08e44ff2753a8117282bed8021be3aa5af7a81247aec41810c0c0cb8e1e1615d0c0000000040847923903fc9d7e9045ea0acb40386f8ea94beea0592e8b10705b270e142b765cb165d0c0000000040847923903fc9d7e9045ea0acb40386f8ea94beea0592e8b10705d2dfdfefb66eddaa8b010000000088306f04f227f93a9dc00b949576c0105f9dd257bd40123df6a040fafafadcc8c8882e060000000020c2bc11c89fe4eb74022f5056da01437c754a5ff50249f4d88302e9eded75a3a3a3ba18000000008008f346207f92afd309bc405969070cf1d5297dd50b24d1630f0aa4a7a7c76ddfbe5d1703000000001061de08e44ff2753a8117282bed8021be3aa5af7a81247aec4181cc9b37cfedd8b1431703000000001061de08e44ff2753a8117282bed8021be3aa5af7a81247aec4181747777bb471f7d541703000000001061de08e44ff2753a8117282bed8021be3aa5af7a81247aec4181747575b9f1f1715d0c0000000040847923903fc9d7e9045ea0acb40386f8ea94beea0592e8b107052227f8131313ba18000000008008f346207f92afd309bc405969070cf1d5297dd50b24d1630f0aa4b3b3d3eddebd5b1703000000001061de08e44ff2753a8117282bed8021be3aa5af7a81247aec4181cc9d3bd74d4e4eea62000000000022cc1b81fc49be4e27f00265a51d30c457a7f4552f90448f3d281039c13f70e0802e060000000020c2bc11c89fe4eb74022f5056da01437c754a5ff50249f4d883029933678e3b74e8902e060000000020c2bc11c89fe4eb74022f5056da01437c754a5ff50249f4d8830291137c000000000092306f04f227f93a9dc00b949576c0105f9dd257bd40123df6a020e41d5f9ce0030000000092306f04fc907c9d4ee005ca4a3b6088af4ee9ab5e20891e7b5010728d68b956340000000000b5306f04fc907c9d4ee005ca4a3b6088af4ee9ab5e20891e7b50109393939ce0030000000012316f04fc907c9d4ee005ca4a3b6088af4ee9ab5e20891e7b5010bb77efe6041f0000000090887923e087e4eb74022f5056da01437c754a5ff50249f4d88382989898709d9d9dba18000000008008f346c00fc9d7e9045ea0acb40386f8ea94beea0592e8b10705313e3eeebababa7431000000000011e68d801f92afd309bc405969070cf1d5297dd50b24d1630f0a62e7ce9daebbbb5b1703000000001061de08f821f93a9dc00b949576c0105f9dd257bd40123df6a020c6c6c6dcfcf9f37531000000000011e68d801f92afd309bc405969070cf1d5297dd50b24d1630f0a62dbb66daea7a7471703000000001061de08f821f93a9dc00b949576c0105f9dd257bd40123df6a0204647475d6f6faf2e060000000020c2bc11f043f2753a8117282bed8021be3aa5af7a81247aec41418c8c8cb8bebe3e5d0c0000000040847923e087e4eb74022f5056da01437c754a5ff50249f4d88382b8f5d65bdd82050b7431000000000011e68d801f92afd309bc405969070cf1d5297dd50b24d1630f0a62f3e6cd6ed1a245ba18000000008008f346c00fc9d7e9045ea0acb40386f8ea94beea0592e8b10705313c3cec0606067431000000000011e68d801f92afd309bc405969070cf1d5297dd50b24d1630f0a62d3a64d6e7070501703000000001061de08f821f93a9dc00b949576c0105f9dd257bd40123df6a020868686dcd2a54b7531000000000011e68d801f92afd309bc405969070cf1d5297dd50b24d1630f0ae29a6bae71cb962dd3c50000000000449837027e48be4e27f00265a51d30c457a7f4552f90448f3d28880d1b36b8152b56e862000000000022cc1b013f245fa7137881b2d20e18e2ab53faaa1748a2c71e14c4faf5ebddaa55ab7431000000000011e68d801f92afd309bc405969070cf1d5297dd50b24d1630f0a62eddab56ecd9a35ba18000000008008f346c00fc9d7e9045ea0acb40386f8ea94beea0592e8b10705b17af56ab76edd3a5d0c0000000040847923e087e4eb74022f5056da01437c754a5ff50249f4d8838290cb01c865010000000000a8857923e087e4eb74022f5056da01437c754a5ff50249f4d88382902f10952f120500000000a016e68d801f92afd309bc405969070cf1d5297dd50b24d1630f0a62f9f2e56ee3c68dba18000000008008f346c00fc9d7e9045ea0acb40386f8ea94beea0592e8b10705b174e952373434a48b010000000088306f04fc907c9d4ee005ca4a3b6088af4ee9ab5e20891e7b50108383836ed3a64dba18000000008008f346c00fc9d7e9045ea0acb40386f8ea94beea0592e8b10705313030e08687877531000000000011e68d801f92afd309bc405969070cf1d5297dd50b24d1630f0a62e1c2856ecb962dba18000000008008f346c00fc9d7e9045ea0acb40386f8ea94beea0592e8b10705d1dfdfefb66eddaa8b010000000088306f04fc907c9d4ee005ca4a3b6088af4ee9ab5e20891e7b50107d7d7d6e6464441703000000001061de08f821f93a9dc00b949576c0105f9dd257bd40123df6a0207a7b7bdde8e8a82e060000000020c2bc11f043f2753a8117282bed8021be3aa5af7a81247aec4141f4f4f4b8eddbb7eb62000000000022cc1b013f245fa7137881b2d20e18e2ab53faaa1748a2c71e14c4bc79f3dc8e1d3b7431000000000011e68d801f92afd309bc405969070cf1d5297dd50b24d1630f0aa2bbbbdb3dfae8a3ba18000000008008f346c00fc9d7e9045ea0acb40386f8ea94beea0592e8b10705d1d5d5e5c6c7c77531000000000011e68d801f92afd309bc405969070cf1d5297dd50b24d1630f0a424ef02726267431000000000011e68d801f92afd309bc405969070cf1d5297dd50b24d1630f0aa2b3b3d3eddebd5b1703000000001061de08f821f93a9dc00b949576c0105f9dd257bd40123df6a020e6ce9deb2627277531000000000011e68d801f92afd309bc405969070cf1d5297dd50b24d1630f0a424ef00f1c38a08b010000000088306f04fc907c9d4ee005ca4a3b6088af4ee9ab5e20891e7b501073e6cc71870e1dd2c50000000000449837027e48be4e27f00265a51d30c457a7f4552f90448f3d280839c107000000002009f346c00fc9d7e9045ea0acb40386f8ea94beea0592e8b1070520eff8e2041f0000000090847923e08fe4eb74022f5056da01437c754a5ff50249f4d88302906b44cbb5a20100000000a8857923e08fe4eb74022f5056da01437c754a5ff50249f4d88302989c9ce4041f0000000090887923e08fe4eb74022f5056da01437c754a5ff50249f4d88302d8bd7b3727f8000000008044cc1b017f245fa7137881b2d20e18e2ab53faaa1748a2c71e14c0c4c484ebececd4c5000000000044983702fe48be4e27f00265a51d30c457a7f4552f90448f3d2880f1f171d7d5d5a58b010000000088306f04fc917c9d4ee005ca4a3b6088af4ee9ab5e20891e7b50003b77ee74ddddddba18000000008008f346c01fc9d7e9045ea0acb40386f8ea94beea0592e8b10705303636e6e6cf9faf8b010000000088306f04fc917c9d4ee005ca4a3b6088af4ee9ab5e20891e7b5000dbb66d733d3d3dba18000000008008f346c01fc9d7e9045ea0acb40386f8ea94beea0592e8b10705303a3aea7a7b7b7531000000000011e68d803f92afd309bc405969070cf1d529d3d6db598ae73b0eef5f1940b3e9b10705303232e2fafafa7431000000000011e68d803f92afd309bc405969070cf1d529d3d63bd951bd2894f658200b3df6a0006ebdf556b760c1025d0c0000000040847923e08fe4eb74022f5056da01437c75cab4f5ca7e6796e248bd0168323df6a000366fdeec162d5aa48b010000000088306f04fc917c9d4ee005ca4a3b6088af4e99b65ed9afbf14c7e80d4093e9b10705303c3cec0606067431000000000011e68d803f92afd309bc405969070cf1d529d3d61bff03d001349b1e7b50009b366d72838383ba18000000008008f346c01fc9d7e9045ea0acb40386f8ea9469ebd50b4296fe21a0bde8b10705303434e4962e5daa8b010000000088306f04fc917c9d4ee005ca4a3b6088af4ee9ab5e20891e7b5000d75c738d5bb66c992e060000000020c2bc11f047f2753a8117282bed8021be3aa5af7a81247aec41016cd8b0c1ad58b1421703000000001061de08f823f93a9dc00b949576c0105f9d326dbd2797e2ff94e2d7e590db5206349b1e7b5000ebd7af77ab56add2c5000000000044983702fe48be4e27f00265a51d30c457a7ac57ef1515b76fee38bc6f654819d06c7aec4101ac5dbbd6ad59b3461703000000001061de08f823f93a9dc00b949576c0105f9db25ebd4f96e2cbe5dbfb4ad1558a63cb21b7e5934340b3e9b10705b07af56ab76edd3a5d0c0000000040847923e08fe4eb74022f5056da01437c75ca7af5ca02d070f9b62c0ccd29c531e590db2c0ca115f4d8830290cb01c865010000000000a8857923e08fe4eb74022f5056da01437c75cab4f5ca770ac5ff04e29032a0d9f4d88302902f10952f120500000000a016e68d803f92afd309bc405969070cf1d529d3d67b72c7e18520f9e49084dc9632a0d9f4d8830258be7cb9dbb871a32e060000000020c2bc11f047f2753a8117282bed8021be3aa5af7a81247aec41012c5dbad40d0d0de962000000000022cc1b017f245fa7137881b2d20e18e2ab53faaa1748a2c71e14c0e0e0a0dbb469932e060000000020c2bc11f047f2753a8117282bed8021be3a65bd7a2b5ff4f16d1d40b3e9b10705303030e08687877531000000000011e68d803f92afd309bc405969070cf1d529ebd5cbc2107cd0630f0a60e1c2856ecb962dba18000000008008f346c01fc9d7e9045ea0acb40386f8ea94beea0592e8b10705d0dfdfefb66eddaa8b010000000088306f04fc917c9d4ee005ca4a3b6088af4ee9ab5e20891e7b50007d7d7d6e6464441703000000001061de08f823f93a9dc00b949576c0105f9d326dbdb5f6ab5506cc961e7b5000bdbdbd6e7474541703000000001061de08f823f93a9dc00b949576c0105f9d326dbdbf2bc55115f7e5b69401cda6c71e14404f4f8fdbbe7dbb2e060000000020c2bc11f047f2753a8117282bed8021be3a65da7af794625d29de528e2b4bf1cb697b00cda1c71e14c0bc79f3dc8e1d3b7431000000000011e68d803f92afd309bc405969070cf1d529d3d6bbb1e3f0be95216540b3e9b10705d0dddded1e7df4515d0c0000000040847923e08fe4eb74022f5056da01437c75cab4f51e5f8a1b4bf14239e4b69401cda6c71e14405757971b1f1fd7c5000000000044983702fe48be4e27f00265a51d30c457a7f4552f90448f3d280039c19f9898d0c5000000000044983702fe48be4e27f00265a51d30c457a7f4552f90448f3d2880cece4eb77bf76e5d0c0000000040847923e08fe4eb74022f5056da01437c75cab4f57eb4144f96e2f58ec3c758fa8780f6a2c71e14c0dcb973dde4e4a42e060000000020c2bc11f047f2753a8117282bed8021be3a65da7a1fea98be2064e91f02da8b1e7b500072827fe0c0015d0c0000000040847923e08fe4eb74022f5056da01437c75cab4f5be5c8a3fea38bcffd1a5585cbe0d349b1e7b500073e6cc71870e1dd2c5000000000044983702fe48be4e27f00265a51d30c457a74c5b6fbcdf2ba538b3141fae28039a498f3d280039c107000000002009f346c01fc9d7e9045ea0acb40386f8ea9469eb8df7fbd7f26d89e7dfd80c348d1e7b609cbce38b137c000000004012e68d805f92afd309bc405969070cf1d529b3d6fbf152fcb2147b4bf169b50d68063df6c038b946b45c2b1a00000000805a9837027e49be4e27f00265a51d30c457a7f4552f90448f3d306e727292137c000000004022e68d805f92afd309bc405969070cf1d529d3d62bfb1da10b8116d0630f8cdbbd7b3727f8000000008044cc1b01bf245fa7137881b2d20e18e2ab53a6ad57f6eb2bc5d17a03d0647aec8171131313aeb3b3531703000000001061de08f825f93a9dc00b949576c0105f9d326dbdf13f001d40b3e9b107c68d8f8fbbaeae2e5d0c0000000040847923e097e4eb74022f5056da01437c75cab4f5ea05214bff10d05ef4d803e376eedce9babbbb7531000000000011e68d805f92afd309bc405969070cf1d5297dd50b24d1630f8c1b1b1b73f3e7cfd7c50000000000449837027e49be4e27f00265a51d30c457a74c5b6fadfd6a9501b3a5c71e18b76ddb36d7d3d3a38b010000000088306f04fc927c9d4ee005ca4a3b6088af4e99b65ebddfe935ca8066d0630f8c1b1d1d75bdbdbdba18000000008008f346c02fc9d7e9045ea0acb40386f8ea9433d51bbff06bc5af2bf6039a458f3d306e6464c4f5f5f5e962000000000022cc1b01bf245fa7137881b2d20e18e2ab53ce54af5e0c8ae360293e57b11fd02c7aec8171b7de7aab5bb060812e060000000020c2bc11f04bf2753a8117282bed8021be3a65da7ad3ee07cc961e7b60dce6cd9bdda2458b7431000000000011e68d805f92afd309bc405969070cf1d5297dd50b24d1630f8c1b1e1e76030303ba18000000008008f346c02fc9d7e9045ea0acb40386a4ed949da578bee3f0fe95d1a8b4c7c6fbbda7148f95624f29feaf3736034da3c71e18b769d326373838a88b010000000088306f04fc927c9d4ee005ca4a3b6048da4e39d951bd2894f6d85ad21e1befb7a17c5be2f13736034da3c71e18373434e4962e5daa8b010000000088306f04fc927c9d4ee005ca4a3b6048da4e29fb9d598a23f58606a5adf7bf4bf167a5f87929feab146795cb8066d3630f8cbbe69a6bdcb265cb7431000000000011e68d805f92afd309bc405969070c49db2965bffe521ca33734286dbd4f771c5e0892fdbf572e4b7b2c90851e7b60dc860d1bdc8a152b7431000000000011e68d805f92afd309bc405969070c49db29e317a28e46a53df67f97626fc7e1ef16fa50b92cedb140167aec8171ebd7af77ab56add2c50000000000449837027e49be4e27f00265a51d30246da7d40b42b37d61cee658a015f4d803e3d6ae5debd6ac59a38b010000000088306f04fc927c9d4ee005ca4a3b6088af4ee9ab5e20891e7b60dcead5abddba75eb7431000000000011e68d805f92afd309bc405969070cf1d529ebd55bf9a2affc74526500cda6c71e1827970390cb020000000000500bf346c02fc9d7e9045ea0acb40386a4ed942797e2ff94e2d7e590db52d6a87af5b230041ff4d803e3e40b44e58b440100000000a8857923e097e4eb74022f5056da0143ea75ca2b2a6edfdc51bd3823658daa572fe0831e7b60dcf2e5cbddc68d1b7531000000000011e68d805f92afd309bc405969070ca9d7299f2cc597cbb7f795a2ab14c796436ecb27871a55af5ec0073df6c0b8a54b97baa1a1215d0c0000000040847923e097e4eb74022f5056da0143ea754a59001a2edf9685a139a538a61c723b8f85a1ce523cdf51fd6925a0d9f4d803e3060707dda64d9b743112fce217bf700f3ffcb0dbb66d9bfbe10f7f4810d342fac5d8d898dbb56b97ee3a00000040b09837027e49be4e27f00265a51d30246da794ef14d28b3352d6a8b4f54e7654d79bf658200b3df6c0b8818101373c3cac8b51832c0a3df0c0036eefdebdeed0a143eebffeebbf08625a48bf90feb17dfb7616870000006006f346c02fc9d7e9045ea0acb40386a4ed9427771c5e08924f0e49c86d296b54da7a65bf334b71a4de0034991e7b60dcc2850bdd962d5b74316a904f0a49d25f2f0610848ec9c94977fffdf7eb2e0400000004897923e097e4eb74022f5056da01437c75cab4f5ca7efd1d872f5f07b4921e7b605c7f7fbfdbba75ab2e460d7299303e2944a409e927726939000000c002e68d805f92afd309bc405969070cf1d529d3d61bff03d001349b1e7b605c5f5f9f1b1919d1c5a84112fd7a0180209282852100000084482ea1fdf4d34f479f828f316f04fc927c9d4ee005ca4a3b6048bd4e59f9e2d30b33b37d61a63d56d737db7a81247aec8171bdbdbd6e74745417a386b40b43ffdf4bbf72cffe3fdf764fde774514725bcaf47e84ed606108000000215abf7ebd9b33674ecd983b77aeebeaea72dddddd6efffefdfa50002d22f93a9dc00b949576c0907a9db2f2c5a7176666fbc29ccdb1402be8b107c6f5f4f4b8eddbb7eb62d4906661e8e503ffe19ef8c1e5eedfbfbf7c5a48996cd3fb13768385210000008448167cf482908ed5ab57ebc300b490e4eb74022f5056da01437c754a5ff50249f4d803e3e6cd9be776ecd8a18b51439a85a15f3e7947d5a2501c7b9ebcb36a7fc26eb03004000080505d7ef9e5558b4195c1a785807c49be4e27f00265a51d30c457a7ac576fe58bbef2d3499501349b1e7b609c5c02e0d1471fd5c5a821cdc2d0ffbb7d7dd582501cb24def4fd80d168600000010aa3d7bf6542d06c5f195af7c45ef0ea0c5245fa7137881b2d20e1892b653d6daaf56595af58e6561083ee8b107c6c9f5a1c7c7c775316a48b330f4c40fd7542d08c521dbf4fe84dd606108000000215bb66c59d5a2506767a77be59557f4ae005a4cf2753a8117282bed8021693be5ef4a7154c57db92d658d4a5b2f90173df6c03859189a9898d0c5a8818521224bb03004000080903df5d453550b434343437a370039907c9d4ee005ca4a3b6048da4eb9a714eb4af196725c598a5f4edb239bb4f5fe5529fea3834f0ca1f5f4d803e3e41d5fbb77efd6c5a821cdc2d093f75d51b52014876cd3fb1376838521000000846e7070706a5148de54f8dbdffe56ef02200792afd309bc405969070c49db293776542fce4859a3d2d62b8b4fbadeb4c70259e8b107c6cd9d3bd74d4e4eea62d4906661e8a73baeab5a108a43b6e9fd09bbc1c21000000042b773e7cea985a11b6fbc516f069013c9d7e9045ea0acb40386a4ed94c797e2c652bc500eb92d658d4a5bef7f97e27fea42a005f4d803e36461e8c08103ba1835a45918daff1fe3ee897b57572d0a49996cd3fb137683852100000058b060c182686168fffefd7a13809c48be4e27f00265a51d30c457a74c5baf7c62a8af14c7ea0d4093e9b107c6c909fea1438774316a48b33024f1dca337572d0c4999de8fb01d2c0c010000c0827befbdd79d7ffef9cc1b018f245fa7137881b2d20e18e2ab53a6adf7b18ec3fbea009a4d8f3d306ce3c68dee339ff94cf413334bb530f4eaabeea70f7da36a6148ca645bd5fe84d960610800000016c87cf1e8a38f66de087824f93a9dc00b949576c090b49df2a3a578b214af7734678126edb1af76542f0aa53d16c8428f3d304a4eea8f3cf24877eeb9e7463f39c99fd94c0b432f1ff80ff7cc8e6bab1685e2906db28f3e8eb0192c0c0100002074cc1b81f620f93a9dc00b949576c090b49df2a18eeac599b4c7d692f658d9ef7f95e2f7f406a0c9f4d80383e293fbf8a45edf476d890b43afbeea7ef5d3fbdde3f7acac5a0cd221fbc8be7c7ac87eb0300400008090e979a2be0f203f92afd309bc405969070c49db295f2ec51f751cdeffe8522c2edf6e54da6365bffe521ca337004da6c71e189374329f548e37d45a189ae9534249c1a787ec070b430000000855d2fc30a91c406b49be4e27f00265a51d30246da78cf77ba5146796e2c315658d487b6cfc0f4007d06c7aec8121339dc4cfb4bde86a2d0ca5f9945052c8b1faf1083bc1c2100000004234d3bc70a6ed009a4ff2753a8117282bed8021693b65bcdfbf966f4b3cffc6e6ccb2d45b2b8066d3630f8c487bf29e76bf22aab530a4177bb2867e3cc24eb03004000080d0a49d0fa6dd0f407348be4e27f00265a51d30246ba7fc78297e598abda5f8b4da9645d67a8156d3630f0cc87ad29e75ffa2a8b530441049c1c2100000004292751e98757fb48f5dbb76b96bafbdd65d74d145aea7a7c7757676ba3973e6443fe5be94cb76d90fed41f2753a8117282bed8021be3aa5af7a81247aecf1e6e73fffb9fbee77bfebbef4a52fb9cf7ffef36ed1a245d189cac2850bddb265cbdcca952bdd37bff94d4e5466d0e8c97aa3c759c6c2109125581802000040281a9dff357a1cfcb8ebaebb5c6f6f6f945b491bb2bf1c07bf245fa7137881b2d20e1892b653d6daaf56595af58e8d5ff4f50268363df6e46e6c6ccc5d7ef9e5aeafafcf0d0d0db9471e79245afcd9bf7f7fb45d7eca7d2997ed175e78a15bb26489fbfef7bfaf1e09b33d499fedf1d6b03044640916860000001082d9cefb667b3c5aef89279e70fdfdfd558b3e59428e97c7811f92afd309bc405969070c49db29f57ea7d728cba2deb17a11a85600cda6c79edc3cf3cc336eeddab5d122cfc30f3fec5e7ffd75bd4b4db29fec3f3838181dcb89ca61694ecee5f98e23499ac7290a1686882cc1c210000000da5d9af91ef3c6b08d8c8c4c5d2a2e8eeeee6e77d55557b96ddbb6d57c23ae94cb76d9aff2b8b973e7468f87fc955f83165869070c99a953ea0599caf875c57e59cd546f4cf6eb2ac5b1e590db698f05b2d0634f2e1e78e081e81ab677df7db77bedb5d7f4e654e438395eae875bf41395b427e5f27cc7514fdac7b38e8521224bb030040000807696769ec7bc315cd75f7f7db498132fec747575b94d9b36b903070ee85d6b92fd647f39ae7281481e17f92abf062db0d20e183253a79c361056c4c1527cae62bfac66aa37f6bb52cc29c531e590db5206349b1e7b5a4e1671e4fb839e7efa69bda921f2387219baa29ea864391997e73b8e9964795cab581822b2040b43000000685759e677cc1bc324b996ca45a1c58b17bbe79e7b4eef968a1c27c7572e0e15fd0db9792bbf062db0d20e1892b653a6dd2fadb48fb7b363fa8294c423d3f6009a438f3d2d259f145ab870a1dbbb77afde342bf278175c7041e14e54b29e84cbf31d471a591fdf1a1686882cc1c210000000da51d6791df3c6f08c8f8f4fbb7cdcaa55abdcc18307f56e99c8f1f238959795937a908ff26bd0022bed8021be3a65da7aff4729464a71a01cb797e20f2a77009a448f3d2d333131112d0a35eb93429a3ceebc79f30a73a2d2c8c9b73cdf71a4d5483d56b0304464091686000000d06e1a99cf316f0ccf82050ba67d5268b68b4231799cca4f0e493dc847f93568819576c0907a9db2f2c5376d4054db1a319b638156d0634fcbac5bb72efa4ea056bae38e3ba2ef2eb2aed1936e79bee3c8a2d1fa42c7c21091255818020000403b69741ec7bc312c77dd75d7d4c28d7c3750a3978f4b228f57f99d43521f5aaffc1ab4c04a3b6048bd4e59f9e29b3620aa6d8d68e4d8f794e2f3a518d71b8026d0634f4b8c8d8db9254b96b8d75e7b4d6f6a2a79fcfefe7ed3272ab339d996e73b8eac66536fa8581822b2040b4300000068a6575e79c50d0c0cb89d3b77ea4d339acdfc8d79637bf8ed6f7fab8b6a92cbeac78b369b366dd29b9b421e37ae43ea43eb955f83165869070cf1d529d3d67b4a291696e28152fcae63f60b5240123df6b4c417bef005f7f0c30febe29678f0c10783385179e18517dc9a356bdc9e3d7bf4a644b33dc996e73b8e46ccb6fed0b0304464091686000000d04c870e1d9a4ac62f5ab428f59c7ab6f336e68ded412e957fe38d37d65d20dab56bd7541fe9eeee76070e1cd0bb34853cae3c7e5c97d48bd62abf062db0d20e18e2ab53ce54efdc52dc598affee38bcefcbe59f9b4bf1898afd8066d1634fd3fdfce73f8f3ec5f3faebafeb4d2d21f57cf6b39f6dfb1395c9c9c9e8844abec071c58a1533febecd38b996e73b8e4635e3f7f0eda73ffda92eaa898521224bb03004000080669273cc38111f875c3afd473ffa91de754a33e66bcc1bdb83e40ae43997fcc6b7bffded9a3915f9fbc67de3cb5ffeb2dedc54f2f8715d3cafad577e0d5a60a51d30246da7acb55fadb2b4663a56b6ffb614a3a5e82ac5b1e532a055f4d8d374fffccfffec86868674714bc9f719b5fb89cafefdfbab4ef2e5727bfffeefffae776dda49b53cdf71cc46b37e1f5fe4c47a7070d04d4c4ce84dd3b0304464091686000000d04cf249113d678c43de7c79df7df74ddbbf59f334e68ded215e188a433eb1b365cb9669fbc827c9e2edba3f349b3c7e5c97d48bd62abf062db0d20e1892b653ca65dc8eaab82fb7a5ac5133d51b2f0cdd5d8ace0e1686d07a7aec693a59a449fb91f766b9fffefbdbfe4445ae17ad4feee390eb48c77fb33427d3f23cb62a92a4f9bdda55676767f47796136db9cca15cd6af161686882cc1c2100000009a493e21a2e78a3afafafadce8e868aaf9999eeb353392a4f9bd509b7eaee3983f7fbefbdef7be17ed23b7e3f2679f7d563d4273c9e357fe0e68adf26bcb022bed8021693be59e52ac2bc55bca7165297e396d8f6c66aa572e25775747f5a5e4fea914ff77c57e40b3e8b1a7e92ebdf4d2969fa068cf3cf34cdb9fa8d47bf7571c3d3d3deef77eeff7dcb9e79eab0f9f469ec756453d9ff8c427a293fc5ffffad77a535bd3efbc92fb7ffff77f1f2dd655626188c8122c0c0100803cc862417cfe21e7af2fbffcb23b78f0607445827dfbf6456f7a92cb56cb7799fee217bf70bb77ef76cf3df75c74e96af9c4fcd34f3fed9e7aea29373e3e1e5dade0b1c71e733ff9c94fdca38f3eea76eedc19bd416dc78e1dd177b7ca25cbb66fdfeeb66ddbe6eebdf7de286411e2eebbef7677dd75971b191971b7df7e7b94a4deba75abbbe5965bdc77bffbdde8530d9b376f76fff44fffe46ebef966373c3c1c5d0aeb9bdffc66f425f6f2bd2937dc7083bbfefaeba3ab4b5c77dd75eeda6baf75d75c738dbbfaeaabdd3ffcc33fb80d1b36b8af7ce52b51c825acaebaea2a77e59557466f3c5cbb76adbbe28a2bdc97bef425b77af56af7c52f7ed15d7ef9e5d19bbe2456ae5ce92ebbecb2e892dd321f5dbe7c7914cb962d73975c72895bba746974b50689bffddbbf75175f7c71148b172f8edea427216f349458b8706174f9b6050b1644210b31715c78e18551f4f6f646df732b217338998bc621df1323219ff69090ab17487475754d85bc712dfe1987cc51f4bc2529ce3fff7c77f4d147b7edbc517e2ffd3b57cec5e288db5ef9b791bf55fcb793bfa3fc4de56f2c7f6bf9bbcbdf5f9e0bf904953c3ff25cc973f6377ff337d1f328cfa93cb772c50879bee5b9973e20fd41fa86f411e92fd26fa41fc9f7004bbf92fe257d4dfa9cf43fe987d227a57f4a3f953e2b7df71bdff846d49fa56f4b1f97fefe8ffff88fd16b405e0ff2ba90d7c89d77de19bd6ee4f523af23794dc9eb6b6c6c2c7acdc96b4f5e87f29a7ce28927a2d7a9fe5be990bf41651f79f1c517f59fbea9e4f1e3bae479426b955f5b165869070c49db293776540f7852d6a8b4f59e528a45a578b0e3f027942cfd43407bd1634fd3c94959ab4f50349914c9898a4c9664922413a4e79f7f3e9a14c964484eb4640224275f722226931d393993c98d9cb4dd7aebadd1899c9cd47deb5bdf8a4ef4e4a44fdee524931439299413449990c889a39c40cac9e4e73ffff9e804534e36e309869c8ccadf209e44c889ab9cc055beb3a75e9c73ce39d1497ebd7758c9f3d8aa482227c49ff9cc67a2884fe2e39376699b9ca4cbc9b94ca6e4245cfe2672e2bd6ad5aae8445b2676f2b794bfab9c44cbc9b39c34cbc9b23c1f8f3cf24834599509ac4c6c65c25beb9aca8d489a60491b64a21ad7c3c2109125581802003413c9ff6225ff2bcf4f936ed70abd6fe563e9647bad847b655426dfe39076c611b73d4ec65726e4e38893f212f1df36fe5bcbdf5de60512f27cc4cf4d9ca897e74d429e4b9957c509fb38692f21cfbfccbf74f23e4ee04bff8993f85ffdea57a712f95ffbdad7a2f994f4bf38a12ffd52faa7f4d39b6eba299af7c5897d09e9d7d2bfe304bfcc11e324bfbc2624e4f55199ec974b6dc509ff071e78209a6bcaeb2c4efccbeb4f5e87f27a94d7a6cc4be5752aaf590979fdcaeb585ecff2da9639ac7ecee390e7445e93f28643f97f91e693397aaed7cc4852f97bc5ffd7e47f5afcff4cfe97493be5ff98b45dbe0f56fe7fc9df26fedf257f37991fcadf52feaef2ff4afed63ff8c10fa2bfbf2cbac8f312ff7f92e74ce697f23cca732acfadfc4f92e73bfe5f24bf8ff48df87f90f49bf87f4ffc7f279eebc7ff6fe2ff3595ff63e2b9bff4ebf87f8b2c4a55fe4f91d746fcbf24fe3f12bfaee2ff1fb5fe6fe8e77ca690bed04a956f6e95ff2d68adf26bcb022bed8021693be5f1a5b8b1142f94436e4b59a3d2d65be9bda5b8ac148feb0d4013e8b1a7e9e404a7d527289a3e61a90cfdcea3ca771cc9895afc4e23399193933a993cca899e9cf0c944532629725218bf9b4826ac720229279332b995134c39d99409869c80cac9a89c98ca44424e5665f2209306992ce813b938e22f979404809c38a739c94f439eef386623fe7de4445a4eea252921931899dcc88447da26932399a8c809b92407e46f22fbaf5fbf3e3ad196936b39a996bfab9c44cbc9b3fcdde53990e7233e318e27cc957f9f7882dbe84294fe7beb90c794e78b8521224bb03004a01124ff49feebdbb542ef5bf958f16d92ff6127ffe5752eaf7979ed4bc8ff01f97f20ff17e4ff439cfc47f1e8ff07f29a953e5a4bbbce1b67fbfb1491bceef5731f87fc0f96ff3f42fee7c7e5ad7e432e9f18ca57f93568819576c0105f9dd257bd40123df6349d9cb4b4fa0445934b9b8570a2a29300327997096bad495f334eaae5f98ea351cdf83d1a257f97d92e444982429f5827050b434496606108f590fc27f9af6fd70abd2fc97f92ff00108f03f27f5cfe87cda419f3b5d0e78d16d4fa4e627933a5fefe66396f89b7b7fa12fe7cc750becaaf410bacb40386f8ea94beea0592e8b1a7e92439d0ea13144d1268219ca8c427f992dc91e4862404ea99edc9b53cdf713462b6f5b70349c6e813ec3824812509d7180b43449690fe42f29fe4bfbe5d2bf4be24ff49fe03009044ce59bef39defe8e2ba663b6f63dee89f9c3bc4e78b721e26e723b5c8795bbc9f9cd3b4923c7e5c97d48bd62abf062db0d20e1892b6537eb4144f96e2f58e8a8171da1ed9cce658a015f4d8d3749214d2ef6a693549f88470a222493df9448b248bd29acd49b63cdf7164359b7adb8924ee748256929592ccd3581822b204c97f92ff24ff010040bb98cdfc8d79a37f725e29e7e2725e5a8ffc9de339879c6bb7923c7e5c17cf6feb955f83165869070c49db291fea98be2034db17e66c8e055a418f3d4d27ef4097445f9e246919c2898a240f1bd1e8c9b63cdf7164d1687ded4812bd72222bc977494ad75b946361a8bd23eecbba3c29b2ee9f35b8941c000000da49a3f338e68de190372fc58b35f246b203070ee85d9a421e57deb016d725f5a2b5caaf410bacb40386a4ed942f97e28f3a0eef7f742916976f376a36c702ada0c79ea693130679e77a5eef9a967ae49df8d64f541a39e996e73b8eb41aa9a79dc9bbfde5520cf24efe99ccb43054f9f73ce28823dcdbdef6b6e82459ead0fb126f44fc37d3e55923ebe364dd3f6bb0300400008076d3c87c8e796358e4ca01f1828dbc31b715e471e33aa43eb45ef93568819576c090b49d32deef95529c598a0f5794356236c702ada0c79e96904b13e57539b93befbcb330272a594fbee5f98e238dac8f6f4dda8521b92d9f3c92ef5e91fb1ffbd8c7aaf625de88cabf5b9ed1ea7a5918020000403bca3aaf63de1816b98472bc682357c690cb1f37933c9e5cfa3aae43ea43eb955f83165869070c49db29e3fdfeb57c5be2f937366796b65e202f7aec6989ef7ffffbd17757bcf6da6b7a5353c9e3cbc79b8b74a292e5245c9eef386692e571adcab23024f1e28b2f46f78f3ffef869db2bf793ef2391ef7b39edb4d3dc49279de4ce3bef3cf7ecb3cf563da6847c0ae9acb3ce723ffbd9cf6ad67bc20927b8b3cf3edb3df8e08355dbf4efd6c831b5ea8ce3d8638f751ffad087dc7bdef31ef7e637bfd99d7efae9d177bde8fd757dfa71e2fab2fc5de2632a6febfd74bdb5f69fa94e69cffbdfff7ef7a637bda9ead85ac1c210000000da5596f95de579f74cb23c2e5a67c18205530b37f2fda1f21d45cd208f23df491a3fb6d4837c945f83165869070cc9da293f5e8a5f96626f293eadb66591b55ea0d5f4d8d332f2c589f245e0ad241f6f2ee2894ada937179bee3a827ede359976561a8f213437ffaa77f3a6dbb7cc7d6abafbe1a95c9a7d9a4ecb6db6e730f3df45074fb9c73cea97a4cb9dcddf0f07074fb539ffa5455dd128f3ffe78b4fd8c33cea83abeb2ced91e53b9cfd7bffe75b773e7ce69f77ff2939f44b7dff9ce77561d57afbecafdd2fe5d2a7fc75a8f93a5de99ea3cf5d453a34521f9bfa51fbf56b030040000807696769e179f374bd493f6f1d07ae3e3e3d125f5e3059c55ab56cd7a71488e5fb972e5d463cae34b3dc847f93568819576c0105f9dd257bd40123df6b48c9c404822f6e9a79fd69b9ae2c73ffe71f4f1e6a29ea8a4392997e73b8e24691ea728d22e0c49c8a77b6421e1fcf3cf8f3e6a5fb95d4ea8e363defad6b74e3b4ee2a8a38eaa7acc975e7a29fa824fb97df2c9274f6dbfe79e7bdc99679ee98e3beeb8a97de5f9d2c757d6d9c8313a2a7fafdffce63753f7e577acdc9ea5becac74ffb77a9fc1df5e364ad77a63a65a14bcadefbdef7460bdb959f26aa152c0c010000a0dda599ef559e1f2749f338c8d7c8c8c8d4224efcc9a1462f2b27c7557e5248421e1ff929bf062db0d20e18e2ab53faaa1748a2c79e969213890b2fbcd0edddbb576f9a955ffce217d1bb578a7ea232db93f3d91e6f4dda85215d5e6fbb2c1e49d99e3d7baaf6af3c266961e85def7a5754b663c78e689144d7a1ef377a8c0ebd4fbdfb8dd497f6ef52af2c6bbd33d5298bcd9ffce427a72e25f7c10f7eb06a9fca6061080000002198edbc6fb6c7a375aebffefa698b39f29d43726515995ba621fbc9fe95df2924218f8b7c95e7af165869070c49db29ffa014b795e2c5727caf14efa9dc21a3b4f50279d1634fcbc909456f6f6fd33e39147f52881395c31a3d496ff438cb5ab130240ba352b664c9929a9fd0898fa9bc949c2c4ec4dbe3c58cb1b1b1e8b9d275e8fb8d1ea343ef53effe4cf59d78e289d1fdf893551269ff2ef5ca66aa57df9fa9ce38e47b8a64bf77bce31d55db2a83852100000084a2d1f95fa3c7213ff286d9cacbca49747777bbabaebaca6ddbb6cdeddab5cbeddfbf3fda577eca7d2997edf29dcd95c7f1065c7fcaf3570bacb40386a4ed943fee2827922ae291697b6493b65e202f7aecc9859c58cc9b37cfdd71c71deeb5d75ed39b5391e3e49d2c9ca854cb7ab29e75ffa268c5c2909c78cb47fa4f3ffdf4e86faef789ef4bc8e5e93ef2918fb8679e79666afb962d5bdcdbdffe763d2e551d5f596723c7e8d0fbd4bb3f537d32e138e59453a695a7fdbbd4fb9d66aa57df4f5ba77c62e8031ff840f4ffaab27e1d2c0c010000202459e78159f7873f4f3cf184ebefef9fb6c89335e478791cf8519e8f5a60a51d30246da7fc5d29ba4a716c39e4b694352a6dbd405ef4d8931b39c158b0604174b221efc87ffdf5d7f52e35c97e77de7967f44e164e5492a53d694fbb5f11cdb430d48a90d7a4842e27da3f58180200004068d2ce07d3ee87f672d75d7745576cd18b3ef542f697e3e057393760819576c090b49d52f69b538a63ca21b7d31e5bcb6c8e055a418f3db98b4f54e4dab7ebd6ad73dbb76f771313136edfbe7dd1f6175e78c13df5d4536e7474d4ad58b122fa8410272ae9cc74f23ed3f6a2636188c8122c0c010000204433cd0b67da8ef627978bbbf6da6bdd45175de47a7a7aa6be43487eca7d2997edb21fda43393760819576c090b49d722a4997105935720cd04a7aecf1861395d6483a894f2ac71b7c2c0c11e1060b430000000855d2fc30a91c406b49be4e27f00265a51d30246da7d40b413ab26ae418a095f4d80383f4c9bcbe8fda581822b2040b4300000008999e27eafb00f223f93a9dc00b949576c0105f9dd257bd40123df6c0a8f8a4fedc73cfe5e43e251686882cc1c21000000042c7bc11680f92afd309bc405969070cf1d5297dd50b24d1630f0c93937ab93c1f27f7e9b030446409168600000060c1e0e0a03bfae8a39937021e49be4e27f00265a51d30246da7fc68299e2cc5eb1d878f99ed0b7336c702ada0c71e18270b4392c4c6cc581822b2040b43000000b0a0bfbfdf9d7ffef9d1392e003f245fa7137881b2d20e1892b6533ed4317d4168b62fccd91c0bb4821e7b609c2c0c1d3c785017a3061686882cc1c21000000042f7f0c30f477346896f7ffbdb7a33809c48be4e27f00265a51d30246da77cb9147fd47178ffa34bb1b87cbb51b3391668053df6c03839c1dfb76f9f2e460d2c0c1159828521000000846ef1e2c5530b439ffdec67ddebafbfae77019003c9d7e9045ea0acb40386a4ed94f17eaf94e2cc527cb8a2ac11b3391668053df6c0b8b973e7ba3d7bf6e862d4c0c2109125581802000040c8c6c7c7a71685e2b8f1c61bf56e007220f93a9dc00b949576c090b49d32deef5fcbb7259e7f63736669eb05f2a2c71e18d7d9d9e976eddaa58b51030b43449660610800000021fbdce73e57b530d4d5d5e50e1d3aa47705d06292afd309bc405969070cc9da293f5e8a5f96626f293eadb66591b55ea0d5f4d803e3e4c4fea9a79ed2c5a8818521224bb0300400008050c99b07e5ea127a6148e2eaabafd6bb036831c9d7e9045ea0acb40386f8ea94beea0592e8b107c6c975a21f7bec315d8c1a581822b2040b4300000008d5ca952bab1684e290ab4e1c3c78501f02a085245fa7137881b2d20e18e2ab53faaa1748a2c71e18d7dddded76eedca98b51030b434496606108000000219a9c9c4cfcb4501c7ff7777fa70f03d04292afd309bc405969070c49db296bed57ab2cadd91c0bb4821e7b60dcfcf9f3ddd8d8982e460d2c0c115982852100000084e88a2baea85a08d29f18923718f2a921203f92afd309bc405969070c49db297f578aa32aeecb6d296b54da7a81bce8b107c6f5f4f4b86ddbb6e962d4c0c21091255818020000408876efdeed9e7efae9e89c36266f28fcd18f7e54b117803c49be4e27f00265a51d30246da7dc538a75a5784b39ae2cc52fa7ed914dda7a81bce8b107c6f5f6f6bad1d1515d8c1a581822b2040b43000000b0e2820b2e70f7de7baf2e069013c9d7e9045ea0acb40386a4ed941b3b0eef5b1952d6a8b4f50279d1630f8cebebeb73232323ba1835b030446409168600000060c585175ee8eebaeb2e5d0c202792afd309bc405969070c49db298f2fc58da578a11c725bca1a95b65e202f7aec81710b162c705bb76ed5c5a8818521224bb030040000002bfafbfbddedb7dfae8b01e444f2753a8117282bed8021be3aa5af7a81247aec81710b172e745bb66cd1c5a8818521224bb030040000002be40d85b7dc728b2e069013c9d7e9045ea0acb40386f8ea94beea0592e8b107c60d0c0cb89b6fbe5917a3061686882cc1c210000000ac58b46891dbbc79b32e069013c9d7e9045ea0acb40386f8ea94beea0592e8b107c65d7cf1c5ee5bdffa962e460d2c0c115982852100000058c11b0a01bf245fa7137881b2d20e18e2ab53faaa1748a2c71e18b764c91277c30d37e862d4c0c210912558180200008015f286c29b6eba491703c889e4eb74022f5056da01437c754a5ff50249f4d803e32eb9e41277dd75d7e962d4c0c2109125581802000080154b972e75dff8c6377431809c48be4e27f00265a51d30c457a7f4552f90448f3d306ef9f2e5ee6b5ffb9a2e460d2c0c115982852100000058c11b0a01bf245fa7137881b2d20e1892b6539e5e8a1f96e2d58ab2b4c7d6329b638156d0630f8cbbecb2cbdc57bffa555d8c1a581822b2040b43000000b0e2d24b2f75575f7db52e069013c9d7e9045ea0acb40386a4ed94231d87f7addc3fedb1b5cce658a015f4d803e3bef0852fb8abaeba4a17a3061686882cc1c210000000ac58b972a5fbca57bea28b01e444f2753a8117282bed8021693be54ba5f870c71bfb1f5d8ad7dfd89c59da7a81bce8b107c6ad5ebddaad5bb74e17a3866ddbb6b943870e552d0010840ee9272c0c010000c00ade5008f825f93a9dc00b949576c090b49d726f29fe77c7e1fd4f2dc5574bb17bda1ed9a4ad17c88b1e7b60dcdab56bdd9a356b74316a181b1b737bf7eead5a0420081d7bf6ec71f7df7fbfee420000004090e40d85327704e087e4eb74022f5056da0143d276ca1b3b0eef5b191ba6ed914dda7a81bce8b107c6c9bbbee4dd5f98d9ae5dbbdcf6eddbdde4e4249f1c226a86f40b5914baefbefba2fe0200000058c01b0a01bf245fa7137881b2d20e1892b6539e588a9b4af1eb52bc508a1b4a71dcb43db2495b2f90173df6c038b94ef465975da68b914092fdf24910b94c1841d40ae91f2c0a010000c0922bafbcd27df18b5fd4c5007222f93a9dc00b949576c0105f9dd257bd40123df6c0b8abafbeda5d7ae9a5ba18000000008088bca170e5ca95ba18404e245fa7137881b2d20e18e2ab53faaa1748a2c71e1877dd75d7b94b2eb94417030000000010e10d85805f92afd309bc405969070ca9d729e3175fbd68d46c8e055a418f3d30ee861b6e704b962cd1c5000000000044784321e097e4eb74022f5056da0143ea754abd08542b1a359b638156d0630f8cfbe637bfe90607077531000000000091ebafbf9e3714021e49be4e27f00265a51d30246da794fdba4a716c39e476da636b99cdb1402be8b107c6dd7cf3cd6e60604017030000000010b9e9a69bdcc5175fac8b01e444f2753a8117282bed8021693be5ef4a31a714c794436e4b59a3d2d60be4458f3d306ecb962d6ee1c285ba180000000080c8f0f0306f28043c927c9d4ee005ca4a3b6048da4eb9b3e3f0be95f1c8b43db2495b2f90173df6c0b8ad5bb7bafefe7e5d0c000000004064f3e6cd6ed1a245ba18404e245fa7137881b2d20e1892b653fe8f528c94e240396e2fc51f54ee9051da7a81bce8b107c68d8c8cb8bebe3e5d0c0000000040e4965b6e71175d74912e069013c9d7e9045ea0acb40386f8ea94beea0592e8b107c68d8e8ebadede5e5d0c0000000040e4f6db6fe70d85804792afd309bc405969070cf1d5297dd50b24d1630f8cdbf6ffb377e7415655e7e2f71d92f21acdf5b56e4493e86b2aa94a5d4d2ae51b132bb1927f722b831a73ebf7c74da0079aa1996c5b1bb11190300bb90145900878852041f809412172c54b4008a37648b834da41b131c196c96612882486ac97677b76e7f473ceee33347bafbdd7fe7eaa9ea2cfdad3d98775f6ea7e9e3dac5b67faf4e9a39b010011dbb76f9fd9b66d9b775cfef5af7f4d441cf2b96fdab4c9b4b6b6eaff1a0000526fd5aa55a67ffffeba194044245fa7137809e5ca7ec021b63aa5aded0241f4d803c76ddebcd9f4eedd5b370300222445a18d1b379a43870e99f7df7fdffce52f7f21220ef9dce5f35fbf7e3dc521000094356bd698be7dfbea660011917c9d4ee025942bfb0187d8ea94b6b60b04d1630f1cd7d4d464aaabab753300204272a590142574b182883e0e1e3c685e7ae925fd5f040040aa6dd8b0c1d4d4d4e8660011917c9d4ee025942bfb0187d8ea94b6b60b04d1630f1cb763c70e535555a59b01001192db9871a5503c42fe1fe4d6720000e01fb66cd9c29d26008b245fa7137809e5ca7ec021b63aa5aded0241f4d803c7b5b4b498caca4add0c0088901422748182b01714860000e86cfbf6eddc6902b048f2753a819750aeec071c526ca7ac3817fb2ff870feec2857779605c2a0c71e384e9ea3505151a19b0100112aa53074e0e82973df92fff5427ed6d389ee07852100003adbb97327779a002c927c9d4ee025942bfb018714db290f5e905b142a76d97cbab32c10063df6c071f2c0f35ebd7ae966004084ba2a0c9d39f31773e4bd3f77bcdef887831d8521f9d96f3f7cfcb4397ef21ff311e507852100003adbbd7b37779a002c927c9d4ee025942bfb018714db2965be9bcfc5457a42998add2e10153df6c071870f1fa630040096051586a428b468cb5b66e4b266b366d77eb3a1e580f9f1b3af761486e46769ffef1d6d66c4b9791e79f17573e214c5a1ee06852100003ae34e13805d92afd309bc8472653fe090623ba5cc37e05c5caa2794a9d8ed0251d1630f1c77e2c409d3b3674fdd0c0088505061a8fdc469f3c0d2e68e4250a1b8ffffee346fb7bf97b31ea2b4a030040040676d6d6d9c50085824f93a9dc04b2857f6030e29b653fa5f441de5eaceb24018f4d803c749028cc21000d81554189278e17fdfc9290005c5d257fe94b33c517a50180200a0b3f6f676fe6e042c927c9d4ee025942bfb018714db297541a8bb5fccee2c0b84418f3d48017ec10700bbba2a0cc9ede3fcc24fe3333bcde2ad7f34ad078f7b213f4b9b3f7df5ce777296274a0f0a43000074c69d2600bb245fa7137809e5ca7ec021b63aa5aded0241f4d88314905ff025110600b0235f61e8c0d15366e31f0e767aa6901482f47cd2e64f977965195956cf47141f14860000e84cc6470a43803d92afd309bc8472653fe0105b9dd2d67681207aec410ac82ff872061800c08e7c85217d9b3809b94a48cf276d7a3e093d1f517c5018020020178521c01ec9d7e9045e42b9b21f7048b19df2ca73f1d4b9783713f2b3b495abd8ed0251d1630f52407ec1977b460300eca03014afa0300400402eee3401d823f93a9dc04b2857f6030ee9aa534ec8fa79e1051fce9b1dd256aeaeb60bd8a0c71ea440af5ebd4c5b5b9b6e060044245f61885bc9d90b0a430000e492bf1bb9d3046087e4eb74022fa15cd90f38a4ab4ef9dab9f849e6e7f67351792e3e9609f959ae1c2a5757db056cd0630f52a0a2a2c2b4b6b6ea66004044f21586fcd8d072b0a3f0d3f8cc4eaf1024570949c8cfd2e64f9779f5f244e941610800805cdc6902b047f2753a819750aeec071cd255a79402d082cccf5218ea792e2ecd84fc4c61082ed1630f52a0b2b2d2b4b4b4e866004044ba2a0cbdd8fc4ece6de28262d58eb69ce589d283c2100000b9b8d304608fe4eb74022fa15cd90f38a4d84e29cf14f2bf8c7e485bb98add2e10153df62005aaaaaacc8e1d3b74330020224185a1f613a7cdc865cd3905a0a018be74a7397cfc74ce7a88d282c2100000b9b8d304608fe4eb74022fa15cd90f38a4d84e79e5051f1682e4ca2109f959daca55ec7681a8e8b10729505d5d6d9a9a9a74330020224185a1d37f3e6366bfb4c7bb5ddc73dbf799f52d9d9f39243f6f683960d6ecdaef1590e66f6c35ef9f3993b31ea2b4a0300400402eb9d3c4eeddbb7533800848be4e27f012ca95fd80436c754a5bdb0582e8b1072950535363366ddaa49b010011092a0c494871e8e0b1531daf37fee11fcf1c929ffdf6a3effd99a2d0790a0a430000e492c2507373b36e061001c9d7e9045e42b9b21f7088ad4e696bbb40103df62005faf4e963d6ad5ba79b010011e9aa30a4e3c0d1531d8521f9594f27ba1f14860000c825779ad8be7dbb6e061001c9d7e9045e42b9b21f7048579d32fbcbe7ffaca35cdd591608831e7b9002fdfaf533ab57afd6cd00808894521822c20f0a430000e492c2d0b66ddb7433800848be4e27f012ca95fd8043baea94148690267aec410ad4d6d69a952b57ea66004044280cc52b280c0100904b6e41be61c306dd0c200292afd309bc8472653fe0105b9dd2d67681207aec410a0c1c38d02c5fbe5c370300224261285e41610800805c7dfbf6356bd6acd1cd002220f93a9dc04b2857f6030eb1d5296d6d1708a2c71ea4c0e0c183cd92254b74330020221486e21514860000c8d5bf7f7fb36ad52add0c200292afd309bc8472653fe090623b65bef9f2b515ab3bcb0261d0630f52a0aeaece2c5cb850370300224261285e41610800805c03060c302b56acd0cd002220f93a9dc04b2857f6030e29b653fefd5c5c92f55a7e96b67215bb5d202a7aec410ad4d7d79bf9f3e7eb66004044280cc52b280c0100904b6e41be74e952dd0c200292afd309bc8472653fe090623b65dbb998742efe9f4c4c3e176f779aa334c56e17888a1e7b90020d0d0d66eedcb9ba190010110a43f10a0a430000e41a32648859bc78b16e061001c9d7e9045e42b9b21f7048b19d72c6051fce9b1dd256ae62b70b44458f3d488161c3869959b366e966004044280cc52b280c0100908b5b9003f648be4e27f012ca95fd80438aed94979f8b27cec5e14cc8cfd256ae62b70b44458f3d4881c6c646f3e8a38fea66004044280cc52b280c0100904b6e413e6fde3cdd0c200292afd309bc8472653fe0105b9dd2d67681207aec410a8c1c39d24c9b364d370300224261285e41610800805c43870e35b367cfd6cd002220f93a9dc04b2857f6030eb1d5296d6d1708a2c71ea4c0e8d1a3cd94295374330020221486e21514860000c8c52dc8017b245fa7137809e5ca7ec021c5764aff8ba8a35cdd591608831e7b900263c78e3593264dd2cd00808850188a575018020020d7f0e1c3cdf4e9d37533800848be4e27f012ca95fd80438aed94ba20d4dd2f66779605c2a0c71ea4c0c48913cdb871e374330020221486e21514860000c8356ad4283375ea54dd0c200292afd309bc8472653fe090723ae5a5e762e005e52debebceb24018f4d8831490dbc8c9ede400007650188a57501802002017b72007ec917c9d4ee025942bfb018794db29bf7c41f9cb8aee2c0b84418f3d480139eb6be4c891ba1900d04dfdfbf7372fbcf0826ece4161285e41610800805c720b72b9db0480e849be4e27f012ca95fd80438aed9432dfd973f1b7ccbff2fa40a7394a53ec7681a8e8b1072920f78996fb450300ceaf9e3d7b7a51a8404461285e41610800805cdc821cb047f2753a819750aeec071c526ca7f4bf887eec3f173d3bcd519a62b70b44458f3d488159b3669961c386e966004037f985a14205220a43f10a0a430000e49a3c79b21933668c6e061001c9d7e9045e42b9b21f7088ad4e696bbb40103df62005e6ce9d6b1a1a1a743300a09b746128a8404461285e41610800805c720bf251a346e9660011907c9d4ee025942bfb018714db29f3cd97afad58dd591608831e7b90024f3ef9a4b9e79e7b74338018397bf6ac6e4202e882900ebf404461285e4161084817c658a038dc821cb047f2753a819750aeec071c526ca7d4f35d9ba7ad14dd591608831e7b90020b172e34757575ba19404c48c24a171408b782c250bc42ffff1004e17e00288c5b9003f648be4e27f012ca95fd80430a754aff0b982fdecd9aaf5485b60b444d8f3d4881254b9698c18307eb66003171faf469d3ab572fdd8c04d089473fb8955cb821bfcf48e8f662832b8680f4608c058a3767ce1c6e410e5892f9fdd605aeec071c52a853ea62901f27cec57d59f395aad07681a8e9b10729b07cf9723360c000dd0c2026dadbdb495a2554a18290af506148c6673f2ebffc72f3b5af7dcd6cdebc39673ee2c3f03f2bdd5e6c501802d283311628debc79f34c7d7dbd6e061081ccefb72e70653fe090623b65b1f315eb7caf0fe82e3df6200556ae5c696a6b6b75338098686b6b23699550850a42be620b43f2f3af7ef52befe71b6eb821673ee2c3c8febcca090a43407a30c602c55bb06001b720072cc9fc7eeb0257f6030eb1d5296d6d1708a2c71ea4c0ead5ab4dbf7efd7433809878fdf5d74d6565a56e4602142a08f94a290c9d3c79d2fbf9d24b2fed982e67bccb959f575f7db5b9e28a2bcc9d77de69f6eedddb317de9d2a5e6f39fffbcf9e8473f9a533429b4ac3fbf1f1ffbd8c7cce73ef73973e6cc196fbafcfbd9cf7ed65c76d965e6e0c1839d96f9f8c73f6e6ebdf5d64e5737e9f565ef677614b38e625f175a9f0e0a43407a30c602c55bbc78b1193264886e061081ccefb22e70653fe090ae3a65f697afe38f4a15e5eaceb24018f4d8831458b76e9de9d3a78f6e061013cdcdcd24ad1c574a61c8bf62e8f6db6fef98deb76f5fafedb9e79e335bb76ef57efed6b7bed531fdaaabaef28a4252a4d2eb2eb4acbfedc71f7fdc2b020d1a34c87b2d579bcaf4152b5678afe559757addbb76edf2a6dd78e38d81ebd3cbe8085ac745175d94b3cea0d785d6a783c210901e8cb140f1e44413f93d0040f432bfdfbac095fd8043baea94d95fbe8e3f345594ab3bcb0261d0630f5240ce9aeeddbbb76e0610134d4d4da6baba5a37c321c51686fcb8eebaebcc5b6fbdd531fd139ff844ce3c975c7249c7f44f7dea535edbf5d75f6f860e1ddae98aa042cbfa6d274e9cf05ebff6da6b5e51e63bdff98ef7fadbdffeb6f7baa5a5c57bfde28b2f9a9b6fbed9bb82c85f365f11c75f5fbe28661d175f7c71ce3a835e175a9f0e0a43407a30c602c5939341b805396047e6775817b8b21f7088ad4e696bbb40103df62005f8831888b70d1b36989a9a1add0c87145b187aefbdf7bc873ecbcffa8a2069936765e865255e79e515f3831ffca0e3567237dd7453d1cbfadbce6ebbe38e3bcc85175ee82588e45fb9fd9c3fedd39ffeb437ff962d5bbce28f5e5ebfce17c5acc32fec1c3f7e3ceff4ecd785d6a783c210901e8cb140f156ad5ae5dd261740f432bfbfbac095fd80438aed94f9e6cbd756acee2c0b84418f3d48811d3b7698aaaa2add0c2026d6ac59e3ddee0bee2ab630243f1f3b76ace32a1fffd67092a491d70d0d0d5d5e89235788ca7c9ffce4273bda0a2d9bbd6d3fe4fd4adbe5975feefdbb76edda8e697ea169d3a64d66c68c1939cbebd7f9a2d03ae47948f2fae5975ff66e49a7a7ebd785d6a783c210901e8cb140f1f8be00f6647e7f75812bfb018714db29f57cd7e6692b45779605c2a0c71ea480dcfe877bab03f125cf72e1b61d6e2ba530243161c204eff537bff94deff5912347ccdd77df6daebdf65aef4a1a3dbfff5aae18bae1861bbce714f9d38a5d56bfa72f7ff9cb5ebbfc9bddbe64c91273cd35d7742ca797d7aff345a1753cf5d453a6478f1e81d3f5eb42ebd3416108480fc658a0785c6107d893f9fdd505aeec071c52a853e6fc219915ef66cd57aa42db05a2a6c71ea4406b6baba9a8a8d0cd006262d9b26566e0c081ba190e29541822a20d0a43407a30c602c5935bb2f26c5ac00ec9d7e9045e42b9b21f7048a14ea98b417e9c3817f765cd57aa42db05a2a6c71ea4c0be7dfb4caf5ebd7433809878fae9a7cd90214374331c4261285e416108480fc658a078dbb76fe7d9b4802592afd309bc8472653fe090623b65b1f315eb7caf0fe82e3df620050e1f3e4c610888b1f9f3e79bfafa7add0c8750188a57501802d283311628dece9d3b79362d6089e4eb74022fa15cd90f38c456a7b4b55d20881e7b9002f2b0f19e3d7bea6600313167ce1cd3d0d0a09be1100a43f10a0a43407a30c602c5dbbd7b37cfa6052c917c9d4ee025942bfb018714db29fdf9fedf73b1e35cb49d8beffe6372c98add2e10153df62005240946610888af19336698c6c646dd0c8750188a57501802d2833116281ecfa605ec917c9d4ee025942bfb018714db29fdf91ecefc2cb1eb1f934b56ec7681a8e8b1072941610888af69d3a699912347ea663884c250bc82c210901e8cb140f1dadadab805396089e4eb74022fa15cd90f38a4d84ef9d773f16fe7e28fe7e22fe7e2964c5bb98add2e10153df62025a43024c93000f13379f2643366cc18dd0c8750188a57501802d2833116285e7b7b3b2714029648be4e27f012ca95fd80438aed94bb2ff8b01024f33f9b692b76d97cbab32c10063df62025e4177c79d61080f8193f7ebc993061826e8643280cc52b280c01e9c1180b148f67d302f648be4e27f012ca95fd80438aed94ffe75c1cbae0c3670bfd7f99b66297cda73bcb0261d0630f52427ec19733c000c48f9cc92c6734c35d1486e215148680f4608c058a2763248521c00ec9d7e9045e42b9b21f7088ad4e696bbb40103df62025e45ed172cf6800f13362c408f3f0c30feb663884c250bc82c210901e8cb14069280c017648be4e27f012ca95fd80436c754a5bdb0582e8b10729515151615a5b5b75338018686c6c343366ccd0cd700885a178058521203d186381d2f06c5ac00ec9d7e9045e42b9b21f7048b19db2e25cecbfe0c3f9b3a35cdd591608831e7b9012959595a6a5a54537038881a143879ad9b367eb663884c250bc82c210901e8cb14069e44e133c9b16889ee4eb74022fa15cd90f38a4d84e79f082dca250b1cbe6d39d658130e8b107295155556576ecd8a19b01c4407d7dbd993f7fbe6e8643280cc52b280c01e9c1180b948667d3027648be4e27f012ca95fd80438aed9432dfcde7e2223da14cc56e17888a1e7b9012d5d5d5a6a9a94937038881bbeebacb2c5ab44837c3211486e215148680f4608c054ac3b369013b245fa7137809e5ca7ec021c5764a996fc0b9b8544f2853b1db05a2a2c71ea4444d4d8dd9b469936e06100303060c30cb962dd3cd700885a178058521203d186381d2f06c5ac00ec9d7e9045e42b9b21f7048b19dd2ff22ea2857779605c2a0c71ea4449f3e7dccba75eb74338018a8adad35cf3fffbc6e8643280cfd23de7efb6def4485bffef5afe6830f3e307bf6ecf16e5b23e3943c0b64debc79de34bddcf90c0a43407a30c602a59167d3eedebd5b37030899e4eb74022fa15cd90f38a4d84ea90b42ddfd62766759200c7aec414af4ebd7cfac5ebd5a37038881be7dfb9a356bd6e8663884c2d05fcc2bafbc627efce31f9b214386e4bdadd3993367bc5bd7bcf9e69bdeebbffffdef5ed1486e83aad7d5dda03004a407632c501a290c353737eb660021937c9d4ee025942bfb0187d8ea94b6b60b04d1630f5242ce965cb972a56e06100372abc78d1b37ea663824ed852129facc9831c32b0e9d3c79d2bbad933cfbeeab5ffdaab9f6da6bbd3f84e55f792ded32fdd4a953e68d37de308d8d8d66dcb8715ed148afb7dca03004a407632c501a1987b76fdfae9b01844c7e1fd609bc8472653fe0105b9dd2d67681207aec414a0c1c38d02c5fbe5c37038801f9035cae8a80bbd25a183a71e284775b38b9fae7d8b16366c48811e68a2bae30dffbdef7cc134f3c617efbdbdf7ab79613f2afbc9676992ef3c9fc478f1ef5ae789571ecf0e1c339db2827280c01e9c1180b9446be33dbb66dd3cd004226f93a9dc04b2857f6030e29d429fd2f605094ab3bcb0261d0630f5262f0e0c166c99225ba19400c70cb0ef7a5b13024fb2cb78e13bffce52f4d8f1e3dbce2ce810307d4a7939fcc27f3cb72b2fcf1e3c7bd76792e91de56a9416108480fc658a0347295dd860d1b7433809049be4e27f012ca95fd80430a754a5d08d251aeee2c0b84418f3d4889baba3ab370e142dd0c20062a2a2abc67a9c05d692b0c6dddbad5dc75d75d66fffefd66fcf8f1e6faebaf37bffffdeff5c75214594e9697f5c89547a2bdbd3d679ba5048521203d186381d2f05c2ec00ec9d7e9045e42b9b21f7088ad4e696bbb40103df62025eaebebcdfcf9f375338018e8d5ab97f7fc14b82b4d85a177de79c7bbd2a7b5b5d52be6dc72cb2de6d0a143fa23e970f6ec59f3ecb3cfeae60ecf3cf38cb7bcac47d627cf2892ab60653b7adbc5068521203d186381d2f4efdfdfac5ab54a37030899e4eb74022fa15cd90f38c456a7b4b55d20881e7b90120d0d0d66eedcb9ba19400cf4ecd9d31c39724437c321692a0c9d3973c6ecddbbd7bbfddb673ef3992e8b427ffbdbdfcccc9933cd7df7dda72779162d5ae47d3f84ac47d627eb7de18517bc2291de76b1416108480fc658a03403060c302b56acd0cd004226f93a9dc04b2857f6030eb1d5296d6d1708a2c71ea4c4b061c3ccac59b37433801890b3994f9f3ead9be190341586fefad7bf9a63c78e99abafbebacbdbc7c97cd3a64df392b6ba3024b78c93ab5c659a5f1812b23e59efd1a3474d6363a3f74079bdfd6282c210901e8cb14069e4aadfa54b97ea660021937c9d4ee025942bfb0187d8ea94b6b60b04d1630f524212688f3efaa86e066099dc462b3bf10d37a5a530b46bd72eafa8f3c0030f98418306e98fa1835c553479f264d3bb776f3376ecd84e8521597ece9c395e3277dcb87139df0f59afac7ff7eedda6a5a525e73d141314868074608c054a3764c810b378f162dd0c206492afd309bc8472653fe0105b9dd2d67681207aec414a8c1c39d23b331b40bcc859cc920087dbd25018dab76f9ff7ec9ff7de7bcf5c79e59566fffefdfa63f0fcf9cf7ff66e03d7a74f1fafb023c927bf30e4df5a4e1e16ff9bdffcc6fbdc745257d62beb97670d09b9f248bf97424161084807c658a07475757566e1c285ba1940c8245fa7137809e5ca7ec021b63aa5aded0241f4d88394183d7ab49932658a6e0660597b7b3b49ab14484361e8b9e79ef36eff26cf00baedb6dbf447e03975ea9479f0c1074dbf7efdcc1b6fbce1b5f985a10f3ef8c03b81a1b2b2d26cdbb6cd9b96af302464fdb21d21cbe9f75228280c01e9c0180b94aebebedecc9b374f37030899e4eb74022fa15cd90f38c456a7b4b55d20881e7b901272ab9e499326e9660096b5b5b591b44a8175ebd699f7df7f3fa740e152485167cb962da6babadacc9d3b577f04e6c48913de2de0e4a1d66fbdf55647bb5f1892931764d9dffdee771dd3820a43b27e99f78f7ffca37756b37e2f5d85fc3f501802d281311628ddd0a143cdecd9b37533809049be4e27f012ca95fd80436c754a5bdb0582e8b107293171e244ef590d00e2e5f5d75ff7ae9080db366dda640e1d3a9453a47029a4c073f8f061f395af7cc56cdfbebdd3fe1f3d7ad42bfec8ade6de7efbed4ed3a4b023b795aba9a931cdcdcd9da605158664fdb29d77de79c7343434e4bc97ae4212c52fbdf4925e25000731c602a51b366c9899356b966e061032c9d7e9045e42b9b21f7088ad4e696bbb40103df62025e44c6cb99d1c8078914438492bf7b5b6b69af5ebd79b83070f3a7de5d0dffffe77f3a94f7dca2bd864932b56a5c0b363c78e4eed429e8127d356ad5aa52705168664fdb21d795e51dfbe7d73de47be90cf5d8a426bd7aef5fe3f00b88f311628ddf0e1c3cdf4e9d37533809049be4e27f012ca95fd80436c754a5bdb0582e8b107293175ea542ff906205e9a9a9abc5b62c17d528c902b55a4d8e16a4861e8924b2ef10a31d9cef71543b27ed9ced9b367bda4af7e1f41219f3f4521203d186381d28d1a35cafbdb1140b4245fa7137809e5ca7ec021b63aa5aded0241f4d8839490b3bee4ec2f00f1b261c3062f210e24ddcf7ffe73af6093ef8a21713e9f31e45f3174ead429d3af5f3f3d19003c8cb140e9e42e133226038896e4eb74022fa15cd90f38c456a7b4b55d20881e7b9012729f68b95f34807859b3668d772b2c20e9aaaaaaccdebd7bf33e63c827859c071f7cd02be6bcf1c61b5e9b5f18fae0830fccb469d3bc2b80b66ddbe64d0b2a0c653f63e8eebbefd69301c0c3180b946eecd8b1def36901444bf2753a819750aeec071c62ab53dada2e10448f3d4889b973e77a0fe806102f2b57ae34b5b5b5ba19481cb94d9c3cbf47aefa913127883c1768fcf8f1deede35a5a5a3a0a43e26f7ffb9b993973a6a9a8a830bff9cd6f020b43b27ed9ced6ad5bbd7501403e8cb140e9a428346edc38dd0c206492afd309bc8472653fe0105b9dd2d67681207aec414a3cf9e493e69e7beed1cd002c5bb66c99193870a06e061247aef69164d22f7ff94b73db6db7e9c99d9c3973c64c9e3cd9f4eedddb3b33d92f0c09794ed19c39734caf5ebdbcc454bec290ac5fb623b7a493621400e4c3180b944ec6e73163c6e8660021937c9d4ee025942bfb0187d8ea94b6b60b04d1630f52421eee5d5757a79b0158f6f4d34f9b214386e86620719a9b9bcdcf7ef63373f2e44973e595579afdfbf7eb593af9eb5fffea1593a4f0935d1812521c9a3f7fbe374d178664bdb27ed90e007485311628ddd4a953cda851a37433809049be4e27f012ca95fd80436c754a5bdb0582e8b10729b164c912ef363f00e24592dff5f5f5ba1948b4071e78c00c1a344837e7f06f1da70b43be458b16e5148664bdb27e002884311628ddf4e9d3cdf0e1c37533809049be4e27f012ca95fd80436c754a5bdb0582e8b10729b17cf9723360c000dd0cc032b96516cfff826b8e1d3b66aebefa6af3fbdfff5e4fca71f6ec59f3ecb3cfeae60ecf3cf34cc7cfb23e59ef912347cc430f3d64de78e38dac3901a033c658a074b366cd32c3860dd3cd004226f93a9dc04b2857f6030eb1d5296d6d1708a2c71ea4040fdf05e269c68c19a6b1b1513703893569d224b378f162ef19409ff9cc67cca14387f42c6591f5c8fa64bd2fbef822570d0128883116281d0555c00ec9d7e9045e42b9b21f7088ad4e696bbb40103df6202556af5e6dfaf5eba79b015826cf58193972a46e0612aba5a5c55454549837df7cd38c1f3fdedc72cb2ddd2e0ec9f2b21e59dfdebd7bbd131d76eddaa56703804e186381d2cd9b378f5b30021648be4e27f012ca95fd80436c754a5bdb0582e8b10729b16edd3ad3a74f1fdd0cc0b2c993279b3163c6e86620d1e4d94055555566fffefd5e31e7faebaf2feab672f9c872b2bcace7ef7fffbb79e9a597bcab8660d7be7dfbccb66ddbbcdf2f7efdeb5f1311877cee9b366d32adadadfabf0659186381d22d58b0c0d4d5d5e9660021937c9d4ee025942bfb0187d8ea94b6b60b04d1630f5262f3e6cda677efdeba19806592ec9e3061826e06124f1efaee27ada590d3a3470f3370e04073e0c00135677e329fcc2fcb51088a17290a6ddcb8d1bb92ebfdf7df377ff9cb5f8888433e77f9fcd7af5f4f71a80b8cb140e9e476b043860cd1cd004226f93a9dc04b2857f6030eb1d5296d6d1708a2c71ea444535393a9aeaed6cd002c933399e58c66c065a74e9d32478f1e3523468c30575c7185f9def7be679e78e209f3dbdffed6bcfdf6dbde3cf2afbc9676992ef3c9fcb2dc0b2fbce0dd1215f120570a495142172b88e8e3e0c183de5574c88f311628ddd2a54bcda041837433809049be4e27f012ca95fd80436c754a5bdb0582e8b10729b163c70eefb63e00e24512df0f3ffcb06e069c326edc38efea9fad5bb79a13274e9865cb9679272b7cf5ab5f35d75e7badf787b0fc2bafa55da69f3c79d2bcf2ca2be6fefbef37f7de7baf79f5d557f56a6189dcc68c2b85e211f2ff20b796437e8cb140e956ac58e13dcb0f40b4e4f7619dc04b2857f6030eb1d5296d6d1708a2c71ea4843c0cbcb2b2523703b0acb1b1d1cc9831433703ce913390fbf5eb676a6a6acc3befbcd3d12ecf0d923876ec58a776b952480a42522442bc4821421728087b41612818632c50ba55ab5699fefdfbeb660021937c9d4ee025942bfb0187d8ea94b6b60b04d1630f5242ee3f5f5151a19b01583674e850337bf66cdd0c38abb9b9d99c3d7bb6e3b55c21d4b3674faf60248928291021de4a290c1d387acadcb7e47fbd909ff574a2fb41612818632c50ba356bd698be7dfbea660021937c9d4ee025942bfb0187d8ea94b6b60b04d1630f52421e14ddab572fdd0cc0b2fafa7a337ffe7cdd0ca4467b7bbb571842727455183a73e62fe6c87b7fee78bdf10f073b0a43f2b3df7ef8f86973fce43fe623ca0f0a43c1186381d26dd8b0c13b590340b4245fa7137809e5ca7ec021b63aa5aded0241f4d88394387cf83085212086eebaeb2eb368d122dd0ca4c69e3d7bb8a23561820a4352145ab4e52d337259b359b36bbfd9d072c0fcf8d9573b0a43f2b3b4fff78e3633e2dc3c8fbcf8ba39718ae2507783c25030c658a0745bb66c31bd7bf7d6cd004226f93a9dc04b2857f6030eb1d5296d6d1708a2c71ea4843cec9b33b281f819306000cf5041aa35353579b7934372041586da4f9c360f2c6dee2804158afbffef4ef376fb7b39eb214a0b0a43c1186381d26ddfbe9d7119b040f2753a819750aeec071c62ab53dada2e10448f3d4809491c501802e2a7b6b6d63cfffcf3ba19488db56bd7f22c8384092a0c49bcf0bfefe414808262e92b7fca599e283d280c05638c054ab773e74e535555a59b01844cf2753a819750aeec071c62ab53dada2e10448f3d48110a4340fc48425c1ef20ba4d5f2e5cbcdc08103753362acabc290dc3ece2ffc343eb3d32cdefa47d37af0b817f2b3b4f9d357ef7c276779a2f4a030148c311628ddeeddbb4d6565a56e061032c9d7e9045e42b9b21f7088ad4e696bbb40103df62045a43024090400f1210ff7ddb871a36e0652e3e73fffb9a9ababd3cd88b17c85a103474f998d7f38d8e999425208d2f3499b3f5de6956564593d1f517c50180ac6180b94aeb5b59567ff011648be4e27f012ca95fd80436c754a5bdb0582e8b1072922852179d61080f8907bb8cb335680b49a356b9619366c986e468ce52b0ce9dbc449c855427a3e69d3f349e8f988e283c25030c658a0746d6d6da657af5eba1940c8245fa7137809e5ca7ec021b63aa5aded0241f4d8831491c2507b7bbb6e066091dcaaa3b9b9593703a9f1939ffcc48c1e3d5a3723c6280cc52b280c05638c054a277f2f720b72207a92afd309bc8472653fe0105b9dd2d67681207aec418ac8995f72061880f8905b75ecd9b3473703a9316edc383369d224dd8c18cb5718e25672f682c25030c658a0747287090a4340f4245fa7137809e5ca7ec021b63aa5aded0241f4d88314913f8ee59ed100e283822dd26ef8f0e166faf4e9ba193196af30e4c78696831d859fc667767a8520b94a48427e96367fbaccab97274a0f0a43c1186381d2c97185c210103dc9d7e9045e42b9b21f7088ad4e696bbb40103df62045e4761a2d2d2dba198045f287f79123477433901af7de7baf79e28927743362acabc2d08bcdefe4dc262e2856ed68cb599e283d280c05638c05ca436108889ee4eb74022fa15cd90f38c456a7b4b55d20881e7b902255555566c78e1dba1980457236f3e9d3a77533901a83070f364b962cd1cd88b1a0c250fb89d366e4b2e69c0250500c5fbad31c3e7e3a673d446941612818632c501e290cc9f1054074245fa7137809e5ca7ec021b63aa5aded0241f4d88314a9aeae364d4d4dba19802567cf9ee58c4ca45efffefdcdaa55ab7433622ca83074facf67ccec97f678b78b7b6efb3eb3bea5f33387e4e70d2d07cc9a5dfbbd02d2fc8dade6fd336772d64394161486f2638c05ca27455579d61080e848be4e27f012ca95fd80436c754a5bdb0582e8b1072952535363366ddaa49b0158226731cb1fde409ac9d8b479f366dd8c180b2a0c494871e8e0b1531daf37fee11fcf1c929ffdf6a3effd99a2d0790a0a43f931c602e593a26a7b7bbb6e061022c9d7e9045e42b9b21f7088ad4e696bbb40103df62045faf4e963d6ad5ba79b0158227f7093b442dac96d4e9b9b9b753362acabc2908e03474f751486e4673d9de87e5018ca8f3116289f7c77dadada7433801049be4e27f012ca95fd80436c754a5bdb0582e8b10729d2af5f3fb37af56add0cc012f9839ba415d28ee453f294521822c20f0a43f931c602e5aba8a830adadadba194088245fa7137809e5ca7ec021b63aa5aded0241f4d88314a9adad352b57aed4cd002c79fdf5d74d6565a56e0652456e57c3c3e19385c250bc82c2507e8cb140f9e4bbb37bf76edd0c204492afd309bc8472653fe0105b9dd2d67681207aec418a0c1c38d02c5fbe5c3703b0446e9f45d20a69c633409289c250bc82c2507e8cb140f9e4bbc36d5e816849be4e27f012ca95fd80436c754a5bdb0582e8b107293278f060b364c912dd0cc092a6a626535d5dad9b81d4e0564fc94461285e4161283fc658a07cf2ddd9be7dbb6e061022c9d7e9045e42b9b21f7088ad4e696bbb40103df62045eaeaeaccc2850b7533004b366cd8606a6a6a7433901a7236725555956e46cc51188a575018ca8f3116289f1486b66ddba69b018448f2753a819750aeec071c62ab53dada2e10448f3d4891fafa7a337ffe7cdd0cc092356bd698be7dfbea662035366fde6c7af7eead9b11731486e2151486f2638c05ca27455529ae02888ee4eb74022fa15cd90f38c456a7b4b55d20881e7b90220d0d0d66eedcb9ba1980252b57ae34b5b5b5ba19488d55ab5699fefdfbeb66c41c85a1780585a1fc186381f24951558aab00a223f93a9dc04b2857f6030eb1d5296d6d1708a2c71ea4c8b061c3ccac59b37433004b962d5b66060e1ca89b81d490e7dec9f3ef902c1486e2151486f2638c05ca27276dc8c91b00a223f93a9dc04b2857f6030eb1d5296d6d1708a2c71ea4486363a379f4d1477533004b9e7efa693364c810dd0ca4c6134f3c61eebdf75edd8c98a33014afa030941f632c50be01030698152b56e8660021927c9d4ee025942bfb0187d8ea94b6b60b04d1630f5264e4c89166dab469ba198025f2cc2f79f61790568f3cf288193e7cb86e46cc51188a575018ca8f3116289f5c6db774e952dd0c204492afd309bc8472653fe0105b9dd2d67681207aec418a8c1e3dda4c9932453703b064ce9c39deb3bf80b49a346992193b76ac6e46cc51188a575018ca8f3116289f5c6db778f162dd0c204492afd309bc8472653fe0105b9dd2d67681207aec418a48f24d927000e261c68c19de2d1e81b47af0c107cd4f7ffa53dd8c98a33014afa030941f632c50bebaba3ab370e142dd0c204492afd309bc8472653fe0105b9dd2d67681207aec418a4c9c38d18c1b374e3703b0446eed28b77804d2eabefbee33b366cdd2cd88390a43f10a0a43f931c602e593db30ce9b374f37030891e4eb74022fa15cd90f38c456a7b4b55d20881e7b9022721b39b99d1c8078983c79b21933668c6e065243ce485eb060816e46cc51188a575018ca8f311628dfd0a143cdecd9b37533801049be4e27f012ca95fd80436c754a5bdb0582e8b107293275ea54ce9c046264fcf8f166c28409ba19488d01030698e5cb97eb6658d2bf7f7ff3c20b2fe8e61c1486e2151486f2638c05ca376cd830aee8052226f93a9dc04b2857f6030eb1d5296d6d1708a2c71ea4c8f4e9d3cdf0e1c37533004be44c6639a31948abbe7dfb9ab56bd7ea6658d2b3674f2f0a1588280cc52b280ce5c7180b944ffe6694bf1d014447f2753a819750aeec071c62ab53dada2e10448f3d481139eb4bcefe02100f23468c300f3ffcb06e0652a3babada6cdfbe5d37c312bf3054a8404461285e4161283fc658a07ca3468df2ee3601203a92afd309bc8472653fe0105b9dd2d67681207aec418acc9d3bd7343434e86600963436369a193366e86620352a2a2acc9e3d7b74332cd185a1a0021185a1780585a1fc186381f2c97369e5f9b400a223f93a9dc04b2857f6030eb1d5296d6d1708a2c71ea4c8934f3e69eeb9e71edd0cc0121eec8bb493a2c391234774332cd105211d7e8188c250bc82c2507e8cb140f9c68e1d6b264e9ca89b018448f2753a819750aeec071c62ab53dada2e10448f3d4891850b179ababa3add0cc092fafa7a337ffe7cdd0ca4c2d9b367730a0f4472421727087b4161283fc658a07c52141a376e9c6e061022c9d7e9045e42b9b21f7088ad4e696bbb40103df62045962c5962060f1eac9b015872d75d7799458b16e9662035a43884f8d0c51f3fa2b8959cfc8e2a11f4da950863bf280ce5c7180b946ff2e4c966cc9831ba19408832bf23b8c095fd80436c754a5bdb0582e8b10729b27cf9723360c000dd0cc012f93e2e5bb64c37038015850a42be720b43f27ba8846ecf374dbf8e533cf5d4531defef17bff845cef4ae228cfda230941f632c50bea953a79a51a346e9660021cafc8ee00257f6030eb1d5296d6d1708a2c71ea4c8ca952b4d6d6dad6e0660897c1f9f7ffe79dd0c0056142a08f9c2280ce92865dea8e3b6db6e331ff9c847bcb8fdf6db73a6771561ec1785a1fc186381f24d9f3edd0c1f3e5c37030851e6770417b8b21f7088ad4e696bbb40103df6204556af5e6dfaf5eba79b0158d2b76f5fb366cd1add0c0056142a08f9c2280ce969fe6b890b2fbcd0dc72cb2de6cd37dfec98dededeee5d1172f5d5579b2baeb8c2dc79e79d66efdebd7997cfb7de8f7ffce3e6d65b6f359b376fce99a697c98efdfbf79b8f7ef4a3e6bbdffdaef9ce77bee3fd2c6d7a1dc5be2ef49e8a090a43f931c602e59b356b9619366c986e0610a2ccef032e70653fe0105b9dd2d67681207aec418aac5bb7cef4e9d3473703b0a4a6a6c66cdcb851370340ac455918925bb52d58b0c0fbf9dffffddf3ba64bd25fda9e7bee39b375eb56efe76f7deb5b39cb3ffef8e3e6cc993339dbdbb56b9737fdc61b6f2c7a19899933677af3c8ede4fcf7f5d8638f755ac745175d94b3cea0d7d991ef3d15131486f2638c05ca3767ce1cd3d0d0a09b018428f33b820b5cd90f38c456a7b4b55d20881e7b902272066aefdebd7533004baaabab4d5353936e0680588bb23074fcf87173ecd831efe72bafbcb263fa273ef1898e79fcb8e4924b72963f71e24447db8b2fbe686ebef96673d96597754ccf57c4c95e46875cd173f9e5977bef49427efec637bed1691d175f7c71ce3a835e177a4fc50485a1fc186381f2cd9b37cfd4d7d7eb660021cafc1ee00257f6030eb1d5296d6d1708a2c71ea488fc712c7f24038887caca4ad3dcdcac9b0120d6e25018baeaaaabbcb6b6b6b69c75e55b9fc4a73ffd69af6dcb962d5ef147cfa35febd8b3678f775b3b7f3e3fa4cdbfcd9dbcf60b3bf2def53af5eb42efa998a030941f632c503eb922b2aeae4e37030851e6770017b8b21f7088ad4e696bbb40103df6204576ecd861aaaaaa7433004b2a2a2abc44230024499485a1ec5bc9fde0073fe8982ecf439236b9d551be2b7cf4fa24fc62d2a64d9bcc8c193372e6d1af754c9c38d19bdeb367cf8eb61ffef0875edb430f3de4bd96671ec9eb975f7ed9bb259d5ea77e5de83d15131486f2638c05cab778f1623364c810dd0c204499df015ce0ca7ec021b63aa5aded0241f4d88314696969f1ce9e04100fbd7af5f2ce76078024e96e614847f6b47cf3ca15395ffdea57cd1b6fbcd131fdc89123e6eebbef36d75e7bad77854ed0f2d9db5fb26489b9e69a6bf26e3f6899ecf8c217bee04dffd5af7ed5d1b672e54aafed8b5ffca2f75a9e3dd4a3478fa2b751e83d15131486f2638c05cab774e9523368d020dd0c204499df015ce0ca7ec021b63aa5aded0241f4d88314696d6df5ce9e04100f72d6b92437012049ca2d0c11e10485a1fc186381f2ad58b1c2d4d6d6ea660021927c9d4ee025942bfb0187d8ea94b6b60b04d1630f5264dfbe7dded99300e241be8fa74f9fd6cd00106b1486e2151486f2638c05cab76ad52aef969d00a223f93a9dc04b2857f6030eb1d5296d6d1708a2c71ea4c8e1c387290c013171f6ec59ef6c6600481a0a43f10a0a43b9186381ee59b3668de9dbb7af6e061022c9d7e9045e42b9b21f7088ad4e696bbb40103df62045e4e1ccfc910cc4839cc54ca116401251188a575018cac5180b74cf860d1b4c4d4d8d6e061022c9d7e9045e42b9b21f7088ad4e696bbb40103df6204524794061088887f6f6769256001289c250bc82c2502ec658a07bb66cd9627af7eead9b018448f2753a819750aeec071c62ab53dada2e10448f3d48190a43403cb4b5b591b40290481486e21514867231c602ddb37dfb76535d5dad9b018448f2753a819750aeec071c62ab53dada2e10448f3d4819290c491201805dafbffebaa9acacd4cd00107b1486e21514867231c602ddb373e74e535555a59b018448f2753a819750aeec071c62ab53dada2e10448f3d4819290cc9b38600d8d5dcdc4cd20a402251188a575018cac5180b74cfeeddbbf90e0111937c9d4ee025942bfb0187d8ea94b6b60b04d1630f52460a4372df750076353535718b0e00894461285e41612817632cd03dadadada6a2a24237030891e4eb74022fa15cd90f38c456a7b4b55d20881e7b903272bf75b9ef3a00bb366cd8606a6a6a743300c41e85a1780585a15c8cb140f7f09c2e207a92afd309bc8472653fe0105b9dd2d67681207aec41cac8995f72061800bbd6ac5963faf6edab9b0120f6280cc52b280ce5628c05ba47ee3021779a00101dc9d7e9045e42b9b21f7088ad4e696bbb40103df62065e45ed12d2d2dba1940c456ae5c696a6b6b753300c41e85a1780585a15c8cb140f7c83369290c01d1927c9d4ee025942bfb0187d8ea94b6b60b04d1630f52a6aaaacaecd8b143370388d8b265cbccc08103753300c41e85a1780585a15c8cb140f7c8b185c210102dc9d7e9045e42b9b21f7088ad4e696bbb40103df62065e441bcf2405e00763dfdf4d366c89021ba1900628fc250bc82c2502ec658a0fb280c01d1927c9d4ee025942bfb0187d8ea94b6b60b04d1630f52461ec4bb69d326dd0c2062f3e7cf37f5f5f5ba1900628fc250bc82c2502ec658a0fba43024c71800d1907c9d4ee025942bfb0187d8ea94b6b60b04d1630f52a64f9f3e66ddba75ba1940c4e6cc99631a1a1a743300c41e85a1780585a15c8cb140f7f5ead5cb7bd610806848be4e27f012ca95fd80436c754a5bdb0582e8b10729d3af5f3fb37af56add0c20623366cc308d8d8dba1900628fc250bc82c2502ec658a0fbe48aa1f6f676dd0c202492afd309bc8472653fe0105b9dd2d67681207aec41cad4d6d69a952b57ea6600119b366d9a193972a46e0680d8a33014afa030948b3116e83eb962a8adad4d37030889e4eb74022fa15cd90f38c456a7b4b55d20881e7b903203070e34cb972fd7cd00223679f2643366cc18dd0c00b14761285e41612817632cd07d151515a6b5b55537030889e4eb74022fa15cd90f38c456a7b4b55d20881e7b903283070f364b962cd1cd0022367efc783361c204dd0c00b14761285e41612817632cd07d95959566f7eeddba194048245fa7137809e5ca7ec021b63aa5aded0241f4d88394a9abab330b172ed4cdc8d8b76f9fd9b66d9b59b76e9d976821a20df9dc376dda948ab313e54c6639a319e9c1f185e82a9274fc93f7ab8b1384bd90ff0f74c6180b749f14869a9b9b7533809048be4e27f012ca95fd80436c754a5bdb0582e8b10729535f5f6fe6cf9faf9b613e4cda6edcb8d11c3a74c8bcfffefb39891722fc90cf5d3efff5ebd7272239da1d23468c300f3ffcb06e86a338be10852249c73f0a43f10a0a43b9186381eeabaeae36dbb76fd7cd004222f93a9dc04b2857f6030eb1d5296d6d1708a2c71ea44c434383993b77ae6ec6397226bf24e574c285883e0e1e3c685e7ae925fd5fe494c6c6463363c60cdd0c47717c218a8d241cff280cc52b280ce5628c05ba4f0a43f2fb0b806848be4e27f012ca95fd80436c754a5bdb0582e8b10729336cd830336bd62cdd8c73e4363e9cc91f8f90ff07d7135d43870e35b367cfd6cd7014c717a2d848c2f18fc250bc22eefdc506c658a0fb6a6a6acc860d1b7433809048be4e27f012ca95fd80436c754a5bdb0582e8b107292367503efae8a3ba19864457dcc2f54417b7754c178e2f442911f7e31ffd395e11f7fe6203632cd07d7dfbf6356bd6acd1cd004222f93a9dc04b2857f6030eb1d5296d6d1708a2c71ea4ccc89123cdb469d374334cf189ae53c70f98bdbffdb9796ded042fe46769d3f311dd0bd7135d77dd759759b468916e86a338be10a544dc8f7fc5f667229a887b7f095b5b5b9bd9bd7bb7173ec658a0fbfaf7ef6f56ad5aa59b018444f2753a819750aeec071c62ab53dada2e10448f3d4899d1a3479b2953a6e86698e2125d278fbd635efd9f1f9b9dffddd829a44da6e9f989f2c3f544d7800103ccb265cb74331cc5f1852825e27efc2ba63f13d145dcfb4bd8e416c93d7bf6cc1bbd7af532959595a6aaaaca2b2001289efcaeba62c50add0c202492afd309bc8472653fe0105b9dd2d67681207aec41ca8c1d3bd64c9a344937c31497e87afbb55fe5246dfd687bedf99cf989f2c3f544576d6dad79fef9e775331cc5f1852825e27efce39959f189243c932a6ca74f9ff60a40ba28941d23468cd08b012860e0c08166e9d2a5ba194048245fa7137809e5ca7ec021b63aa5aded0241f4d88394993871a219376e9c6e86292e71fb87f5ff9993b0f543a6e9f989f2c3f54417f76d4f178e2f442911f7e3dfa64d9bcca1438772de37117dc855302fbdf492fe2f4a9d871e7a28a718941d5c2d04946ec8902166f1e2c5ba194048245fa7137809e5ca7ec021b63aa5aded0241f4d8839491dbc8c9ede490ab98c4edabbf1e9793b0f543a6e9f989f223ee89d1eeaaa9a9311b376ed4cd7014c717a29488fbf1afb5b5d5ac5fbfde1c3c78902b872c857cee52ec58bb76adf7ff9176ededed81570dc94951004a57575767162e5ca89b018444f2753a819750aeec071c62ab53dada2e10448f3d4899a953a79a912347ea661812b7718bb82746bbabbabada343535e966388ae30b514a24e1f827c508b95245de2b6127e4f3a728f40fa3468dca290a49b1e8d8b1637a560045a8afaf37f3e6cdd3cd004222f93a9dc04b2857f6030eb1d5296d6d1708a2c71ea4ccf4e9d3cdf0e1c375334c7189dbd7d64ec849d8fa21d3f4fc44f921ff1f2e938761373737eb66388ae30b514ab87efc03c22045325d189a3973a69e0d4091860e1d6a66cf9ead9b018444f2753a819750aeec071c62ab53dada2e10448f3d489959b3669961c386e96698e212b77bb6ccca49d8fa21d3f4fc44f9e17a62b4a2a2c2ecd9b34737c3511c5f8852c2f5e31f10968686868ea2909c8021df2700e591bf19e56f4700d1907c9d4ee025942bfb0187d8ea94b6b60b04d1630f5266eedcb9de1fcdc8554ce2f6c83bcde6d535637392b6d226d3f4fc44f9e17a62546e6fc3c3b0d383e30b514ab87efc03c2b27dfbf68ec2d0cf7ef6333d194009e42e1372b70900d1907c9d4ee025942bfb0187d8ea94b6b60b04d1630f52e6c9279f34f7dc738f6e86292e712bf1d6f68539895b69d3f311dd0b9713a3efbefbae97b43a72e4889e0447717c214a09978f7f40d8060c18e08db1ededed7a128012c873bbe4f9b400a221f93a9dc04b2857f6030eb1d5296d6d1708a2c71ea4ccc2850b4d5d5d9d6e862932717be68cd9b375764ee256da645acefc44d9e16a6274c68c19e6a28b2ef29256a74f9fd693e1288e2f4429e1eaf10f089b8cb13d7af4608c05ce83d1a3479b2953a6e8660021917c9d4ee025942bfb0187d8ea94b6b60b04d1630f5266c9922566f0e0c1ba19a670e2f6e4b177cc1b5b1ecb49dafa21d3641ebd1c515eb89818f58b4277dc7187f9d18f7ee4bd463a707c214a09178f7f40d8186381f36becd8b166e2c489ba194048245fa7137809e5ca7ec021b63aa5aded0241f4d8839459be7cb9778b0de40a4cdc9e39630eec79c9ec7a71544eb25687cc23f372767ff7c3b5c4a89fb0f21355fa35dcc6f18528255c3bfe0161d363aa7e0da07452141a376e9c6e061012c9d7e9045e42b9b21f7088ad4e696bbb40103df6206556ae5c696a6b6b75334cfec46da1b3f88382b3fbbb1f2e254683125441ed700fc717a29470e9f807842d682c0d6a07509cc993279b3163c6e8660021917c9d4ee025942bfb0187d8ea94b6b60b04d1630f5266f5ead5a65fbf7eba19267fe2b698b3f8834296d5eb238a0f5712a385125385a6c30d1c5f8852c295e31f10b6426368a1e900824d9d3ad58c1a354a37030889e4eb74022fa15cd90f38c456a7b4b55d20881e7b9032ebd6ad337dfaf4d1cd30f913b73a195b6ae8f511c5870b89d1621352c5ce87e4e2f84294122e1cff80b0153b76163b1f80cea64f9f6e860f1fae9b018444f2753a819750aeec071c62ab53dada2e10448f3d4899cd9b379bdebd7beb6698fc895bc25e243d315a6a22aad4f9912c1c5f885222e9c73f206ca58e99a5ce0fc09859b3669961c386e9660021917c9d4ee025942bfb0187d8ea94b6b60b04d1630f52a6a9a9c9545757eb661812b7718b242746cb4d4095bb1ce28fe30b514a24f9f80784addcb1b2dce580b49a33678e696868d0cd004222f93a9dc04b2857f6030eb1d5296d6d1708a2c71ea4cc8e1d3b4c5555956e8621711bb7486a62b4bb89a7ee2e8f78e2f8429412493dfe0161ebee18d9dde5813499376f9ea9afafd7cd004222f93a9dc04b2857f6030eb1d5296d6d1708a2c71ea44c4b4b8ba9acacd4cd30246ee316494c8ce6b8a05bd100008000494441544b389d3d7bd6cc9c39d3dc7cf3cde6b2cb2e33175f7cb1f74bbffc2bafa55da6cb7c5dad07c9c6f18528259278fc03c2966f6c648c05c2b360c102535757a79b018444c62f95bf4b2a57f6030eb1d5296d6d1708a2c71ea44c6b6baba9a8a8d0cd30246ee316494b8ce64b34fde77ffea7b9f4d24bfd5ff2bb0c994fe6ef6a7d482e8e2f442991b4e31f10b67c6322632c10aec58b179b214386e8660021c98c592e70653fe0105b9dd2d67681207aec41caecdbb7cff4ead54b37c390b88d5b242931aa134cf2fe6fbae9a69cc4543121cbc9f2f9d68be4e2f8429412493afe0161d363a17c47186381f02d5dbad40c1a34483703084966ac72812bfb0187d8ea94b6b60b04d1630f52e6f0e1c314860290b88d57242531aa134bf2deafbefaea4e89a80b2fbcd07ce94b5f32d3a64d334d4d4dde7cf2afbc9676999e3dbf2c2febc9b77e2413c717a29448caf10f089b1e03e5fbc1180b4463c58a15a6b6b65637030849669c72812bfb0187d8ea94b6b60b04d1630f52e6c48913a667cf9eba1986c46ddc220989d17c09257d16f375d75d675e7bedb5aca572c974992f7b39598f2fdf76902c1c5f88522209c73f206cf9c63ec658203aab56ad32fdfbf7d7cd00429219a35ce0ca7ec021b63aa5aded0241f4d8839491841385a1fc48dcc62be29e18cd974892e717c871d68faf7ffdeb594b1426f3672fcff310dcc1f1852825e27efc03c2966fcc638c05a2b566cd1ad3b76f5fdd0c202499f1c905aeec071c62ab53dada2e10448f3d4899b367cf7a8521b99d5c7575b57716585d5d9d193e7cb8993871a299356b96f7a051f943a0b9b9d9b4b7b7eb5524cee38f3f6e366cd8a09b7390b88d57c439319a2f8124dfad8f7dec631d0927393bb91cd96735cbfa64bdbe7cdb4532707c214a89381fff80621c3c78d04c9830c1fbb754f9c63ac658207af2f7534d4d8d6e061092ccf8e40257f6030eb1d5296d6d1708a2c71ea490fc11dcd6d6e6dd7f5d6e11f0f39fffdc4c9f3edd8c1d3bd60c1b36cc0c1e3cd83b3bacaaaaaaa388545151e1fd613060c00073efbdf79a071f7cd0fce4273f314f3cf18459be7cb9d9bc79b3d9b3678f397dfab4de9c7577df7db7b71f8d8d8d5d16ba48dcc62ba2488cfee94f7f32afbffeba6eee5250e268e6cc991dc926799ec1ae5dbb3a4d2f962c97fd3c04596fb6a0ed23de38be10a54414c73f204c5210f27f871c356a9479ebadb7f42c79058d718cb140f4b66cd9627af7eead9b0184243336b9c095fd80436c754a5bdb0582e8b10728488a3d52f491e28f1481a418244521290e4991488a45523492e2912400242a2b2b4d9f3e7dbc22d37df7dd67c68d1b671e79e411af0825c528294a4971ea830f3ed09b3befe4a1a9929cf01314fff55fffa567f190b88d57449118953321a55f0c1932c4ac5ebd5a4fced155c2e8e69b6fee4834c9c3aebb4396f7d725ebd5ba7a1f8856b1c5708e2f442911c5f10f08d39123473a7ef7f27fff92df07e56af4205d8d6d8cb140f4b66fdfeedd610240343263930b5cd90f38c456a7b4b55d20881e7b80f34e9201f287ffdab56bcd92254bbcdbd34d9a34c9bb5d9ddcb64e6e5f277f644892208adbdac9bab3931312fdfaf533bffbddef3acd47e2365e11456274c78e1d9dfa85f495b973e7e64df6174a145d76d9651d89a6ece7169423fb390ab2de7c0abd1f4443aeacfce94f7f9ab7cf64e3f8429412511cff8030c93151ffeee587fcaeb76ddbb64ef3171ad3186381e8eddcb9d3fb3d0740343263930b5cd90f38c456a7b4b55d20881e7b00aba2b8ad9dccaf93127e8c1933c69c3871c29b8fc46dbc228ac4a8dc4a4ef709bf9f491f94e9a29804d1c5175fdc9168fafdef7faf27974496f7d725eb0d52ccfb42b8fc02b71c67a4982d7d371f8e2f442911c5f10f08935c11aec7561d03070ef44efe29662c638c05a2b77bf76eef2e1000a291199b5ce0ca7ec021b63aa5aded0241f4d803244a39b7b5d389081d32afdc5ece95c4ad7ccf25747bd2228ac4a81405757fd021b799bbeaaaabcc1d77dca117efc4ffdc254e9e3ca927974496cf5e5f57befffdef7b89ab77df7d574f4204f4314612284f3ef964a7079a0b578e2f443411c5f10fee91be23e39a5c612d27ddb4b6b67a895d39eb5f6e0925cf0b915ba84a31464ec659b1628559ba74a97775f682050bccbc79f3cc9c3973bc22b79ca43375ea543379f264ef2a6e395962f4e8d1def382e4ca6e397967e8d0a1a6bebedebb0248c64a29f4c8ef617205b89cd4a3c7d37cf11ffff11fe69ffee99fbcb1ac2b36c7d81ffde847de7bcd3e11408ef572d2925c692cb74e96fd95fd96cf404e6a92cfe49e7beef13ea3fbefbfdf8c1c39d2fbfcc68f1f6f1e7ae821ef4a53f98ce5b3962b95e5c4a8458b1679ff1f2b57aef46e6fbb6edd3aefff4cfeefe4ca79f9fd57fe5fe5ff57f6418f33c0f926c710e9ef00a29119975ce0ca7ec021b63aa5aded0241f4d80338ed0f7ff8434e12223bfce2914494895bf92ee60b3d5f39713ed76533ce5762541227727b43f9e356922b92689164d8c2850bcde38f3f9ed32782e2873ffca197c40962f36c66fd5e25e40f799dbcca4e60c9ed14e5f95b92c41b346890b9ebaebbbc449624f924912549bfc6c6463362c408aff0fae31fffd84b68c96d21a74c99e2250ce5f390f7209fa31469e7cf9fef7dae720bc965cb96799fb3241fffe77ffec7fbdca5a0fbf2cb2f7bb7719424d7ebafbfeefdbf48a2ebf0e1c3e6d8b1635ef13749c92e5d18f2433e6bf91c7c511e5f88e4c7f93afea174f2f9c7a9b82227bbf8c76f399e4bf827bfc8b126e818e45f619d3d06c843e4657d7e1143c60039fecb76fde37f434383f7bee4fdc9fb942babe53991f2feb38ffdb27fb367cff6f6578efbb2fff239f8c77df97cf47bf243de8f2c279fb37cdec55c9963738c957fdf7fff7def778983070f9ab7de7acbb4b4b478b7a395312dbb3fc8494b72ec97cf444e3a92f171e6cc9966dab469dee73761c204ef339571d5ef03f299df7df7ddde382cff1ff2ff2263b48cd7f27f26ff77f29965ffbfebff6b3ffc3e22cbc8ffb5ac43d6e58ff5f27f9d3dce3ff0c0035e9ff4ff8fe5367b0f3ffcb0b7cfd28ffdffdf679e79c63cfbecb3de3ecaada2376edce85ded2fdf0bf97ec815d6f2d9c8382effa770831c03a55f018846666c72812bfb0187d8ea94b6b60b04d1630fe03449e2e83fa025e48f65f963ddbf8d9c8832712bdf4509dd7e3e22cc754719f2ffd1554147925352a890b37025c1210915497c48124412223a8122affdc288245d240926cbe9be919d6891e48d243ce47d4822acabc495ede71fc867266710fb892b49d2c8d9c592bcf2139af24c074960495247ce4696b39225d123c93c3953d94f6a4ab24f927e8f3efaa8972092339b25b129092d9dd894e2917c8e72c59e9fdc94b3a5b3939bf9125c7e922bfbea3e3fb2ff0fb27ff6e7f797cf4e7cf9894ed966f619db926c93f7e69fb5ed273b651f645f649fe4ec6db9f250f655f6393be12967713ffdf4d35e524c127efe99dcf219ca67a9fb8d0e797fb24c94c71722f991f4c290ec03c595f3535c91cf498eddfe5523f239fa0575f97cfde24a1ce9cf553e473989205ff15f8f699aed3136aee4967dd207e4e48a7dfbf679275c483f91feb269d326ef772719b3fcef988c677212873fce3ff2c823def827277d481f9582959c102263bbf4e3ec713ddf774abe17f2ffdad518aebf47fe7728fb0415fffb23e3f57df7dde76d5fbe3bfe4929f2fdf7bf373ffbd9cfbc7e24e3b37c67fcb1594e42f1bf2f72028afcfee37f57e477a3a49d781207728c91ff4300d1c88c4d2e70653fe0105b9dd2d67681207aec019cf6c20b2f74fa0355fed0d40f3cf64599b895efa2846e3f70e080f9d8c73e663ef7b9cf993367ce786df2ef673ffb592f792109ffece53ffef18f9b5b6fbdd5bb122368dd855e17bbbe7ccb8515b2cf924490ffb7a0828e148424a92f67e14aa148926a92f8902488244424192089804249004954e864a024f3e4b3d6ba4a14dd7cf3cd1d9fd197bef4253db924b2bcbf2e59afd6d5fb7085fcbf4912273bb92c6769fb492f49fac899da92f85abf7e7da704b35cade49fb12d89234920491f79ecb1c73a92cc929c954498249c24692b89663f19962fd1ec17bbfc33b92531267d52f79da088f2f842243ffcfe427185e24a9265f70129bacb55375de96a6c638c4d167f0c97dfc3fce397146a64ecf64f529142cef3cf3fef1576fce3968cd752f891fee21fb3e4773d2910f9c72b291c4901494efc9063861ca7fcb15917acf44942fad8e41f9fb28f4dd9c7a5ecdb02ca3129fb4a6a391ec9ef11525893029bfc8e21c72229bcfde217bfe8380ec9df22f2bba9fcbe225759f9574ccb093c52d08bf3f1c7bfe532806864c62617b8b21f7088ad4e696bbb40103df6004e932491246fe5feed85ee491f65e256be8bf942a649724c7e96b31fe5b5fc5129afe58f53bd9e5dbb7679d36ebcf1c69c7567bf960447d0f462d7278975bf58154548322f0a9208f09304925c905bc37425286124b78af13fab0b2fbcd0fb2ccb21cbc9f2feba64bdd982b68fe849d24b279afc90445276113acae30b91fcd0894c8a2b4822e9ab724566f6d5d985048d718cb1385fe438257dd2bfba5a8a34527097a28d9c18255704fbc576b95a588e89f2ec4029b44bbf90ab8be5aab3ec22bbdc924fae4af60becfe6d01fde2bafc2de217ad74613ddff13efb98ef1feffddb02cab15e0af7b20dffaa687d9c97629a14d5e4e429e9e3f23bbcdcdad0bfddaf14e3b28fed72a28dfcfe2bc53b390967fffefd5e518fc21010adccd8e40257f6030eb1d5296d6d1708a2c71ec069a524a9a24cdcca775142b74bbcf6da6b5e52e23bdff98ef7fadbdffeb6f75afe5893d72fbef8a277866bf66d55ba2afcc8cf720ffda0e9c5aecf4ffa451551dd4a4992aa92bc925baa152b5fe248ce8e95abbdfccfebbaebaecb5aa278b29cbf0e595ff6154ff9b60b7be4590aba202449a17cc5c5288f2f44f223aae31f10a6520a42d9f28d758cb1709df4453989cdbf4a546e07fceaabaf765c212a5747fbb701962ba3e516c0fe55d1d957864a31d6bf1a5aaeaef70b5672d553f6ed7efdab41fd5b30ebabacb20b5600a291199f5ce0ca7ec021b63aa5aded0241f4d8032023cac4ad7c172574bb1f77dc71877746ab9cad28ffde79e79d1dd33efde94f7bcbca1f899274d1ebcaf7da2ff41c3f7e3c677aa9eb8b2aa24a8cca2d3e647ba5ca9740ca7e6e81c4d7bffef5ac250a93f9b397cf7e8e42beedc12eb9058c9f3491b38525891324ace38bfe7eead75d4529f3da8cb0df67d8eb0f8aaeb61bd5f10f88ab7c631e632c00c06599f1c905aeec071c62ab53dada2e10448f3d0032c24adce60bf92e4ae8763fe4bdc8f4cb2fbfdcfb576e6be14fbbeaaaabbc36b957b92430f4baf4ebabafbeda7b2db789905b49e8e9a5ae2faa484262345f22e9a69b6eeaf8cc24e4ec64b90aac2b323dfb2c6609598f2fdf76609f9cd52bcf3d90337b0b093abec8f7f22b5ff98ab9e4924bbc677cc9b32ff43c5d85fe7eead75d859e57bf3e9ff1d4534f75ac5f9ebda0a77715dd795f5ff8c217bc65e576397e9b5c25296d5ffce2178b5e7f31f3941a5dad3309c73f206cf9c63ec6580080ab3263940b5cd90f38c456a7b4b55d20881e7b006404256ec308f92ee68bec79befce52f7b6df26f76bbdc1bfc9a6bae095c56bf96846c8f1e3d02e72f757d51455212a33aa124efdd2fc6f921577d49c25feef52ef7b017f2afbc96f6ece71d48c8f2b29e7ceb4732051d5ffc24a73cd760efdebdde3308f43c5dc5f9fc7e9ecf75e9b8edb6dbcc473ef2112f6ebffdf69ce95d4577de973c034296955be8f86df2fc076993dbede8f983a23bef2128ba5a67528e7f40d8f41828df0fc65800808b32e3940b5cd90f38c456a7b4b55d20881e7b006404256e093b91a4c4a84e2cc9fbd76735171bb29c2c9f6fbd48aea0e38bffcc0c7986809e26210fc796fbfe7fe2139ff042eeff2f6dfe74bfdf04bd968747cb3305e496917e7234dfbcba1fe69b4fae68baf5d65bbd22969ea697c90e7988f5473ffa51f3ddef7ed77b769afc2c6d7a1dc5be2ef49eb2436eef27fbfdb9cf7daea34d7e96b637df7c33effaf53ee58bae962bf67de69bdf8f241dff80b0e9b150be238cb10000d764c62a17b8b21f7088ad4e696bbb40103df600c8084adc1276226989d17c0926797ec1a5975e9a9398ca17321fcf3b7057d0f1e5dbdffeb6f7ff2f57d27ce31bdf3093274f36478f1eed982e4521992eb75f5bb06081f7b3b4f9d3fdfe13f45a1e2e2daf870f1f6ede7befbd4edbd6f3ead73a76eddae54dbff1c61b739691db549e3973266719899933677af3c8d58bfe3e3cf6d8639dd6217d5daf33e87576e47b4f3aa42023f33437379b9d3b777a3fcb671db4fe7cfba4e7f1dbba7adfd991ef7d76357fd28e7f40d8f28d898cb100009764c62c17b8b21f7088ad4e696bbb40103df600c8084adc1276228989d17c89a6b367cf7a89f19b6fbed95c76d965e6e28b2ff67ee9977fe5b5b4cb7499afabf520d9828e2fefbefbae19316284f9d77ffdd78e04a6148bfce9fff22fffe2b51d3f7edc1c3b76ccfb59ae1cf2a7fbcb04bdf69f2176e8d0a19c6deb79f56b09791e8fdf77fde9f98a21274e9cc859bf1f529891e7a5c9fb97909f756146be0f7a9d41af0bbd271d7e61ea273ff9899932658af7b32e4ce5db5ef63ee979fcb6aede77a1f7a9e7cf8e241eff80b0e51b1b19630100aec8fc6ee80257f6030eb1d5296d6d1708a2c71e001941895bc24e243531dadd84537797473c15737c9142828cd3727b39bfcd7661486e41276d5bb66cf10a257a1efd5a877f2b377f3e3ff4addcfc8289eca75ea77e5de83de9f06f65f7cd6f7ed32b48957a2bbbaedaba7adf85dea77e9d1d493dfe0161ebee18d9dde50100084be6774317b8b21f7088ad4e696bbb40103df600c82826714b4417494e8c969b782a7739c45fd0f1e5dffeeddfbc69f22ca0b56bd77a7f10de72cb2d1dd3cfd7ade4e4aaa442b792fbe77ffe67eff55b6fbdd5d1e61796366ddae4f54bbd8c7ead63e2c489def49e3d7b76b4fdf0873ff4da1e7ae821efb5ff20f9975f7ed9bb7d9b5ea77e5de83de58bdb6ebbcdbb8240e2f6db6fef344d2faf5f4be4fb6c0abdef42ef53bfce8e241fff80b0953b5696bb1c000051c8fc6ee80257f6030eb1d5296d6d1708a2c71e00194189dbf311f2ddf3436ea3f4b5af7d2df061e9c48791f4c468a909a852e747b2041d5fbefbddef9a4f7dea53e6924b2e31575c7185572892e7e0f8d30f1e3ce81582e4ca2189caca4aafcd9fee1f57825e4bc1a9aeaecedb867fe54ed0bc729b35ff0a25bf7dc99225e69a6baee9740ceb6a1d3abef0852f78d37ff5ab5f75b4ad5cb9d26bfbe217bfe8bd96670ff5e8d1a3e86d147a4ff962e1c2851df3c9cfd9d3f4f2fab544becfa6d0fb2ef43ef5ebec48faf10f085ba96366a9f3030010b5ccef862e70653fe0105b9dd2d67681207aec01901194b83d1f21df3d09f95912a4f2f30d37dc90331ff18f7021315a6c22aad8f9905c611e5f08f7c285e31f10b662c7ce62e70300c0a64ccec005aeec071c62ab53dada2e10448f3d0032c24cdcca774f427e3e79f2a4f7f3a5975eda31bdbdbddd0c1830c0bb35915c3570e79d779abd7bf7764cf7cffa976756143aeb3fe87576fbd2a54bcde73fff79ef591b7a7eff0a05798e8984be42a1ab65cf67b892182d94902a341d6e08f3f842b817ae1cff80b0151a430b4d0700202e327f5bbbc095fd80436c754a5bdb0582e8b107404698895bf9ee49c8cffe1543d9cfb9e8dbb7afd7f6dc73cf99ad5bb77a3f7feb5bdfea98ee3f2764f8f0e1799f1322498f7cdbca7e2dcfc03873e68cd726cfbe90c2ce0b2fbcd0695d12859e69d2d5b2e7335c4a8c0625a682dae19e308f2f847be1d2f10f085bd0581ad40e00401c65fe6e77812bfb0187d8ea94b6b60b04d1630f808c3013b7f2ddcb8eebaebbaed343cce5ca1c3d8f3c73c49fee3fc4fcd0a14379d72d0f54d7dbd2af4f9c38d1d126cf1b91b6ebafbfde0c1d3ab4d3d549fe73348e1f3f6e8e1d3be6fd2cefaf9865cf67b89618d5092afd1a6e0bf3f842b817ae1dff80b0e93155bf060020ee327fb7bbc095fd80436c754a5bdb0582e8b107404698895bf9ee49c8d53ef5f5f5decfd95704f9859fb6b6b69c65b3a7071586fc2b86a498e36f4b6f3b7b99575e79c5fce0073fe8b81ddc4d37ddd431ad5061a8ab65cf67b89818f51355dffffef74958a54c98c717c2bd70f1f807848d311600906499bfdb5de0ca7ec021b63aa5aded0241f4d8032023ccc4ad7cf724e46729b6f85708f9b763f36f15d7d0d0d0e9ca1e3ffce923468cc8b9959c3c9748a6bdfcf2cbdeede2b2b7a5b7ad63f3e6cddeb44f7ef2931d6d856e25d7d5b2e7335c4d8cfa89ab9e3d7bea49705898c717c2bd70f5f807844dc658b98a5a4ebe01002049327fb7bbc095fd80436c754a5bdb0582e8b107404698895bf9ee49f8af274c98e0bdfee637bfe9bd3e72e488b9fbeebbcdb5d75eeb150df4fc32bdaeaecebb8ddb85175ed869da534f3d657af4e8d1b18c5e56bfce6e93ab7e6eb8e106efb947feb483070f7a8520b97248a2b2b2d26b2b66d9f3192e2746df7df75daf3024fb897408f3f842b8172e1fff80b0c9731b196301004993f93bdb05aeec071c62ab53dada2e10448f3d003248dcc62b5c4f8c4ad24aae0e433a707c214a09d78f7f4058e4ea69195f25e6cf9faf270300105b92afd309bc8472653fe0105b9dd2d67681207aec019041e2365ee17a62b457af5ee6f0e1c3ba198ee2f8429412ae1fff80b0c8d5d77e6148ae7efee0830ff42c0000c492e4eb74022fa15cd90f38c456a7b4b55d20881e7b006490b88d57b89e1895c2d0be7dfb74331cc5f18528255c3ffe0161686969e9280af9317bf66c3d1b0000b124f93a9dc04b2857f6030eb1d5296d6d1708a2c71e0019246ee315ae27462b2a2acc9e3d7b74331cc5f18528255c3ffe0161b8fffefb730a4332d69e3e7d5acf0a0040ec48be4e27f012ca95fd80436c754a5bdb0582e8b107400689db7885eb89d1caca4aefec66a403c717a29470fdf8079c6f7ffad39f728a427e3cfcf0c37a7600006247f2753a819750aeec071c62ab53dada2e10448f3d003248dcc62b5c4f8ccab30f76ecd8a19be1288e2f4429e1faf10f38df1e7cf0c19c82901f72ebd663c78ee945fe7ff6ee3d48abea4afc7ea971ac8aa30ca3821549a492aaa92993aa4c4a61669ca46a2649cd48a692fc31a98c5c452e022a8a171445b9a9a85143c02ba2888812d41044412528de1082282328515430820d846ba32891c07edf75c2797e4fafe739f4e574f73a7b3ddf4fd5aaee679ff39cddbbddf66af6ea7d0e00008522eb757a012f525ec60147ac26a555bf40169d7b001cc2c26db1c2fbc268dfbe7dc3f2e5cb75339ce2e70bd19cf0fef30f684ddbb76faf2806e9983061827e1b00008522eb757a012f525ec60147ac26a555bf40169d7b001cc2c26db1c2fbc2e839e79c135e7ae925dd0ca7f8f9423427bcfffc035ad3f5d75f5f51082a0fb975abfc3106bb8600004526eb757a012f525ec60147ac26a555bf40169d7b001cc2c26db1c2fbc2e8b9e79e1b162f5eac9be1143f5f88e684f79f7f406b92e70bbdf3ce3b0d0a3fe45800406c64bd4e2fe045cacb38e088d5a4b4ea17c8a2730f804358b82d56785f181d38706058b870a16e8653fc7cf973d8b4695358ba74693870e0403878f06058bf7e7df2d7fcfdfbf70f975e7a69983e7d7af8e28b2f2ade578be1fde71fd0d6c8b10080d8c87a9d5ec08b949771c011ab4969d52f9045e71e0087b0705bacf0be303a68d0a0306fde3cdd0ca76af9e7cb6bafbd16c68c1913860d1b1666cd9aa5bf3561dfbe7d49d1e8fdf7df4f5e4bd1e8bdf7de0b2b56aca8b856ad84f79f7f405b23c702006223eb757a012f525ec60147ac26a555bf40169d7b001c52cb0bb7450cef0ba3e79d775e78ecb1c774339caac59f2ffbf7ef4f76074d993225fcfef7bf0f9f7cf24932e7e5591fddba750b5dba7449fe012c1fe5b5b4cbf14f3ffd34ac5bb72e8c1c39328c1b372e291ae96b7b0fef3fff80b6468e0500c4467e2fd60b7891f2320e38623529adfa05b2e8dc03e0905a5cb82d72785f1895dd138f3cf2886e8653b5f6f3458a3b2979eec7a851a342870e1dc259679d15eebdf7de6417d1c68d1b93e3f2515e4bbb1c97f3e4fc9d3b7786a79f7e3a59e0ddba756b451f9ec3fbcf3fa0ad91630100b191f53abd8017292fe380235693d2aa5f208bce3d000ea9b585dba287f785d10b2eb820cc98314337c3a95afaf9f2fcf3cf27b78e138f3ffe78e8d4a95352dcd9bc79b3faae5427e7c9f9f23e79ffeeddbb939d47ba1fcfe1fde71fd0d6c8b10080d8c87a9d5ec08b949771c011ab4969d52f9045e71e0087d4d2c26d0ce17d61f4a28b2e0ad3a64dd3cd70aa567ebe2c5fbe3c5990adabab0be3c78f0fa79e7a6a78e38d37f4b7a349e47df27eb98e3c77e82f7ff94bd8b66d5b459f1ec3fbcf3fa0ad91630100b191f53abd8017292fe380235693d2aa5f208bce3d000ea99585db58c2fbc2e825975c12eebaeb2edd0ca76ae1e74bbad367fdfaf54931a77bf7eec92de0b2c82ea0b973e7eae6923973e624ef97ebc8f5e4194543870ead89670e79fff907b435722c002036b25ea717f022e5651c70c46a525af50b64d1b907c021b5b0701b53785f181d397264983c79b26e8653b5f0f3450a3d1f7ef86172fbb7ae5dbb1eb62824bb7fa64c99122ebdf4527d28316bd6ac70f6d967279fcb75e47a72dd050b168471e3c655f4ed2dbcfffc03da1a391600101b59afd30b7891f2320e38623529adfa05b2e8dc03e0905a58b88d29bc2f8c5e79e595e197bffca56e8653de7fbe48a147ecdab52b74eedcf9b0b78ffbe28b2fc2adb7de9a147e7461486e19377dfaf4e4585a1812723db9eece9d3bc3e5975f1e56ac5851f135780aef3fff80b6468e0500c446d6ebf4025ea4bc8c038e584d4aab7e812c3af70038c4fbc26d6ce17d6174f4e8d1e117bff8856e8653de7fbefce10f7f48c6298bb143860c51a3ff7ff6eddb17264e9c18faf5eb17c68e1ddba0302445a17beeb927f4ecd933d915545e1812725db9bef4b566cd9a8aafc15378fff907b435722c002036b25ea717f022e5651c70c46a525af50b64d1b907c021de176e630bef0ba363c68c0937dc70836e86539e7fbe6cdcb83179f6cf9e3d7b42c78e1d435d5d9d1e7ee2b3cf3e4b9e15d4bf7fffb076eddaf0c8238f940a43e9ade57af5ea155e7cf1c5e4fba50b43725db9be3c6b48761de9afc35378fff907b435722c002036b25ea717f022e5651c70c46a525af50b64d1b907c021cf3df75cf8fcf3cf2b16e888f60ff9efe07d6174c28409c922396a83e79f2ff3e6cd0b0f3cf040f20ca01e3d7ae8a1273efdf4d3e42ff8070c1810d6ad5b97b4a585a1fdfbf727b796ebddbb7758b66c5972ac5a6148c8f5a51f2924e9afc34bd4c2cf3fa0ad91630100b191f53abd8017292fe380235693d2aa5f208bce3d000e79f9e59793879ceb453aa2fd63d3a64de1f9e79fd7ff895c91db695d7bedb5ba194e79fef972db6db785575f7d35f4eddb374c9d3a550f3dd4d7d727b7801b3c7870d8b06143a93d2d0cdd78e38dc97b5f7ffdf5d2b1acc2905c5fce5dbf7e7d98316346c5d7e2216ae1e71fd0d6c8b10080d8c87a9d5ec08b949771c011ab4969d52f9045e71e00877cf0c10761c9922561cb962d6effb2bfe821df7759145dbc7871f2dfc3b35b6eb9255c7df5d5ba194e79fef93267ce9cb06ddbb670c6196784952b573618f7ce9d3b93e28fdc6a4e6e39576ee6cc99c96de5ce39e79cb07af5ea06c7b20a43727de9477e4e5c7cf1c5155f4bcc514b3fff80b6468e0500c446d6ebf4025ea4bc8c038e584d4aab7e812c3af70028238b71f297dab22849d8847cff6b615174d2a449e18a2baed0cd70ccebcf17b9ad9bf8ca57be123efef8e30663befefaeb9302cfaa55ab1ab48babaeba2a39f6d4534fe943c975ab1586e4fad28f3c6748760ee9af25f628c2cfbf8f3efa28b9a59fdcfe507f7d44db877cdf6587a1f53c881d391600101b59afd30b7891f2320e38623529adfa05b2e8dc03003070fbedb787cb2fbf5c3703d13ae69863929d2fe55a7bc7905c5ffa3970e040d5e3c8478a422fbdf45272db436f3bdb6209f9becbf75f7618521c6a39722c002036b25ea717f022e5651c70c46a525af50b64d1b9070060e09e7bee0923468cd0cd40746401fb8b2fbea8ba6348b4e63386d21d437bf6ec093d7bf6d4879193ec14f2fa2cacd8426e3bc9b3a65a8e1c0b00888dacd7e905bc487919071cb19a9456fd025974ee010018b8fffefbc3f0e1c37533101d99c7b21ba8da3386529f7efa69183d7a741830604058b76e5dd2961686f6efdf1f6ebdf5d6d0bb77efa43021b20a43e93386a4c024e7a375c96dccd829548c90ff0ef2ff015a861c0b00888dacd7e905bc487919071cb19a9456fd025974ee01001890db685d70c105ba1988ce35d75c13962f5f9eecfa993a75aa3e5cf2d9679f85f1e3c727b78f5bbb766da93024e4394553a64c09bd7af50a2fbef862666148ae2ffd2c58b0200c1b364c1f464ef27dd7050ac22e280cb51c391600101b59afd30b7891f2320e38623529adfa05b2e8dc030030307bf6ece4b92b40eceebcf3ce70df7df785c71f7f3cf4e8d1431f6e60dfbe7d61e2c489a15fbf7e61ecd8b1a5c2903878f06072fb27b945dcb871e3aa1686e4fad28fec1c9a376f9e3e8c9c1a2b0cbdf6c1b670e5a3abc3a5b3ffefb071cbc27742dd8e4f2ade4f342f280cb51c391600101b59afd30b7891f2320e38623529adfa05b2e8dc030030f09bdffc2679e60a10bbd5ab5787850b17864f3ef92474ecd831d4d5d5e9531a90e711c9ade3a4f0535e1812521c9a3e7d7a724c1786e4ba727d79be10dac6e10a43a31e5b1d7efffe9fc2efdeaaab2804558ba94bdeafb806d1bca030d472e45800406c64bd4e2fe045cacb38e088d5a4b4ea17c8a2730f00c0c0134f3c11060d1aa49b81a85d79e59561c89021bab9427aeb385d184acd9a35aba23024d795eba3ed1cae3094ee04dab4fd938a2250b51833774dc53588e60585a19623c702006223eb757a012f525ec60147ac26a555bf40169d7b0000069e7efae93060c000dd0c446dd7ae5da173e7cee18d37ded0872a1c387020cc9d3b573797cc9933a7f4b95c4faebb6ddbb670de79e78577de79a7ec4cb496c60a4323e7bc59d14eb45d50186a39722c002036b25ea717f022e5651c70c46a525af50b64d1b9070060e0b9e79e0bfdfbf7d7cd40b4640790dc524e9e01d4b56bd7b075eb567d4a8bc875e47a72ddfbefbf9f5d006da8b1c2505343bf97685950186a39722c002036b25ea717f022e5651c70c46a525af50b64d1b9070060e095575e09fdfaf5d3cd40b4d6ae5d9b2cc47ef8e18761fcf8f1a17bf7eeb98b43f27eb98e5cefcd37df0c3d7bf64c9e6984b64161a8584161a8e5c8b10080d8c87a9d5ec08b949771c011ab4969d52f9045e71e008081152b5684be7dfbea66206af26c2079e0fb962d5b9262cea9a79edaa4dbca5523ef93f7cb750e1e3c18eebdf7de307bf66c7d1a5a1185a1620585a19623c702006223eb757a012f525ec60147ac26a555bf40169d7b00000656ad5a15faf4e9a39b81e84d9f3e3d7cf4d147c9e772fbb74e9d3a25cf05dabc79b33ab33a394fce97f7c9fbd17e280c152b280cb51c391600101b59afd30b7891f2320e38623529adfa05b2e8dc03003020b7ddeaddbbb76e065cd9bb776fd8b9736718356a54e8d0a14338ebacb3929d3fafbdf65ad8b87163728e7c94d7d22ec7e53c397ffbf6ed61dab469493bda0785a1620585a19623c702006223eb757a012f525ec60147ac26a555bf40169d7b0000063ef8e083d0ab572fdd0cb83261c2843074e8d0b07cf9f2505f5f1f1e7becb1e4f64eddba750b5dba7449fe012c1fe5b5b4cbf13d7bf684050b1624cf071938706078ebadb7f465d146280c152b280cb51c391600101bf9bd582fe045cacb38e088d5a4b4ea17c8a2730f00c0c0a64d9b42cf9e3d7533e0cea38f3e1a060c1890147ed25d42429e1b2476ecd811366cd8506aafabab4b0a42f23eb42f0a43c50a0a432d478e0500c446d6ebf4025ea4bc8c038e584d4aab7e812c3af700000cc86db2ce3efb6cdd0cb8b57af5ea70e0c081d26b59b495ff07e4a33c0b440a44b055ad303466ee9a8ac2cfe142ced7d7205a1614865a8e1c0b00888dacd7e905bc487919071cb19a9456fd025974ee01001890db6af1d7cca8752cdc164bb5c2d0d425ef57147f0e1772bebe06d1b2a030d472e45800406c64bd4e2fe045cacb38e088d5a4b4ea17c8a2730f00c0802cfab1288e5ac7ff03c552ad3054b7e39370cbc2772a0a40d542ce93f3f53588960585a19693ef1f3f5f00003191f53abd8017292fe380235693d2aa5f208bce3d000023b268557e6b2da0d6b0705b2cd50a43845d5018ca871c0b008889acd7e905bc487919071cb19a9456fd025974ee01001891dbdcecddbb5737033583c250b150182a565018ca871c0b008889acd7e905bc487919071cb19a9456fd025974ee0100189145ab5dbb76e966a06650182a160a43c50a0a43f9906301003191f53abd8017292fe380235693d2aa5f208bce3d000023b268b565cb16dd0cd40c0a43c54261a8584161281f722c002026b25ea717f022e5651c70c46a525af50b64d1b9070060a457af5ee18f7ffca36e066a0685a162a13054aca030940f391600101359afd30b7891f2320e38623529adfa05b2e8dc030030d2bb77eff0eebbefea66a06650182a160a43c50a0a43f9906301003191f53abd8017292fe380235693d2aa5f208bce3d0000237dfaf409ab57afd6cd40cda030542c14868a151486f221c702006222eb757a012f525ec60147ac26a555bf40169d7b000046faf6ed1b56ae5ca99b819a4161a858280c152b280ce5438e0500c444d6ebf4025ea4bc8c038e584d4aab7e812c3af700008cf4ebd72f2c5bb64c37033583c250b150182a565018ca871c0b008889acd7e905bc487919071cb19a9456fd025974ee010018e9dfbf7f78e1851774335033280c150b85a1620585a17cc8b1008098c87a9d5ec08b949771c011ab4969d52f9045e71e00809173cf3d372c5ab44837033583c250b150182a565018ca871c0b008889acd7e905bc487919071cb19a9456fd025974ee0100181938706078eaa9a774335033280c150b85a1620585a17cc8b1008098c87a9d5ec08b949771c011ab4969d52f9045e71e0080914183068579f3e6e966a06650182a160a43c50a0a43f9906301003191f53abd8017292fe380235693d2aa5f208bce3d00002343860c098f3efaa86e066a0685a162a13054aca030940f391600101359afd30b7891f2320e38623529adfa05b2e8dc030030326cd8b0f0f0c30feb66a06650182a160a43c50a0a43f9906301003191f53abd8017292fe380235693d2aa5f208bce3d000023175e786178e0810774335033280c150b85a1620585a17cc8b1008098c87a9d5ec08b949771c011ab4969d52f9045e71e0080918b2fbe38dc7befbdba19a8191486dac7c08103c3c2850b757385b6280cc9ef9e1259afbd445b8c8bc2503ee45800404c0efd2ee1819771c011ab4969d52f9045e71e0080914b2eb924dc75d75dba19a8191486da877c9f251a2b10b5b43024bf5f4ae8f66ac7f4eb22c5830f3e58fafa1e7ae8a18ae3878bb6181785a17cc8b10080981cfa5dc2032fe380235693d2aa5f208bce3d000023975f7e799832658a6e066a0685a1f69116861a2b10b54561484773ce6defe8d1a347f8d297be94c48f7ef4a38ae3878bb6181785a17cc8b10080981cfa5dc2032fe380235693d2aa5f208bce3d000023a3468d0ab7dd769b6e066a0685a1f6a10b435905a2b6280ce963e96b89238e382274efde3dbcfffefba5e3dbb76f0f83070f0e9d3b770e1d3a74083ffef18fc3faf5ebabbebfda758f3beeb870e6996786575e79a5e2987e4f79d4d5d585a38f3e3afcd77ffd57f8cffffccfe47369d3d768eaebc6bea6a60485a17cc8b10080981cfabdc1032fe380235693d2aa5f208bce3d000023a3478f0e37df7cb36e066a0685a1f6a10b423ad202517b1686e4566d3366cc483effe94f7f5a3a7eeeb9e7266dbffded6fc3abafbe9a7cfefdef7fbfe2fd728bb07dfbf655f4b766cd9ae4f869a79dd6e4f748c8ce1239476e27977e5db7df7e7b836b1c79e49115d7cc7a5d1ed5bea6a60485a17cc8b10080981cfa5dc2032fe380235693d2aa5f208bce3d00002363c78e0dd75f7fbd6e066a862e5010b6d19e85a1ddbb77875dbb76259f77ecd8b174fcc4134f2c9d93c631c71c53f1fefafafa52db33cf3c134e3ffdf470ecb1c7968e572be294bf4787ece8f9dbbffddbe46b9290cfbffbddef36b8c651471d5571cdacd78d7d4d4d090a43f9906301003139f4fb82075ec60147ac26a555bf40169d7b000046264c9810c68f1faf9b01a055e902501a96b792cb2a0c9d74d24949dba64d9b2aae55ed7a12a79c724ad2b674e9d2a4f8a3cfd1af75bcf7de7bc96dedd2f3d290b6f43677f23a2decc8d7aeafa95f37f6353525280ce5438e0500c4e4d0ef0a1e7819071cb19a9456fd025974ee010018993871621833668c6e068056d5584128d59e85a1f25bc9fde4273f291d97af4dda468c185175878fbe9e445a4c7af9e597c3e4c9932bced1af755c77dd75c971f9dea46d3ffff9cf93b61b6eb821792dcf3c92d7cb972f4f6e49a7afa95f37f6353525280ce5438e0500c4e4d0ef0a1e7819071cb19a9456fd025974ee010018b9e5965bc2d5575fad9b01a0553556104ae52d0ce9283f56ed5cd991d3ad5bb7b06eddbad2f11d3b76840b2fbc3074e9d225d9a193f5fef2fe67cf9e1d4e3ef9e4aafd67bda73cbef9cd6f26c7e7cf9f5f6a7be2892792b66f7deb5bc96b79f650a74e9d9adc47635f535382c2503ee45800404c0efdaee0819771c011ab4969d52f9045e71e008091499326852baeb842370340ab6aac20946a696188689ba030940f391600101359afd30b7891f2320e38623529adfa05b2e8dc03003072c71d7784cb2ebb4c370380090a43c50a0a43f9906301003191f53abd8017292fe380235693d2aa5f208bce3d00002353a74e4d9ea30100454061a8584161281f722c002026b25ea717f022e5651c70c46a525af50b64d1b907006064faf4e961f8f0e1ba19004c50182a565018ca871c0b008889acd7e905bc487919071cb19a9456fd025974ee01001899397366b8e0820b74330098287261487e8795d0ed6d1d56fd4a5018ca871c0b0088c9a1df393cf0320e38623529adfa05b2e8dc030030327bf6ec3074e850dd0c0026ac0a43dffce63793c590458b1695da9e79e699a4ed5bdffa56f25a3e97d0ef2d8fa69cd3dc688b6b3635280ce5438e0500c4e4d0ef1c1e7819071cb19a9456fd025974ee010018f9cd6f7e13ce3bef3cdd0c0026ac0a43d75d775db21872d1451795dae41660d276c30d37549c9f1572be846ecf136d71cda60685a17cc8b10080981cfa9dc3032fe380235693d2aa5f208bce3d0000234f3ef964183468906e0600135685a1f7de7b2f1c71c411e11bdff846a94d3e97b6f7df7f3f792dbfc34aa4c7d3d7878bc3bdafbcffb4edb8e38e0b679e796678e595572a8e959fdf5e4161281f722c002026877ee7f0c0cb38e088d5a4b4ea17c8a2730f00c0c8b3cf3e1b060c18a09b01c084556148420a32f27beaead5abc39b6fbe997cfeddef7eb7745c5e4be8d777dd7557d8b76f5fd573d2b6238f3cb2e27dba7f89356bd624c74e3bedb4269ddfd64161281f722c002026877ee7f0c0cb38e088d5a4b4ea17c8a2730f00c0c892254b42fffefd75330098b02c0c4d9932255910b9e9a69bc28d37de987c7efbedb7978ecb6b09fdbabebebea2adfcbaf2faa8a38eca3c479e6574fae9a787638f3db674aca985a4b60e0a43f9906301003139f43b87075ec60147ac26a555bf40169d7b0000465e7ef9e5d0af5f3fdd0c00262c0b43757575e1e8a38f0edffbdef7929d42f2b9b4a5c7e5775889acd7876b4b0b3dbb77efae38e794534e495e2f5dba342932e9e3fa757b0685a17cc8b10080981cfa9dc3032fe380235693d2aa5f208bce3d0000232b56ac087dfbf6d5cd0060c2b23024d1a3478f64778fc48f7ef4a306c7e4775889acd712c71f7f7cd2b661c386525be7ce9d93b6e5cb9727b79dd3ef3be9a49392d75244983c7972c571fdba3d83c2503ee45800404c0efdcee1819771c011ab4969d52f9045e71e008011798e469f3e7d74330098b02e0ccd9c39b3548891cfcb8fa5ed59af25e41674279c704283630f3ef860e8d4a953a94dbf6ff6ecd9e1e4934fce3cae5fb7675018ca871c0b0088c9a1df393cf0320e38623529adfa05b2e8dc030030f2ce3bef84debd7beb660030615d18221a0685a17cc8b1008098c87a9d5ec08b949771c011ab4969d52f9045e71e008011b9dd51af5ebd74330098a03054aca030940f391600101359afd30b7891f2320e38623529adfa05b2e8dc030030220f56efd9b3a76e06001314868a151486f221c702006222eb757a012f525ec60147ac26a555bf40169d7b00004676ecd811ce3efb6cdd0c0026280c152b280ce5438e0500c444d6ebf4025ea4bc8c038e584d4aab7e812c3af700008c7cf2c9272c5a01280c0a43c50a0a43f9906301003191f53abd8017292fe380235693d2aa5f208bce3d000023fbf7ef67d10a406150182a565018ca871c0b008889acd7e905bc487919071cb19a9456fd025974ee0100189245ab03070ee86600687714868a151486f223c702006221eb757a012f525ec60147ac26a555bf40169d7b00008664d16aefdebdba1900da1d85a1620585a1fcc8b1008058c87a9d5ec08b949771c011ab4969d52f9045e71e00802159b49207640380350a43c50a0a43f991630100b190f53abd8017292fe380235693d2aa5f208bce3d0000433d7bf60c757575ba1900da1d85a1620585a1fcc8b1008058c87a9d5ec08b949771c011ab4969d52f9045e71e0080a15ebd7a850d1b36e86600687714868a151486f223c702006221eb757a012f525ec60147ac26a555bf40169d7b00008664d1eadd77dfd5cd00d0ee280c152b280ce5478e0500c442d6ebf4025ea4bc8c038e584d4aab7e812c3af700000cf5eedd3bac5ebd5a370340bba33054aca030941f391600100b59afd30b7891f2320e38623529adfa05b2e8dc030030d4b76fdfb072e54add0c00ed8ec250b182c2507ee45800402c64bd4e2fe045cacb38e088d5a4b4ea17c8a2730f00c050bf7efdc2d2a54b753300b43b0a43c50a0a43f991630100b190f53abd8017292fe380235693d2aa5f208bce3d000043fdfbf70f4b962cd1cd00d0ee280c152b280ce5478e0500c442d6ebf4025ea4bc8c038e584d4aab7e812c3af700000c0d1830203cfbecb3ba1900da1d85a1620585a1fcc8b1008058c87a9d5ec08b949771c011ab4969d52f9045e71e0080a141830685279f7c52370340bba33054aca030941f391600100b59afd30b7891f2320e38623529adfa05b2e8dc0300303478f0e03077ee5cdd0c00ed8ec250b182c2507ee45800402c64bd4e2fe045cacb38e088d5a4b4ea17c8a2730f00c0d0d0a143c39c3973743300b43b0a43c50a0a43f991630100b190f53abd8017292fe380235693d2aa5f208bce3d000043e79f7f7e78e8a187743300b4bbe79e7b2e7cfef9e715050aa2fd43fe3b5018ca8f1c0b008885acd7e905bc487919071cb19a9456fd025974ee0100181a3e7c78983e7dba6e068076f7f2cb2f87ad5bb756142988f68f4d9b3685e79f7f5eff27423391630100b190f53abd8017292fe380235693d2aa5f208bce3d00004323468c0853a74ed5cd00d0ee3ef8e083b064c992b065cb16760e19857cdfa528b478f1e2e4bf07f221c702006221eb757a012f525ec60147ac26a555bf40169d7b0000862ebbecb270c71d77e866003021c508d9a922b731236c42beff14855a07391600100b59afd30b7891f2320e38623529adfa05b2e8dc0300303472e4c83069d224dd0c00007222c702006221eb757a012f525ec60147ac26a555bf40169d7b000086aebaeaaa70ebadb7ea6600009013391600100b59afd30b7891f2320e38623529adfa05b2e8dc03003074cd35d7841b6fbc51370300809cc8b1008058c87a9d5ec08b949771c011ab4969d52f9045e71e0080a171e3c685ebaebb4e370300809cc8b1008058c87a9d5ec08b949771c011ab4969d52f9045e71e0080a1ebafbf3e8c1d3b56370300809cc8b1008058c87a9d5ec08b949771c011ab4969d52f9045e71e0080a19b6fbe398c1e3d5a370300809cc8b1008058c87a9d5ec08b949771c011ab4969d52f9045e71e0080a1db6ebb2d8c1a354a370300809cc8b1008058c87a9d5ec08b949771c011ab4969d52f9045e71e0080a15ffdea5761e4c891ba190000e4448e0500c442d6ebf4025ea4bc8c038e584d4aab7e812c3af700000cdd79e79de1d24b2fd5cd00002027722c002016b25ea717f022e5651c70c46a525af50b64d1b9070060e8de7bef0d175f7cb16e0600003991630100b190f53abd8017292fe380235693d2aa5f208bce3d0000430f3cf040b8f0c20b75330000c8891c0b008885acd7e905bc487919071cb19a9456fd025974ee0100187af8e187c3b061c374330000c8891c0b008885acd7e905bc487919071cb19a9456fd025974ee0100187af4d147c390214374330000c8891c0b008885acd7e905bc487919071cb19a9456fd025974ee0100189a376f5e183468906e0600003991630100b190f53abd8017292fe380235693d2aa5f208bce3d0000434f3df554183870a06e0600003991630100b190f53abd8017292fe380235693d2aa5f208bce3d0000438b162d0ae79e7bae6e0600003991630100b190f53abd8017292fe380235693d2aa5f208bce3d0000432fbcf04238e79c7374330000c8891c0b008885acd7e905bc487919071cb19a9456fd025974ee0100185ab66c59e8dbb7af6e0600003991630100b190f53abd8017292fe380235693d2aa5f208bce3d0000432b57ae64d10a008036408e0500c442d6ebf4025ea4bc8c038e584d4aab7e812c3af700000cad5ebd3af4e9d347370300809cc8b1008058c87a9d5ec08b949771c011ab4969d52f9045e71e0080a177df7d37f4eedd5b370300809cc8b1008058c87a9d5ec08b949771c011ab4969d52f9045e71e0080a13ffef18fa167cf9eba190000e4448e0500c442d6ebf4025ea4bc8c038e584d4aab7e812c3af700000c6dd9b2259c7df6d9ba190000e4448e0500c442d6ebf4025ea4bc8c038e584d4aab7e812c3af700000cedd8b183bf660600a00d90630100b190f53abd8017292fe380235693d2aa5f208bce3d0000437bf7ee65d10a008036408e0500c442d6ebf4025ea4bc8c038e584d4aab7e812c3af700000c1d387080dbdc0000d006c8b1008058c87a9d5ec08b949771c011ab4969d52f9045e71e00803159b4faf39fffac9b0100404ee45800400c64bd4e2fe045cacb38e088d5a4b4ea17c8a2730f00c0982c5ad5d7d7eb6600009013391600100359afd30b7891f2320e38623529adfa05b2e8dc03003026cf3fd8be7dbb6e06000039916301003190f53abd8017292fe380235693d2aa5f208bce3d000063b268b569d326dd0c673efae8a3b06cd9b2f0dc73cf85dffdee7704d120645ebcfcf2cbe1830f3ed05307400ee45800400c64bd4e2fe045cacb38e088d5a4b4ea17c8a2730f00c058af5ebd580c764e8a422fbdf452d8ba756bf8fcf3cf93e75d104479c8bc90f9b164c9127e1e00ad881c0b008881acd7e905bc487919071cb19a9456fd025974ee010018ebddbb7758bb76ad6e8623b2534816fd75318020746cd9b2253cfffcf37a0a016821722c002006b25ea717f022e5651c70c46a525af50b64d1b9070060ac4f9f3e61d5aa55ba198ec86dc2d829443425649ec8ade500b40e722c002006b25ea717f022e5651c70c46a525af50b64d1b9070060ac6fdfbe61c58a15ba198ec842bf2e001044565018025a0f391600100359afd30b7891f2320e38623529adfa05b2e8dc03003076ce39e7240f9d875f4d2d0c7dba7b7358ffda03e1edc5139290cfa54d9f47f80e0a4340eb21c702006220eb757a012f525ec60147ac26a555bf40169d7b0000c6faf7ef9fdc6a0c7e35a530f4c9ae8fc35bcf5e1bde5c30b241489b1cd3e7137e83c210d07ac8b1008018c87a9d5ec08b949771c011ab4969d52f9045e71e0080b101030684a79f7e5a37c391a6148636be3dbfa22894c6a6b79fac389ff01b148680d6438e0500c440d6ebf4025ea4bc8c038e584d4aab7e812c3af700008c0d1a34283cf1c413ba198e34a530f4872537571484d29063fa7cc26f5018025a0f391600100359afd30b7891f2320e38623529adfa05b2e8dc0300303678f0e0f09bdffc4637c391a61486defaddb88a82501a724c9f4ff80d0a4340eb21c702006220eb757a012f525ec60147ac26a555bf40169d7b0000c6860e1d1a66cf9ead9be1088521a239416108683de4d862e9d7af5fb8f9e69bc3a9a79e1a2ebcf0c2d0b56b573ef2918f7c34ff78e5955786c9932787fafa7afd63abddc87a9d5ec08b949771c011ab4969d52f9045e71e0080b10b2eb820cc9c395337c391a61486de5e3ca1a22094861cd3e7137e83c210d07ac8b1c5208bad03070e0c0f3ffc7078f9e597f5610030b577efdef09def7c273cfbecb3fa50bb91f53abd8017292fe380235693d2aa5f208bce3d000063175d7451b8efbefb74331c694a61e8bda577541484d29063fa7cc26f5018025a0f39b618de78e38df0c31ffe50370340a10c183020fce0073fd0cded42d6ebf4025ea4bc8c038e584d4aab7e812c3af700008c5d72c925e1eebbefd6cd70a42985a11d1faf0e6f2d1a5b5114923639a6cf27fc068521a0f590638be1dbdffe76a8ababd3cd005028ebd6ad0b5bb76ed5cded42d6ebf4025ea4bc8c038e584d4aab7e812c3af700008c5d76d965e18e3beed0cd70a4298521890d2b67561486a44d9f47f80e0a4340eb21c716c3d1471f9dfc7c0380223b70e04038e288237473bb90f53abd8017292fe380235693d2aa5f208bce3d000063575c7145983469926e86234d2a0ceddb17de7bf5ee8ac290b4c9b18af309b7416108683de4d862f8f77fff77dd04008564f51c3459afd30b7891f2320e38623529adfa05b2e8dc03003076f5d557875b6eb94537c391c60a439fecfa38ac5b7a7b4551280d3926e7e8f7113e83c210d07ac8b1c5e0a93024ffa66ead7f57675d6bdbb66de198638e09dffbdef7f421006dec4b5ffa926e6a17877e1e78e0651c70c46a525af50b64d1b9070060ecda6baf0d13274ed4cd7024b330b46f5fd8fcdef361cd335757148374c839722ebb87fc078521a0f590638ba1b985a1f9f3e787af7ef5abe1c8238f4c164be5e309279ca04f33215f4f6bfdbb3aeb5adff8c637c23ffff33feb6600ed801d43b97919071cb19a9456fd025974ee0100181b3f7e7c983061826e8623d50a438ded12ca0a760ff90f0a4340eb21c71643730a430f3ffc70b2402a7fb57febadb7862d5bb684871e7a287ced6b5fd3a79a90af8d7f57037eb16328372fe380235693d2aa5f208bce3d000063d75f7f7d18376e9c6e8623d50a434dd9259415f25e7d3dc24f5018025a0f39b6189a5318929d41f2efd6abaeba4a1f6a40ce919007c51f7ffcf161faf4e915c7d2901d47c3870f2f1d9762d3b7bffded70d4514755147aeaeaeac269a79d96bc47ae7df2c92787152b56948eebf3cbdbaa7d2d87eb4bbf5ebf7e7db25b48fa96f8fad7bf9eb4e9f3b3c605203f760ce5e6651c70c46a525af50b64d1b9070060eca69b6e0ad75c738d6e8623d50a43bad8d3dcd0d723fc048521a0f590638ba1398521f937ab447941e4709e7efae9e47c79264f2abd46efdebdc3cc99334b4594d43ffee33f266dfffaafff1aeaebeb4bede21ffee11f926363c68c29bdf7effffeef4bc7d36b5753ed6b395c5ffa5a521492d752ec19366c58f2b9b4e9f3b3c605203f760ce5e6651c70c46a525af50b64d1b9070060ecb6db6e0ba3468dd2cd70a45a618820b282c210d07ac8b1c5d0da85a15b6eb9251c7becb1a573d348a5af77ecd811f6efdf5f713c7d76d1871f7e586ad3c774a4f4ebc6be96c3f5a5cf951d47f25abeee6ddbb6259f97177ed2f3b3c605203f760ce5e6651c70c46a525af50b64d1b90700606cf2e4c961e4c891ba198e5018229a13148680d6438e2d86e614869a722bb9f4b66c3366cc08bb76edaa289034f6fa70c59af4d81ffef0077d28a1afd5d8d772b8bef4b94d2d0c65bd06901f3b8672f3320e38623529adfa05b2e8dc03003076d75d77854b2eb94437c3110a43447382c210d07ac8b1c5d09cc2d0430f3d942c90cae2ec2f7ff9cbb075ebd6f0eb5fff3a74eddab5744e5a6cb9fffefbc3fffeefff5614481a7b9ddedeeddffeeddf2a6eef961e3be38c3392428fa6afd5d8d772b8bef4b94dbd955cd66b00f9b16328372fe380235693d2aa5f208bce3d000063d3a64d0b175d74916e8623148688e6048521a0f590638ba1398521316fdebcd0a54b9752d14576d2943fe7e7b2cb2eab7acbb75463afb76cd912befded6f9776fbe863fff44fffd4e0d8e1aed5d8d772b8bef46bb97d9e148264bc125ffffad71bdc524f9faf5f03c88f1d43b97919071cb19a9456fd025974ee0100187be08107c205175ca09be1088521a239416108683de4d862686e610800acb06328372fe380235693d2aa5f208bce3d000063b366cd0ae79f7fbe6e8623148688e6048521a0f590638b81c2108058b06328372fe380235693d2aa5f208bce3d0000638f3efa68183264886e8623148688e6048521a0f590638b81c2108058b06328372fe380235693d2aa5f208bce3d000063721ffdc18307eb6638426188684e5018025a0f39b618280c0188053b8672f3320e38623529adfa05b2e8dc030030b670e1c23070e040dd0c47280c11cd090a4340eb21c71603852100b160c7506e5ec60147ac26a555bf40169d7b0000c6162f5e1cce3df75cdd0c47280c11cd090a4340eb21c71603852100b160c7506e5ec60147ac26a555bf40169d7b0000c65e7ae9a570ce39e7e86638426188684e5018025a0f39b618280c0188053b8672f3320e38623529adfa05b2e8dc030030b66cd9b2d0af5f3fdd0c47280c11cd090a4340eb21c71603852100b160c7506e5ec60147ac26a555bf40169d7b0000c65e7ffdf5d0a74f1fdd0c47280c11cd090a4340eb21c71603852100b160c7506e5ec60147ac26a555bf40169d7b0000c6de7aebadd0bb776fdd0c47280c11cd090a4340eb21c71603852100b160c7506e5ec60147ac26a555bf40169d7b0000c6de7befbdd0ab572fdd8c080c1c38302c5cb8503757a030443427280c01ad871c5b0c148600c4821d43b97919071cb19a9456fd025974ee010018fbe8a38f42cf9e3d75332270f6d96727d158812896c2d0fffddfff859ffdec67e1a4934e0a471f7d74e8d4a953f8e10f7f58715e4b437e0f91d0edcd8dd6ba4e5183c210d07ac8b1c5406108402cd831949b9771c011ab4969d52f9045e71e0080b13ffde94f2c5a452a2d0c3556208aa130b47cf9f270ecb1c786af7ef5abe1d9679f0d3b76ec481edafef39fffbce2dc9686fc1e22a1db9b1bad759da2068521a0f590638b81c2108058b06328372fe380235693d2aa5f208bce3d000063f5f5f5495101f1d185a1ac02510c85a11ffce007c93f481f7ffcf18a63696cd9b2257988fb89279e98843cb743dad2e3f2fef2e8dcb97378e8a187aa1e93a8d6aeaf75dc71c78533cf3c33bcf2ca2b55cf6fca7baabd4f8fad48416108683de4d862a030042016ec18cacdcb38e088d5a4b4ea17c8a2730f00c0d8e79f7fcea255a4744148475a208aa13024bb85e4f784f2428f0e290ac93952ec99316346f2b9b4a5c7e5b5c41d77dc115e7df5d5e4f3934f3eb9e278f935d3b6bbeeba2becdbb7afa2cf356bd624c74f3bedb48af7e8739bf29eac7e8a14148680d6438e2d060a430062c18ea1dcbc8c038e584d4aab7e812c3af700000a401714085fe1a53074c2092724e7ecdebd3becdab52bf95c760ea5c7e5757a5c1663d3d7fa78f935d336f9abfeb4ed99679e09a79f7e7ae96b9238f2c8232bde537e9da6bea7bc9fa2869e3f0441e40fd8a230042016ec18cacdcb38e088d5a4b4ea17c8a2730f00006821bdf09886d75bc935b530d4d4d7596da79c724ad2b674e9d2a490a3cfd1af5bfa9ea2063b860078436108685fab56ad0aa3478f4e7676f7ead5abc1efa9f25adae5b89c8786d831949b9771c011ab4969d52f9045e71e0000d0428d158452311486962d5b16befce52f87af7ef5ab61d1a24561e7ce9d61c58a15c9b8d2739a7a2bb9acd7c71f7f7cf27ac3860d99e7489c74d249499bfcc37cf2e4c915e754bb4e63efd1af8b1c14860078134b6168f5ead5e1fefbef0f63c78e0d23478e0cc3860d4bf2e0d0a143c365975d962ca4df7efbed61e5ca95faad688677de7927cc9a352b8c1b372e5c79e5950dbecf975f7e7918356a5498346912458b16b8efbefb2a0a418d859c2fefc35fb16328372fe380235693d2aa5f208bce3d0000a0851a2b08a562280c49c802ccfffccfff244516f947b1ec10fa8ffff88fd271b9cd9c1482a45da277efde0d6e3d27bf674864bdbef1c61b4bbb8ed2767d8ec4ecd9b3936713a5c7f439d5aed3d87bf4eb2207852100de14bd30f4c4134f24058af3ce3b2fdc73cf3dc91f46ac5fbf3eecd8b123392e1fe5b5b4cb7139ef924b2e49fe48024db778f1e270edb5d78641830625cffc5bbe7c79f8e0830f1a7c9fe5b5b4cb71f9fdeaa28b2e0ad3a74f575782267f1823bfa3e9a24f7342de6fb55ba648acbe07877e57f5c0cb38e088d5a4b4ea17c8a2730f000068a1c60a42a9580a43443182c210006f8a5a189202c4983163925d2ab20be8e0c183fa94aae43c395f7611c97bf9b97d78b213ebbaebae0b23468c487628efd9b3273cf6d863a16fdfbea15bb76ea14b972ec9a2b87c94d7d22ec7e53c395f8a43175e78a1d9827dd14d9d3a35f4ecd9b3419147be87f28734cf3df75cd5e29bb4cb71394f1788e47ab58c1d43b97919071cb19a9456fd025974ee0100006d8cc210d19c6081118037452c0cc92e21d9f923bb580e1c38a00f3789bc4fde2f7f2872efbdf7eac3f8ff490162c89021c91fd26cdfbe3db94d5c870e1dc259679d957ccf5e7bedb5b071e3c6e45cf928afa55d8ecb7972bebc4fdedfbf7fff9a2f5a68723bbef2a290ece69e366d5af22cc8a690f3e47c795f797148ae5babac0a90b25ea717f022e5651c70c46a525af50b64d1b9070000b4310a43447382c210006f8a56189267e55d70c105c9ede15a835ce7fcf3cf0f37dc70833e54d3e6ce9d9b3c3f489e29f4f8e38f874e9d3a25c5b8cd9b37eb53ab92f3e47c799fbc5fae23b7a1abe5a24539bd53487655c9f3175b42de27ef67e7103b865a819771c011ab4969d52f9045e71e0000d0c6280c11cd090a4300bc29526168fefcf9c902787a6badd622d793e2d0dd77dfad0fd524d9293474e8d0e45984e3c78f0fa79e7a6a78e38d37f4694d22ef93f7cb75e47ae79e7b6ecd162d522fbcf042e8d5ab57a988337af4e8505f5faf4f6b1679bf5ca7bc3824fdd41a760ce5e6651c70c46a525af50b64d1b9070000b4316f8521f97d4242b7b74758f6dd5e416108803745290cc9338564078a3c63a52dc875e5b672cf3cf38c3e5453de7cf3cda428243b7ca498d3bd7bf7b075eb567d5ab3c8fbe53a723db96ebf7efd6ab26891ead3a74f839d42798b4229b94ef9ce21e9a7d6b06328372fe380235693d2aa5f208bce3d0000a08d51186abd68edbe5bfb7aad11148600785394c2d0983163926702b525b9fef0e1c375734db9fefaeb936702c9eddfba76edda685168d1a24599858dc71e7bacf4b95c47ae27d79567444971a816dd77df7da5c28d3c1ba8b1dbc7c9f7aa39e47ae5cf1c92fe6a093b8672f3320e38623529adfa05b2e8dc030000da98b7c290a790df8d2474bb65501802e04d110a430b162c08975f7e793870e0803ed4aae4fa975e7a69cddeea4c0a6323468c08dbb76f0f9d3b776ef4f6714f3ffd74f29c9c5dbb76e943e191471e490a13e5e47a725db9be3c6fa8d68a16a2fc1672d3a64dd3871bd8b66d5bf2fd955d56cd21d74dfb90fe6a093b8672f3320e38623529adfa05b2e8dc030000da587b178664b164f0e0c1c9c249870e1dc28f7ffce3e4c1d8e9f175ebd625b76339e288234a851189f4784b5f4bc835e5daefbfff7e83af293d7edc71c78533cf3c33bcf2ca2b15c7d2f8f297bf1cbef39def84af7ded6be16ffee66f42972e5dc2a38f3e5ab5efc6c6aaaf2de7c943c7ab1d4baf2bcf2f905ba79c78e28949c85fcd4a5bf978da32280c01f0a60885a1abaeba2abcf6da6bbab9c1f3545a1a9af4336cd830dd5c13aeb9e69ab06cd9b270e5955786214386e8c30d48b1ee9c73ce097dfbf6ad280c49ae966352d4d0e4ba727df95dc24bd162e3c68dc9edf7de7aeb2d7da88155ab5695e65db5ef9b26cf7a9273a558f997bffc451fae70f0e0c1e4a35c57ae9ff625fdd60a760ce5e6651c70c46a525af50b64d1b9070000b4b1f62e0cc9439925e7fff6b7bf0dafbefa6af2f9f7bffffdd271299e489b2cbacc9831a3415144423e3ff2c8231bbcd6c7abbd2ebfde4f7ffad38aaf4b62cd9a35c9f1d34e3bade2fd77de796758b1624583d7afbffe7af2f957bef295aa7d3736d6f4fc3beeb8a374fce4934fae385efe354a5148dacac7236d7a2c6d1514860078635d1892c5762926a48bdee564d13b7da68a7c945b973516e5e7572b0c493ff2aca1dffffef7fa5094e40f24a64f9fae9b2bc8ae14f9630db92d5cc78e1d435d5d9d3ea5e4a9a79e4a0a3ff2fd935c5e5ee078f0c1074bc7aa157ee4ba727de947be360f450b290ca54518993b4b972ed5a724a4c0999e77d34d37e9c315264d9a9414d7e4fcb973e7eac315cafb95eba77d49bfb5821d43b97919071cb19a9456fd025974ee0100006dacbd0b43b2cb45727e791c73cc31a5e37ff7777f97b4eddebd3b598849cf498fcbe7471d755483d7fa78b5d7e5d793059bf4b83c84fbf4d34f0fc71e7b6ce9dc6a852779ff679f7d567a2dd7d2fde9be1b1b6bf9b53ffffcf38af7ebd712279c7042e93de978a49ff273da32280c01f0c6ba302445fe7beeb947372764d13b2df8a49f1f4ef979e9e7d5dc7df7ddc9ee190fd2e2406305a299336786bbeeba2b7906508f1e3df4e192279f7cb254f8d185a1071e7820f4efdfbf74ac5a6148c8f5a59ff1e3c7bb285ac82ddfd231a721df0779fe52b9f25d3c8d3d2f4b6e6b28dfdbf47cf92397cd9b37ebd34ade7cf3cde4ff95945c3f7daff45b2bd831949b9771c011ab4969d52f9045e71e0000d0c6dabb3074d2492725ffb8dcb46953c53189a61486d2c28d9c53ed78b5d75985a1534e39256993bf4295bfeecd7a7f535eeb638d8d559fdfd86b090a4300d0baac0b4313264c08cb972fd7cd0959f44e8b418d1587f4f1c31586a4bff3cf3f5f374749172cb20a44d75d775d721b392922643d63e989279e68501492480b43f2bca0f2a29044566148ae2ffd48f1c243d1e2934f3ea9f83ea7d1af5fbfd26e9f74f78f84dc3af770e4d6c1e5d791f7ca7fa36a76eedc19ce3befbc06ff9fc8f5cbdf5b2bd831949b9771c011ab4969d52f9045e71e0000d0c6dabb3024b720919c2f0f7f96428c3eded8ade4e4393cf25a1607e42f7ff5f1acd7e5d7fbc94f7e523a9e166fe42f30274f9e9cf9fea6bcd6c71a1bab3e5fbf3efef8e393d71b366c28b5712b3900685dd685a1912347662ea2cba277792148177f0ed77eb8c290f427b755f340172ad2d005a22baeb82219f719679c1156ae5c597685bf92dbbeeaa290841486e496afba282491551892eb4b3fefbefbae8ba2853cff478f5d87fc2e52fe5a8a3987233baaca0b4969bcf4d24b0dce939d4563c78e4dce95dfa55272fdf2f7d50a760ce5e6651c70c46a525af50b64d1b9070000b4b1f62e0cedd8b12379ee41972e5d929d3f92ff25d2e3f217a4ddbb770f471c7144e958f971b9b77fa74e9d1a1c2b3f9ef55a42aed9ad5bb7a48ff4f8ecd9b393e7fa34f77ad55eeb638d8db5b1d737de7863698750dabe65cb9664f145da2564e14bdad2f7b475501802e08d7561489e2f54fe0c9b72b2e0dd581148bfd6e75523fd4911c4035d58d0911688860e1d9a1413e4b9801f7ffc71836b4891a25ae14742726eb5829144566148ae2ffdc8ef01729edc8a5676fa4afb871f7e983cef489e2d25cf79921dcb4b962c496e6d3b7ffefca4403567ce9ce40f40e4eb96dd47f2873053a64c09b7dd765bb8f9e69b93df0fe43675e3c68d4b6e0978f5d5572785afcb2fbf3c5c72c925e1e28b2f4e7eff9018366c5832762904ca1fac480c18302019af8c4b42763549c858e5fb25e32a8f6a059cc662fffefdfadbd2c0b5d75e5b715d792d5f9fec504a3df2c823c931195b39b97ef97b6b053b8672f3320e38623529adfa05b2e8dc030000da587b17869a1bf2fb81846e6f6ae47d3fd130280c01f0c6ba30240bf2598be8b2e09d55f09190e240fa79d679d5487f5200285f58af859071a7cffa2bd7da8521b9bef4a38b17d50a21e9c7f2480b32f2df48fa4f43e64a5acc919d4c1269b1476eb52645462904494168f8f0e1e1a28b2e4a0a455254b9f2ca2b930292149264078edcc2500a4c52689a346952b26b5a0a505288921dc95298920295dc26eea9a79eaa187bf918e41a52f82a6f3fdc8ea1bd7bf7567c2fcaaf973e73ebf5d75f2f9d27cf772ac78ea1f675e8f7690fbc8c038e584d4aab7e812c3af700008036466188684e501802e08d75614816f49bba63a87c7750d6e7fadc6aa43f79368c07bab09086be959c144db2760c89d6bc955cba6368dbb66d99ff0d62a3c72e059b89132726b7994b95177bb26e8f2864a754f9f750425fff85175e48bef7e9eb152b5634b806cf186a5f877e9ff6c0cb38e088d5a4b4ea17c8a2730f00006863452f0c11c50a0a4300bcb12e0c5d7ae9a5998be8b2e87db85bc6bdfdf6dba5cff5f1c31586a43fb99d9807baa0a00b42a9cb2ebbecb0cf18124f3cf1444571488a135248bbefbefb2a8a435985a1f419436bd7ae7553b4281fb7dcc24e6e8fa7c98ea6f49cc58b17ebc325d3a64d2b1583aaed1c2adf49957e2cbfbd9c90eba7e74bbfb5821d43b97919071cb19a9456fd025974ee0100006d8cc210d19ca03004c01bebc2d055575d15962f5fae9b13b2e89db523a89a6abb88aa59b66c5952e4f0202d0e64158452721b3519b71411e47669599e7cf2c906c5a1b43024e47666e5c5a1acc2905c5ffa91429397a2851467468d1a5551a029277339fddedc74d34dfa7089dcea2e3defd7bffe75f2eca46a052209691f3972a4be4472fdf41ce9b756b06328372fe380235693d2aa5f208bce3d0000a08d5118229a1314860078635d18fac52f7e517aa68a268bdee9227a6345a1545a104adf57cdadb7de9a3c73c683c60a4229293ec83374e479423d7af4d0871b9067eaa4c5a1f2c29078f0c1074bc7b20a43727de967c488116e8a16872b08a556ad5a552ad64841acda2d12376fdedca0a023b7a293b6ac675e496148bee7e5e4baf2cca5f41ce9b756b06328372fe380235693d2aa5f208bce3d0000a08d5118229a1314860078635d1892e7adc873860e1e3ca80f9516bea5c893ee026a4a94efc8d0a41f79be90f45b4ba4783068d0a0505f5f1f3a76ec18eaeaeaf4290d2c58b0202900552b703cf4d043c9b16ab78993ebcaf577efde5d73450b51febc20b9659cf6ecb3cf26c7e4fb2705a194ecc6cada35a46ffd27d74d8f6515e7bc62c7506e5ec60147ac26a555bf40169d7b0000401ba330443427280c01f0c6ba3024ce3ffffcf0da6bafe9e68a05f2968426b75393dd19b568f8f0e1c9f865b7d4902143f4e10a4f3ffd7452acd08521f1c8238f54fdfeca75e5fab263a8d68a16429ec594ce3d99671b366c6870fc965b6e498e2d59b2a441bbec4892dd59ba3824aff7eedd5b3a4fae575e7c92fe6a093b8672f3320e38623529adfa05b2e8dc030000da188521a239416108803745280cc9ade42eb9e49270e0c0017da855c9f5070f1e9cdc52ad16c92de72ebae8a2b07dfbf6d0b973e7f0c61b6fe8532a2c5ab428d965548dbebd9f5c4faefba73ffd292968d45ad122557e9b37d9bd967effe4b671f28ca6499326a977fcd5fcf9f32b8a42e5b73c94eb5c70c105a5e3d24fad61c7506e5ec60147ac26a555bf40169d7b0000401ba330443427280c01f0a60885213174e8d036ff19fbc4134fd4e4627a39d935b470e1c264474fd7ae5dc3d6ad5bf5292d22d791ebc9757ff5ab5fd5f4f7f985175e6850e0193d7a7452d479fbedb793dd719f7efaa97e4be28b2fbe480a3fe9ae21f928b7ed13f2feabafbebac175a59f5ac38ea1dcbc8c038e584d4aab7e812c3af7000080364661e8cf61d3a64d61e9d2a5c95f52cbb317d6af5f9f2c38c85fb55e7ae9a5c95f18cb62857e5f2d465b2f5a02407b2b4a61e899679e499efdf3c1071fe843ade2dd77df4d16daa59f5a26c504b965d93befbc13c68f1f1fba77ef9ebb3824ef97ebc8f55e79e5959a2d5a949b3a756a83228eec1c9236290e1d8efc3e56fe3ed98525b78f2bdf292421d7aa45ec18cacdcb38e088d5a4b4ea17c8a2730f00006863b55c1892e7398c1933260c1b362ccc9a354b7f6bc2be7dfb92a2d1fbefbf9fbc96a2d17befbd1756ac585171ad5a090a4300bc294a6148c84e13b9d5db8e1d3bf4a15cb66ddb96ec6091ebe3af458b810307862d5bb624c59c534f3db549b795ab46de27ef97eb4801a3968b16dab871e31a1473e4d940d3a64dabfacca694fcae95ee0c9242e6dd77dfdde099421272dd5ac58ea1dcbc8c038e584d4aab7e812c3af700008036568b85a1fdfbf727bb83a64c99127efffbdf270f3c96e704f4eddb3774ebd62d74e9d225f907b07c94d7d22ec7e5d627ebd6ad0b23478e4c1625a468a4afed3d280c01f0a648852121cf54911d2dadb5734876c6f4eeddbbc1b35af0d7a245ba73486effd6a953a770de79e785cd9b37eb53ab92f3e47c799fbc3fdd2954cb458b6af4ce2109f9bdeac61b6f0ccf3df75c32cfd342a87c94d78f3cf248a930a4df5beb4537760ce5e6651c70c46a525af50b64d1b9070000b4b15a2b0c95dfd75efe6275d4a851a143870ee1acb3ce0af7de7b6fb28b68e3c68dc971f928afa55d8ecb7972fece9d3bc3d34f3f9d2c08c9ed63741f9e83c210006f8a561812e9336a162c5890fc21434bc8fbd20576760a552745062952c8b397b66fdfdea2df09fef4a73f25df5f8a16d964978bcc675de4694ec8fbad76cb1489d5f740d6ebf4025ea4bc8c038e584d4aab7e812c3af700008036564b85a1e79f7f3eb9759c688dbf0edebd7b77b2f0a6fbf11c1486007853c4c29078f6d96793c5f04183068565cb9625b7d86a0a394f766248c143760ac975904d16dae57b25df67d9f5b367cf9e26ed22aeafaf4f7e17905d2d142d9ae6befbeeabb82d5c6321e7cbfbf057ec18cacdcb38e088d5a4b4ea17c8a2730f00006863b552185abe7c79f2e0e2bababa567d9e802cc0fde52f7f499edfa0fbf4181486007853d4c250ea8e3bee4816c725e43665f2470e72fb33d9e12264c7ca1ffef087b068d1a2e47671e962babc0f4d27c50729a449487e97e29afe3ebffdf6db61fefcf961c48811142d7258b56a55183d7a745250d38522792ded725cce434356054859afd30b7891f2320e38623529adfa05b2e8dc030000da582d1486d29d3eebd7af4f167bba77ef9edc022e8bec029a3b77ae6e2e9933674ef27eb98e5c4f9e513474e8d09a78e610852100de14bd30949267e249e14716cdf5b357d25d2b725cce43cb51b44091b16328372fe380235693d2aa5f208bce3d0000a08dd54261480a3d1f7ef86172cb97ae5dbb1eb62824bb7fa64c99122ebdf4527d28316bd6ac647148c875e47a725d790e84fc25b7eedb5b501802e04d2c85210060c7506e5ec60147ac26a555bf40169d7b0000401bf35e1892428fd8b56b57e8dcb9f3616f1ff7c5175f845b6fbd3529fce8c290dc326efaf4e9a5bf1a4ec9f5e4ba3b77ee0c975f7e7958b16245c5d7e029280c01f086c2108058b06328372fe380235693d2aa5f208bce3d0000a08d792f0cc9731784dc5e67c890216af4ffcfbe7dfbc2c4891343bf7efdc2d8b1631b1486a42874cf3df724b7ea915d41e5852121d795eb4b5f6bd6aca9f81a3c05852100de501802100b760ce5e6651c70c46a525af50b64d1b9070000b431cf85a18d1b3726cffed9b3674fe8d8b163a8ababd3c34f7cf6d967c9b382faf7ef1fd6ae5d1b1e79e491526128bdb59c3c57e0c5175f4cbe5fba3024d795ebcbb38664d791fe3a3c05852100de501802100b760ce5e6651c70c46a525af50b64d1b9070000b4b1e79e7b2e7cfef9e71505000f316fdebcf0c0030f24cf00ead1a3871e7ae2d34f3f4d1e223d60c080b06eddbaa42d2d0ceddfbf3fb9b55cefdebdc3b265cb9263d50a4342ae2ffd4821497f1d5e42e609852100de501802100b760ce5e6651c70c46a525af50b64d1b9070000b431f907e6d6ad5b2b8a001ee2b6db6e0bafbefa6ae8dbb76f983a75aa1e7aa8afaf4f6e013778f0e0b061c386527b5a18baf1c61b93f7befefaeba563598521b9be9cbb7efdfa3063c68c8aafc5436cdab4293cfffcf37ae80010350a430062c18ea1dcbc8c038e584d4aab7e812c3af700008036f6c1071f84254b96842d5bb6b8db393467ce9cb06ddbb670c6196784952b573618f7ce9d3b93e28fdc6a4e6e39576ee6cc99c96de5ce39e79cb07af5ea06c7b20a43727de9478a27175f7c71c5d71273c8bc90712d5ebc38992f00e009852100b160c7506e5ec60147ac26a555bf40169d7b0000403b90c57ed90922450f4f21b775135ff9ca57c2c71f7fdc60ccd75f7f7d52e059b56a55837671d5555725c79e7aea297d28b96eb5c2905c5ffa91e70cc9ce21fdb5c41e323fac8b421f7df451724b3fb9fda1fefa88b60ff9becb8294f53c005a1b852100b160c7506e5ec60147ac26a555bf40169d7b000000723be69863929d2fe55a7bc7905c5ffa3970e040d5e3c8478a422fbdf45272db436f3bdb6209f9becbf75f7618521c8227148600c4821d43b97919071cb19a9456fd025974ee010000683159c0fee28b2faaee1812adf98ca174c7d09e3d7b42cf9e3df561e4243b85bc3e0b2bb690db4ef2ac2978426108402cd831949b9771c011ab4969d52f9045e71e000080161b3e7c78b21ba8da3386529f7efa69183d7a741830604058b76e5dd2961686f6efdf1f6ebdf5d6d0bb77efa43021b20a43e93386a4c024e7a375c96dccd829548c90ff0ef2ff01e005852100b160c7506e5ec60147ac26a555bf40169d7b0000005aec9a6bae09cb972f4f76fd4c9d3a551f2ef9ecb3cfc2f8f1e393dbc7ad5dbbb6541812f29ca22953a6845ebd7a85175f7c31b33024d7977e162c5810860d1ba60f2327f9beeb020561171486e009852100b160c7506e5ec60147ac26a555bf40169d7b0000005aecce3bef0cf7dd775f78fcf1c7438f1e3df4e106f6eddb17264e9c18faf5eb17c68e1d5b2a0c8983070f867beeb927b945dcb871e3aa1686e4fad28fec1c9a376f9e3e8c9c9a5a18fa74f7e6b0feb507c2db8b2724219f4b9b3e8fc8171486e009852100b160c7506e5ec60147ac26a555bf40169d7b0000005a6cf5ead561e1c285e1934f3e091d3b760c757575fa9406e4794472eb3829fc941786841487a64f9f9e1cd38521b9ae5c5f9e2f84b6d194c2d027bb3e0e6f3d7b6d7873c1c806216d724c9f4fb43c280cc1130a430062c18ea1dcbc8c038e584d4aab7e812c3af7000000b48a2bafbc320c1932443757486f1da70b43a959b366551486e4ba727db49da6148636be3dbfa22894c6a6b79fac389f687950188227148600c4821d43b97919071cb19a9456fd025974ee0100006815bb76ed0a9d3b770e6fbcf1863e54e1c0810361eedcb9bab964ce9c39a5cfe57a72dd6ddbb685f3ce3b2fbcf3ce3b6567a2b534a530f4872537571484d29063fa7ca2e54161089e501802100b760ce5e6651c70c46a525af50b64d1b90700002037d90124b79493670075edda356cddba559fd222721db99e5cf7fefbef0f83060dd2a7a09534a530f4d6efc6551484d29063fa7ca2e54161089e501802100b760ce5e6651c70c46a525af50b64d1b907000020b7b56bd786fefdfb870f3ffc308c1f3f3e74efde3d777148de2fd791ebbdf9e69ba167cf9ec9338dd036280c152b280cc1130a430062c18ea1dcbc8c038e584d4aab7e812c3af7000000b40a7936d0e0c183c3962d5b9262cea9a79edaa4dbca5523ef93f7cb750e1e3c18eebdf7de307bf66c7d1a5a51530a436f2f9e5051104a438ee9f3899607852178426108402cd831949b9771c011ab4969d52f9045e71e00008056337dfaf4f0d1471f259fcbeddf3a75ea943c1768f3e6cdeacceae43c395fde27ef47fb694a61e8bda577541484d29063fa7ca2e54161089e501802100b760ce5e6651c70c46a525af50b64d1b9070000a04decddbb37ecdcb9338c1a352a74e8d0219c75d659c9ce9fd75e7b2d6cdcb83139473eca6b6997e3729e9cbf7dfbf6306ddab4a41deda32985a11d1faf0e6f2d1a5b5114923639a6cf275a1e1486e009852100b160c7506e5ec60147ac26a555bf40169d7b000000dac4840913c2d0a143c3f2e5cb437d7d7d78ecb1c742dfbe7d43b76edd42972e5d927f00cb47792ded727ccf9e3d61c18205a15fbf7e61e0c081e1adb7ded297451b694a614862c3ca9915852169d3e711f982c2103ca130042016ec18cacdcb38e088d5a4b4ea17c8a2730f0000409b79f4d147c380010392c24fba4b48c87383c48e1d3bc2860d1b4aed757575494148de87f6d5a4c2d0be7de1bd57efae280c499b1cab389f687150188227148600c4821d43b97919071cb19a9456fd025974ee0100006873ab57af0e070e1c28bdeed9b36738fbecb3938f7dfaf4490a44b0d55861e8935d1f87754b6faf280aa521c7e41cfd3ea2654161089e501802100b760ce5e6651c70c46a525af50b64d1b9070000c0841486501c9985a17dfbc2e6f79e0f6b9eb9baa218a443ce9173d93d943f280cc1130a430062c18ea1dcbc8c038e584d4aab7e812c3af700000098a030542cd50a438ded12ca0a760fe50f0a43f084c2108058b06328372fe380235693d2aa5f208bce3d00000026280c154bb5c2505376096585bc575f8f687a50188227148600c4821d43b97919071cb19a9456fd025974ee010000304161a858aa158674b1a7b9a1af47343d280cc1130a430062c18ea1dcbc8c038e584d4aab7e812c3af700000098a030542cd50a43845d50188227148600c4821d43b97919071cb19a9456fd025974ee010000304161a858280c152b280cc1130a430062c18ea1dcbc8c038e584d4aab7e812c3af700000098a030542c14868a151486e009852100b160c7506e5ec60147ac26a555bf40169d7b0000004c50182a160a43c50a0a43f084c2108058b06328372fe380235693d2aa5f208bce3d00000026280c150b85a16205852178426108402cd831949b9771c011ab4969d52f9045e71e0000001314868a85c250b182c2103ca130042016ec18cacdcb38e088d5a4b4ea17c8a2730f000080090a43c54261a8584161089e501802100b760ce5e6651c70c46a525af50b64d1b9070000c00485a162a13054aca030044f280c0188053b8672f3320e38623529adfa05b2e8dc0300006082c250b150182a5650188227148600c4821d43b97919071cb19a9456fd025974ee010000304161a858280c152b280cc1130a430062c18ea1dcbc8c038e584d4aab7e812c3af700000098a030542c14868a151486e009852100b160c7506e5ec60147ac26a555bf40169d7b0000004c50182a160a43c50a0a43f084c2108058b06328372fe380235693d2aa5f208bce3d00000026280c150b85a16205852178426108402cd831949b9771c011ab4969d52f9045e71e0000001314868a85c250b182c2103ca130042016ec18cacdcb38e088d5a4b4ea17c8a2730f000080090a43ed63e0c08161e1c285bab942d10a43f27bab44d66bef4161089e501802100b760ce5e6651c70c46a525af50b64d1b9070000c00485a1f621df6789c60a44168521f9dd5442b7573ba65f7b0f0a43f084c2108058b06328372fe380235693d2aa5f208bce3d00000026280cb58fb430d45881a86885211dcd39d74350188227148600c4821d43b97919071cb19a9456fd025974ee010000304161a87de8c2505681a86885217d2c7d2d71c4114784eeddbb87f7df7fbf747cfbf6ed61f0e0c1a173e7cea143870ee1c73ffe7158bf7e7dd5f757bbee71c71d17ce3cf3ccf0ca2baf541cd3ef698fa030044f280c0188053b8672f3320e38623529adfa05b2e8dc0300006082c250fbd005211d69812896c2d0430f3d1466cc98917cfed39ffeb474fcdc73cf4dda7efbdbdf86575f7d35f9fcfbdfff7ec5fbefbaebaeb06fdfbe8afed6ac59931c3fedb4d39afc9eb60c0a43f084c2108058b06328372fe380235693d2aa5f208bce3d00000026748182b08d580a43bb77ef0ebb76ed4a3eefd8b163e9f889279e583a278d638e39a6e2fdf5f5f5a5b6679e79269c7efae9e1d8638f2d1d3ff2c8230ffb9ef60a0a43f084c2108058b06328372fe380235693d2aa5f208bce3d000000704c1780d288f556725985a1934e3a2969dbb46953c5b5aa5d4fe294534e49da962e5d9a147ff439fa757b06852178426108402cd831949b9771c011ab4969d52f9045e71e00000038d6584128154b61a8fc56723ff9c94f4ac7655cd23662c488aa3b7cf4f524d262922c024d9e3cb9e21cfdba3d83c2103ca130042016ec18cacdcb38e088d5a4b4ea17c8a2730f0000001c6bac2094b22c0ce9283f56eddc238e382274ebd62dac5bb7ae747cc78e1de1c20b2f0c5dba74496e0797f5fef2fe67cf9e1d4e3ef9e4aafd67bda7bd82c2103ca130042016ec18cacdcb38e088d5a4b4ea17c8a2730f0000001c6bac2094b2280c11d94161089e501802100b760ce5e6651c70c46a525af50b64d1b907000000a03054b0a030044f280c0188053b8672f3320e38623529adfa05b2e8dc0300000050182a58501882273ffce10fc3e79f7fae9b01a050f6efdf1f8e3efa68dddc2e64bd4e2fe045cacb38e088d5a4b4ea17c8a2730f0000004061a8604161089efcf77fff77d8b56b976e06804291e715ae5fbf5e37b70b59afd30b7891f2320e38623529adfa05b2e8dc03000000981786e4f75409ddde1e61d9775650188227f3e7cf0ffff22fffa29b01a0507ef0831f849ffdec67bab95d1cfa5dc4032fe380235693d2aa5f208bce3d00000040a38521f93db25ae8f35a1aad7dbde6446bf7dd1ad7a330044feaebebc32f7ff9cb3071e2c4b072e5caff8fbd7b8192acaa0f855fa042e421212a18189468cc037357a208de8feb7783c417ea8cc9d59eaaea992120e161c088a2829a28c62478d51585c07c57d1289778318021e2155184310ccf41441d502f0292cb631861184684197c70beb3cf74757a7677f5f44c3df6aed3bfdf5affd57df6397576d7ccffecda8faa53f16e80a47ef9cb5f162f7ad18b8adb6ebbad78e49147e2dd4331d177a883ba3c0f6a245552a6aa17ba895f7b000060ce0b4371b9981efdf8b7b230441d2d5cb8b0f8f297bf5cecbaebaec5a73ffde962b7dd76f3d34f3ffd4cfef31ffff11f8b934f3e39e92d2f27fa0e755097e7418da44aca54f54237f16b0f0000f4bc3014de657bf0c107173becb0c3e4b1538fdfdeed10e19ce1dcb7df7efb167576f6efbefbeec521871c525c7df5d5d3f67562975d76295ef8c21716cf7ef6b38b9d76daa958b0604171c10517cc58f7830f3e581c73cc31c5de7bef5decb1c71ed56476f8ce816ee70ec79d77de7933eeeb9cf7fefbef2f962e5d5a3ce319cfa862c9922555d9d4e733352c0c01c0fc31d167a883ba3c0f6a245552a6aa17ba895f7b000060ce0b437174f687c593b01d16483efbd9cf4edb1f7edf71c71da79d6f6bdb53cff7fad7bf7edadf1562f5ead5d5fe030e3860dae3cf3efbec62d5aa555b6cdf74d34dd5effbecb3cf8c751f75d451d5f6c5175f5c5c7bedb5d5ef871d76d8b4739f75d65993fb9ff5ac674ddb3ff56f0c8b42a16ceaf30965f173e984852100983f26fa0e755097e7418da44aca54f54237f16b0f0000cc7961282eefc4affeeaaf56fb1f7ef8e1ea562cf1f1e1f7273de9495dcfd76d7beaf9f6dc73cfc9fd975d765971e0810756b7a4ea1c3bd3c25378fc638f3d36b91dce15d717d71d3ed1d329ebc4ce3bef3ce3b9376edc38edf1f17688a73ffde9938fe93c9f50cfd463a686852100983f26fa0e755097e7418da44aca54f54237f16b0f00000c6561a8b370138e9969ff4cdbdd1686f6dd77dfaaec9a6baea9bed8bedbe3e7b21def7be6339f596ddf73cf3d936553233e7e6bdb212c0c0100dd4cf41deaa02ecf831a499594a9ea856ee2d71e0000e87961686bb7920bdfc313b6afbffefa62f9f2e5d3f677db9e7abe458b164deeef2cdeac5cb9b238e38c33ba3e7e2edbf1bea38f3ebada3ee9a493aa45a74ef94c8f9d69fb694f7b5ab5fda31ffd68b2ccade400806e26fa12755097e7418da44aca54f54237f16b0f0000cc7961288ecefedb6ebbad38f8e0838b1d76d861c6fde79e7b6eb1d75e7b757d7cb7ed10e19c071d7450554767fff9e79f5f7dafcfb69e6fa6ed78dfba75eb8a134f3cb158b06041f529a778ffd6b64f3ffdf4c94f0875caefbffffe6a2128948758b2644955d6794c1c16860060fe98e833d4415d9e0735922a2953d50bddc4af3d0000b0d585a16d8dd0ef0c1197cf357a7dfca887852100983f26fa3d755097e7418da44aca54f54237f16b0f00005818ca2c2c0c01c0fc31d1efa983ba3c0f6a245552a6aa17ba895f7b0000a0ef0b43a2b7b0300400f34798af8b27f046545d9e0735922a2953d50bddc4af3d0000606128b3b0300400f34798af8b27f046545d9e0735922a2953d50bddc4af3d0000606128b3b0300400f34798af8b27f046545d9e0735922a2953d50bddc4af3d0000606128b3b0300400f34798af8b27f046545d9e0735922a2953d50bddc4af3d0000606128b3b0300400f34798af8b27f046545d9e0735922a2953d50bddc4af3d0000606128b3b0300400f34798af8b27f046545d9e0735922a2953d50bddc4af3d0000606128b3b0300400f34798af8b27f046545d9e0735922a2953d50bddc4af3d0000606128b3b0300400f34798af8b27f046545d9e0735922a2953d50bddc4af3d0000606128b3b0300400f34798af8b27f046545d9e0735922a2953d50bddc4af3d0000606128b3b0300400f34798af8b27f046545d9e0735922a2953d50bddc4af3d0000606128b3b0300400f34798af8b27f046545d9e0735922a2953d50bddc4af3d0000606128b3b0300400f34798af8b27f046545d9e0735922a2953d50bddc4af3d0000606128b3b0300400f34798af8b27f046545d9e0735922a2953d50bddc4af3d0000606128b3b0300400f34798af8b27f046545d9e0735922a2953d50bddc4af3d0000606128b3b0300400f34798af8b27f046545d9e0735922a2953d50bddc4af3d0000606128b3b0300400f34798af8b27f046545d9e0735922a2953d50bddc4af3d0000606128b3b0300400f34798af8b27f046545d9e0735922a2953d50bddc4af3d0000606128b3b0300400f34798af8b27f046545d9e0735922a2953d50bddc4af3d0000505c71c515c5c68d1ba72d5088e147f87fb0300400f34798af8b27f046545d9e0735922a2953d50bddc4af3d000050ac5cb9b258bb76edb4450a31fcb8e79e7b8a2bafbc32fe2f02006a2accd7c5137823aa2ecf831a499594a9ea856ee2d71e000028eeb8e38e62c58a15c5fdf7dfef93438922fcbb8745a1af7ffdebd5ff0700303f84f9ba78026f44d5e5795023a9923255bdd04dfcda03000095b018113ea9126e6326d244f8f7b7280400f34b98af8b27f046545d9e0735922a2953d50bddc4af3d00000000402261be2e9ec01b5175791ed448aaa44c552f7413bff600000000008984f9ba78026f44d5e5795023a9923255bdd04dfcda03000000002412e6ebe209bc115597e7418da44aca54f54237f16b0f00000000904898af8b27f046545d9e0735922a2953d50bddc4af3d00000000402261be2e9ec01b5175791ed448aaa44c552f7413bff600000000008984f9ba78026f44d5e5795023a9923255bdd04dfcda03000000002412e6ebe209bc115597e7418da44aca54f54237f16b0f00000000904898af8b27f046545d9e0735922a2953d50bddc4af3d00000000402261be2e9ec01b5175791ed448aaa44c552f7413bff600000000008984f9ba78026f44d5e5795023a9923255bdd04dfcda03000000002412e6ebe209bc115597e7418da44aca54f54237f16b0f00000000904898af8b27f046545d9e0735922a2953d50bddc4af3d00000000402261be2e9ec01b5175791ed448aaa44c552f7413bff600000000008984f9ba78026f44d5e5795023a9923255bdd04dfcda03b571fffdf717d75d77dde4f69d77de59b45aade2c8238f2cdefef6b7179ff9cc67fee360000000800c84f9ba78026f44d5e5795023a9923255bdd04dfcda0323efa69b6e2adef7bef7156f7ef39b8b7ffaa77f8a77179b366d2aeeb9e79ee2f6db6f9f2cbbe38e3b8a6f7deb5b538e0200000018be305f174fe08da8ba3c0f6a245552a6aa17ba895f7b60a43df1c413c599679e59dc70c30dc5238f3c525c78e185c5b265cb8a830e3aa858b06041d5b90a3fc376280ffb7ffad39f16b7dd765bf1ce77beb3f8c0073e50ac5dbb363e2d000000c05084b98b78026f44d5e5795023a9923255bdd04dfcda032369e3c68d93bfaf5fbfbe38f5d4538b3df6d8a378f5ab5f5d7cf2939f2c6ebcf1c6e2eebbefaef6879f613b9487fde1b870fc430f3d547ce52b5f298e3df6d8ea7700000080610bf375f104de88aacbf3a046522565aa7aa19bf8b50746ce8a152baa5bc705175d7451b1d75e7b558b3b6bd6ac292ebef8e2e8e8e9c271e1f8f0b8f0f8871f7e383e040000006028c27c5d3c8137a2eaf23ca891544999aa5ee8267eed8191b26ad5aae284134e28eebbefbeea3670cf79ce7326bf2be881071e285aad5671cb2db7448f9a59785c787c384fb8255db061c386e82800000080c109f375f104de88aacbf3a046522565aa7aa19bf8b50746c68f7ffce3ea933e77de7967b59873f0c1076ff1fd40575c7145b53074d24927153ffbd9cfa63c72666131283c3e9c279c2f7c47d1f1c71fef3b8700000080a109f375f104de88aacbf3a046522565aa7aa19bf8b507464658c8b9ebaebbaadbbfedbffffed316703ef6b18f15471c7144b53874c105176cb16f26d75c734df5339c279c2f9cf7d24b2fad1689000000008621ccd7c5137823aa2ecf831a499594a9ea856ee2d71e1829ebd7af2ff6de7befc9dbc775fcf297bf2cdef4a63715cb972f2f3efef18f174b972e2deebdf7de2d8e99ea3bdff94ef1d9cf7e76723b9c2f9cf7a1871e2adef9ce774e3b3f000000c02084f9ba78026f44d5e5795023a9923255bdd04dfcda0323e1073ff841f5f394534e298e3beeb8686f51dc76db6dd52785c2a780c2e25158249afadd415385c59f704bbaebafbf7e8bf270de70fe5057a73e00000080410af375f104de88aacbf3a046522565aa7aa19bf8b507b2b766cd9aeabb7f7ef2939f147beeb96771df7df7c58754b7816bb7dbc5860d1baaedcb2fbfbc5a285ab162c516c7854f168505a3a9c77684f386f387ef1a020000001886305f174fe08da8ba3c0f6a245552a6aa1766b4d34e3b3df1f8e38fc7af3f90b54b2eb9a4f8cc673e532dfe1c7ef8e1f1eecafbdef7bee2ddef7ef7e476f8a45028fbb33ffbb32d1680fef99fffb95a300ab78b9b49387fa80700000060d0366dda745fa3d1d814cfe18d2873e164275552a6aa1766f4fce73f7fdd8d37de18bf0641d6fefeefffbeb8f6da6b8b65cb96159ff8c427e2ddc5a38f3e5a8c8f8f179ffffce78bdb6fbfbdb8f2ca2babf2bbefbebb58b2644971f6d96757dbdffdee77ab4f0a8585a1b0d0349370fe50cf5d77dd559c77de79f16e00000080bef9ca57be7259a3d1b8319ec31b51e6c2c94eaaa44c552fcc68bffdf6fbdb57bdea553f8b5f842067e1533e0f3cf040f1e217bfb8f8e637bf19ef2e6eb8e1866ab1e7a69b6e2afee22ffea2faaea0c71e7bacda17168bc2be952b5756df2bb474e9d26a7bd5aa55d159360be70ff5dc7befbdc549279d14ef06000000e89775bbeebaebd71b8dc6bbe239bc11652e9ceca44aca54f542374f7aea539f7aed4b5ef2927baebbeeba07dc568e51b2cf3efb540b36b173ce39a738eaa8a38a33cf3cb3fa445088b09814fcec673fab1678c2625038e6acb3ceaaf677fb1ea170fe504f58580ac7033078bff8c52fe2220000a8ad4d9b36ad099f14da75d75d2f6f341a2bc27c5d3c8137a2cc85939d544999aa5e984d78b17967193795f17863739e0a916d5c78e18555c769e79d772e665acc0c9f123ae28823aac59ff3cf3fbfba755cd85eb76e5db57ff5ead5d5be703bba0f7ef083c529a79c129de13f84f3877a7ef9cb5f568f89ff16218410fd8d1d77dcb178c31bde50ecb0c30ed3f609218410420851d308f371615e2ecccfd565512808cf0db2922a2953d50b501b975c72c9bf854ffeccf489a1356bd6540b3821def39ef754ef3a7ff0c107abef095abe7cf9e471e13673e11ca1fcdc73cf9d72862d753e31f4d39ffe347c3fd14fe2bf0580fe1a1f1fff83b20d5f1d9703000023c75c38d9499594a9ea05a88de38e3bee81bbefbe7bc6ef18faea57bf5a2d0afde99ffe69b548d4113e39146e1977d75d774d96dd7aebadd5b1f139a69afa1d434b962cb933fe5b00e8af66b37944d9367f2e2e070000468eb970b2932a2953d50b501b279f7cf277aebffefaead33e9ff8c427b658c8f9c8473e522df6ac58b1628bf2f01d41c71e7b6cf1377ff3379365e1967461b1e8d1471f9d72e496c2f9433dd75c73cd2fca63ff25fe5b00e8af66b3f9d1b21d3f252e070000468eb970b2932a2953d50b501bef78c73b3ef4a94f7daab8e8a28b8ac30f3f7c721127dc36eea8a38e2a3ef6b18f4d59daf90f9d4f13dd7cf3cdd5f6fbdffffee2ddef7e7774d496c2f9433ddffffef7bfd96c365f19ff2d00f457d94e7fad6c6f0f8fcb01008091632e9ceca44aca54f502d4c6d8d8d86f7ee94b5f5afbc8238f147beeb96771df7df7558b38dffffef78b3ffff33fafbe0f682661e1e8ed6f7f7bf18e77bca3fa04d1d2a54b8bf3ce3b2f3e6c52386f387fa8a7f4b6f8ef00a0ff5aadd6fd655fcaeebc00006af6494441543bbf6f5c0e00008c1c73e164275552a6aa17a0568aa2f86058ad39e594538ae38e3bae5ac809b7865bbd7af57faceccce0c61b6fac3e35f4f18f7fbcfaf9ad6f7d2b3e6452386f387fe9e765ec1fff0d00f4d7b265cbf62adbe675713900003092cc85939d544999aa5e805a298ae2d7ca585f2af6de7bef6a81e7baebaedb6261a79b0f7ce003d5a2d0f8f878f5c9a19984f385f3ae5bb72e2c0edd5d1ebf7ffc3700d05f8b172f7e79d9deae88cb01008091642e9ceca44aca54f502d4cec73ef6b1af5e7ae9a5d57700edbffffe93b794db9a3beeb8a368b7dbc57bdffbde785765eddab5d5f9c279cbf33f7ec41147ac8ceb06a0ff9acde6db5badd619713900003092cc85939d544999aa5e80da79eb5bdffadb471f7df4cfeebaebaeea5340071f7c70b5a83317679e7966f1b9cf7d2e2eae1e1fce13ce77e79d7716471c71c44fc6c7c79f1fd70d40ffb5dbed735badd6d1713900003092cc85939d544999aa5e805a7afbdbdffea6e38f3ffe17f7df7f7fb598f39ce73c67d6ef0dea080b40b7dc72cb1665e171e1f1e13c4f3cf14471c105175cde6eb7ff38ae1380c168369b37b75aad17c7e50000c04832174e76522565aa7a016aeb031ff8c0296bd7aeadee23176effb6d75e7b15c71e7b6cb166cd9a2d167eba09c785e3c3e3c2e327848f133d39ae0b80c138f4d0439fdc6ab51e1d1b1b7b6abc0f00001849e6c2c94eaaa44c552f40ad1545f1ac32ae7becb1c78a871e7aa838f5d4538b3df6d8a378f5ab5f5d7cf2939f2c6ebcf1c6e2eebbefae567cc2cfb01dcac3fe705c383e3ceed24b2f7de2bcf3cebb283e3f0083d56eb75f50c60fe27200006064990b273ba9923255bd00b55714c5ce1ffde847af38f9e4937f11167e366cd8505c78e185c5b265cb8a830e3aa858b060416883ab9f613b9487fd8f3cf24871c30d37146f7bdbdb1e3df6d863bfd56c369f179f1b80c16a6f76415c0e00008c2c73e164275552a6aa1760de38e9a493da6f7deb5bef3ef6d8637ffec0030f746e0d577d6f50b07efdfae2de7befed143ffed0430f7de3cd6f7ef3ea76bbbd303e1700c351b6c1a7b75aadbf8ccb01008091652e9ceca44aca54f502cc3be3e3e3cf7ffcf1c75f5014c55bcaf8dba38e3a6a63abd52adef4a637854f06fdf8befbee5b56963f2d7e1c00c3d76c36bf5cb6d18be27200006064990b273ba9923255bd0094c2c2505c06407a65fb7c7719fbc7e50000c0c832074376522565aa7a016854138f4f943f7688cb0148676c6cecd7caf679435c0e00008c3473e164275552a6aa178046b530f48bb1b1b127c5e500a4d36eb7ffb06c9faf8ecb01008091662e9ceca44aca54f502d0a816867e76ecb1c73e252e07209d76bbfd96b27d5e1e9703000023cd5c38d9499594a9ea05a0512d0c6d3cf2c8237f252e07209d66b3794ed93e1f1f9703000023cd5c38d9499594a9ea05a0512d0c3dba70e1c25de27200d229dbe655651c129703000023cd5c38d9499594a9ea05a0514d3e3e323636b65b5c0e401aa79d76da8e65dbfcd3458b16ed1eef030000469ab970b2932a2953d50b40a35a18dab064c992a7c5e500a4d16c367fab6c9bef88cb01008091672e9ceca44aca54f502d0a82620d71f79e491bf1a97039046abd57a63d9365f1c9703000023cf5c38d9499594a9ea05a0514d40ae1b1b1bfbb5b81c8034ca76f9afdbedf607e272000060e4990b273ba9923255bd0034aa09c807daedf633e27200d228dbe57f2ddbe537c4e50000c0c833174e76522565aa7a01685413906b972d5bb6575c0e401a65bb7ce7f8f8f8f3e372000060e4990b273ba9923255bd0034aa09c835636363cf8acb0118be458b16ed5eb6cb3f3dedb4d3768cf701000023cf5c38d9499594a9ea05a0512d0cdd5bc63e713900c357b6c7879471435c0e0000d482b970b2932a2953d50b40a39a84bc7bc992250be2720086af6c938f6f369be7c4e50000402d980b273ba9923255bd0034aa49c87f1f1b1b7b765c0ec0f0956df2f276bbfd96b81c0000a80573e164275552a6aa1780463509f9a332f68fcb0118beb23dbebadd6eff615c0e0000d482b970b2932a2953d50b40a39a84bc637c7cfcb971390043b743d9266f28dbe43de31d0000402d980b273ba9923255bd0034aa85a11f8e8d8dfd665c0ec070956df16f84ef7d8bcb010080da30174e76522565aa7a0168540b43ffa7d96cfe565c0ec070956df1ebcb36f97fc7e50000406d980b273ba9923255bd0034aa85a1ef359bcddf8dcb0118aeb23dfeab32fe2e2e0700006ac35c38d9499594a9ea05a0514d44ded26eb75f109703305c657b7c61b3d96cc5e50000406d980b273ba9923255bd0034aa5b177d77c99225ff292e0760b8c2ad3dc7c6c60e88cb010080da30174e76522565aa7a0168541391df6e369bbf1f9703303c0b172edca56c8f1f3df4d0439f1cef0300006ac35c38d9499594a9ea05a0512d0c7dab8c17c6e5000c4fb3d93c28b4c771390000502be6c2c94eaaa44c552f008d6a61e89be3e3e307c6e5000c4fd9161f5dc667e3720000a056cc85939d544999aa5e001ad564e4aaf04ef5b81c80e129dbe233cab6f8ed71390000502be6c2c94eaaa44c552f008d6a32f2fa325e129703303c653bbc62f1e2c52f8fcb0100805a31174e76522565aa7a0168549391d7b6dbedff272e076078cab678ddb265cbf68acb0100805a31174e76522565aa7a0168549391572f5ebcf8bfc4e5000cc7d8d8d8be655b7c7f5c0e0000d48eb970b2932a2953d50b40a35a18baaa8cff372e076038c6c7c75f53b6c35f8bcb010080da31174e76522565aa7a0168540b43df68b7db7f189703301ccd66f3d4b22dfe485c0e0000d48eb970b2932a2953d50b40a9dd6e5fb978f1e297c5e5000c47abd5fa5f652c8bcb010080da31174e76522565aa7a01685413925f2fe38fe2720086a36c836f69369bbf1f97030000b5632e9ceca44aca54f502d0a82624bfd66eb75f11970330786363633b95edf063e167bc0f0000a81d73e164275552a6aa178046b530f49576bbfdeab81c80c11b1f1fff83b21d5e1d97030000b5642e9ceca44aca54f502d0a8bef4fccbe3e3e3af89cb0118bcb20d3ea2d56a7d2e2e0700006ac95c38d9499594a9ea05a0517d62e84bcd66f3757139008357b6bf1f2ddbe153e2720000a096cc85939d544999aa5e001ad5c2d017cb581497033078e17bde9acde6e171390000504be6c2c94eaaa44c552f008deaddea17b7dbed3f8ecb0118bc56ab75ffd8d8d8be71390000504be6c2c94eaaa44c552f008d6a52f20bcd66f3bfc5e5000cd6b265cbf62adbe07571390000505be6c2c94eaaa44c552f008d6a61e8c232de18970330588b172f7e79d9feae88cb010080da32174e76522565aa7a0168540b43ffdc6eb717c7e5000c56b3d97c7bd9069f1197030000b5652e9ceca44aca54f502506ab7dbe7379bcd565c0ec06095edefb9ad56ebe8b81c0000a82d73e164275552a6aa178046f589a1cf95311e97033058cd66f3e6b2fd7d715c0e0000d496b970b2932a2953d50b40a35a183aafdd6e2f8dcb01189c430f3df4c965fbfbe8d8d8d853e37d0000406d990b273ba9923255bd003436dfcaa8d96c1e119703303865dbfb82327e1097030000b5662e9ceca44aca54f502d0a83e31f499328e8ccb01189cf66617c4e5000040ad990b273ba9923255bd0034aa85a14f97f1a6b81c80c169b7dba7976def5fc6e5000040ad990b273ba9923255bd0034aa2f3f3fa7dd6eff595c0ec0e0946def975badd6a2b81c0000a83573e164275552a6aa178046f589a14f94716c5c0ec0e094edeedd65ec1f97030000b5662e9ceca44aca54f502d0a8262797379bcd37c7e5000cc6d8d8d8af956def86b81c0000a83d73e164275552a6aa178046b53074561927c4e5000c46bbddfec3b2ddbd3a2e0700006acf5c38d9499594a9ea05a0517dcfc599ed76fb2d7139008311dadcf069cdb81c0000a83d73e164275552a6aa1780463541f9f166b3f9d6b81c80c128dbdc735aadd6f171390000507be6c2c94eaaa44c552f008dea56727f5fc6dbe2720006a36c73579571485c0e0000d49eb970b2932a2953d50b40a37ae7fa47dbedf6c9713900fd77da69a7edd86ab57eba68d1a2dde37d000040ed990b273ba9923255bd0034aa5bc97db8d96cbe332e07a0ffcaf6f6b75aadd61d71390000302f980b273ba9923255bd0034aa5b1a7da88c53e27200faaf6c6fdfd86c362f8ecb01008079c15c38d9499594a9ea05a0514d52fe5dbbdd7e775c0e40ff956dee5f976dee07e2720000605e30174e76522565aa7a016854b792fb9b66b3f9deb81c80fe6bb55aff5ab6bb6f88cb01008079c15c38d9499594a9ea05a0b1f9ddeb65fc555c0e40ff95eded9de3e3e3cf8fcb01008079c15c38d9499594a9ea05a0514d529e56c6fbe37200fa6bd1a245bb97eded4f4f3bedb41de37d0000c0bc602e9ceca44aca54f502506a369beff37d170083d76ab50e29e386b81c00009837cc85939d544999aa5e001ad544e55f96f1c1b81c80fe2adbdae39bcde63971390000306f980b273ba9923255bd0034aa89caf794f1b7713900fd55b6b5cbdbedf65be272000060de30174e76522565aa7a0168541395a794f1a1b81c80fe2adbdaabdbedf61fc6e50000c0bc612e9ceca44aca54f502d0a8be63e89ded76fbc37139007db543abd5da303e3ebe67bc0300009837cc85939d544999aa5e004aed76fbe466b3f9d1b81c80fe191b1bfb8d56ab75775c0e0000cc2be6c2c94eaaa44c552f008dead6466f2be3efe37200faa7d96cbebe6c6bff775c0e0000cc2be6c2c94eaaa44c552f008d6ab2f2aded76fbe3713900fdd36ab5feaa8cbf8bcb01008079c55c38d9499594a9ea05a051dd4aee2dcd66f3ccb81c80fe69b55a17966d6d2b2e070000e61573e164275552a6aa178046355979421967c5e500f44fd9cefe9fb1b1b103e2720000605e31174e76522565aa7a016854b7927b73abd55a1e9703b0ed162e5cb84bd9aefe8fb25dfd8b320e1d1f1fdf339495bf3f7ae8a1873e393e1e00009857cc85939d544999aa5e001ad5ade48e0b9398713900dba7d56add504631257e5cc6c3657bfbe1f26773c99225ff696c6cec49f1e3000080da33174e76522565aa7a0168541398c794f1c9b81c80edd36c36df172d0c4d8b76297e1c0000507be6c2c94eaaa44c552f008d6a61e8e8323e159703b07dc6c7c70f8c1782a2b0180f0000f393b970b2932a2953d50b40a37a67fb51ed76fb1fe37200b6db0ead56ebbe1916848ab2cdfdee91471ef92bf10300008079c15c38d9499594a9ea05a0517dc7d09fb65aadcfc6e5006cbff049cc7851a88c47ca36f777e26301008079c35c38d9499594a9ea05a0514d5e2e2be37fc6e5006cbf66b3f9dfe285a176bbbd343e0e00009857cc85939d544999aa5e001ad5e4e59276bbfd4f713900db6fd1a245bbb75aadc7a72c0c7d3a3e0600009877cc85939d544999aa5e001ad5ade4daad56eb7fc5e500f4a66c5e2f9f58147a606c6ceca9f17e000060de31174e76522565aa7a01685413978b5badd63fc7e500f4a66c5f4f6a369b3f2fdbd853e27d0000c0bc642e9ceca44aca54f502d0a8be63e88d655c189703d09bf1f1f1e797edeb3dcd66f3f7e37d0000c0bc642e9ceca44aca54f502d098fc82f42fc4e5c35014c54e77de79e705d75d77ddcfaeb8e28ae2f2cb2f17438ef2dffd89abaebaeabe2bafbcf2f5f1ff0f0c9a36207d680300a0bff46fd287fe0d9933174e76522565aa7a016854b73afae366b379715c3e0ce580e9c2b2c35eac5dbbb6d8b87163f1f8e38f8b2147f8770ffffedff8c637369483a8d7c6ff473048da80f4a10d0080fed2bf491ffa3764ce5c38d9499594a9ea05a051dd4a6e51195f8ccb8721bc8b2e74d8e38ebc187eac59b3e6c172d0b42afe3f8241d206e413da0000e80ffd9b7c42ff864c990b273ba9923255bd0034aa5bc9bdaed56a7d292e1f86706b05efa2cb23c2ff433968da14ff1fc1206903f2096d0000f487fe4d3ea17f43a6cc85939d544999aa5e001ad597a3bfa6d96c7e392e1f8670ffe7b8f32ed245f8ff88ff8f6090b40179853600007aa77f9357e8df9021394976522565aa7a016854df31f4ea56abf595b87c18b63668baf18e078a532ef86ef1f6f3bf3d6b7ce4d21f14f7ad7b64dae3c5b6854113c3a60dc82bb40100d0bbadf56f3af1d387d71477def899e2d6afff7515e1f750161f277a0bfd1b322427c94eaaa44c552f008dea5672af6cb55a5f8dcb8761b641d3a9177eb7b8e1f61f1797df72dfb449e099e2132b6e9f760eb16d61d0c4b06903f20a6d0000f46eb6fe4d271e597f6f71cb57ffaaf8ce97dfb94584b2b02f3e5e6c7fe8df9021394976522565aa7a01282d5ebcf8e5ed76fbf2b87c18661b348589def029807b1e7c64da04f04cf1be7f593ded1c62dbc2a08961d306e415da0000e8dd6cfd9b4edc7deb25d316853a71cfad5f9a76bcd8fed0bf21437292eca44aca54f502d0a86e257758abd5ba222e1f86d9064d61a2f79dfffc9d69e5627061d0c4b06903f20a6d0000f46eb6fe4d27bebfe2bf4f5b10ea44d8171f2fb63ff46fc8909c243ba9923255bd00945aadd6a165ac88cb8761b64153fc6980d9227eacd8be306862d8b40179853600007a375bffa613b75c7edab405a14e847df1f162fb43ff860cc949b2932a2953d50b40a3ba95dc7f6db7dbff16970fc36c83a678e277b6881f2bb62f0c9a18366d405ea10d0080decdd6bfe98485a1e185fe0d19929364275552a6aa178046752bb997b65aad9571f930cc36688a277e678bf8b162fbc2a08961d306e415da0000e8dd6cfd9b4edcfaf5bf9eb620d489b02f3e5e6c7fe8df9021394976522565aa7a016854b7923ba48c6be2f261986dd0144ffcce16f163c5f6854113c3a60dc82bb40100d0bbd9fa379df8e135674d5b10ea44d8171f2fb63ff46fc8909c243ba9923255bd00949acde67f6eb55ad7c7e5c330dba0299ef89d2de2c78aed0b8326864d1b9057680300a077b3f56f3ab1eedeef16b77cedfdd316854259d8171f2fb63ff46fc8909c243ba9923255bd0034aa85a1835aadd6aab87c18661b34c513bfb345fc58b17d61d0c4b06903f20a6d0000f46eb6fecdd4f8d137ffe7b485a150161f277a0bfd1b322427c94eaaa44c552f00a5f1f1f1035badd637e3f261986dd0144ffcce16f163c5f6854113c3a60dc82bb40100d0bbd9fa3793b16953f1c36bffbf690b43a12cec9b76bcd8eed0bf21437292eca44aca54f502d0a8be63e885657c2b2e1f8699064deffb97d5d3267d678b707c7c0eb17d61d0c4b06903f20a6d0000f46ea6fecdd47864fdbdc56dd7fcc3b445a14e847de198f87162fb42ff860cc949b2932a2953d50b40a3ba95dcefb75aad6fc7e5c330d3a0e9132b6e9f36f13b5b84e3e37388ed0b8326864d1b9057680300a07733f56faad8b4a958f3c32b8bd597bd67da62501ce19870ac4f0ff51efa3764484e929d544999aa5e004a4b962cf94fcd66f3bb71f930cc3468ba6fdd23c5472efdc1b4c9df99221c178e8fcf21b62f0c9a18366d405ea10d0080decdd4bfd9daa784ba854f0ff51efa3764484e929d544999aa5e004aed76fb05ad56eb96b87c18661a34897461d0c4b06903f20a6d0000f46ea6fecd5c3e25d42dc263e3f389b987fe0d19929364275552a6aa178046752bb9df6db55adf8bcb8761a641934817064d0c9b3620afd0060040ef66eadfc48b3ddb1af1f9c4dc43ff860cc949b2932a2953d50b40696c6cecb7dbedf60fe2f2619869d024d2854153efcaeb69df56ab757cb3d9bca4fcb9aa8cbbcb28267eae9a283f3e1c173f763ed206e415da0000e89dfe4d5ea17f333cc642732627c94eaaa44c552f00a5f1f1f1e7979db3dbe2f2613068ca2b0c9ab6dfe2c58b5f565e47574d0c7ce61a5785c7c5e79a4fb40179853600007aa77f9357e8df0c9eb1d036939364275552a6aa178046752bb9e7959db2dbe3f2613068ca2b0c9ab6ddc4f5f39519063adb125f09e789cf3d1f6803f20a6d0000f44eff26afd0bf191c63a1ed2627c94eaaa44c552f008deae3debf5176c6ee8ccb87c1a029af3068da368b172f7e79bbdd7e78eac066d9b265c5e9a79f5e5c71c515c51d77dc51ac5bb7ae08c2cfb01dcac3fe705c34207a289c2faea3eeb40179853600007aa77f9357e8df0c86b1504fe424d9499594a9ea05a051dd4aee396547ecaeb87c180c9af20a83a6b92baf99379503a15f7406334b962c29ce39e79c62fdfaf5d5e0676bc271e1f8f0b82903a29f87f3c675d5993620afd0060040eff46ff20afd9bfe3316ea999c243ba9923255bd0034aa4edd7e65fcdfb87c180c9af20a83a6b9997877dce440e8c4134f2c7ef4a31fc5e39d39098f0b8f9f3a209a4fef96d306e415da0000e89dfe4d5ea17fd35fc6427d2127c94eaaa44c552f008dea5672fb961db07be2f2613068ca2b0c9ab6aebc5e7e737c7c7c7d67f0f2def7beb7d8b061433cc6d926e1f1e13c530644eb423d71dd75a40dc82bb40100d03bfd9bbc42ffa67f8c85fa464e929d544999aa5e004a4b972efdf5b2f3755f5c3e0c064d798541d3d695d7caa59d414b78775baf03a18e709ee8dd7297c675d7913620afd0060040eff46ff20afd9bfe3116ea1b394976522565aa7a01282d5bb66cafb2e3b5362e1f0683a6bcc2a069768b172f7e5967b012ee87bdbdb74ce8269c6fea7db6437df1df5037da80bc421b0000bd4bd1bf696c9e5b9b56de4b6ceb39bff0852f14cf7dee738b1d77dc719b1e37e8d0bfe90f63a1be929364275552a6aa178052bbdd7e46d9f17a202e1f86148326d13d0c9a66575e272b3b0395f065a98310ce3be59d722be3bfa16eb40179853600007ad7ad7fd398586889233e6e7ba29fe7eac4b69e73bffdf6ab8ebff9e69ba7ed4b19fa37fd612cd4577292eca44aca54f502d0a8ee13fc6b65a76b5d5c3e0cdd064d224dccc74153b895e25cbee074e2bbb89e08839465cb9615ebd7af8fc7317d11ce1bce3f31187a22d41bff2d75a20dc82be6631b0000fdd6ad7fd3d8c68596518b5c9f9ffe4d77612cd46c36ffdb69a79db663bc6f2a63a1be939364275552a6aa1780d291471ef9ab6567707d5c3e0cdd064d224dccc7415339d8f8ed8981c7b7cb5876ecb1c73e253e2628af913777debdf6a10f7d281ec3f455387fa7ae506ffcb7d4893620af988f6d0000f45bb7fe4d632b0b279dfd9dd87befbd8bf3ce3baf58b3664db1cb2ebb14cf7bdef38a4d9b3655c7869fe1b66dbbeeba6b71fffdf7cf78ee4ed9eebbef5e1c72c821c5d5575f3d6ddf4c8f8b8f89b7e3bf6fa67d9dc785bf6de9d2a5c5339ef18c2ac2adc24259b773ce54169efb0b5ff8c2e2d9cf7e76b1d34e3b150b162c282eb8e082ead8071f7cb038e69863aabf658f3df628162e5c58dc79e79d5b3c0ffd9beec6c7c79f3b31eef861bbddfef3238f3cf257e2630263a1be939364275552a6aa178052d9397f5ad9e9da10970f43b741934813f371d054e6fe7e9d81c744dc5bc629e52069cfe8b87fe91cf3f5af7f3d1ebff45538ff94bfe75fa6fe1d75a30dc82be6631b0000fdd6ad7fd39861f12444bcffacb3ce2aaebdf6daeaf7673deb59d5bee38e3baedafee217bf586dffebbffe6bb57dfcf1c76ff1d8b8ce10ab57afaef61d70c001d3ea5abe7cf9e462531cf13967fbfb663a3e4458140a656101e9b39ffd6cf57b288b1f33f5efe8949d7df6d9c5aa55abb6d8bee9a69baadff7d9679fead8a38e3aaadabef8e28b27ffa6c30e3b6c8bbf41ffa6bbf089a1682cf44019a78d8d8d3d73ea71c6427d2727c94eaaa44c552f008dea1313bb951dae47e2f261e836681269623e0e9a266ea53875f0d1899f96714678175d38aefcfdc6cebef02ec4410ae79ff277dc18ffcd75a20dc82be6631b0000fdd6ad7fd39861e164a6fd0f3ffc70b171e3c62d8ebff5d65b8b1d77dcb178e52b5f596dbfe215afa8b6bff7bdefcd78eecb2ebbac38f0c003ab4f1475f685e3e3ba366cd830edef888f89b767fafb663a3ec4d39ffef4c9c784db8485dfc32787e2c74cfd3ba6d6f3d8638f4d6e87c7c7f5847375b63bb1f3ce3b6ff137e8df7417ee1e32c33828c4c632969763a1e787e38c85fa4e4e929d544999aa5e004a0b172edca5ec703d1a97f7a23cdf8a320e8dcb63dd064db94763ca6024c417bef085ea560e61b0d5298f8f1985988f83a6c30f3f7ce719064253e317cd66f3a2d6e677cf55650f3df4503c7ee9ab70fe29f5df1bffcd7532aa6dc0d6a23182d77f88f9d8060040bf75ebdf34b6d23f88f7c7dbaf7ded6b8b1d76d8a1fab450f8196e9bd6edd87df7ddb7dabee69a6baa4597787fbc3d53c4c76ceb7688b92e0c6d6fbdcf7ce633abdfefb9e79e2dce3135f46fba1b1b1bdb6986f1cfd4f8656bf3a7858c85fa4b4e929d544999aa5e001ad5bb847ea5ec706d8ccb7b31a523b7a235cb0251b74153bfa231316838f9e493a795c5c7768b998e8fcbf6db6fbf6afbe69b6fee7acc28440d064d3b2c5bb66cd770eb8332eff66fb7db2f68369b07851c2ce3b5e5ef63e5cf23cb38a1fcfd9de5cfd3caf8486be28b54bb4579eccfa76efffce73f8fc72f7d15ce3fa5be4df193ac9341b701b34563e21a8d233e6e7ba29fe71a66d4a00d0080e4baf56f1a5be91fc4fbe3ed89d7e962b7dd76ab7e865b6e753bb6b360b272e5cae28c33ce98b63fde9e29e263b6753bc45c6f25b7bdf51e7df4d1d5ef279d7452d74f3fd5b97f538e7b9e14ee00528e81f61a1f1f7f4e39fef99d72ecf2a2c58b17ff97f2f75794638945659445cda3c27708957172b9fd5765fc5d59f6b1f2e7275a5b190b95f18ba9dbc6427d51db9c6474a54aca54f502d0987c97d0e371792f66e84cae68cdb040d46dd0d4af684c0c1ac2c0a83350e894c5c7768bb91c3f97634621863068daae859bf2f7b3cb9f9f2de3c2f2f72f973fbf51c68de5e36f2d7fded5dafc0eb6475b9bdfd1167efeb88c1f4dec5f55c68af0b872fb82f2f7cf84f395bf7fb8fcfdfd13f5845b25c4391be2fe32de511ebb77f9f3be4eb977c9f5cfa0db80d9a25193ebb69f31843600006aaf5bffa631d1f78823dedf6d3bc48b5ef4a2aa2cfc9ce9dc9dedf3cf3fbffafe9fb9d63553c4c76ceb7688fbefbfbf5a080a9f1c0ab164c992aa6cb6c7c465b36daf5bb7ae38f1c4138b050b164cdebd213edfb0fb37617c5dc61ee1fb7bc26da9cbf1c6ef8531cfe2c58bff6b39ae7875d9bfff9332c6cbdfffac8cb794f1ae72fbb4f298ff5efefc87323e55c6e7caed8bcbb8acdcff6fadcdb772bba58c3bcb5853c6c365fcacb579d1e69132d6b6368f8bbe5fc64d655c5d3eeef2f2e717cbf87c6b620c54c647cbdfffbadcf7ee324e2a7f3fb6d57d2c14be7bf52ffee44ffee4e92d63a17e1b6a4ec25ca44aca54f502503af4d0439f5c76b87e1e97f762864e652756b4a62c10751b34f52b1a130383d7bdee75c5a73ef5a92dca3ac774062be1960621a60e563ac74e8df81cf1feb8bc534f18b49c70c209d56d1dc2ad1fa6ee9b7afceebbef5e1c72c821c5d5575f3d6d5f7cce7ec7d7bef6b522c7859bf6e677b7fd69a8bf1c5cbda6fcfd0fc3df55fe9d078477c685bf37dc12b1fcb7d9a1b11d5a53063a21caf3ffa4fcf95713e7ec1ce3beda0330e83660b6686ce57aeaecefc4de7bef5dbddb75cd9a35c52ebbec523cef79cf9bfc92e4f033dc4e32dcc73fb41f339dbb5396f21adf5a0c7be20400ea2865ff464c8f30c629c70b4f3de288239e5e8ef51684efcd29c712bf5fc67f5ebc78f1cbcafef66bcb7863b97d44390e386e62c1e43d657c7062216579199f29e3f3e5f625130b2ed794f1add6e685987f6f6d1edf84059ab050f3786bf3c24d1863dcd1dabca0b3aa7cdcbf958fbfacb5f9d66c61e1e79c32ce6c6e5e107a7fb9ff5d65bca5fcfde8d6e685a33f2effd6578505a572fbc5616c16169acae7f2acb0f01416a0e2dcdb1eadcd8b4a53c71f0f85bf25dc727bca31c642fda5cf4d76522565aa7a01289d76da693b961dae5fc6e5bd883a9633c58a320e1df4a0a93131c91abe7cf5c52f7ef116659d6306717b8399ca3ab73978d7bbde55fce4273fd9e2d8a9b17af5eaeab8030e3860dab9962f5f3e3911ddef08e72d0700e1ff26bb859b412b9fc7ed1379f9f3f2effe1fe5dfbff70cc784015c95bfe1b61d8314cedfa92bd41bff2d7532e83660b6684c5c5771c4fbcf3aebace2da6bafad7e0fefbc0dfb8e3beeb86afb8b5ffc62b51deef51fb68f3ffef82d1e1bd71922d5353e97b0300400bd4bd9bf115bc69431ce6365ac2be3ee326e2be3db655c57eebbb2fcf9bfcbb8b08cff19c602cdcdb758fbbb32feb2dc7f72b9fde6d6e637c735cbed858b172f7e79b8555bb9fdc272fb773ae39d32762be349713ee4aeb5f98d7ce1df685358082b9fc3afcd708cb1507fe973939d544999aa5e00264ce9780d3de2ce7b3fa3316572364cc28677e84f2d0b31882f449da9ac739fefb56bd76e715c88b07075e08107569f36e83c2edc0a213e57b7fb66f72bc2bbe91af3509987df29e34be540e877e37d1d1303c22a673ff4a10fc5e397be0ae7efd415ea8dff963a493971d298e1ba9d697f681b366edcb8c5f1b7de7a6b758dbef295afacb65ff18a5754dbdffbdef7663c772ed7f8d6c2c21000f42e65ff464c8ff93ac699abf066c032fea91c7bec1fefeb3016ea3b394976522565aa7a01189078f1674aac6825b8955cf83dbcebbff3e9a04e59881c1686c2ede5c2be6baeb9a69a188e1f1b6f0f2ae6eba4f0d8d8d86fc765b1f2987d5b135fccba6cd9b22a5706219cb7ccd3ce17c03e11ea8dff963a19741b305b34b6725dc5fbe3edd7bef6b5d56d21c3a785c2cf850b17763d36976b7c6b315fdb0000e8a794fd1b313df46f66173ef11497c58c85fa4e4e929d544999aa5e0006646b0b421d831e3435a64cb6864ee6d42f60ed1cb3b55bc93ded694fabca7ef4a31fcd78de99b6672aebdc4aeed4534f9d762bb9cea2d1ca952b8b33ce3863da63e3ed418541d3ecca1c5ed9c9e973ce39271ec7f44538ef94eb6665fc37d4cda0db80d9a2b195eb2ade1f6f4f5c2fc56ebbed56fd0cb7bde8766c2ed7f8d6421b0000bd4bd9bf11d343ffa63f8c85fa4a4e929d544999aa5e0006646b0b421d831e3435a2c9d6b7bded6dd3cac217c58785a0f0c9a1104b962ca9ca3afb4f3ffdf4c94f15751e179f23de9ea96cddba75c509279c50ecb3cf3ed5a70ba6ee3bfffcf3b758b48a1f1b6f0f2a0c9a6637f1e5b4556e873c098b85fd14ce373e3ede79875c11ea8bff86ba19741b305b34a2ebad13f1fe6edb215ef4a2175565e1e74ce7ee6ce7728d6f2db40100d0bb94fd1b313df46ffac358a8afe424d9499594a9ea056040b6b620d461d0945718346d5d99d79776062b279e7862755bb07e08e739e184137ed93977a827aebb8eb40179853600007aa77f9357e8dff48fb150dfc849b2932a2953d50b4062064d798541d3d68d8d8dfd66395059d719b4bcf7bdefed7940141eff9ef7bc67f2dd71e1fca19eb8ee3ad206e415da0000e8ddf6f46f1a139f1ede7df7dd8b430e39a4b8faeaaba71dd389071f7cb038e698638abdf7debbd8638f3daaef39bcf3ce3ba79dab13bbecb24bf1c217beb078f6b39f5decb4d34ec582050b8a0b2eb860dab1e1ae06071f7c7071fbedb7773dd75cea0fe7feaddffaade2294f79ca168f8bcfb9b5e7fa9297bca43aeedc73cfadb62fbae8a26afba52f7de9b463670bfd9bfe3116ea1b394976522565aa7a01486c7b064d627061d034378b172f7e793960f97967f012de2db7bdb752088f8bde1df7f370feb8cebad206e415da0000e85d2ffd9bd5ab57578b1f071c70c0b47d9d38eaa8a3aa632ebef8e2e2da6bafad7e3fecb0c326f787ed10679f7d76b16ad5aa2db66fbae9a6eaf7707beba9c74efdbed5d7bffef5d3ceb57cf9f262d3a64d73aa3f7cb7625814baf4d24ba7fded53636bcff5739ffb5cb5ff75af7bdd16f57ee94b5f9a76ec6ca17fd35fc6427d2127c94eaaa44c552f0089f5326812fd0f83a6b92b072d6f9a3a200af7d90e5f96ba7efdfa78bc33a3705c387eea7db427cef7a6b8ae3ad306e415da0000e8ddb6f66f2ebbecb2e2c0030f2c76dd75d7c985981d77dc71da719d78c6339e31795c2776de79e7c9fd9db2871f7eb878ecb1c726b743ff73eafef8d8b03ffcbee79e7b4e3b57f854c75ceb0f8b4ea1ec39cf794ef51daf533f4db42dcf35fced9d4f3985ef800d9f500a9f7c8a8fdb5ae8dff49fb150cfe424d9499594a9ea0520b16d1d34a588c6c480252eaf6318346d9b8977cb3d346530532c5bb6ac38fdf4d38b2baeb8a2b8e38e3b8a75ebd655839ff0336c87f2b07fe9d2a5530741211e9a27ef8edb420e6dc017bef085e2b9cf7d6e3529d198b8d6c3cfceefa9a3dbdf1206d4bffbbbbf1b6ebd316ddff6863600007ab7adfd9b7df7ddb77aadbfe69a6baa0598f07b88f8b84e844fe484fdf7dc73cfb47d21e2c7cfb6ddf97d6b0b43db52ff0d37dc502c5ab468f256727ff0077f30b96f5b9feb873ffce16aff71c71d57fdfcfce73f3fed98ad85fecd60180bf5444e929d544999aa5e0012dbd641d320e2dbdffe76f1c637be71f296077bedb557f1f297bf7c727f632b83953a8541d3b66b369bcf2b07325f890636db1a5f09e789cf3d1fe4d006ecb7df7ed5357ef3cd374f9685ed10f1b129a2dbdf1206de279f7cf2b4f25e421b0000bddbd6fe4d67a165e5ca95c519679cd1f5b5bf13471f7d74b5ffa4934edae2933c9d881f3fdb76e7f7a9b7920b8b3a331d3bd7fa3b11be3b281cf7ebbffeeb9365dbfa5c1f78e081eabb88c2f71ffdceeffc4eb171e3c669c76c2df46f06c75868bbc949b2932a2953d50b4062db3a68ea775c7ffdf5d56d0cc2c4f057bffad5ea9d4cd75d775db178f1e269c7ce873068da7e65cebcac1cd45c35c34067b6b82a3c2e3ed77c92ba0d08d1d8ca84c47c0a6d0000f46e5bfb37e79f7f7ef1ac673d6bb24fd289f8b84e84314bf85e97050b164c7ee279eaf1dbb23db5beb0f872d0410715b7dd76db8cc76e6bfde14d77e1d3cd975c72c9e4be6d7dae213a9f16faf4a73f3d6ddf5c42ff66f08c85b6999c243ba9923255bd0024b6ad83a67ec71ffdd11f55838c8b2eba68dabe4e84fd213adb0f3ef86071cc31c754f7b8de638f3d8a850b176e71dfeccef1531f3753d9d6ce93220c9a7a373636b66f39c839bed96c5e52fe5c55c6dd13039ff073d544f9f1e1b8f8b1f3d15cdb80300171c2092754b71f0993168d29d764b8e7fcd2a54babfbdd8708f7380f659dfde1d8a911aeb9f0aed899f675ce3bf5f7998e9ba96c975d76a9ee7bdfb9177e982cb9e0820ba69d23bcebf590430ea9de453b97e717ff2dbd3cdfad853600007a37d7fe4d0ed188fa19b945e823855bd13def79cf2b1e7df4d169fbe712fa37c3632c34677292eca44aca54f5029058ea4153e74b4fa74eaac611f687e86c1f75d451d5f6c5175f5c5c7bedb5d5ef871d76d8b4e3972f5f5e6cdab4a96bd9d6ce93220c9a18b6b9b6019d5b96bceb5def2a7ef2939f6cb12f2c92847d536f8112ca3afbc37688b3ce3a6bf25a0bef548df74f3d675cd6d99ee9ba3efbecb38b55ab566db17dd34d3755bf872f5f9e7ade10ab57afaef61d70c0019365b33dbff86fe9f5f9ce16da0000e8dd5cfb37394423ea67e414612128fc6de18d33575d75d5b4fd730dfd1b322427c94eaaa44c552f0089a51e346dcfc25078877ea7ac133befbcf3b4e3a7de6f7ba6b2ad9d27451834316c736d033af7a35fbb76edb47d4f7ffad3ab7d53bf34395c5f9dfd61bbb33fdc97beb31def9f7aceb8acb33dd3751dcefbd8638f4d6e87bf213ec765975d561c78e081936d4e8870eb95ceb9667b7ef1dfd2ebf39d2db40100d0bbb9f66fc47042ff860cc949b2932a2953d50b4062a9074ddb732bb9ce04ee3df7dc33edd8998eef56b6b5f3a4088326866dae6dc06c0b27735d2899ebf64c65f1f64c65b36d8777ba86dfafb9e69a6a71293e76b6e7171fdbebf39d2db40100d0bbb9f66fc47042ff860cc949b2932a2953d50b4062a9074dd75d775df5bd20fbedb75ff1b5af7dad78e8a187aa5b4285fb20778e694493aa9d5b3e9d74d2495b7c7aa0dbf1ddcab6769e1461d0c4b0cdb50de85c2fa79e7aeab45badcdf5d66a73dd9ea92cde9ea96cb6edcec2cfca952b8b33ce3863dab1b33dbff8d85e9fef6ca10d0080decdb57f937334b6d27fd8dafe9c42ff860cc949b2932a2953d50b4062390c9a6ebef9e6e20d6f78433571fbe4273fb97a37fecb5ef6b2c9fd8d68d013be00f5c4134facbe583edc0a2ade1f6f772bdbda7952844113c336d736205c2f279c7042f59d3d3becb0c316d74ab81564581809d76e88254b966c717bc870ecd4e3b7b63d5359bc3d53d96cdbe79f7f7ef53d3f9db2f8d8d99e5f7c6cafcf77b6d0060040efe6dabfe9779c7beeb993affbe10d24f1fe6d89ce79e2f2b9eecf29f46fc8909c243ba9923255bd0024966ad024660e8326864d1b9057680300a077a9fa37871f7e78f546b710af79cd6ba6eddf96688cd0c2cfd642ff860cc949b2932a2953d50b4062a9064d62e6306862d8b40179853600007a97a27f73df7df7154f79ca538a57bdea55c52b5ff9caeaf750d6d9df9858e8e94428eb7c62397c1762b74f2c7762efbdf7dee2534853cf937be8df9021394976522565aa7a01482cc5a049740f8326864d1b9057680300a07729fa37679e7966b550136e27d7f90ec27ff8877f98dc1fb6432c5fbebcd8b4695355d6f98ec377bdeb5d5dbfe3f0acb3ceaabe9735fc1e6e8b1bef8fff8e1c43ff860cc949b2932a2953d50b406229064da27b1834316cda80bc421b0000bd4bd1bf39e490438add76dbad58bf7e7d15e1f797bef4a593fb1b130b391b366c982c0bdfb11acad6ae5d3bed7c9de31f7ef8e162e3c68dd31682e2ed9c43ff860cc949b2932a2953d50b406229064da27b1834316cda80bc421b0000bd1b76ffe6873ffce1e4ade0a64628bbfdf6dbab633a65531f379785a1b96ee71cfa3764484e929d544999aa5e00121bf6a049cc1e064d0c9b3620afd0060040ef86ddbff9e0073f582dd2b45aadc9b2c58b1757657ffbb77f5b6d87df434c7d5ce75672a79e7a6ad75bc90d6a7b98a17f4386e424d9499594a9ea0520b1610f9ac4ec61d0c4b06903f20a6d0000f46ed8fd9b17bce005d5a2cb25975c3259f6c52f7eb12afbbddffbbd6a3bfc1e62eae3d6ad5b579c70c209c53efbec33f989a3cebef8f87e6f0f33f46fc8909c243ba9923255bd002436ec4193983d0c9a18366d405ea10d0080dee9dfe415fa3764484e929d544999aa5e00123368ca2b0c9a18366d405ea10d0080dee9dfe415fa3764484e929d544999aa5e00123368ca2b0c9a18366d405ea10d0080dee9dfe415fa3764484e929d544999aa5e00123368ca2b0c9a18366d405ea10d0080dee9dfe415fa3764484e929d544999aa5e00123368ca2b0c9a18366d405ea10d0080dee9dfe415fa3764484e929d544999aa5e00123368ca2b0c9a18366d405ea10d0080dee9dfe415fa3764484e929d544999aa5e00123368ca2b0c9a18366d405ea10d0080dee9dfe415fa3764484e929d544999aa5e00123368ca2b0c9a18366d405ea10d0080dee9dfe415fa3764484e929d544999aa5e00123368ca2b0c9a18366d405ea10d0080dee9dfe415fa3764484e929d544999aa5e00123368ca2b0c9a18366d405ea10d0080dee9dfe415fa3764484e929d544999aa5e00123368ca2b0c9a18366d405ea10d0080dee9dfe415fa3764484e929d544999aa5e00123368ca2b0c9a18366d405ea10d0080dee9dfe415fa3764484e929d544999aa5e00123368ca2b0c9a18366d405ea10d0080dee9dfe415fa3764484e929d544999aa5e0012bbe28a2b9ed8b871e3b4cebb187e94ff0ff79583a64df1ff110c9236209fd00600407fe8dfe413fa3764ca5c38d9499594a9ea0520b1abaebaeabeb56bd74eebc08be1c7bffffbbf7fbe1c34ad8aff8f6090b401f984360000fa43ff269fd0bf2153e6c2c94eaaa44c552f00895d79e595afffc637beb161cd9a350f7a575d9a28ffddd7dc75d75dffab1c30fddf325e1bff1fc1206903d287360000fa4bff267de8df903973e164275552a6aa17800c848e7a781757198f87fb3f8ba147f8770ffffe064c2411726f220747b60d68b55ad3ca4628b40100d067e17575e2f57564fb37231efa37e4cc5c38d9499594a9ea0500809e8585a1b80c006054957d9b15fa373030ae2db2932a2953d50b00003d33710200d445d9af3934f46d26e2d0783fd0336307b2932a2953d50b00003db3300400d445e7d34213b122de0ff4ccd881eca44aca54f5020040cf2c0c010075107d5ac8a78660308c1dc84eaaa44c552f0000f4ccc210005007d1a7857c6a0806c3d881eca44aca54f5020040cf2c0c0100a3aecba7857c6a08facfd881eca44aca54f5020040cf2c0c0100a3aecba7857c6a08facfd881eca44aca54f5020040cf2c0c0100a32c7c226886c5a0380e8d1f076c176307b2932a2953d50b00003db33004008cb2f089a0191682e2f0a921e80f6307b2932a2953d50b00003db3300400d48dfe0d0c8c6b8beca44aca54f5020040cf4c9c000075a37f0303e3da223ba9923255bd0000d03313270040dde8dfc0c0b8b6c84eaaa44c552f0000f4ccc409005037fa373030ae2db2932a2953d50b00003d33710200d48dfe0d0c8c6b8beca44aca54f5020040cf4c9c000075a37f0303e3da223ba9923255bd0000d03313270040dde8dfc0c0b8b6c84eaaa44c552f0000f4ccc409005037fa373030ae2db2932a2953d50b00003d33710200d48dfe0d0c8c6b8beca44aca54f5020040cf4c9c000075a37f0303e3da223ba9923255bd0000d03313270040dde8dfc0c0b8b6c84eaaa44c552f0000f4ccc409005037fa373030ae2db2932a2953d50b00003d33710200d48dfe0d0c8c6b8beca44aca54f5020040cf4c9c000075a37f0303e3da223ba9923255bd0000d03313270040dde8dfc0c0b8b6c84eaaa44c552f0000f4ccc409005037fa373030ae2db2932a2953d50b00003d33710200d48dfe0d0c8c6b8beca44aca54f5020040cf4c9c000075a37f0303e3da223ba9923255bd0000d03313270040dde8dfc0c0b8b6c84eaaa44c552f0000f4ccc409005037fa373030ae2db2932a2953d50b00003d33710200d48dfe0d0c8c6b8beca44aca54f5020040cf4c9c000075a37f0303e3da223ba9923255bd0000d03313270040dde8dfc0c0b8b6c84eaaa44c552f0000f4ccc409005037fa373030ae2db2932a2953d50b00003d33710200d48dfe0d0c8c6b8beca44aca54f5020040cf4c9c000075a37f0303e3da223ba9923255bd0000d03313270040dde8dfc0c0b8b6c84eaaa44c552f0000f4ccc409005037fa373030ae2db2932a2953d50b00003d33710200d48dfe0d0c8c6b8beca44aca54f5020040cf4c9c000075a37f0303e3da223ba9923255bd0000d03313270040dde8dfc0c0b8b6c84eaaa44c552f0000f4ccc409005037fa373030ae2db2932a2953d50b00003d33710200d48dfe0d0c8c6b8beca44aca54f5020040cf4c9c000075a37f0303e3da223ba9923255bd0000d03313270040dde8dfc0c0b8b6c84eaaa44c552f0040b6c2605c8c4ec4ff7f0000a34cff0606c6b54576522565aa7a0100b265300e00402afaa23030ae2db2932a2953d50b00902d8371000052d1178581716d919d544999aa5e00806c198c0300908abe280c8c6b8beca44aca54f5020064cb601c008054f44561605c5b64275552867a8510420821c49498188c0b218410420831f4d0171562a00159499594a9ea0500c89677690200908abe280c8c6b8beca44aca54f5020064cb601c008054f44561605c5b64275552a6aa1700205b06e30000a4a22f0a03e3da223ba9923255bd0000d93218070020157d511818d716d9499594a9ea0500c896c1380000a9e88bc2c0b8b6c84eaaa44c552f0040b60cc6010048455f1406c6b54576522565aa7a0100b265300e00402afaa23030ae2db2932a2953d50b00902d8371000052d1178581716d919d544999aa5e00806c198c0300908abe280c8c6b8beca44aca54f5020064cb601c008054f44561605c5b64275552a6aa1700205b06e30000a4a22f0a03e3da223ba9923255bd0000d93218070020157d511818d716d9499594a9ea0500c896c1380000a9e88bc2c0b8b6c84eaaa44c552f0040b60cc6010048455f1406c6b54576522565aa7a0100b265300e00402afaa23030ae2db2932a2953d50b00902d8371000052d1178581716d919d544999aa5e00806c198c0300908abe280c8c6b8beca44aca54f5020064cb601c008054f44561605c5b64275552a6aa1700205b06e30000a4a22f0a03e3da223ba9923255bd0000d93218070020157d511818d716d9499594a9ea0500c896c1380000a9e88bc2c0b8b6c84eaaa44c552f0040b60cc6010048455f1406c6b54576522565aa7a0100b265300e00402afaa23030ae2db2932a2953d50b00902d8371000052d1178581716d919d544999aa5e00806c198c0300908abe280c8c6b8beca44aca54f5020064cb601c008054f44561605c5b64275552a6aa1700205b06e30000a4a22f0a03e3da223ba9923255bd0000d93218070020157d511818d716d9499594a9ea0500c896c1380000a9e88bfeffeddd0b9814c5bdf7f1c14b48c241c80505417d8f4f5e4fc4bc27e46088f14dde20d1e4f8443126213bbb488420820664173541851c8c49508298dd053426f11235848ba2242264d95d100135e225401434802272919ba2b212a4defaf74e8f33b5b33bddc34c57edccf7f33cbf87e9ea9eaededdaa02aab67b8082a16fc139b61aa5ad7a0100009cc57fc6010000600bff16050a86be05e7d86a94b6ea0500007016ff19070000802dfc5b142818fa169c63ab51daaa170000c059fc671c000000b6f06f51a060e85b708ead4669ab5e00000067f19f71000000d8c2bf458182a16fc139b61aa5ad7a0100009cc57fc6010000600bff16050a86be05e7d86a94b6ea0500007016ff19070000802dfc5b142818fa169c63ab51daaa170000c059fc671c000000b6f06f51a060e85b708ead4669ab5e00000067f19f71000000d8c2bf458182a16fc139b61aa5ad7a0100009cc57fc6010000600bff16050a86be05e7d86a94b6ea0500007016ff19070000802dfc5b142818fa169c63ab51daaa170000c009fa3fde8df29fef2c6934df0700000014020b4340c1d0b7e01c5b8dd256bd0000004ed0fff1ee9f6121c84c7ff37d0000004021b03004140c7d0bceb1d5286dd50b0000e00cb92328c36210770b01000020722c0c010543df82736c354a5bf50200003843ee08cab020c4dd42000000881c0b4340c1d0b7e01c5b8dd256bd0000004e913b83322c0a71b71000000022c5c2105030f42d38c756a3b4552f000080535ab96ba8bf791c00000050482c0c010543df82736c354a5bf502000038c7b86b88bb85000000103916868082a16fc139b61aa5ad7a0100009c63dc35d4dfdc0f000000141a0b4340c1d0b7e01c5b8dd256bd0000004ef2ef1a32cb0100008028f06f51a060e85b708ead4669ab5e00000027f9770d99e50000004014f8b7285030f42d38c756a3b4552f000028424aa98f6cdcb871ceaa55ab0ed6d7d7abbababa7619f9cfb859d65ea2bfef871f7ffcf1371a1a1a2e327f3e40a115cb18400a17c6a8d6d17f48b6d07f4a070b4340c1d0b7e01c5b8dd256bd0000a0086ddcb871eee38f3fae76ecd8a10e1c38a0de7fff7d1271e4fb2edfffa54b97be555757f72df3670414126300c916c6a8d6d17f48b6d07f4a070b4340c1d0b7e01c5b8dd256bd0000a008c96f39cb8485399141a2cfb66ddb76d5d5d53d6dfe8c8042620c2041c318d512fd87040dfda7f8b13004140c7d0bceb1d5286dd50b00008a903cfa86df727623f273a8abab6b327f464021310690a0618c6a89fe438286fe53fc5818020a86be05e7d86a94b6ea05000045489e7f6f4e5e107b919f87f933020a893180840963543afa0f0913fa4f716361082818fa169c63ab51daaa17000014a1a0935aefecdba636feed6eb56ec9cfbcc86b29338f234716268d1035c60012268c51e9e83f244ce83fc58d8521a060e85b708ead4619b45effb893759ed3795de79b1fee0600000836a9b57fef56b576f144f5c2a3d7a645ca649f793cc93d4c1a216a8c01244c18a3d2d17f4898d07f8a1b0b4340c1d0b7e01c5b8d3268bdfe71b7265e4bd67cb81b000020d8a4d696750b5a4c68f9797ddd9f5b1c4f720f9346881a63000913c6a874f41f1226f49fe2c6c2105030f42d38c756a30c5aef419dafeb6cd6795fa75fa20c00002029c8a4d68b8db7b498ccf223fbcce349ee61d20851630c2061c218958efe43c284fe53dc5818020a86be05e7d86a9441eb7d29d6bc1024c73f94280bfa5e00005022824c6aadad9bd46232cb8fec338f27b9874923448d3180840963543afa0f0913fa4f716361082818fa169c63ab5106adf7629d1db1e6cf16fa42a22ce87b010040896052cbad306984a831069030618c4a47ff216142ff296e2c0c010543df82736c354a5bf5020080221464526bdd929fb598ccf223fbcce349ee61d20851630c2061c218958efe43c284fe53dc5818020a86be05e7d86a94b6ea0500004528c8a4d6cb2ba6b798ccf223fbcce349ee61d20851630c2061c218958efe43c284fe53dc5818020a86be05e7d86a9441ebeda553a7d3945216f4bd0000a0440499d4dabdf5ef6aed5fffa7c5849694c93ef378927b983442d4180348983046a5a3ff9030a1ff143716868082a16fc139b61a65d07a1f89351f9b7a7cd0f7020080121164524bb2e9993fb498d49232f338726461d20851630c2061c218958efe43c284fe53dc5818020a86be05e7d86a9441ebdda7f35fb10f8fffa8ce071fee0600000838a9d5d4a45e5e797b8b492d29937d2d8e2739874923448d3180840963543afa0f0913fa4f716361082818fa169c63ab5106ad7787cec5b1e6e3bbe94cd57935ed08000050f2b24d6aeddfbb556d5851db6242cb8fec9363ccf791dcc2a411a2c61840c284312a1dfd878409fda7b8b13004140c7d0bceb1d52883d67b67ecc347c9f9b935ed08000050f25a9dd46a6a52db5e6e506b165ddf6222cb8c1c23c7f29bcf471e268d1035c60012268c51e9e83f244ce83fc58d8521a060e85b708ead4619b4dee3747eaff3a6ce4e9ddfe8744a3b02000094bc4c935ad97ec3b9b5f09bcf471e268d1035c60012268c51e9e83f244ce83fc58d8521a060e85b708ead4669ab5e00005084324d6a05f90de7d622ef35cf4782874923448d3180840963543afa0f0913fa4f716361082818fa169c63ab5106ad37d37199ca00004009cb34a9654e54858d793e123c4c1a216a8c01244c18a3d2d17f4898d07f8a1b0b4340c1d0b7e01c5b8d3268bde671bd3294010080129769528bd80b9346881a63000913c6a874f41f1226f49fe2c6c2105030f42d38c756a3cc56afec6f2df27943000000494c6ab995529a349a3973e6d7a64d9bf6d0840913768c1b37eedd51a3461d924915f9b3aaaaeadd1b6eb861e79429531ed1f96ff3bdc81fc6001226a534460541ff216142ff296e2c0c010543df82736c35ca6cf59a8b417eded21997721c000000935a8ec5d549a3cadb1affd7d89a866d66795893264d3a6aca942993478f1efdde983163d45d77dda556af5ead366fdeacf6ecd9a384fc29dbcf3efbacbaefbefbd4b871e3d465975df6fe840913ee1c3468d0bf99e78c52e56dcb4eafac69d86496b7678c01244c5c1da36ca1ff9030a1ff143716868082a16fc139b61a65d07a831e0700004a18935a6e25df934655331a3f5359d3a05292d31de455b5f5c3f47bff64968771f3cd37578c193366ff8d37dea85e7ae925b56ddb366f61e87bdffb9eead3a78fead9b3a7f70b4df2e7e73fff7975f1c517ab3beeb8436ddab4496dddba55cd9831430d1f3efcfdb163c74e960526f3fc51a8aca9bf42e76eb3bc3d630c206192ef31aabda3ff9030a1ff143716868082a16fc139b61aa5ad7a010040116252cbade47bd2686c4dc35555350d779ae56155d634dc2b8b226679503ffff9cf678c1a35ea03b90be895575e5183070f569ffce427554545857757d0f3cf3fef2dfe08f9f385175e50b366cd5243870e553d7af45003060c508d8d8dde62d24d37dd7470e4c891cf9697979f60d65368fafb30bbaabaf152b3bc3d630c206192ef31aabda3ff9030a1ff143716868082a16fc139b61a65d07a2b74de88b57ca41c00004012935a6e25df9346636b1a1eabac6dfc766ad9a4498dc754d5344ca9ac69d82e771055d6d497fbfbf4eb4a5df6b2cea1d447c7e9edcd95b50dbfd4efdb33b6b67e965faeb73726ee447aabb2bae13abf3cb97f46e367aaaaff7a70dc2db3d4b53397aaeba6dcadba75eba66efae5afd475bf795cfdb1ee4535f1774fa843873e500f2edde0954df8ed136af5faedde22d1619dbf3ebd51fd787a9dbaf2964754d9e5e3d5fffc7eb97ae04f0f7e70d56d8b0e8f99fae87cff3a335d4be56d8ff790af716c75c30cfde7bbfa98eaaa9a255fd55fe7df655b7f6f7e95bcd60cef9f7477e347f5f61f74deaeacadffb97ccfae9e5e7f4a6bc7b7478c01244cf23d46b577f41f1226f49fe2c6c2105030f42d38c756a30c5aeff658cb45a1a0ef0500002582492db792cf49a3aa692b3f5659d3f05e62f1c2cb8fa62ff9d4d8eac6c963ab1b1ea8bcadb1ebb89ac6b374f90eeff8dafaf155350d2bc6d42ce99dfaa836f97c21398fdef7b5aaeafa8bf5eba60f6bd194ea30f6d70dff210b2469e5daf8a90f2cafbaf511f5cfd7b6abf2a157aaaba62d523b76ec506b37bea9aebf73b9dabced2d6f01e8cf2bfea9ee59b856ed7fefa05726fbc492675e55d31f7c56eddaf79e7aafe9a0fac9ad73d5b72fbf513d307f89faf1cc46f5c32bafd95b5151e12dd4788c6ba9aaa9bf50bfde2a9f0d34767ae305faf5a1cadac6ffa99ab6e89355d50d178dad6938907c6f86f7cbf74abfbe5fbe57f2fda9343f5fa88dafbdbd600c206192cf31aa18d07f4898d07f8a1b0b4340c1d0b7e01c5b8d3268bd725c5f1d2bcf5f070000ed03935a6e259f934695b5f5e78fad696c68515ed3b02375b148e7ed44f91b55b72d39d53c3ef5f385c6552f3947bffe9bbc1e5bdb3050bf7e41a749ce2377d0a4beef965b6e193c66f21f0f2f7be665f5ddef7e570d1936c2bb3b483cf6e446b5e08957d4a14387d4ead5abd54f66d4ab9b7f354d8d1a354a5d31ba525d5dbd48cd9d3b575dff9ba56ae79e77bcf78807976d507f98bf549d3be847aaf6817ab570e1c277870c19b271ccd405e599aea5b2ba7ed2d89a865fc86bb95348bf7ed1bfbee6edfa67e5756b5f8b7ebdf9da198ddd13e71ae37fbe506bc7b7478c01244cf239461503fa0f0913fa4f716361082818fa169c63ab5106ad578e1ba1f3317307000080af3d4f6a3df8e083ead4534f55471d7594fcbbc72b933ffdd74112f6f842279f934695b50d35636b1aae6d515ed3b0f7aaea86be72b74b6ab9f798b8e94bce1b3467ced1a9e5faf87bc7d6348e4c1c53ad737da27cd7d8da866f5e73fbe2e375d99d12ff3d72c7d198ab2af75f33a3515d77cb5dea6b03ce53f72c5ca31e5df54f6f81e7b70b5e504b9f7e49dd70c30deaa73ffda9ba767abd5ab9fa4575ffac39ea67773caaee7a78959a3d7bb6aafcf55fd54f26fd4a6d7e758b7a71f36e35fe8ec7d5aeb70ea85bee69547dbffa2d6f5169dab469af8dfdf55f0f64ba96aaeafa3fcb9d41def556d7ff5aee16f2af51b6c7d6d44ff05eb7f2b5e8f2fd637fddf025ef9178350d1bfdcf176aedf8f6a83d8f0124fae4738c2a06f41f1226f49fe2c6c2105030f42d38c756a30c5a6f72a2c30800004092ad49ad58e2df26c71e7bacfaf4a73fadce3df75c6fc2c43caead9c74d249de399e7beeb916e7358f6d2d618f2f74f239695459d3f0f255d58d9fcb50fe43f95c1eb9d34532ba76d9bf7be5d5f543f4f66b3a87a57c4ccde3dd12c76f96c7a5255ebf76756de367e5b52c86c8a3d874599dce53636b1bbeebd73165ca94c9137e59a3a6dcbf427d7be44ddee70bddb7789dfad7a10fd4e1c387d54f66d6ab2bc68c53cf3cf38cb750f4f43fb6a909bf5daeaeaead5737ff6ea1f7994362c59ad7d58f6734a8b1d316aa9afb16ab5fdef7a457fed3df3fa1ee9b354f9d71c6196acf9e3dea8a89bf691a5b5d2f77efa45d8b7efdc6b819cb4e924530fd7a8b3c26cfbbc0c4b63c62aeadafa5b2b661a2de7ea7aaba619efe7347cae70b653cbe3d0adbef4869279f635431a0ff9030a1ff143716868082a16fc139b61a65d07a93131d46000000926c4d6ac512ff363970e0807afae9a7bd09fea38f3e5a2d5ebcb8c5b1adc53f8759de9e532c9346a3478f7eef770f3fa5465c7b8bfac52f7ed1fc1cb884bffce52feabaebae536fbef9665ab958b76e9d97548775d66fdcaac6fd6a9ebafd814569fbce3fff7c75ebadb7aa871f7ef8e5783cfe67f33a909dad3180b4cf14cb18952ff41f1226f49fe2c6c2105030f42d38c756a3b4552f00002842b626b562c6a2cea2458bbcedfefdfb27cb76eddaa5468c18a14e38e104d5a54b1775e18517aa8d1b37a6bd3f3599ce6b1e23e7baefbefb5aec37b7cdf2a8520c9346b5b5b5fdc78c19a36ebceb09f599de7dd53bef7cf81941afbffebaf73942bb77ef4e59dec9ace9e021ef8ea6aada46f5b37b56aa8797ae5323478ef4cee15bbf7ebdead6ad9bdabf7fffe1f2f2f2b7060d1af449f37ad0365b6300699f2986312a9fe83f244ce83fc58d8521a060e85b708ead4669ab5e000050846c4d6ac58c8517b97b44b63ff5a94f25cb860d1be695cd9f3f5fad5cb9d27b3d60c08056cf91a9ccdf9e3e7d7af21cddbb776fb1dfdc9e3973a66a6a6a4a3b77147175d2a8a2a2e213f178fc67e5e5e59f36f799a64d9bf6d0dd77dfadeebaeb2e259324be43870ea9ebafbf5e2d5bb62c59669a3b77ae97d62c5fbedc3b879ccbf795af7c452d5cb8505d73cd35cfe8fa869bd753aafaf7ef7f8c599689ad3180b4cfb83a46d942ff216142ff296e2c0c010543df82736c35caa0f5f6d2a9d3694a290bfa5e000050226c4d6ac58c05999d3b777adbf279437e99bcf68ff3d3b163c756cf91a9ccdfdeb76f9ff7d8bad6f69bdb6fbdf556da79a38aab934672278e4c78e8bc535656769bdeee691ee39b3871e236f9ec207d8c7777966ff5ead54aef4b6e67926d6148c839e45cbedada5af5c31ffe503dfae8a37f2b2f2f9f635e4fa9d23fab1764a12cdb0291ad3180b4cfb83a46d942ff216142ff296e2c0c010543df82736c35caa0f53e124b4c6ca494057d2f00002811b626b562c6824ca647c9c923c2a44c1e1d66be3fd33932951de976d47175d268e0c0819d130b437ede2f2b2bfb6d4545c5ff368f1d376edcbb9b376f565ff8c217d4f3cf3f9f5cc091059f3973e624b73309b230347bf66c356fdebce4f6aa55abd459679da5d6ae5dfb0f7d5dabcceb2955fa7bb13ff1b3daa07f5683274d9a7494798cb0350690f61957c7a87cd3fda651a7bf596eca47ff8985fc7b27ecf15125ec753df8e083ead4534f55471d7554a8f7d94cd8afd14ca9f49f52c5c2105030f42d38c756a30c5aef3e9dff8a7d78fc47753ef870370000407e26b572492c31b92277f13cfdf4d3ea8c33ce50471f7db45abc7871f298e1c3877bc754565666bc83c73f475b6547ba1d755c9d341a3a74e8478d85213f8774669795957dde3ff6f2cb2f3fb477ef5ed5a3470fb57dfbf6e402ce942953d4dffffef7e4b669eddab5eaca2baf54575c71855ab3668db93be985175ef0cee5dbb2658bead5ab973c8e70bbbe962da9d75dcaf4f7e280f1b35a5b5e5efe5df3385b6300699f71758ccab7947ed3e6025190fe134bfcbd62c6dc6fbeafb5843d3eaa84bdae934e3ac93bfeb9e79e6bb1cfd584fd1acd944aff29553266986500f282be05e7d86a9441ebdda17371acf9f86e3a53755e4d3b02000094bc20935a85482c31b972cc31c7789f2b74ce39e7781326a9c7ecdebd5b8d1e3dda9bf4f77fa358629e23d379f3b51d755c9d341a3468d0d1c622438b9495953d5a5e5efe954b2eb944fdeb5fff521ff9c847d4c18307930b38a3468d52f7df7fbf7747d0ba75eb92e5be6bafbd36792e591c32ef1e92f7c8b69c43cee593cf8292470ceaba9af47b531fa35cd2f4f7e2a0f9334a64b5fe599def1f67f63b42da8aab6354be65e8378df10c0b4441fa4f2ccbdf2bd9f69b097bbcab698f5fc7915e73a9f49f522563855906202fe85b708ead4619b4de3b63897fb4a4e4d6b423000040c90b32a945a28bfc3c2ebffcf2632fbcf0c28f0f1a34a88b4eb7783c7e624545c529faf567747acbdd39baecccf2f2f22f7ffffbdfff7f3ae7ca44bf2e1b287784e894ebed1fe8ede13aa374aed24557ebb2f1faf5449d9fe9dcaccb6ed56535faf5ed3abfd7f9832e9ba5cbe6e9d78fe83ca6b344972dd37fae8cb79c2835f341bcf90e22ef339dba77ef9e76c750b685a11b6eb821792eb97328e8c2903c6a30e58e2179bf5cc3fb3aefe96b7f5b7f3d7bf5eb5d3ab27fabce6b3a9b745ed6fb5fd259176ffe3c9e6775fea6b34ae789c4d75daff3d778f3f7e2cf3a0feb3ca8335be78f3af7e9dcadf33b9ddfe8ba66c8f7543e87496fff4ae7669d5fe873dda8cb7eaa7383defe89ce353a55ba7c8cce953a23752ed365437586e854e8edef9737ff3cbfaddf7781fc8c75bea1b707e87c4de72b7afb2c9d2feafc97defe4f9d33743e2b6d25defcf3307f46a9919fe9d71903489894cac47686fee2a7319eb24014a4ffc4b22c2664daef9775eedc599d7df6d9ea89279e68b14fd2a14307d5af5f3ff5ca2baf24f7cbb82b0bf4f2397d92c183077b6599de9f5a6fd03acd6b358f31b7fd9c70c209dee7ce65dae7bf2f976b37cb3efef18f7b8f323df9e493bd5f5090bf1fe431a672ecae5dbbd4881123bc6be9d2a58bd27fd7aa8d1b37b6f85afc6cd8b0c1fbfecaf7d9ac3797f3954aff29553246986500f282be05e7d86a9441eb3d4ee7f73a6feaecd4f98d4ea7b423000040c90b32a945a24b7979b94c3cca9d1eefeaecd3d9196f5eccd81c6f5ec890458ce7e3cd0b182bf5f6329d3afd7aa1ce2389459d3feab27be3cd8b15b727162aa6eab2c9f1e64521591cfa892e1ba7cbc6c49b178f641169882e8bcb6244bc7991e9bff59f5f97c527fdfacbf1e6c516739254f2a24e852c66f5efdfff98aaaa2aef3386faf4e993f61943f2f837790c5c6b5e7ae9256f7148ee1c92c7cab5c67c94dc934f3ea9bef4a52fc9c2917cc6d093727793ce47743e269f8d3474e8d0ae3ff8c10f3ea5bf8613f4fe13754ed2fbfe3db1d0f61fb2d8268b2abafc0b3a67ca628bfe9aff6fe2eb964598f3e47b91589cb948e73be5cd8b36e29278f3628e7cff2e2f6f5ee491c59eca78f3e28f2c025dafdff3535d76a3cecfe3cd8b45b268342df1b391c5a43be2cd3fafbb75fea0f340bcf9117df374e6c79b17a5e467bc38debc58b5546779bc7911eb699dd5f1e6c5adb5f1e69fc7cbf1963f2733b270f481bea616ed9090d6522a13db19fa8b99469dfe41fe0e8d190b177eccfde6fb24f2584dd9d7bb77ef16c7cb22cb3df7dce3bdbee8a28b92fb6561c5dc2f65e6fb67ce9ce9dd7119a6ced6de937a8cb93d7dfa74b572e54aefb5fcc280b93ff51cb95cbb5f3663c60cefd1b4a9dbab57aff65e9f78e289deb1c3860df3b6e7cf9f9fbca6010306b4f85afcc8428f793da9d71cf67ca5d27f4a958c0d661980bca06fc139b61aa5ad7a010040110a32a945a28bcb9346e5e5e56f1b13a3ffd4193269d2a4a3528f9b3061c276998cfbce77bea3fef4a73f251770e46e9fd9b36727b77325e798376f5e72fb8e3bee50975e7aa97aecb1c76481646eeab5942ab9eb2cc344b69f87cbcacabee81fcb1840c224437b2ae904e93f316331c18cb97fd1a245aa6fdfbeaa53a74ec97df23855f378b933533ecf4d5e7fe2139f48ee97c7b39afbe5ee1bf3fda99fdd17b4ce4c9ff7671e636ecb75c8e709b6b63ff51cb95c7b6a3defbdf75e725bde6fd623e7f2b7fdc8a34853af21355dbb766d713dfeb972399fd97e48f12506a010e85b708ead4669ab5e00005084824c6a91e8e2f2c2503c1edf9d98f8d82677c6c8e283798c983a75ea23f2dbd5b7df7ebb1a3a7468720147168b264e9c98dcce959c43cee53befbcf3d4430f3da4c68f1fffa4beb651e6f59422fd7dffa83159257707cdd63fb7ff348f650cf8303163d2d7dc266e8f51f9644ef6a6a4315ee047c9f5ecd9d3db5eb16285b70062eef7b78f746128f51a82d699fa1e33e63161b725b95cbb59d6d676b76eddbcd7f208d2d473b4966c0b4361cf572afd0700f28cb113ceb1d52883d69be9b84c650000a0840599d422d1c5e549a3783cfe625959d97879649cb92fd5d4a953bf79f5d557ab4d9b36a91e3d7aa843870e790b38f2e7f5d75faf962f5f9e5cd4094bde2be7f0cfb963c70e6fe2eeedb7df3e5c5e5ebe67d0a041ddcdeb294543860ce99498c496c712de238fcc338ff1e5630c8825264b8f3df6586f12f7dc73cf0d7427856bf1bf8ed6b689db63543e655b10f20569e7b12cedc8dcef2f36c878575d5ddd62bfbf9dfa78b381030726f7077d1c5bea3504ad33f53d66cc63c26e4b72b976b3acadede1c3877baf2b2b2bdbbcfbc9cf05175cd0e27a52cf1df67ca5d27f0020cf183be11c5b8d3268bd87753aa66ccb6b29030000480a32a9959a586252c4d50960fffaccf2f61297278de4337bccb25674183162c4fb5bb76ef53e6b4126d47cf25bd523478e546fbef966b22c28798fbc57cee1fbd18f7ea4aaaaaa546363e33fcacbcb97991752aae4b395e4738be4b394cc7da67cf4df58a2dfc9e3a2e4333ece38e30c75f4d147abc58b17b738d6e5f85f476bdbc4ed312a9fb22d08f982f49f58a21d9931f7fbdbb366cdf23e8b27dbf1920e1d3aa82f7ef18b6ac3860dc9fddbb76ff71653e4ee1bc9e0c183bd32f3fda9d718b4ced4f798318f09bb2dc9e5dacdb2b6b677efdead468f1ead7af5eae53d2acf3cd6ccfaf5ebd599679ee97d9ffd63538f0f7bbe52e93f0090678c9d708ead4619b4ded7757eaed335915fea6c493b02000094bc20935aa98925263d5c9d00f6afcf2c6f2f299649a3091326dc291ffcddd8d8a83efbd9cfaa0f3ef820b998f397bffc455d77dd75191787d6ad5be7c524c7ca7be4bdbe175f7c511d7ffcf16ae7ce9df21943af5654547cd3bc0e6417760cc89498d1efe4f34a64bb7ffffec9b25dbb76a9112346a8134e384175e9d2c5fb50f78d1b3726f7cf9933479d76da69dea2b379bed43a3a77eeacce3efb6cf5c4134fb4d897fabe4c65fea4b32c6a4bb24d3a9bdbb95c8719994896054d7974973fd96cbe3fdb766a795bdfb76c5f6f2e2996312a9b6c0b42be7cf41f523a2995fe030079c6d809e7d86a9441ebad8e19ff71489401000024859dd48a19138f992680b34d46b635319a6df2d8afdf8f1c2777a464dae79f37db39cdc86f5ef7ebd7afd5df10ceb61db6bed414cba491dcb1327cf8f0a66ddbb6a96f7ce31beaa69b6e4a2ee81c3e7cd85be091bb7fccc7cacd9d3bd74b2a39468e95f7c87bc53befbca3faf4e9a3eeb8e30e356fdebcb56565658bcc6b403061c7804c89197d4016f2645b7ee3df2f1b366c9857367ffe7cb572e54aefb5dc51e6ef974759c9e2c6c2850b5b9c3f356bd6acf1dedbbb77ef16f5cf9c3953353535b55a16f63155e6762ed761c67ff4d48f7ffc63790462da3e2997bb0eccf399dba9e76febfb96edebcd25c53246e54b3efa0f299dd07f0020278c9d708ead4619b4de7fd3b953676722f25aca00000092c24e6ac58c89ca4c13c0d92623db9a18cd3679ecd73f7dfaf4e47e79fc8db93fcc39cdc8428e79fda9e794d76d4dde86ad2f35c5346954555575f34d37dd74501e2977e28927aa65cb96a52df8c823e1e4f382264e9ca866cf9ead5e78e10575fffdf77b91d75226fbe498d4c7c7c9e2d0c5175fec2dbe6dd9b2655f4545c59b6565659f33eb473061c7804c89197d40eee292edd40f8d97d7fe717e3a76ec98dc2f6d44ca4e39e514eff180a98ba9b200ddb76f5fd5a953a7e47b33f5c1d4cff8c85416f683edcded5caec38cff592ef2f958e63e29973b30cdf399dba9e76febfb96edebcd25c53446e5433efa0f299dd07f0020278c9d708ead4669ab5e00005084c24e6ac58c89ca4c13c0d92623db9a18cd3679ec97c9b9e57176e6f598db41ce69a66bd7aec93afceb37eb686bf2366c7da929a649a34993261d3572e4c867e7ce9dfbc192254bbc3ba8e4b15ba90e1d3aa456af5e2d77fda82953a6a851a3467991d772e790ec93637c72a7902c0a9d77de796acf9e3dff1a3a74e8d6783c3ec4ac1bc1851d03322566f4814c7712fafd5e16f9ccf74b9e7aea293570e0c0e423d1e48e307f9fdc5d28652b56acf01645ccfaccedd6cab28d4de67bcced5caec34c5be39f94fb0b4d728de6f9cc6d495bdfb76c5f6f2e29a6312a1ff2d17f48e984fe03003961ec84736c354a5bf5020080221476522b664c4c669a00ce3619d9d6c468b6c963b3fe6cdb41ce6926c8c2505b93b761eb4b4db14d1a9597979f70e9a597ee59b972e521591c92cf04923b8172219f292493de975d7699b72874c515576cd0e79f6cd68970c28e0199124bf481b63e7bccbf53b0b2b2b2cd3b6a64f1508eebd1a347b2ccef53f258c1eaeaea167dcedc6ead2cdbdd8ce67bcced5caec38cff7d183f7e7c8b3b2665f154f63df9e493dee3e2ccf399dba9c9f47dcbf6f5e692621ba38e543efa4f3124d646dbcc358538a7edd07f0020278c9d708ead4619b4de4fe8dcabf36622f25aca00000092c24e6ac51213356d4d00679b8c6c6b6234dbe4b15f7f6bdbc71d779cb7bd69d3a6c0e73493ed5172d9266fc3d6979a629c341a3c78f0ff193264c8ce850b17be2b7700499b39fffcf3bdcf720a42ee4abbf2ca2bbd4525f94ca12d5bb6bc25770ac9a290dc9564d68770c28e0199124bf481638e39c65b183ee79c73bcb69c7a8c7cb6d8e8d1a355af5ebdbc8555ff3de639e4ce97d34f3f5d2d58b020b96fd6ac59de2323fd635a7b6fa66b4a2df33fff4cae51627efe99f91e733b97eb30e37fc69a3c02cefc8cb57befbdd76be761ceef9765fabe65fb7a7349318e5147c26ce7a59a5880b61a36f938876ba1ff00404e183be11c5b8d3268bd7f88a5fc67221129030000480a3ba9154bfcbba2ad09e06c93916d4d8c069d3c6e6d7bf2e4c9c93b96fcf26ce734230b16fdfaf54b5e9b797cb6c9dbb0f5a5a658278d2a2a2a4ed16de29569d3a6bd2677594d9d3ad5fb397df5ab5f55b5b5b5de6731bdf6da6bde4290fcb96ad52a75e79d77aa73cf3d5775e9d2c5fbec14f93cab79f3e6add3e7dac5e3e3f2c7ecbf84b495621da37245ff694eccf87bcedcce25f938876ba1ff00404e183be11c5b8d3268bdbb7406eb7c3c11792d770e0100002431a9953db10827a78a79d268e8d0a15dcbcaca6a2eb9e4923df3e7cf7f79fffefd6ae1c285ead24b2f555ffef297d5c9279fec7d9fe5cfb3ce3acb5b5c7ce8a187bcbbca1a1b1bffa18f7b351e8f2fd6e7f89c796ee48e31808449318f51b970b5ffc4127f6ff991b25dbb76a91123467877bdca82bbdc1dbb71e3c6e47be6cc99a34e3bedb4e4e755f9ef4b3d5f906db3ee4cc775eedc599d7df6d9de2310fd7dd97e29c3ffa5137934adc4fca593b6aedf95d07f0020278c9d708ead4619b45e59188aeb7c2c1179cdc210000048e3eaa4964b894538c1540a9346f268b9783cfee78a8a8ab7afbdf6dabf3df6d863abd7ac59f38f9d3b77be917874dc1bb2bd78f1e267c68f1fbfaabcbc7c9fceb2b2b2b26f98e7c291630c2061520a635418aef69f58e2ef2d79dc6953539357366cd830af6cfefcf9de5d9af27ac08001c9f7c86768c9a28a2cd8673a9fffd97aa9e70fba6d468ff1defedebd7b27cbb23dc635db636adbba7e5742ff01809c3076c239b61a65d07ae5338592ff984a44ca000000925c9dd42ad594d2a4d1a041833e198fc77fa8335767a58edc11a4745ed359a5f3607979f9487d5c77f3bdc81fc6001226a5344605e16aff8925e600523fe74eeeb2f1cbfd74ecd831b95f1eef2a65a79c728af7f8ced4bb89a45c3e4fd03c7fd06dc9a2458b54dfbe7d55a74e9d92fb53179bba76edea95c9e346f7eedddbe21cfe636253f7cbd7e4ef6febfa5d09fd070072c2d809e7d86a9441ebfd44ac792148ee1c92c86b2903000048727552ab54c3a411a2c61840c284312a9dabfd2796616146eea891b2d75f7fbdc5f192a79e7a4a0d1c3830f928b63e7dfaa49dcf5fc4918519f3fcd9b6253d7bf6f4ca56ac58e12d5899c71ce9c2505bd7ef4ae83f009013c64e38c756a3b4552f00002842f998d48a659800723de6359bdbb6c2a411a2968f3180944e18a3d2b9da7f6219fe4e1b3e7cb8575659599976279119f9dc1f39ae478f1ec932f95c22297bf2c927bdc7d399e737b78f3bee386f7bd3a64dc9327f616af9f2e5aabababac57b2eb8e0026f3bd747c9b575fdae84fe03003961ec84736c354a5bf502008022948f49ad983179d31e625eb3b96d2b4c1a216af9180348e984312a9dabfd2796e1efb4ddbb77abd1a347ab5ebd7a7977ff98c7f8db72c7cde9a79fae162c5890dc77efbdf7aae38f3f3e794c6beff5b7274f9e9cbcc3c72f9f356b96eadebd7babe758bf7ebd3af3cc3355870e1d32eedfbe7dbbb71024e7950c1e3cd82b33af21d3f5bb12fa0f00e484b113ceb1d52883d43b40a73ed6fc08b9377596e89c9376040000402c3f935a3163f2a63dc4bc6673db56983442d4f2310690d20963543afa0f0913fa0f00e484b113ceb1d528b3d52b0b40876289c98d9448d9d7528e030000c869526bc3860daa5fbf7eadfe56efae5dbbd4881123bc47cf74e9d2455d78e185691f023d67ce1c75da69a7253f0720f5bd12bfac73e7ceeaecb3cff61e0b63ee4b7d5fa632ff378be5f30724adfd66716bdbd9aea35061d20851cb650c20a51bc6a874f41f1226f41f00c80963279c63ab5166ab57ee145aa3f3759de374bae89cabb34e6751ca71000000394d6ac9428f7e6bab9f03306cd8306f7bfefcf96ae5ca95deeb01030624f7cbe70cc8a2d0c2850b5b9c3b356bd6acf1dedbbb77ef64995f977cc641535353ab65d93e8bc0bc66733bdb75142a4c1a216ab98c01a474c318958efe43c284fe03003961ec84736c35ca6cf5eed6e963166a5f88353f560e000020299749adae5dbb7a0b25fbf6ed537bf7ee6db1a82277e8f8657e3a76ec98dc7fe289277a65a79c728aaaaaaa4abb9b68d1a245aa6fdfbeaa53a74ec9f7ca6721f8fbfdb2d40fcece54e67fb641ea35ca7599ef696d3bdb75142a4c1a216ab98c01a474c318958efe43c284fe03003961ec84736c35ca6cf5fe4be728b330d65c76d02c040000a52d9749ad6c0b437247906cbffefaeb2dde2b79eaa9a7d4c08103938f92ebd3a74f725fcf9e3dbdb2152b56780b3de6b9cdedd6ca8e746128db75142a4c1a216ab98c01a474c318958efe43c284fe03003961ec84736c35ca6cf526272e5a09000040522e935a175c7081f7ef8ad61e25377cf8706fbbb2b232ed2e1e33f2993d725c8f1e3d9265fea2d2f2e5cb557575758b739bdbad951de9a3e4c25e47b6eda061d20851cb650c20a51bc6a874f41f1226f41f00c80963279c63ab5166ab373911d14a000000927299d45abf7ebd3af3cc3355870e1dd2fe9de1efdfbd7bb71a3d7ab4ead5ab97f7f83573bfbf2d770c9d7efae96ac18205c97db366cd52ddbb7737fffdd2e2bda9d793a96cfbf6edde4290dc3924193c78b057d6da7bccedb0d7916d3b68983442d472190348e986312a1dfd878409fd070072c2d809e7d86a94b6ea0500004588492db7c2a411a2c61840c284312a1dfd878409fd070072c2d809e7d86a94b6ea0500004588492db7c2a411a2c61840c284312a1dfd878409fd070072c2d809e7d86a94b6ea0500004588492db7c2a411a2c61840c284312a1dfd878409fd070072c2d809e7d86a94b6ea0500004588492db7c2a411a2c61840c284312a1dfd878409fd070072c2d809e7d86a94b6ea0500004588492db7c2a411a2c61840c284312a1dfd878409fd070072c2d809e7d86a94b6ea0500004588492db7c2a411a2c61840c284312a1dfd878409fd070072c2d809e7d86a94b6ea0500004588492db7c2a411a2c61840c284312a1dfd878409fd070072c2d809e7d86a94b6ea0500004588492db7c2a411a2c61840c284312a1dfd878409fd070072c2d809e7d86a94b6ea0500004588492db7c2a411a2c61840c284312a1dfd878409fd070072c2d809e7d86a94b6ea0500004588492db7c2a411a2c61840c284312a1dfd878409fd070072c2d809e7d86a94b6ea0500004588492db7c2a411a2c61840c284312a1dfd878409fd070072c2d809e7d86a94b6ea0500004588492db7c2a411a2c61840c284312a1dfd878409fd070072c2d809e7d86a94b6ea0500004588492db7c2a411a2c61840c284312a1dfd878409fd070072c2d809e7d86a94b6ea05000045a8bebefef08103075a4c5e90e8a37f0e6fd4d5d535993f23a090180348d03046b544ff214143ff01809c31170ee7d86a94b6ea05000045e8f1c71f7f63c78e1d2d263048f479f5d557ff545757f7b4f933020a893180040d63544bf41f1234f41f00c81973e1708ead4669ab5e000050841a1a1a2e5aba74e95bdbb66ddbc56f3ddb89febe6fdbbc79f31febeaea5ed3f996f933020a893180640b6354ebe83f245be83f0070c4980b87736c354a5bf502008022251315f25bac3aefcbf3ef49e491efbb7cff99308215d2f6126d903180640a63541be4fb92f8fed07f48a6d07f00e0c830170ee7d86a94b6ea0500000000000000202acc85c339b61aa5ad7a0100000000000000880a73e1708ead4669ab5e0000000000000000a2c25c389c63ab51daaa170000000000000080a830170ee7d86a94b6ea0500000000000000202acc85c339b61aa5ad7a0100000000000000880a73e1708ead4669ab5e0000000000000000a2c25c389c63ab51daaa170000000000000080a830170ee7d86a94b6ea0500000000000000202acc85c339b61aa5ad7a0100000000000000880a73e1708ead4669ab5e0000000000000000a2c25c389c63ab51daaa170000000000000080a830170ee7d86a94b6ea0500000000000000202acc85c339b61aa5ad7a0100000000000000880a73e1708ead4669ab5e0000000000000000a2c25c389c63ab51daaa170000000000000080a830170ee7d86a94b6ea0500000000000000202acc85c339b61aa5ad7a0100000000000000880a73e1708ead4669ab5e0000000000000000a2c25c389c63ab51daaa170000000000000080a830170ee7d86a94b6ea0500000000000000202acc85c339b61aa5ad7a0100000000000000880a73e1708ead4669ab5e0000000000000000a2c25c389c63ab51daaa170000000000000080a830170ee7d86a94b6ea0500000000000000202acc85c339b61aa5ad7a0100000000000000880a73e1708ead4669ab5e0000000000000000a2c25c389c63ab51daaa170000000000000080a830170ee7d86a94b6ea0500000000000000202acc85c339b61aa5ad7a0100000000000000880a73e1708ead4669ab5e0000000000000000a2c25c389c63ab51daaa170000000000000080a830170ee7d86a94b6ea0500000000000000202acc85c339b61aa5ad7a0100000000000000880a73e1708ead4669ab5e0000000000000000a2c25c389c63ab51daaa170000000000000080a830170ee7d86a94b6ea0500000000000000202acc85c339b61aa5ad7a0100000000000000880a73e1708ead4669ab5e0000000000000000a2c25c389c238d9210420821841042082184104208218509000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c2faff949937f4c88bed190000000049454e44ae426082	t
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
be681431-e2d1-11f1-87a6-06295b567284	App Cursos	\N	appCursos		2026-11-17 21:56:29.573	\N	\N	be67c60c-e2d1-11f1-87a6-06295b567284	\N
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
Process_Curso:1:be9df144-e2d1-11f1-87a6-06295b567284	1	http://flowable.org/test	Institución de capacitación	Process_Curso	1	be681431-e2d1-11f1-87a6-06295b567284	Process_Curso.bpmn	Process_Curso.Process_Curso.png	\N	f	t	1		\N	\N	0	\N
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
be9f9ef5-e2d1-11f1-87a6-06295b567284	1	message	Solicitud de curso	\N	\N	Inicio	Process_Curso:1:be9df144-e2d1-11f1-87a6-06295b567284	2026-11-17 21:56:29.937	Process_Curso:1:be9df144-e2d1-11f1-87a6-06295b567284	\N	\N	\N	\N	\N	\N	
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
1	flowable	org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml	2026-11-16 15:54:32.07744	1	EXECUTED	8:1b0c48c9cf7945be799d868a2626d687	createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...		\N	4.9.0	\N	\N	4844471872
2	flowable	org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml	2026-11-16 15:54:32.100622	2	EXECUTED	8:0ea825feb8e470558f0b5754352b9cda	addColumn tableName=FLW_CHANNEL_DEFINITION; addColumn tableName=FLW_CHANNEL_DEFINITION		\N	4.9.0	\N	\N	4844471872
3	flowable	org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml	2026-11-16 15:54:32.120068	3	EXECUTED	8:3c2bb293350b5cbe6504331980c9dcee	customChange		\N	4.9.0	\N	\N	4844471872
1	flowable	org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml	2026-11-16 15:54:32.07744	1	EXECUTED	8:1b0c48c9cf7945be799d868a2626d687	createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...		\N	4.9.0	\N	\N	4844471872
2	flowable	org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml	2026-11-16 15:54:32.100622	2	EXECUTED	8:0ea825feb8e470558f0b5754352b9cda	addColumn tableName=FLW_CHANNEL_DEFINITION; addColumn tableName=FLW_CHANNEL_DEFINITION		\N	4.9.0	\N	\N	4844471872
3	flowable	org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml	2026-11-16 15:54:32.120068	3	EXECUTED	8:3c2bb293350b5cbe6504331980c9dcee	customChange		\N	4.9.0	\N	\N	4844471872
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

\unrestrict n31kBxfXpuPkSD9BlP0JtqL9gARhfJ5BvDcm2xFlq0xbytd5A3FdkQi3fuS2Vkc

