set define '^'
set verify off
set serveroutput on size 1000000
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
 
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to sqlplus as the schema associated with the UI defaults or as the product schema.
  wwv_flow_api.set_security_group_id(p_security_group_id=>1500428789135903);
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'en'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to install this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2020.03.31');
 
end;
/

-- SET SCHEMA
 
begin
 
   wwv_flow_api.g_id_offset := 0;
   wwv_flow_hint.g_schema   := 'PYCOTIC';
   wwv_flow_hint.check_schema_privs;
 
end;
/

 
--------------------------------------------------------------------
prompt  SCHEMA PYCOTIC - User Interface Defaults, Table Defaults
--
-- Import using sqlplus as the Oracle user: APEX_200100
-- Exported 13:02 Sunday November 21, 2021 by: MIGUEL
--
 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'APLIC_IMPUTAC_PREVISION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161493878795719077 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'APLIC_IMPUTAC_PREVISION',
  p_report_region_title => 'Aplicaciones presupuestarias de la previsión',
  p_form_region_title => 'Aplicaciones presupuestarias de la previsión');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Concepto',
  p_help_text => 'Concepto presupuestario. Tercer nivel de desagreación de la estructura orgánica del presupuesto.',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161494431265719097 + wwv_flow_api.g_id_offset,
  p_table_id => 161493878795719077 + wwv_flow_api.g_id_offset,
  p_column_name => 'CONCEPTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id aplicación presupuestaria de la imputación previsión',
  p_help_text => 'Identificador único de la aplicación presupuestaria de la imputación previsión.',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161493938759719096 + wwv_flow_api.g_id_offset,
  p_table_id => 161493878795719077 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_APLIC_IMPUTAC_PREVISION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Programa',
  p_help_text => 'Programa presupuestario según denominación PGE.',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161494309897719097 + wwv_flow_api.g_id_offset,
  p_table_id => 161493878795719077 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROGRAMA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Proyecto de inversión',
  p_help_text => 'Proyecto de inversión presupuestario según PGE.',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161494597445719097 + wwv_flow_api.g_id_offset,
  p_table_id => 161493878795719077 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROYECTO_INVERSION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Sección',
  p_help_text => 'Sección presupuestaria. Primer nivel de desagreación de la estructura orgánica del presupuesto.',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161494165233719097 + wwv_flow_api.g_id_offset,
  p_table_id => 161493878795719077 + wwv_flow_api.g_id_offset,
  p_column_name => 'SECCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Servicio',
  p_help_text => 'Servicio presupuestario. Segundo nivel de desagreación de la estructura orgánica del presupuesto.',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161494244452719097 + wwv_flow_api.g_id_offset,
  p_table_id => 161493878795719077 + wwv_flow_api.g_id_offset,
  p_column_name => 'SERVICIO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'SP',
  p_help_text => 'Número de previsión.',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161494081035719096 + wwv_flow_api.g_id_offset,
  p_table_id => 161493878795719077 + wwv_flow_api.g_id_offset,
  p_column_name => 'SP');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'ATRIBUTOS_PREVISION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161494879239722934 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'ATRIBUTOS_PREVISION',
  p_report_region_title => 'Atributos de la previsión',
  p_form_region_title => 'Atributos de la previsión');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id atributo previsión',
  p_help_text => 'Indentificador único de un atributo asociado a una previsión.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161494916615722934 + wwv_flow_api.g_id_offset,
  p_table_id => 161494879239722934 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_ATRIBUTO_PREVISION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'SP',
  p_help_text => 'Número de previsión.'||chr(10)||
'',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161495284336722934 + wwv_flow_api.g_id_offset,
  p_table_id => 161494879239722934 + wwv_flow_api.g_id_offset,
  p_column_name => 'SP');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo de atributo de la previsión',
  p_help_text => 'Tipo de atributo de la previsión.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161495076203722934 + wwv_flow_api.g_id_offset,
  p_table_id => 161494879239722934 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_ATRIBUTO_PREVISION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Valor de la categoría',
  p_help_text => 'Valor asociado a la categoría.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161495131125722934 + wwv_flow_api.g_id_offset,
  p_table_id => 161494879239722934 + wwv_flow_api.g_id_offset,
  p_column_name => 'VALOR');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'CAJAS_FIJA');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161495387222723346 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'CAJAS_FIJA',
  p_report_region_title => 'Cajas fijas',
  p_form_region_title => 'Cajas fijas');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Ano',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161495998868723346 + wwv_flow_api.g_id_offset,
  p_table_id => 161495387222723346 + wwv_flow_api.g_id_offset,
  p_column_name => 'ANO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Caja Fija',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161495468543723346 + wwv_flow_api.g_id_offset,
  p_table_id => 161495387222723346 + wwv_flow_api.g_id_offset,
  p_column_name => 'CAJA_FIJA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161496193569723346 + wwv_flow_api.g_id_offset,
  p_table_id => 161495387222723346 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Concepto',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161495849958723346 + wwv_flow_api.g_id_offset,
  p_table_id => 161495387222723346 + wwv_flow_api.g_id_offset,
  p_column_name => 'CONCEPTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripcion',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161496069242723346 + wwv_flow_api.g_id_offset,
  p_table_id => 161495387222723346 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Importe',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161496252596723346 + wwv_flow_api.g_id_offset,
  p_table_id => 161495387222723346 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMPORTE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Programa',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161495799158723346 + wwv_flow_api.g_id_offset,
  p_table_id => 161495387222723346 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROGRAMA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Seccion',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161495589033723346 + wwv_flow_api.g_id_offset,
  p_table_id => 161495387222723346 + wwv_flow_api.g_id_offset,
  p_column_name => 'SECCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Servicio',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161495603844723346 + wwv_flow_api.g_id_offset,
  p_table_id => 161495387222723346 + wwv_flow_api.g_id_offset,
  p_column_name => 'SERVICIO');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'CONCEPTOS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161496380819723771 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'CONCEPTOS',
  p_report_region_title => 'Conceptos presupuestarios',
  p_form_region_title => 'Conceptos presupuestarios');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Concepto',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161496434867723771 + wwv_flow_api.g_id_offset,
  p_table_id => 161496380819723771 + wwv_flow_api.g_id_offset,
  p_column_name => 'CONCEPTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripcion',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161496634686723772 + wwv_flow_api.g_id_offset,
  p_table_id => 161496380819723771 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Vinculante',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161496536832723772 + wwv_flow_api.g_id_offset,
  p_table_id => 161496380819723771 + wwv_flow_api.g_id_offset,
  p_column_name => 'VINCULANTE');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'DESTINATARIOS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161496712781724156 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'DESTINATARIOS',
  p_report_region_title => 'Unidades administrativas beneficiarias',
  p_form_region_title => 'Unidades administrativas beneficiarias');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Destinatario',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161496892624724156 + wwv_flow_api.g_id_offset,
  p_table_id => 161496712781724156 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESTINATARIO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Nombre',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161496926047724156 + wwv_flow_api.g_id_offset,
  p_table_id => 161496712781724156 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOMBRE');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'DISTRIBUCION_IMPUTACIONES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161497022356724582 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'DISTRIBUCION_IMPUTACIONES',
  p_report_region_title => 'Distribucion de la imputación presupuestarias',
  p_form_region_title => 'Distribucion de la imputación presupuestarias');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Destinatario',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161497301075724582 + wwv_flow_api.g_id_offset,
  p_table_id => 161497022356724582 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESTINATARIO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Num Lote',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161497267065724582 + wwv_flow_api.g_id_offset,
  p_table_id => 161497022356724582 + wwv_flow_api.g_id_offset,
  p_column_name => 'NUM_LOTE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Porcentaje',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 3,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161497481123724582 + wwv_flow_api.g_id_offset,
  p_table_id => 161497022356724582 + wwv_flow_api.g_id_offset,
  p_column_name => 'PORCENTAJE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Ua',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161497152038724582 + wwv_flow_api.g_id_offset,
  p_table_id => 161497022356724582 + wwv_flow_api.g_id_offset,
  p_column_name => 'UA');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'DISTRIBUCION_PREVISION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161497584521725001 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'DISTRIBUCION_PREVISION',
  p_report_region_title => 'Distribucion de los beneficiarios de la previsión',
  p_form_region_title => 'Distribucion de los beneficiarios de la previsión');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Destinatario',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161497710303725001 + wwv_flow_api.g_id_offset,
  p_table_id => 161497584521725001 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESTINATARIO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Porcentaje',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 3,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161497836989725001 + wwv_flow_api.g_id_offset,
  p_table_id => 161497584521725001 + wwv_flow_api.g_id_offset,
  p_column_name => 'PORCENTAJE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Sp',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161497696246725001 + wwv_flow_api.g_id_offset,
  p_table_id => 161497584521725001 + wwv_flow_api.g_id_offset,
  p_column_name => 'SP');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'DOCUMENTOS_CAJA_FIJA');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161497980077725449 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'DOCUMENTOS_CAJA_FIJA',
  p_report_region_title => 'Documentación asociada a la Caja Fija',
  p_form_region_title => 'Documentación asociada a la Caja Fija');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Caja Fija',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161498058730725449 + wwv_flow_api.g_id_offset,
  p_table_id => 161497980077725449 + wwv_flow_api.g_id_offset,
  p_column_name => 'CAJA_FIJA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Character Set Column',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 40,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161498856953725449 + wwv_flow_api.g_id_offset,
  p_table_id => 161497980077725449 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHARACTER_SET_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161498441041725449 + wwv_flow_api.g_id_offset,
  p_table_id => 161497980077725449 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fichero',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_FILE',
  p_form_attribute_01 => 'DB_COLUMN',
  p_form_attribute_06 => 'Y',
  p_form_attribute_08 => 'attachment',
  p_form_attribute_09 => 'SESSION',
  p_form_attribute_10 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161498322207725449 + wwv_flow_api.g_id_offset,
  p_table_id => 161497980077725449 + wwv_flow_api.g_id_offset,
  p_column_name => 'FICHERO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Filename Column',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161498641549725449 + wwv_flow_api.g_id_offset,
  p_table_id => 161497980077725449 + wwv_flow_api.g_id_offset,
  p_column_name => 'FILENAME_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Last Updated Column',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161498706984725449 + wwv_flow_api.g_id_offset,
  p_table_id => 161497980077725449 + wwv_flow_api.g_id_offset,
  p_column_name => 'LAST_UPDATED_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Mime Type Column',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161498573183725449 + wwv_flow_api.g_id_offset,
  p_table_id => 161497980077725449 + wwv_flow_api.g_id_offset,
  p_column_name => 'MIME_TYPE_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Nombre',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161498106126725449 + wwv_flow_api.g_id_offset,
  p_table_id => 161497980077725449 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOMBRE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo Documento',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161498297669725449 + wwv_flow_api.g_id_offset,
  p_table_id => 161497980077725449 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_DOCUMENTO');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'DOCUMENTOS_CONTRATACION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161498992619725785 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'DOCUMENTOS_CONTRATACION',
  p_report_region_title => 'Documentación asociada al expediente de contratación',
  p_form_region_title => 'Documentación asociada al expediente de contratación');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Character Set Column',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 40,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161499810273725786 + wwv_flow_api.g_id_offset,
  p_table_id => 161498992619725785 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHARACTER_SET_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161499347076725785 + wwv_flow_api.g_id_offset,
  p_table_id => 161498992619725785 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Documento',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_FILE',
  p_form_attribute_01 => 'DB_COLUMN',
  p_form_attribute_06 => 'Y',
  p_form_attribute_08 => 'attachment',
  p_form_attribute_09 => 'SESSION',
  p_form_attribute_10 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161499407451725785 + wwv_flow_api.g_id_offset,
  p_table_id => 161498992619725785 + wwv_flow_api.g_id_offset,
  p_column_name => 'DOCUMENTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Filename Column',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161499626119725786 + wwv_flow_api.g_id_offset,
  p_table_id => 161498992619725785 + wwv_flow_api.g_id_offset,
  p_column_name => 'FILENAME_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Last Updated Column',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161499784314725786 + wwv_flow_api.g_id_offset,
  p_table_id => 161498992619725785 + wwv_flow_api.g_id_offset,
  p_column_name => 'LAST_UPDATED_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Mime Type Column',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161499588174725786 + wwv_flow_api.g_id_offset,
  p_table_id => 161498992619725785 + wwv_flow_api.g_id_offset,
  p_column_name => 'MIME_TYPE_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Num Documento',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161499048211725785 + wwv_flow_api.g_id_offset,
  p_table_id => 161498992619725785 + wwv_flow_api.g_id_offset,
  p_column_name => 'NUM_DOCUMENTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo Documento',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161499290741725785 + wwv_flow_api.g_id_offset,
  p_table_id => 161498992619725785 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_DOCUMENTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Ua',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161499120887725785 + wwv_flow_api.g_id_offset,
  p_table_id => 161498992619725785 + wwv_flow_api.g_id_offset,
  p_column_name => 'UA');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'DOCUMENTOS_FACTURACION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161499982132726381 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'DOCUMENTOS_FACTURACION',
  p_report_region_title => 'Documentación asociada a la factura',
  p_form_region_title => 'Documentación asociada a la factura');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Character Set Column',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 40,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161500805666726382 + wwv_flow_api.g_id_offset,
  p_table_id => 161499982132726381 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHARACTER_SET_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161500419794726382 + wwv_flow_api.g_id_offset,
  p_table_id => 161499982132726381 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Documentacion',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_FILE',
  p_form_attribute_01 => 'DB_COLUMN',
  p_form_attribute_06 => 'Y',
  p_form_attribute_08 => 'attachment',
  p_form_attribute_09 => 'SESSION',
  p_form_attribute_10 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161500314595726382 + wwv_flow_api.g_id_offset,
  p_table_id => 161499982132726381 + wwv_flow_api.g_id_offset,
  p_column_name => 'DOCUMENTACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Filename Column',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161500690345726382 + wwv_flow_api.g_id_offset,
  p_table_id => 161499982132726381 + wwv_flow_api.g_id_offset,
  p_column_name => 'FILENAME_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id Factura',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161500155036726382 + wwv_flow_api.g_id_offset,
  p_table_id => 161499982132726381 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_FACTURA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Last Updated Column',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161500702518726382 + wwv_flow_api.g_id_offset,
  p_table_id => 161499982132726381 + wwv_flow_api.g_id_offset,
  p_column_name => 'LAST_UPDATED_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Mime Type Column',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161500586380726382 + wwv_flow_api.g_id_offset,
  p_table_id => 161499982132726381 + wwv_flow_api.g_id_offset,
  p_column_name => 'MIME_TYPE_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Num Documento',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161500044156726382 + wwv_flow_api.g_id_offset,
  p_table_id => 161499982132726381 + wwv_flow_api.g_id_offset,
  p_column_name => 'NUM_DOCUMENTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo Documento Fac',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161500276565726382 + wwv_flow_api.g_id_offset,
  p_table_id => 161499982132726381 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_DOCUMENTO_FAC');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'DOCUMENTOS_MODELO');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161500932214726951 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'DOCUMENTOS_MODELO',
  p_report_region_title => 'Documentación del modelo',
  p_form_region_title => 'Documentación del modelo');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Character Set Column',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 40,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161501709868726951 + wwv_flow_api.g_id_offset,
  p_table_id => 161500932214726951 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHARACTER_SET_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161501348410726951 + wwv_flow_api.g_id_offset,
  p_table_id => 161500932214726951 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Documentacion',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_FILE',
  p_form_attribute_01 => 'DB_COLUMN',
  p_form_attribute_06 => 'Y',
  p_form_attribute_08 => 'attachment',
  p_form_attribute_09 => 'SESSION',
  p_form_attribute_10 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161501201644726951 + wwv_flow_api.g_id_offset,
  p_table_id => 161500932214726951 + wwv_flow_api.g_id_offset,
  p_column_name => 'DOCUMENTACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Filename Column',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161501516332726951 + wwv_flow_api.g_id_offset,
  p_table_id => 161500932214726951 + wwv_flow_api.g_id_offset,
  p_column_name => 'FILENAME_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id Modelo',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161501022508726951 + wwv_flow_api.g_id_offset,
  p_table_id => 161500932214726951 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_MODELO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Last Updated Column',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161501695938726951 + wwv_flow_api.g_id_offset,
  p_table_id => 161500932214726951 + wwv_flow_api.g_id_offset,
  p_column_name => 'LAST_UPDATED_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Mime Type Column',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161501487232726951 + wwv_flow_api.g_id_offset,
  p_table_id => 161500932214726951 + wwv_flow_api.g_id_offset,
  p_column_name => 'MIME_TYPE_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Num Version',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 3,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161501172455726951 + wwv_flow_api.g_id_offset,
  p_table_id => 161500932214726951 + wwv_flow_api.g_id_offset,
  p_column_name => 'NUM_VERSION');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'DOCUMENTOS_MODIFICACIONES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161501847277727497 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'DOCUMENTOS_MODIFICACIONES',
  p_report_region_title => 'Documentación asociada a la modificación presupuestaria',
  p_form_region_title => 'Documentación asociada a la modificación presupuestaria');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Character Set Column',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 40,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161502727873727498 + wwv_flow_api.g_id_offset,
  p_table_id => 161501847277727497 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHARACTER_SET_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161502344372727498 + wwv_flow_api.g_id_offset,
  p_table_id => 161501847277727497 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Documentacion',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_FILE',
  p_form_attribute_01 => 'DB_COLUMN',
  p_form_attribute_06 => 'Y',
  p_form_attribute_08 => 'attachment',
  p_form_attribute_09 => 'SESSION',
  p_form_attribute_10 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161502203361727498 + wwv_flow_api.g_id_offset,
  p_table_id => 161501847277727497 + wwv_flow_api.g_id_offset,
  p_column_name => 'DOCUMENTACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Filename Column',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161502524862727498 + wwv_flow_api.g_id_offset,
  p_table_id => 161501847277727497 + wwv_flow_api.g_id_offset,
  p_column_name => 'FILENAME_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id Modificacion',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161501978972727497 + wwv_flow_api.g_id_offset,
  p_table_id => 161501847277727497 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_MODIFICACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Last Updated Column',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161502609298727498 + wwv_flow_api.g_id_offset,
  p_table_id => 161501847277727497 + wwv_flow_api.g_id_offset,
  p_column_name => 'LAST_UPDATED_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Mime Type Column',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161502404093727498 + wwv_flow_api.g_id_offset,
  p_table_id => 161501847277727497 + wwv_flow_api.g_id_offset,
  p_column_name => 'MIME_TYPE_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Num Documento',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161502029128727497 + wwv_flow_api.g_id_offset,
  p_table_id => 161501847277727497 + wwv_flow_api.g_id_offset,
  p_column_name => 'NUM_DOCUMENTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo Doc Envio',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161502199866727497 + wwv_flow_api.g_id_offset,
  p_table_id => 161501847277727497 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_DOC_ENVIO');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'EJERCICIOS_FUTUROS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161502867956728523 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'EJERCICIOS_FUTUROS',
  p_report_region_title => 'Tipos de categorías de ejercicios futuros',
  p_form_region_title => 'Tipos de categorías de ejercicios futuros');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripcion',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161503089153728523 + wwv_flow_api.g_id_offset,
  p_table_id => 161502867956728523 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo Ejercicios Futuros',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161502906565728523 + wwv_flow_api.g_id_offset,
  p_table_id => 161502867956728523 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_EJERCICIOS_FUTUROS');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'ESTADOS_PREVISION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161503179770729442 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'ESTADOS_PREVISION',
  p_report_region_title => 'Categorías de estados de la prevision',
  p_form_region_title => 'Categorías de estados de la prevision');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripcion',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161503335326729442 + wwv_flow_api.g_id_offset,
  p_table_id => 161503179770729442 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Estado Prevision',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161503224844729442 + wwv_flow_api.g_id_offset,
  p_table_id => 161503179770729442 + wwv_flow_api.g_id_offset,
  p_column_name => 'ESTADO_PREVISION');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'EVENTOS_CONTRATACION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161508829703760186 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'EVENTOS_CONTRATACION',
  p_report_region_title => 'Tipos de eventos de contratación',
  p_form_region_title => 'Tipos de eventos de contratación');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentario',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161509605429760186 + wwv_flow_api.g_id_offset,
  p_table_id => 161508829703760186 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripcion',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161509746763760186 + wwv_flow_api.g_id_offset,
  p_table_id => 161508829703760186 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Evento',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161508983132760186 + wwv_flow_api.g_id_offset,
  p_table_id => 161508829703760186 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha Esperada Fin',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161509383687760186 + wwv_flow_api.g_id_offset,
  p_table_id => 161508829703760186 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_ESPERADA_FIN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha Fin',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161509578115760186 + wwv_flow_api.g_id_offset,
  p_table_id => 161508829703760186 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_FIN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha Inicio',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161509296589760186 + wwv_flow_api.g_id_offset,
  p_table_id => 161508829703760186 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_INICIO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id Tramitador',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161509489685760186 + wwv_flow_api.g_id_offset,
  p_table_id => 161508829703760186 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_TRAMITADOR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo Evento Contratacion',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161509158737760186 + wwv_flow_api.g_id_offset,
  p_table_id => 161508829703760186 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_EVENTO_CONTRATACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Ua',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161509086608760186 + wwv_flow_api.g_id_offset,
  p_table_id => 161508829703760186 + wwv_flow_api.g_id_offset,
  p_column_name => 'UA');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'EVENTOS_FACTURACION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161513466683762290 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'EVENTOS_FACTURACION',
  p_report_region_title => 'Tipos de eventos de facturación',
  p_form_region_title => 'Tipos de eventos de facturación');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161514255003762291 + wwv_flow_api.g_id_offset,
  p_table_id => 161513466683762290 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripcion',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161514355539762291 + wwv_flow_api.g_id_offset,
  p_table_id => 161513466683762290 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Evento',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161513567518762290 + wwv_flow_api.g_id_offset,
  p_table_id => 161513466683762290 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha Esperada Fin',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161513969858762290 + wwv_flow_api.g_id_offset,
  p_table_id => 161513466683762290 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_ESPERADA_FIN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha Fin',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161514103856762291 + wwv_flow_api.g_id_offset,
  p_table_id => 161513466683762290 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_FIN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha Inicio',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161513808627762290 + wwv_flow_api.g_id_offset,
  p_table_id => 161513466683762290 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_INICIO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id Factura',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161513608066762290 + wwv_flow_api.g_id_offset,
  p_table_id => 161513466683762290 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_FACTURA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id Tramitador',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161514000697762291 + wwv_flow_api.g_id_offset,
  p_table_id => 161513466683762290 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_TRAMITADOR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo Evento Facturacion',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161513701345762290 + wwv_flow_api.g_id_offset,
  p_table_id => 161513466683762290 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_EVENTO_FACTURACION');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'EVENTOS_PLANIFICACION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161514408718762971 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'EVENTOS_PLANIFICACION',
  p_report_region_title => 'Tipos de eventos de planificación',
  p_form_region_title => 'Tipos de eventos de planificación');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161515289927762971 + wwv_flow_api.g_id_offset,
  p_table_id => 161514408718762971 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripcion',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161515351550762971 + wwv_flow_api.g_id_offset,
  p_table_id => 161514408718762971 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Evento',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161514585172762971 + wwv_flow_api.g_id_offset,
  p_table_id => 161514408718762971 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha Esperada Fin',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161514907654762971 + wwv_flow_api.g_id_offset,
  p_table_id => 161514408718762971 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_ESPERADA_FIN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha Fin',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161515010579762971 + wwv_flow_api.g_id_offset,
  p_table_id => 161514408718762971 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_FIN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha Inicio',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161514862049762971 + wwv_flow_api.g_id_offset,
  p_table_id => 161514408718762971 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_INICIO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id Tramitador',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161515105142762971 + wwv_flow_api.g_id_offset,
  p_table_id => 161514408718762971 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_TRAMITADOR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Sp',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161514610886762971 + wwv_flow_api.g_id_offset,
  p_table_id => 161514408718762971 + wwv_flow_api.g_id_offset,
  p_column_name => 'SP');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo Evento Planificacion',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161514714053762971 + wwv_flow_api.g_id_offset,
  p_table_id => 161514408718762971 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_EVENTO_PLANIFICACION');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'EVEN_PROC_CONT');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161515499654764019 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'EVEN_PROC_CONT',
  p_report_region_title => 'Relación de eventos con los procedimientos de contratación',
  p_form_region_title => 'Relación de eventos con los procedimientos de contratación');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Proc Cont',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161515620645764019 + wwv_flow_api.g_id_offset,
  p_table_id => 161515499654764019 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROC_CONT');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo Evento',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161515535956764019 + wwv_flow_api.g_id_offset,
  p_table_id => 161515499654764019 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_EVENTO');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'EXPEDIENTES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'EXPEDIENTES',
  p_report_region_title => 'Expedientes',
  p_form_region_title => 'Expedientes');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Cancelado',
  p_display_seq_form => 19,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 19,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161517691558764826 + wwv_flow_api.g_id_offset,
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_column_name => 'CANCELADO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161517528076764826 + wwv_flow_api.g_id_offset,
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id Dgrcc',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161517194555764826 + wwv_flow_api.g_id_offset,
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_DGRCC');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id Dtic',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161517216532764826 + wwv_flow_api.g_id_offset,
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_DTIC');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id Financiera',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161517344905764826 + wwv_flow_api.g_id_offset,
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_FINANCIERA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id Jc',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161517077635764826 + wwv_flow_api.g_id_offset,
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_JC');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Inicio Tramitacion',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161516731158764825 + wwv_flow_api.g_id_offset,
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_column_name => 'INICIO_TRAMITACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Nombre',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161516258227764825 + wwv_flow_api.g_id_offset,
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOMBRE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Num Lote Padre',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161516144155764825 + wwv_flow_api.g_id_offset,
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_column_name => 'NUM_LOTE_PADRE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Organo Contratacion',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161516536703764825 + wwv_flow_api.g_id_offset,
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_column_name => 'ORGANO_CONTRATACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Proc Contratacion',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161516324535764825 + wwv_flow_api.g_id_offset,
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROC_CONTRATACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Proyecto Inversion',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161516987224764826 + wwv_flow_api.g_id_offset,
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROYECTO_INVERSION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Rc Solicitado',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161516409515764825 + wwv_flow_api.g_id_offset,
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_column_name => 'RC_SOLICITADO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Sp',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161515977677764825 + wwv_flow_api.g_id_offset,
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_column_name => 'SP');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo Contratacion',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 25,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161516810444764826 + wwv_flow_api.g_id_offset,
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_CONTRATACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo Ejercicios Futuros',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 3,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161516636980764825 + wwv_flow_api.g_id_offset,
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_EJERCICIOS_FUTUROS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo Tramitacion',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161517474059764826 + wwv_flow_api.g_id_offset,
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_TRAMITACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Ua',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161515863389764825 + wwv_flow_api.g_id_offset,
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_column_name => 'UA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Ua Padre',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161516043813764825 + wwv_flow_api.g_id_offset,
  p_table_id => 161515760829764825 + wwv_flow_api.g_id_offset,
  p_column_name => 'UA_PADRE');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'FACTURAS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161517752411765692 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'FACTURAS',
  p_report_region_title => 'Facturas',
  p_form_region_title => 'Facturas');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_help_text => 'Texto libre.'||chr(10)||
'',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161518678079765692 + wwv_flow_api.g_id_offset,
  p_table_id => 161517752411765692 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de certificación',
  p_help_text => 'Fecha de certificación de la factura por el responsable de la ejecución.'||chr(10)||
''||chr(10)||
'',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161518209080765692 + wwv_flow_api.g_id_offset,
  p_table_id => 161517752411765692 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_CERT');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha  de devolución',
  p_help_text => 'Fecha de devolución de la factura al proveedor.'||chr(10)||
'',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161518434682765692 + wwv_flow_api.g_id_offset,
  p_table_id => 161517752411765692 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_DEV');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha factura',
  p_help_text => 'Fecha de emisión de la factura.'||chr(10)||
'',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161518120599765692 + wwv_flow_api.g_id_offset,
  p_table_id => 161517752411765692 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_FACTURA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de pago',
  p_help_text => 'Fecha correspondiente a la orden de pago de la factura.'||chr(10)||
''||chr(10)||
'',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161518344740765692 + wwv_flow_api.g_id_offset,
  p_table_id => 161517752411765692 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_PAGO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id de la factura',
  p_help_text => 'Identificador único asignado a la factura.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161517825022765692 + wwv_flow_api.g_id_offset,
  p_table_id => 161517752411765692 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_FACTURA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Número de factura externo',
  p_help_text => 'Número de factura definido por el proveedor.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161518076600765692 + wwv_flow_api.g_id_offset,
  p_table_id => 161517752411765692 + wwv_flow_api.g_id_offset,
  p_column_name => 'NUM_FACTURA_EXTERNO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id imputación presupuestaria',
  p_help_text => 'Id de la imputación presupuestaria originaria de la factura.'||chr(10)||
'',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161518719811765692 + wwv_flow_api.g_id_offset,
  p_table_id => 161517752411765692 + wwv_flow_api.g_id_offset,
  p_column_name => 'NUM_IMPUTACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Pagador',
  p_help_text => 'Identificador del proveedor que debe realizar el pago de la factura.'||chr(10)||
'',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161518543109765692 + wwv_flow_api.g_id_offset,
  p_table_id => 161517752411765692 + wwv_flow_api.g_id_offset,
  p_column_name => 'PAGADOR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Período',
  p_help_text => 'Periodo del servicio objeto de la factura. Texto libre.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161517916363765692 + wwv_flow_api.g_id_offset,
  p_table_id => 161517752411765692 + wwv_flow_api.g_id_offset,
  p_column_name => 'PERIODO');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'FUNCIONES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161518850893766331 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'FUNCIONES',
  p_report_region_title => 'Funciones (Links)',
  p_form_region_title => 'Funciones (Links)');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Alias de la funcion',
  p_help_text => 'Ámbito funcional al que se puede atribuir una previsión (Link).'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161518919268766331 + wwv_flow_api.g_id_offset,
  p_table_id => 161518850893766331 + wwv_flow_api.g_id_offset,
  p_column_name => 'ALIAS_FUNCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación de la función.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161519119076766331 + wwv_flow_api.g_id_offset,
  p_table_id => 161518850893766331 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Función',
  p_help_text => 'Denominación de la función.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161519018668766331 + wwv_flow_api.g_id_offset,
  p_table_id => 161518850893766331 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOMBRE_FUNCION');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'GENERADORES_INGRESO');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161509869078760715 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'GENERADORES_INGRESO',
  p_report_region_title => 'Generadores de ingreso',
  p_form_region_title => 'Generadores de ingreso');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Character Set Column',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 40,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161511491824760716 + wwv_flow_api.g_id_offset,
  p_table_id => 161509869078760715 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHARACTER_SET_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_help_text => 'Texto libre.'||chr(10)||
'',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161510986826760716 + wwv_flow_api.g_id_offset,
  p_table_id => 161509869078760715 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Condiciones de la prorroga',
  p_help_text => 'Texto libre para detallar las condiciones para el establecimiento de una prórroga.'||chr(10)||
'',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161510613052760715 + wwv_flow_api.g_id_offset,
  p_table_id => 161509869078760715 + wwv_flow_api.g_id_offset,
  p_column_name => 'CONDICIONES_PRORROGA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Documentación',
  p_help_text => 'Solo se permite un fichero. En caso de múltiples ficheros se debe utilizar un formato de compresión.'||chr(10)||
'',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_FILE',
  p_form_attribute_01 => 'DB_COLUMN',
  p_form_attribute_06 => 'Y',
  p_form_attribute_08 => 'attachment',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161511005688760716 + wwv_flow_api.g_id_offset,
  p_table_id => 161509869078760715 + wwv_flow_api.g_id_offset,
  p_column_name => 'DOCUMENTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Email específico',
  p_help_text => 'Email de contacto para comunaciones referentes al convenio/acuerdo/...'||chr(10)||
'',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161510889447760715 + wwv_flow_api.g_id_offset,
  p_table_id => 161509869078760715 + wwv_flow_api.g_id_offset,
  p_column_name => 'EMAIL_ESPECIFICO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de fin',
  p_help_text => 'Fecha de finalización de la vigencia del instrumento jurídico.'||chr(10)||
'',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161510450589760715 + wwv_flow_api.g_id_offset,
  p_table_id => 161509869078760715 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_FIN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de finalización de la prórroga',
  p_help_text => 'Fecha de finalización de las posibles prórrogas previstas.'||chr(10)||
'',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161510580326760715 + wwv_flow_api.g_id_offset,
  p_table_id => 161509869078760715 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_FIN_PRORROGA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de firma',
  p_help_text => 'Fecha de firma del instrumento jurídico.'||chr(10)||
'',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161510252326760715 + wwv_flow_api.g_id_offset,
  p_table_id => 161509869078760715 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_FIRMA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de inicio',
  p_help_text => 'Fecha de inicio de la vigencia del instrumento jurídico.'||chr(10)||
'',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161510388913760715 + wwv_flow_api.g_id_offset,
  p_table_id => 161509869078760715 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_INICIO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Filename Column',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161511240169760716 + wwv_flow_api.g_id_offset,
  p_table_id => 161509869078760715 + wwv_flow_api.g_id_offset,
  p_column_name => 'FILENAME_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id generador ingreso',
  p_help_text => 'Identificador único asociado al instrumento de generación de ingresos (convenio, acuerdo, …)'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161509989407760715 + wwv_flow_api.g_id_offset,
  p_table_id => 161509869078760715 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_GENERADOR_INGRESO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Last Updated Column',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161511318976760716 + wwv_flow_api.g_id_offset,
  p_table_id => 161509869078760715 + wwv_flow_api.g_id_offset,
  p_column_name => 'LAST_UPDATED_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Mime Type Column',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161511106703760716 + wwv_flow_api.g_id_offset,
  p_table_id => 161509869078760715 + wwv_flow_api.g_id_offset,
  p_column_name => 'MIME_TYPE_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Organismo',
  p_help_text => 'Identificador único asociado al organismo firmante.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161510114209760715 + wwv_flow_api.g_id_offset,
  p_table_id => 161509869078760715 + wwv_flow_api.g_id_offset,
  p_column_name => 'ORGANISMO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Sistema',
  p_help_text => 'Sistema tecnológico objeto del convenio/acuerdo/...'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161510048940760715 + wwv_flow_api.g_id_offset,
  p_table_id => 161509869078760715 + wwv_flow_api.g_id_offset,
  p_column_name => 'SISTEMA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo legal',
  p_help_text => 'Tipología de documentación legal.'||chr(10)||
'',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161510760392760715 + wwv_flow_api.g_id_offset,
  p_table_id => 161509869078760715 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_LEGAL');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'GENERADORES_PAGO');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161519275758766979 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'GENERADORES_PAGO',
  p_report_region_title => 'Generadores de pago',
  p_form_region_title => 'Generadores de pago');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Character Set Column',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 40,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161520675623766979 + wwv_flow_api.g_id_offset,
  p_table_id => 161519275758766979 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHARACTER_SET_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_help_text => 'Texto libre.'||chr(10)||
'',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161520102157766979 + wwv_flow_api.g_id_offset,
  p_table_id => 161519275758766979 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Condiciones de la prórroga',
  p_help_text => 'Texto libre para detallar las condiciones para el establecimiento de una prórroga.'||chr(10)||
'',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 400,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161519845222766979 + wwv_flow_api.g_id_offset,
  p_table_id => 161519275758766979 + wwv_flow_api.g_id_offset,
  p_column_name => 'CONDICIONES_PRORROGA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Documentación',
  p_help_text => 'Solo se permite un fichero. En caso de múltiples ficheros se debe utilizar un formato de compresión.'||chr(10)||
'',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_FILE',
  p_form_attribute_01 => 'DB_COLUMN',
  p_form_attribute_06 => 'Y',
  p_form_attribute_08 => 'attachment',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161520231193766979 + wwv_flow_api.g_id_offset,
  p_table_id => 161519275758766979 + wwv_flow_api.g_id_offset,
  p_column_name => 'DOCUMENTACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Email específico',
  p_help_text => 'Email de contacto para comunaciones referentes al convenio/acuerdo/...'||chr(10)||
'',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161520085306766979 + wwv_flow_api.g_id_offset,
  p_table_id => 161519275758766979 + wwv_flow_api.g_id_offset,
  p_column_name => 'EMAIL_ESPECIFICO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de fin',
  p_help_text => 'Fecha de finalización de la vigencia del instrumento jurídico.'||chr(10)||
'',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161519677216766979 + wwv_flow_api.g_id_offset,
  p_table_id => 161519275758766979 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_FIN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de fin de la prórroga',
  p_help_text => 'Fecha de finalización de las posibles prórrogas previstas.'||chr(10)||
'',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161519712728766979 + wwv_flow_api.g_id_offset,
  p_table_id => 161519275758766979 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_FIN_PRORROGA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de firma',
  p_help_text => 'Fecha de firma del instrumento jurídico.'||chr(10)||
'',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161519414654766979 + wwv_flow_api.g_id_offset,
  p_table_id => 161519275758766979 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_FIRMA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de inicio',
  p_help_text => 'Fecha de inicio de la vigencia del instrumento jurídico.'||chr(10)||
'',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161519560153766979 + wwv_flow_api.g_id_offset,
  p_table_id => 161519275758766979 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_INICIO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Filename Column',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161520472909766979 + wwv_flow_api.g_id_offset,
  p_table_id => 161519275758766979 + wwv_flow_api.g_id_offset,
  p_column_name => 'FILENAME_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id generador de pago',
  p_help_text => 'Identificador único asociado al instrumento de generación de pagos (convenio, acuerdo, …)'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161520708005766979 + wwv_flow_api.g_id_offset,
  p_table_id => 161519275758766979 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_GENERADOR_PAGO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Last Updated Column',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161520568365766979 + wwv_flow_api.g_id_offset,
  p_table_id => 161519275758766979 + wwv_flow_api.g_id_offset,
  p_column_name => 'LAST_UPDATED_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Mime Type Column',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161520373090766979 + wwv_flow_api.g_id_offset,
  p_table_id => 161519275758766979 + wwv_flow_api.g_id_offset,
  p_column_name => 'MIME_TYPE_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Organismo receptor',
  p_help_text => 'Identificador único asignado al organismo receptor del servicio.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161519326427766979 + wwv_flow_api.g_id_offset,
  p_table_id => 161519275758766979 + wwv_flow_api.g_id_offset,
  p_column_name => 'ORGANISMO_RECEPTOR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Sistema',
  p_help_text => 'Sistema tecnológico objeto del convenio/acuerdo/...'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161520854252766979 + wwv_flow_api.g_id_offset,
  p_table_id => 161519275758766979 + wwv_flow_api.g_id_offset,
  p_column_name => 'SISTEMA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo legal',
  p_help_text => 'Tipología de documentación legal.'||chr(10)||
'',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161519952322766979 + wwv_flow_api.g_id_offset,
  p_table_id => 161519275758766979 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_LEGAL');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'IMPUTACIONES_LOTE');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161520964846767701 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'IMPUTACIONES_LOTE',
  p_report_region_title => 'Imputaciones presupuestarias del expediente',
  p_form_region_title => 'Imputaciones presupuestarias del expediente');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Año',
  p_help_text => 'Año (formato numérico con todos sus dígitos).'||chr(10)||
'',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161521719955767701 + wwv_flow_api.g_id_offset,
  p_table_id => 161520964846767701 + wwv_flow_api.g_id_offset,
  p_column_name => 'ANO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Concepto',
  p_help_text => 'Concepto presupuestario. Tercer nivel de desagreación de la estructura orgánica del presupuesto.'||chr(10)||
'',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161521602944767701 + wwv_flow_api.g_id_offset,
  p_table_id => 161520964846767701 + wwv_flow_api.g_id_offset,
  p_column_name => 'CONCEPTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Importe de adjudicación',
  p_help_text => 'Importe con IVA (euros con máximo dos decimales).'||chr(10)||
'',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161521920278767702 + wwv_flow_api.g_id_offset,
  p_table_id => 161520964846767701 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMPORTE_ADJ');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Importe de licitación',
  p_help_text => 'Importe con IVA (euros con máximo dos decimales).'||chr(10)||
'',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161522025649767702 + wwv_flow_api.g_id_offset,
  p_table_id => 161520964846767701 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMPORTE_LIC');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Lote',
  p_help_text => 'Identificador del lote.',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161521133962767701 + wwv_flow_api.g_id_offset,
  p_table_id => 161520964846767701 + wwv_flow_api.g_id_offset,
  p_column_name => 'LOTE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Número de imputacion',
  p_help_text => 'Identificador único de la imputación presupuestaria.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161521279306767701 + wwv_flow_api.g_id_offset,
  p_table_id => 161520964846767701 + wwv_flow_api.g_id_offset,
  p_column_name => 'NUM_IMPUTACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Programa',
  p_help_text => 'Programa presupuestario según denominación PGE.'||chr(10)||
'',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161521523834767701 + wwv_flow_api.g_id_offset,
  p_table_id => 161520964846767701 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROGRAMA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Proyecto de inversión',
  p_help_text => 'Proyecto de inversión presupuestario según PGE.'||chr(10)||
'',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161521847910767701 + wwv_flow_api.g_id_offset,
  p_table_id => 161520964846767701 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROYECTO_INVERSION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Sección',
  p_help_text => 'Sección presupuestaria. Primer nivel de desagreación de la estructura orgánica del presupuesto.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161521386826767701 + wwv_flow_api.g_id_offset,
  p_table_id => 161520964846767701 + wwv_flow_api.g_id_offset,
  p_column_name => 'SECCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Servicio',
  p_help_text => 'Servicio presupuestario. Segundo nivel de desagreación de la estructura orgánica del presupuesto.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161521421768767701 + wwv_flow_api.g_id_offset,
  p_table_id => 161520964846767701 + wwv_flow_api.g_id_offset,
  p_column_name => 'SERVICIO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'UA',
  p_help_text => 'Identificador del expediente.',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161521099863767701 + wwv_flow_api.g_id_offset,
  p_table_id => 161520964846767701 + wwv_flow_api.g_id_offset,
  p_column_name => 'UA');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'IMPUTACIONES_PREV');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161522133785768379 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'IMPUTACIONES_PREV',
  p_report_region_title => 'Imputaciones presupuestarias de la previsión',
  p_form_region_title => 'Imputaciones presupuestarias de la previsión');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Año',
  p_help_text => 'Año (formato numérico con todos sus dígitos).'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161522356025768379 + wwv_flow_api.g_id_offset,
  p_table_id => 161522133785768379 + wwv_flow_api.g_id_offset,
  p_column_name => 'ANO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id aplicación presupuestaria de la imputación previsión',
  p_help_text => 'Identificador único de la aplicación presupuestaria de la imputación previsión'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161522202183768379 + wwv_flow_api.g_id_offset,
  p_table_id => 161522133785768379 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_APLIC_IMPUTAC_PREVISION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Importe de licitación',
  p_help_text => 'Importe con IVA (euros con máximo dos decimales).'||chr(10)||
'',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161522561609768379 + wwv_flow_api.g_id_offset,
  p_table_id => 161522133785768379 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMPORTE_LIC');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Importe de la previsión',
  p_help_text => 'Importe con IVA (euros con máximo dos decimales).'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161522405805768379 + wwv_flow_api.g_id_offset,
  p_table_id => 161522133785768379 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMPORTE_PREV');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'INDS_IGAE');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161522612491769005 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'INDS_IGAE',
  p_report_region_title => 'Identificadores IGAE',
  p_form_region_title => 'Identificadores IGAE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Alias indicador IGAE',
  p_help_text => 'Alias del indicador correspondiente a la IGAE.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161522785571769005 + wwv_flow_api.g_id_offset,
  p_table_id => 161522612491769005 + wwv_flow_api.g_id_offset,
  p_column_name => 'ALIAS_INDICADOR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación del indicador.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161522842262769005 + wwv_flow_api.g_id_offset,
  p_table_id => 161522612491769005 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'INGRESOS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161511501298761241 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'INGRESOS',
  p_report_region_title => 'Ingresos',
  p_form_region_title => 'Ingresos');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Character Set Column',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 40,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161513304032761242 + wwv_flow_api.g_id_offset,
  p_table_id => 161511501298761241 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHARACTER_SET_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_help_text => 'Texto libre.'||chr(10)||
'',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161512953356761242 + wwv_flow_api.g_id_offset,
  p_table_id => 161511501298761241 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Objeto.'||chr(10)||
'',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161512077873761242 + wwv_flow_api.g_id_offset,
  p_table_id => 161511501298761241 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Documentación',
  p_help_text => 'Solo se permite un fichero. En caso de múltiples ficheros se debe utilizar un formato de compresión.'||chr(10)||
'',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_FILE',
  p_form_attribute_01 => 'DB_COLUMN',
  p_form_attribute_06 => 'Y',
  p_form_attribute_08 => 'attachment',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161512117503761242 + wwv_flow_api.g_id_offset,
  p_table_id => 161511501298761241 + wwv_flow_api.g_id_offset,
  p_column_name => 'DOCUMENTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Estado del ingreso',
  p_help_text => 'Descripción la situación del ingreso.'||chr(10)||
'',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161512525821761242 + wwv_flow_api.g_id_offset,
  p_table_id => 161511501298761241 + wwv_flow_api.g_id_offset,
  p_column_name => 'ESTADO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de envío',
  p_help_text => 'Fecha de envío para el pago (al órgano u organismo pagador)'||chr(10)||
'',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161512294282761242 + wwv_flow_api.g_id_offset,
  p_table_id => 161511501298761241 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_ENVIO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de fin de la liquidación',
  p_help_text => 'Fecha de finalización del periodo de liquidación correspondiente.'||chr(10)||
'',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161511947134761242 + wwv_flow_api.g_id_offset,
  p_table_id => 161511501298761241 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_FIN_LIQUIDACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de inicio de la liquidación',
  p_help_text => 'Fecha de inicio del periodo correspondiente a la liquidación realizada'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161511800150761242 + wwv_flow_api.g_id_offset,
  p_table_id => 161511501298761241 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_INICIO_LIQUIDACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Filename Column',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161513104925761242 + wwv_flow_api.g_id_offset,
  p_table_id => 161511501298761241 + wwv_flow_api.g_id_offset,
  p_column_name => 'FILENAME_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id generador de ingresos',
  p_help_text => 'Identificador único asociado al instrumento de generación de ingresos (convenio, acuerdo, …)'||chr(10)||
'',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161512864270761242 + wwv_flow_api.g_id_offset,
  p_table_id => 161511501298761241 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_GENERADOR_INGRESOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id ingreso',
  p_help_text => 'Identificador único del ingreso.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161511639446761242 + wwv_flow_api.g_id_offset,
  p_table_id => 161511501298761241 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_INGRESO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Identificador de la modificación',
  p_help_text => 'Identificador único de la modificación presupuestaria.'||chr(10)||
'',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161512755180761242 + wwv_flow_api.g_id_offset,
  p_table_id => 161511501298761241 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_MODIFICACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Importe',
  p_help_text => 'Importe con IVA (euros con máximo dos decimales).'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161511738767761242 + wwv_flow_api.g_id_offset,
  p_table_id => 161511501298761241 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMPORTE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Last Updated Column',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161513270833761242 + wwv_flow_api.g_id_offset,
  p_table_id => 161511501298761241 + wwv_flow_api.g_id_offset,
  p_column_name => 'LAST_UPDATED_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Mime Type Column',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161513033074761242 + wwv_flow_api.g_id_offset,
  p_table_id => 161511501298761241 + wwv_flow_api.g_id_offset,
  p_column_name => 'MIME_TYPE_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Número de justificante',
  p_help_text => 'Número de justificante según el documento 069 (ingresos no tributarios).'||chr(10)||
'',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161512392010761242 + wwv_flow_api.g_id_offset,
  p_table_id => 161511501298761241 + wwv_flow_api.g_id_offset,
  p_column_name => 'NUM_JUSTIFICANTE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Número de tesoro',
  p_help_text => 'Número asignado por el Tesoro Público en el certificado de ingreso correspondiente.'||chr(10)||
'',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161512688708761242 + wwv_flow_api.g_id_offset,
  p_table_id => 161511501298761241 + wwv_flow_api.g_id_offset,
  p_column_name => 'NUM_TESORO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo de ingreso',
  p_help_text => 'Tipo de ingreso.'||chr(10)||
'',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161512469146761242 + wwv_flow_api.g_id_offset,
  p_table_id => 161511501298761241 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'JEFES_DE_PROYECTO');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161522983013769901 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'JEFES_DE_PROYECTO',
  p_report_region_title => 'Jefes de proyecto',
  p_form_region_title => 'Jefes de proyecto');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Primer apellido',
  p_help_text => 'Primer apellido.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161523258867769901 + wwv_flow_api.g_id_offset,
  p_table_id => 161522983013769901 + wwv_flow_api.g_id_offset,
  p_column_name => 'APELLIDO1');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Segundo apellido',
  p_help_text => 'Segundo apellido.'||chr(10)||
'',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161523303760769901 + wwv_flow_api.g_id_offset,
  p_table_id => 161522983013769901 + wwv_flow_api.g_id_offset,
  p_column_name => 'APELLIDO2');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_help_text => 'Texto libre.'||chr(10)||
'',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161523476055769901 + wwv_flow_api.g_id_offset,
  p_table_id => 161522983013769901 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id jefe de proyecto',
  p_help_text => 'Alias asignado al jefe de proyecto.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161523037506769901 + wwv_flow_api.g_id_offset,
  p_table_id => 161522983013769901 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_JP');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Nombre',
  p_help_text => 'Nombre completo.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161523109635769901 + wwv_flow_api.g_id_offset,
  p_table_id => 161522983013769901 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOMBRE');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'LINEAS_FACTURA');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161523512539770710 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'LINEAS_FACTURA',
  p_report_region_title => 'Líneas de la factura',
  p_form_region_title => 'Líneas de la factura');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Concepto',
  p_help_text => 'Concepto presupuestario. Tercer nivel de desagreación de la estructura orgánica del presupuesto.'||chr(10)||
'',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161523914620770711 + wwv_flow_api.g_id_offset,
  p_table_id => 161523512539770710 + wwv_flow_api.g_id_offset,
  p_column_name => 'CONCEPTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Importe',
  p_help_text => 'Importe con IVA (euros con máximo dos decimales).'||chr(10)||
'',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161524039500770711 + wwv_flow_api.g_id_offset,
  p_table_id => 161523512539770710 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMPORTE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Número de expediente de gasto',
  p_help_text => 'Número del expediente de gasto (asociado al sistema de tramitación contable).'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161523881331770711 + wwv_flow_api.g_id_offset,
  p_table_id => 161523512539770710 + wwv_flow_api.g_id_offset,
  p_column_name => 'NUM_EXP_GASTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Número de factura',
  p_help_text => 'Identificador único de la factura.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161523760199770711 + wwv_flow_api.g_id_offset,
  p_table_id => 161523512539770710 + wwv_flow_api.g_id_offset,
  p_column_name => 'NUM_FACTURA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Número de línea',
  p_help_text => 'Número de la línea de la factura.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161523673281770711 + wwv_flow_api.g_id_offset,
  p_table_id => 161523512539770710 + wwv_flow_api.g_id_offset,
  p_column_name => 'NUM_LINEA');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'LOTES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161524159575771356 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'LOTES',
  p_report_region_title => 'Lotes',
  p_form_region_title => 'Lotes');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Adjudicado',
  p_help_text => 'El contrato correspondiente ya ha sido firmado por el órgano competente.'||chr(10)||
'',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161525381756771356 + wwv_flow_api.g_id_offset,
  p_table_id => 161524159575771356 + wwv_flow_api.g_id_offset,
  p_column_name => 'ADJUDICADO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_help_text => 'Texto libre.'||chr(10)||
'',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161525867676771357 + wwv_flow_api.g_id_offset,
  p_table_id => 161524159575771356 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Nombre',
  p_help_text => 'Objeto.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161524521194771356 + wwv_flow_api.g_id_offset,
  p_table_id => 161524159575771356 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Expediente Gasto',
  p_help_text => 'Número del expediente de gasto (asociado al sistema de tramitación contable).'||chr(10)||
'',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161524296345771356 + wwv_flow_api.g_id_offset,
  p_table_id => 161524159575771356 + wwv_flow_api.g_id_offset,
  p_column_name => 'EXPEDIENTE_GASTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de fin de la prórroga',
  p_help_text => 'Fecha de finalización de las posibles prórrogas previstas.'||chr(10)||
'',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161525228108771356 + wwv_flow_api.g_id_offset,
  p_table_id => 161524159575771356 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_FIN_PRORROGA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de publicación de la formalización',
  p_help_text => 'Fecha de publicación de la formalización en el boletín correspondiente (BOE, plataforma de contratación, …)'||chr(10)||
'',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161525519823771356 + wwv_flow_api.g_id_offset,
  p_table_id => 161524159575771356 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_PUB_FORM');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de fin de la ejecucion',
  p_help_text => 'Fecha de finalización del contrato de principal (excluyendo las posibles prórrogas).'||chr(10)||
'',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161525003262771356 + wwv_flow_api.g_id_offset,
  p_table_id => 161524159575771356 + wwv_flow_api.g_id_offset,
  p_column_name => 'FIN_EJECUCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de fin del lote',
  p_help_text => 'Fecha de finalización del lote (excluyendo las posibles prórrogas).'||chr(10)||
'',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161524953643771356 + wwv_flow_api.g_id_offset,
  p_table_id => 161524159575771356 + wwv_flow_api.g_id_offset,
  p_column_name => 'FIN_LOTE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id jefe de proyecto',
  p_help_text => 'Alias asignado al jefe de proyecto.'||chr(10)||
'',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161524698654771356 + wwv_flow_api.g_id_offset,
  p_table_id => 161524159575771356 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_JP');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id proveedor',
  p_help_text => 'Identificador único asociado a la empresa o UTE.'||chr(10)||
'',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161525452023771356 + wwv_flow_api.g_id_offset,
  p_table_id => 161524159575771356 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_PROVEEDOR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id tramitador',
  p_help_text => 'Alias del reponsable de la tramitación.'||chr(10)||
'',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161524710496771356 + wwv_flow_api.g_id_offset,
  p_table_id => 161524159575771356 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_TRAMITADOR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Identificador IGAE',
  p_help_text => 'Identificador único asignado por la IGAE.'||chr(10)||
'',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161525618651771356 + wwv_flow_api.g_id_offset,
  p_table_id => 161524159575771356 + wwv_flow_api.g_id_offset,
  p_column_name => 'IND_IGAE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de inicio del lote',
  p_help_text => 'Día de inicio del contrato (según formalización).'||chr(10)||
'',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161524851410771356 + wwv_flow_api.g_id_offset,
  p_table_id => 161524159575771356 + wwv_flow_api.g_id_offset,
  p_column_name => 'INICIO_LOTE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Número de lote',
  p_help_text => 'Número de lote según el PCAP.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161524455980771356 + wwv_flow_api.g_id_offset,
  p_table_id => 161524159575771356 + wwv_flow_api.g_id_offset,
  p_column_name => 'NUM_LOTE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plan pagos comunicado',
  p_help_text => 'Indicador de que el plan de pagos ya ha sido comunicado al proveedor.'||chr(10)||
'',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161525761028771357 + wwv_flow_api.g_id_offset,
  p_table_id => 161524159575771356 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLAN_PAGOS_COMUNIC');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prórroga',
  p_help_text => 'Indicador de prórroga.'||chr(10)||
'',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161525121328771356 + wwv_flow_api.g_id_offset,
  p_table_id => 161524159575771356 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRORROGA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'UA',
  p_help_text => 'Identificador único del expediente de contratación.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161524310279771356 + wwv_flow_api.g_id_offset,
  p_table_id => 161524159575771356 + wwv_flow_api.g_id_offset,
  p_column_name => 'UA');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'MODELOS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161527481987772862 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'MODELOS',
  p_report_region_title => 'Modelos',
  p_form_region_title => 'Modelos');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación del modelo.'||chr(10)||
'',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161527812674772863 + wwv_flow_api.g_id_offset,
  p_table_id => 161527481987772862 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id Modelo',
  p_help_text => 'Identificador único asignado al modelo.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161527569993772863 + wwv_flow_api.g_id_offset,
  p_table_id => 161527481987772862 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_MODELO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Nombre',
  p_help_text => 'Denominación del modelo.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161527604459772863 + wwv_flow_api.g_id_offset,
  p_table_id => 161527481987772862 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOMBRE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo de modelo',
  p_help_text => 'Tipo de modelo de documentación.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161527793642772863 + wwv_flow_api.g_id_offset,
  p_table_id => 161527481987772862 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_MODELO');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'MODIFICACIONES_PRESUPUESTO');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161525984174772081 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'MODIFICACIONES_PRESUPUESTO',
  p_report_region_title => 'Modificaciones presupuestarias',
  p_form_region_title => 'Modificaciones presupuestarias');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Activo',
  p_help_text => 'Señaliza que la modificación presupuestaria ya ha sido aprobada por el órgano competente y es activa.'||chr(10)||
'',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161526654792772082 + wwv_flow_api.g_id_offset,
  p_table_id => 161525984174772081 + wwv_flow_api.g_id_offset,
  p_column_name => 'ACTIVO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Año',
  p_help_text => 'Año (formato numérico con todos sus dígitos).'||chr(10)||
'',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161526544838772082 + wwv_flow_api.g_id_offset,
  p_table_id => 161525984174772081 + wwv_flow_api.g_id_offset,
  p_column_name => 'ANO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_help_text => 'Texto libre.'||chr(10)||
'',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161527314485772082 + wwv_flow_api.g_id_offset,
  p_table_id => 161525984174772081 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Concepto',
  p_help_text => 'Concepto presupuestario. Tercer nivel de desagreación de la estructura orgánica del presupuesto.'||chr(10)||
'',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161526422187772082 + wwv_flow_api.g_id_offset,
  p_table_id => 161525984174772081 + wwv_flow_api.g_id_offset,
  p_column_name => 'CONCEPTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Objeto.'||chr(10)||
'',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161527133730772082 + wwv_flow_api.g_id_offset,
  p_table_id => 161525984174772081 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de envío',
  p_help_text => 'Fecha de envío para la tramitación (a Oficina Presupuestaria)'||chr(10)||
'',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161526883644772082 + wwv_flow_api.g_id_offset,
  p_table_id => 161525984174772081 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_ENVIO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Identificador de la modificación',
  p_help_text => 'Identificador único de la modificación presupuestaria.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161526058435772081 + wwv_flow_api.g_id_offset,
  p_table_id => 161525984174772081 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_MODIFICACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Importe',
  p_help_text => 'Importe con IVA (euros con máximo dos decimales).'||chr(10)||
'',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161527003013772082 + wwv_flow_api.g_id_offset,
  p_table_id => 161525984174772081 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMPORTE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Oficina presupuestaria',
  p_help_text => 'Asignación en oficina prespuestaria.'||chr(10)||
'',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161526977585772082 + wwv_flow_api.g_id_offset,
  p_table_id => 161525984174772081 + wwv_flow_api.g_id_offset,
  p_column_name => 'OF_PRESUPUESTARIA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Programa',
  p_help_text => 'Programa presupuestario según denominación PGE.'||chr(10)||
'',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161526377456772082 + wwv_flow_api.g_id_offset,
  p_table_id => 161525984174772081 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROGRAMA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Proyecto de inversión',
  p_help_text => 'Proyecto de inversión presupuestario según PGE.'||chr(10)||
'',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161527292242772082 + wwv_flow_api.g_id_offset,
  p_table_id => 161525984174772081 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROYECTO_INVERSION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Sección',
  p_help_text => 'Sección presupuestaria. Primer nivel de desagreación de la estructura orgánica del presupuesto.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161526110382772081 + wwv_flow_api.g_id_offset,
  p_table_id => 161525984174772081 + wwv_flow_api.g_id_offset,
  p_column_name => 'SECCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Servicio',
  p_help_text => 'Servicio presupuestario. Segundo nivel de desagreación de la estructura orgánica del presupuesto.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161526287053772082 + wwv_flow_api.g_id_offset,
  p_table_id => 161525984174772081 + wwv_flow_api.g_id_offset,
  p_column_name => 'SERVICIO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo de modificación presupuestaria',
  p_help_text => 'Tipo de modificación presupuestaría.'||chr(10)||
'',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161526776115772082 + wwv_flow_api.g_id_offset,
  p_table_id => 161525984174772081 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_MODIFICACION_PRESUPUESTO');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'OFERTAS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161527965497773577 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'OFERTAS',
  p_report_region_title => 'Ofertas',
  p_form_region_title => 'Ofertas');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Character Set Column',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 40,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161528915528773577 + wwv_flow_api.g_id_offset,
  p_table_id => 161527965497773577 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHARACTER_SET_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_help_text => 'Texto libre.'||chr(10)||
'',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161528593339773577 + wwv_flow_api.g_id_offset,
  p_table_id => 161527965497773577 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Documentación',
  p_help_text => 'Solo se permite un fichero. En caso de múltiples ficheros se debe utilizar un formato de compresión.'||chr(10)||
'',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_FILE',
  p_form_attribute_01 => 'DB_COLUMN',
  p_form_attribute_06 => 'Y',
  p_form_attribute_08 => 'attachment',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161528404438773577 + wwv_flow_api.g_id_offset,
  p_table_id => 161527965497773577 + wwv_flow_api.g_id_offset,
  p_column_name => 'DOCUMENTACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Filename Column',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161528733952773577 + wwv_flow_api.g_id_offset,
  p_table_id => 161527965497773577 + wwv_flow_api.g_id_offset,
  p_column_name => 'FILENAME_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Identificación del ofertante',
  p_help_text => 'Identificador único asignado a la empresa o UTE ofertante.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161528229573773577 + wwv_flow_api.g_id_offset,
  p_table_id => 161527965497773577 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_OFERTANTE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Importe',
  p_help_text => 'Importe con IVA (euros con máximo dos decimales).',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161528303879773577 + wwv_flow_api.g_id_offset,
  p_table_id => 161527965497773577 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMPORTE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Last Updated Column',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161528830531773577 + wwv_flow_api.g_id_offset,
  p_table_id => 161527965497773577 + wwv_flow_api.g_id_offset,
  p_column_name => 'LAST_UPDATED_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Mime Type Column',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161528678640773577 + wwv_flow_api.g_id_offset,
  p_table_id => 161527965497773577 + wwv_flow_api.g_id_offset,
  p_column_name => 'MIME_TYPE_COLUMN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Número de lote',
  p_help_text => 'Número de lote según el PCAP.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161528165304773577 + wwv_flow_api.g_id_offset,
  p_table_id => 161527965497773577 + wwv_flow_api.g_id_offset,
  p_column_name => 'NUM_LOTE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'UA',
  p_help_text => 'Identificador único del expediente de contratación.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161528056426773577 + wwv_flow_api.g_id_offset,
  p_table_id => 161527965497773577 + wwv_flow_api.g_id_offset,
  p_column_name => 'UA');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'ORGANISMOS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161529032804774202 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'ORGANISMOS',
  p_report_region_title => 'Organismos administrativos',
  p_form_region_title => 'Organismos administrativos');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_help_text => 'Texto libre.'||chr(10)||
'',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161530393746774203 + wwv_flow_api.g_id_offset,
  p_table_id => 161529032804774202 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Contacto',
  p_help_text => 'Nombre y apellidos de la persona de contacto.'||chr(10)||
'',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161529451687774203 + wwv_flow_api.g_id_offset,
  p_table_id => 161529032804774202 + wwv_flow_api.g_id_offset,
  p_column_name => 'CONTACTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'CP',
  p_help_text => 'Código postal'||chr(10)||
'',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161529990550774203 + wwv_flow_api.g_id_offset,
  p_table_id => 161529032804774202 + wwv_flow_api.g_id_offset,
  p_column_name => 'CP');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Dirección',
  p_help_text => 'Dirección postal.'||chr(10)||
'',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161529843641774203 + wwv_flow_api.g_id_offset,
  p_table_id => 161529032804774202 + wwv_flow_api.g_id_offset,
  p_column_name => 'DIRECCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Email',
  p_help_text => 'Email de la persona de contacto para comunicaciones.'||chr(10)||
'',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 250,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161529536625774203 + wwv_flow_api.g_id_offset,
  p_table_id => 161529032804774202 + wwv_flow_api.g_id_offset,
  p_column_name => 'EMAIL');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fax',
  p_help_text => 'Número de fax de la entidad.'||chr(10)||
'',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161530250434774203 + wwv_flow_api.g_id_offset,
  p_table_id => 161529032804774202 + wwv_flow_api.g_id_offset,
  p_column_name => 'FAX');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id organismo',
  p_help_text => 'Identificador único asociado al organismo.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161529181760774202 + wwv_flow_api.g_id_offset,
  p_table_id => 161529032804774202 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_ORGANISMO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'NIF',
  p_help_text => 'Número de identificación fiscal.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161529265939774202 + wwv_flow_api.g_id_offset,
  p_table_id => 161529032804774202 + wwv_flow_api.g_id_offset,
  p_column_name => 'NIF');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Nombre del organismo',
  p_help_text => 'Nombre del órgano u organismo.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161529361339774203 + wwv_flow_api.g_id_offset,
  p_table_id => 161529032804774202 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOMBRE_ORGANISMO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Población',
  p_help_text => 'Texto libre para indicar la localidad.'||chr(10)||
'',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161530004341774203 + wwv_flow_api.g_id_offset,
  p_table_id => 161529032804774202 + wwv_flow_api.g_id_offset,
  p_column_name => 'POBLACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Provincia',
  p_help_text => 'Provincia.'||chr(10)||
'',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161530143712774203 + wwv_flow_api.g_id_offset,
  p_table_id => 161529032804774202 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROVINCIA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Teléfono 1',
  p_help_text => 'Teléfono de contacto principal.'||chr(10)||
'',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161529642647774203 + wwv_flow_api.g_id_offset,
  p_table_id => 161529032804774202 + wwv_flow_api.g_id_offset,
  p_column_name => 'TELEFONO1');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Teléfono 2',
  p_help_text => 'Teléfono de contacto secundario.'||chr(10)||
'',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161529757909774203 + wwv_flow_api.g_id_offset,
  p_table_id => 161529032804774202 + wwv_flow_api.g_id_offset,
  p_column_name => 'TELEFONO2');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'ORGANOS_CONTRATACION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161530447631774912 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'ORGANOS_CONTRATACION',
  p_report_region_title => 'Órganos de contratación',
  p_form_region_title => 'Órganos de contratación');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Alias del órgano contratación',
  p_help_text => 'Alias del órgano de contratación competente.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161530525121774912 + wwv_flow_api.g_id_offset,
  p_table_id => 161530447631774912 + wwv_flow_api.g_id_offset,
  p_column_name => 'ALIAS_ORGANO_CONTRATACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Nombre',
  p_help_text => 'Nombre del órgano u organismo.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161530610788774912 + wwv_flow_api.g_id_offset,
  p_table_id => 161530447631774912 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOMBRE');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'PAGOS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161530735741775666 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'PAGOS',
  p_report_region_title => 'Pagos',
  p_form_region_title => 'Pagos');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Objeto.'||chr(10)||
'',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161531236741775666 + wwv_flow_api.g_id_offset,
  p_table_id => 161530735741775666 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de fin de la liquidación',
  p_help_text => 'Fecha de finalización del periodo de liquidación correspondiente.'||chr(10)||
'',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161531105576775666 + wwv_flow_api.g_id_offset,
  p_table_id => 161530735741775666 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_FIN_LIQUIDACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de inicio de la liquidación',
  p_help_text => 'Fecha de inicio del periodo correspondiente a la liquidación realizada'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161531049270775666 + wwv_flow_api.g_id_offset,
  p_table_id => 161530735741775666 + wwv_flow_api.g_id_offset,
  p_column_name => 'FECHA_INICIO_LIQUIDACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id generador de pago',
  p_help_text => 'Identificador único asociado al instrumento de generación de pagos (convenio, acuerdo, …)'||chr(10)||
'',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161531436685775666 + wwv_flow_api.g_id_offset,
  p_table_id => 161530735741775666 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_GENERADOR_PAG');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Identificador de la modificación',
  p_help_text => 'Identificador único de la modificación presupuestaria.'||chr(10)||
'',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161531382209775666 + wwv_flow_api.g_id_offset,
  p_table_id => 161530735741775666 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_MODIFICACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id pago',
  p_help_text => 'Identificador único asociado al pago.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161530822897775666 + wwv_flow_api.g_id_offset,
  p_table_id => 161530735741775666 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_PAGO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Importe',
  p_help_text => 'Importe con IVA (euros con máximo dos decimales).'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161530928643775666 + wwv_flow_api.g_id_offset,
  p_table_id => 161530735741775666 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMPORTE');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'PREVISIONES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'PREVISIONES',
  p_report_region_title => 'Previsiones',
  p_form_region_title => 'Previsiones');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Link',
  p_help_text => 'Ámbito funcional al que se puede atribuir una previsión (Link).'||chr(10)||
'',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161532460825776351 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'ALIAS_FUNCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Alias de la unidad proponente',
  p_help_text => 'Alias de la unidad proponente del expediente de contratación.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161531709274776350 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'ALIAS_UNIDAD_PROPONENTE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Aprobado',
  p_help_text => 'Aprobado por parte de la dirección.'||chr(10)||
'',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161532078488776350 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'APROBADO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_help_text => 'Texto libre.'||chr(10)||
'',
  p_display_seq_form => 19,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 19,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161533491132776351 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Estado de la previsión',
  p_help_text => 'Descripción de la situación de la previsión.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161531815920776350 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'ESTADO_PREVISION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de fin previsto',
  p_help_text => 'Fecha de finalización del contrato de principal (excluyendo las posibles prórrogas).'||chr(10)||
'',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161532830937776351 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'FIN_PREVISTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id del jefe de proyecto',
  p_help_text => 'Alias asignado al jefe de proyecto.'||chr(10)||
'',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161532300588776350 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_JP');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fecha de inicio previsto',
  p_help_text => 'Día de inicio del contrato (prevista a la formalización).'||chr(10)||
'',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161532774225776351 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'INICIO_PREVISTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Nombre',
  p_help_text => 'Objeto.'||chr(10)||
'',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161532161088776350 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOMBRE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prioridad',
  p_help_text => 'Indicador número de prioridad (número entero).'||chr(10)||
'',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161532501713776351 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRIORIDAD');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Procedimiento de contratación',
  p_help_text => 'Denominación del procedimiento de contratación.'||chr(10)||
'',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161532250105776350 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROC_CONTRATACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prórroga',
  p_help_text => 'Indicador de prórroga.'||chr(10)||
'',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161533047292776351 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRORROGA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Proyecto',
  p_help_text => 'Tipificación del proyecto.'||chr(10)||
'',
  p_display_seq_form => 20,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 20,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 3,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161533530550776351 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROYECTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Pendiente aprobación',
  p_help_text => 'Pendiente de aprobación por parte de la dirección.'||chr(10)||
'',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161531900648776350 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'PTE_APROBACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Recurrente',
  p_help_text => 'Indicador de recurrencia (incluir siguientes etiquetas recurrente, puntual, SP subsecuente que proceda, pendiente, ...)'||chr(10)||
'',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161533109940776351 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECURRENTE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Resumen',
  p_help_text => 'Texto libre descriptivo del objeto de la previsión.'||chr(10)||
'',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161532653596776351 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'RESUMEN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'SP',
  p_help_text => 'Número de previsión.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161531607043776350 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'SP');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'SP subsecuente',
  p_help_text => 'Identificador del SP del Expediente Subsecuente'||chr(10)||
'',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161533242498776351 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'SP_SUBSECUENTE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo de contratación',
  p_help_text => 'Tipo según definición LCSP.'||chr(10)||
'',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 25,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161532991230776351 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_CONTRATACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo de tramitación',
  p_help_text => 'Tipo de tramitación del expediente.'||chr(10)||
'',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161533365919776351 + wwv_flow_api.g_id_offset,
  p_table_id => 161531566899776350 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_TRAMITACION');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'PRIORIDADES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161533689858777069 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'PRIORIDADES',
  p_report_region_title => 'Prioridades',
  p_form_region_title => 'Prioridades');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación de la prioridad.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161533805621777069 + wwv_flow_api.g_id_offset,
  p_table_id => 161533689858777069 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prioridad',
  p_help_text => 'Indicador número de prioridad (número entero).'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161533720126777069 + wwv_flow_api.g_id_offset,
  p_table_id => 161533689858777069 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRIORIDAD');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'PROCEDIMIENTOS_CONTRATACION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161533960390777796 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'PROCEDIMIENTOS_CONTRATACION',
  p_report_region_title => 'Procedimientos de contratación',
  p_form_region_title => 'Procedimientos de contratación');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación legal.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 400,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161534154450777796 + wwv_flow_api.g_id_offset,
  p_table_id => 161533960390777796 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Procedimiento de contratación',
  p_help_text => 'Denominación del procedimiento de contratación.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161534065373777796 + wwv_flow_api.g_id_offset,
  p_table_id => 161533960390777796 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROC_CONTRATACION');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'PROGRAMAS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161534200540778431 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'PROGRAMAS',
  p_report_region_title => 'Programas presupuestarios',
  p_form_region_title => 'Programas presupuestarios');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación legal.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 2000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161534590555778431 + wwv_flow_api.g_id_offset,
  p_table_id => 161534200540778431 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Nombre del programa',
  p_help_text => 'Denominación legal según PGE.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161534488483778431 + wwv_flow_api.g_id_offset,
  p_table_id => 161534200540778431 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOMBRE_PROGRAMA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Programa',
  p_help_text => 'Programa presupuestario según denominación PGE.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161534321509778431 + wwv_flow_api.g_id_offset,
  p_table_id => 161534200540778431 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROGRAMA');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'PROVEEDORES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161507428238759605 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'PROVEEDORES',
  p_report_region_title => 'Proveedores',
  p_form_region_title => 'Proveedores');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comentarios',
  p_help_text => 'Texto libre.'||chr(10)||
'',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161508795486759606 + wwv_flow_api.g_id_offset,
  p_table_id => 161507428238759605 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMENTARIOS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Contacto',
  p_help_text => 'Nombre y apellidos de la persona de contacto.'||chr(10)||
'',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161507860926759605 + wwv_flow_api.g_id_offset,
  p_table_id => 161507428238759605 + wwv_flow_api.g_id_offset,
  p_column_name => 'CONTACTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'CP',
  p_help_text => 'Código postal'||chr(10)||
'',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161508373643759606 + wwv_flow_api.g_id_offset,
  p_table_id => 161507428238759605 + wwv_flow_api.g_id_offset,
  p_column_name => 'CP');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Dirección',
  p_help_text => 'Dirección postal.'||chr(10)||
'',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161508284082759606 + wwv_flow_api.g_id_offset,
  p_table_id => 161507428238759605 + wwv_flow_api.g_id_offset,
  p_column_name => 'DIRECCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Email',
  p_help_text => 'Email de la persona de contacto para comunicaciones.'||chr(10)||
'',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161507910217759605 + wwv_flow_api.g_id_offset,
  p_table_id => 161507428238759605 + wwv_flow_api.g_id_offset,
  p_column_name => 'EMAIL');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fax',
  p_help_text => 'Número de fax de la entidad.'||chr(10)||
'',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161508689736759606 + wwv_flow_api.g_id_offset,
  p_table_id => 161507428238759605 + wwv_flow_api.g_id_offset,
  p_column_name => 'FAX');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id proveedor',
  p_help_text => 'Identificador único asociado a la empresa o UTE.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161507548573759605 + wwv_flow_api.g_id_offset,
  p_table_id => 161507428238759605 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_PROVEEDOR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'NIF',
  p_help_text => 'Número de identificación fiscal.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161507658140759605 + wwv_flow_api.g_id_offset,
  p_table_id => 161507428238759605 + wwv_flow_api.g_id_offset,
  p_column_name => 'NIF');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Denominación social',
  p_help_text => 'Razón social completa.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161507797322759605 + wwv_flow_api.g_id_offset,
  p_table_id => 161507428238759605 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOMBRE_PROVEEDOR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Población',
  p_help_text => 'Texto libre para indicar la localidad.'||chr(10)||
'',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161508485739759606 + wwv_flow_api.g_id_offset,
  p_table_id => 161507428238759605 + wwv_flow_api.g_id_offset,
  p_column_name => 'POBLACION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Provincia',
  p_help_text => 'Provincia.'||chr(10)||
'',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161508556636759606 + wwv_flow_api.g_id_offset,
  p_table_id => 161507428238759605 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROVINCIA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Teléfono 1',
  p_help_text => 'Teléfono de contacto principal.'||chr(10)||
'',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161508044592759606 + wwv_flow_api.g_id_offset,
  p_table_id => 161507428238759605 + wwv_flow_api.g_id_offset,
  p_column_name => 'TELEFONO1');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Teléfono 2',
  p_help_text => 'Teléfono de contacto secundario.',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161508125850759606 + wwv_flow_api.g_id_offset,
  p_table_id => 161507428238759605 + wwv_flow_api.g_id_offset,
  p_column_name => 'TELEFONO2');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'PROYECTOS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161507057829758869 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'PROYECTOS',
  p_report_region_title => 'Proyectos',
  p_form_region_title => 'Proyectos');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Descripción detallada del proyecto.',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161507384422758869 + wwv_flow_api.g_id_offset,
  p_table_id => 161507057829758869 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Nombre',
  p_help_text => 'Denominación del proyecto.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161507279349758869 + wwv_flow_api.g_id_offset,
  p_table_id => 161507057829758869 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOMBRE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Proyecto',
  p_help_text => 'Tipificación del proyecto.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 3,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161507157077758869 + wwv_flow_api.g_id_offset,
  p_table_id => 161507057829758869 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROYECTO');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'PROYECTOS_INVERSION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161506437131758165 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'PROYECTOS_INVERSION',
  p_report_region_title => 'Proyectos de inversión presupuestarios',
  p_form_region_title => 'Proyectos de inversión presupuestarios');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación legal.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161506653836758165 + wwv_flow_api.g_id_offset,
  p_table_id => 161506437131758165 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Programa',
  p_help_text => 'Programa presupuestario según denominación PGE.'||chr(10)||
'',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161506947771758165 + wwv_flow_api.g_id_offset,
  p_table_id => 161506437131758165 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROGRAMA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Proyecto de inversión',
  p_help_text => 'Proyecto de inversión presupuestario según PGE.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 40,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161506508131758165 + wwv_flow_api.g_id_offset,
  p_table_id => 161506437131758165 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROYECTO_INVERSION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Sección',
  p_help_text => 'Sección presupuestaria. Primer nivel de desagreación de la estructura orgánica del presupuesto.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161506792634758165 + wwv_flow_api.g_id_offset,
  p_table_id => 161506437131758165 + wwv_flow_api.g_id_offset,
  p_column_name => 'SECCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Servicio',
  p_help_text => 'Servicio presupuestario. Segundo nivel de desagreación de la estructura orgánica del presupuesto.'||chr(10)||
'',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161506831249758165 + wwv_flow_api.g_id_offset,
  p_table_id => 161506437131758165 + wwv_flow_api.g_id_offset,
  p_column_name => 'SERVICIO');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'RESERVAS_CAJAFIJA');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161505465492757570 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'RESERVAS_CAJAFIJA',
  p_report_region_title => 'Reservas Cajafija',
  p_form_region_title => 'Reservas Cajafija');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Año',
  p_help_text => 'Año (formato numérico con todos sus dígitos).'||chr(10)||
'',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161506069514757572 + wwv_flow_api.g_id_offset,
  p_table_id => 161505465492757570 + wwv_flow_api.g_id_offset,
  p_column_name => 'ANO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Concepto',
  p_help_text => 'Concepto presupuestario. Tercer nivel de desagreación de la estructura orgánica del presupuesto.'||chr(10)||
'',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161505918539757572 + wwv_flow_api.g_id_offset,
  p_table_id => 161505465492757570 + wwv_flow_api.g_id_offset,
  p_column_name => 'CONCEPTO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id reservas caja fija',
  p_help_text => 'Identificador de la reserva de caja fija.',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161505597139757570 + wwv_flow_api.g_id_offset,
  p_table_id => 161505465492757570 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_RESERVAS_CAJAFIJA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Importe',
  p_help_text => 'Importe con IVA (euros con máximo dos decimales).'||chr(10)||
'',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161506293870757572 + wwv_flow_api.g_id_offset,
  p_table_id => 161505465492757570 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMPORTE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Programa',
  p_help_text => 'Programa presupuestario según denominación PGE.'||chr(10)||
'',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161505872843757572 + wwv_flow_api.g_id_offset,
  p_table_id => 161505465492757570 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROGRAMA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Sección',
  p_help_text => 'Sección presupuestaria. Primer nivel de desagreación de la estructura orgánica del presupuesto.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161505673531757571 + wwv_flow_api.g_id_offset,
  p_table_id => 161505465492757570 + wwv_flow_api.g_id_offset,
  p_column_name => 'SECCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Servicio',
  p_help_text => 'Servicio presupuestario. Segundo nivel de desagreación de la estructura orgánica del presupuesto.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161505738489757572 + wwv_flow_api.g_id_offset,
  p_table_id => 161505465492757570 + wwv_flow_api.g_id_offset,
  p_column_name => 'SERVICIO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'UDSGAF',
  p_help_text => 'Unidad finaciera.'||chr(10)||
'',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161506339130757572 + wwv_flow_api.g_id_offset,
  p_table_id => 161505465492757570 + wwv_flow_api.g_id_offset,
  p_column_name => 'UDSGAF');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Vinculante',
  p_help_text => 'Nivel vinculante. Vinculación presupuestaria asociada según PGE.'||chr(10)||
'',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161506145632757572 + wwv_flow_api.g_id_offset,
  p_table_id => 161505465492757570 + wwv_flow_api.g_id_offset,
  p_column_name => 'VINCULANTE');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'SECCIONES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161505195047756943 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'SECCIONES',
  p_report_region_title => 'Secciones',
  p_form_region_title => 'Secciones');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Nombre de la sección presupuestaria',
  p_help_text => 'Denominación legal según PGE.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161505327651756943 + wwv_flow_api.g_id_offset,
  p_table_id => 161505195047756943 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOMBRE_SECCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Sección',
  p_help_text => 'Sección presupuestaria. Primer nivel de desagreación de la estructura orgánica del presupuesto.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161505266285756943 + wwv_flow_api.g_id_offset,
  p_table_id => 161505195047756943 + wwv_flow_api.g_id_offset,
  p_column_name => 'SECCION');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'SERVICIOS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161504787962756273 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'SERVICIOS',
  p_report_region_title => 'Servicios',
  p_form_region_title => 'Servicios');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Nombre del servicio',
  p_help_text => 'Denominación legal según PGE.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161505013502756273 + wwv_flow_api.g_id_offset,
  p_table_id => 161504787962756273 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOMBRE_SERVICIO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Sección',
  p_help_text => 'Sección presupuestaria. Primer nivel de desagreación de la estructura orgánica del presupuesto.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161504871144756273 + wwv_flow_api.g_id_offset,
  p_table_id => 161504787962756273 + wwv_flow_api.g_id_offset,
  p_column_name => 'SECCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Servicio',
  p_help_text => 'Servicio presupuestario. Segundo nivel de desagreación de la estructura orgánica del presupuesto.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 4,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161504913048756273 + wwv_flow_api.g_id_offset,
  p_table_id => 161504787962756273 + wwv_flow_api.g_id_offset,
  p_column_name => 'SERVICIO');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'SISTEMAS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161504437789755408 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'SISTEMAS',
  p_report_region_title => 'Sistemas',
  p_form_region_title => 'Sistemas');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación del sistema.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161504618302755408 + wwv_flow_api.g_id_offset,
  p_table_id => 161504437789755408 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Sistema',
  p_help_text => 'Sistema tecnológico objeto del convenio/acuerdo/...'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161504567183755408 + wwv_flow_api.g_id_offset,
  p_table_id => 161504437789755408 + wwv_flow_api.g_id_offset,
  p_column_name => 'SISTEMA');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'TIPOS_ATRIBUTO_PREVISION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161504064227754851 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'TIPOS_ATRIBUTO_PREVISION',
  p_report_region_title => 'Tipos Atributo Prevision',
  p_form_region_title => 'Tipos Atributo Prevision');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Activo',
  p_help_text => 'Señaliza que este atributo está en uso y puede ser seleccionable.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161504373722754851 + wwv_flow_api.g_id_offset,
  p_table_id => 161504064227754851 + wwv_flow_api.g_id_offset,
  p_column_name => 'ACTIVO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación del tipo.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161504240374754851 + wwv_flow_api.g_id_offset,
  p_table_id => 161504064227754851 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo de atributo de la previsión',
  p_help_text => 'Tipo de atributo de la previsión.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161504187660754851 + wwv_flow_api.g_id_offset,
  p_table_id => 161504064227754851 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_ATRIBUTO_PREVISION');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'TIPOS_CONTRATACION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161503718078754344 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'TIPOS_CONTRATACION',
  p_report_region_title => 'Tipos Contratacion',
  p_form_region_title => 'Tipos Contratacion');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación del tipo.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161503920622754345 + wwv_flow_api.g_id_offset,
  p_table_id => 161503718078754344 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo de contratación',
  p_help_text => 'Tipo según definición LCSP.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 25,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161503899370754345 + wwv_flow_api.g_id_offset,
  p_table_id => 161503718078754344 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_CONTRATACION');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'TIPOS_DOCUMENTO_FACTURACION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161503458209729964 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'TIPOS_DOCUMENTO_FACTURACION',
  p_report_region_title => 'Tipos Documento Facturacion',
  p_form_region_title => 'Tipos Documento Facturacion');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación del tipo.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161503682028729964 + wwv_flow_api.g_id_offset,
  p_table_id => 161503458209729964 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo de documento de facturación',
  p_help_text => 'Tipo de documento de facturación.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161503575011729964 + wwv_flow_api.g_id_offset,
  p_table_id => 161503458209729964 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_DOCUMENTO_FACTURACION');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'TIPOS_DOC_CONT');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161534666094779657 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'TIPOS_DOC_CONT',
  p_report_region_title => 'Tipos Doc Cont',
  p_form_region_title => 'Tipos Doc Cont');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación del tipo.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161534884195779657 + wwv_flow_api.g_id_offset,
  p_table_id => 161534666094779657 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo de documento de contratación',
  p_help_text => 'Tipo de documento de contratación.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161534785286779657 + wwv_flow_api.g_id_offset,
  p_table_id => 161534666094779657 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_DOC_CONT');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'TIPOS_DOC_ENVIO');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161534918086779998 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'TIPOS_DOC_ENVIO',
  p_report_region_title => 'Tipos Doc Envio',
  p_form_region_title => 'Tipos Doc Envio');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación del tipo.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161535167841779998 + wwv_flow_api.g_id_offset,
  p_table_id => 161534918086779998 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo de documentación de envío',
  p_help_text => 'Tipo de documento de envío.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161535092103779998 + wwv_flow_api.g_id_offset,
  p_table_id => 161534918086779998 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_DOC_ENVIO');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'TIPOS_EVENTO_CONTRATACION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161535251089780323 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'TIPOS_EVENTO_CONTRATACION',
  p_report_region_title => 'Tipos Evento Contratacion',
  p_form_region_title => 'Tipos Evento Contratacion');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación del tipo.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161535489075780323 + wwv_flow_api.g_id_offset,
  p_table_id => 161535251089780323 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo de evento de contratación',
  p_help_text => 'Tipo de evento de contratación.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161535324780780323 + wwv_flow_api.g_id_offset,
  p_table_id => 161535251089780323 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_EVENTO');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'TIPOS_EVENTO_FACTURACION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161535554874780615 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'TIPOS_EVENTO_FACTURACION',
  p_report_region_title => 'Tipos Evento Facturacion',
  p_form_region_title => 'Tipos Evento Facturacion');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación del tipo.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161535731225780615 + wwv_flow_api.g_id_offset,
  p_table_id => 161535554874780615 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo de evento de facturación',
  p_help_text => 'Tipo de evento de facturación.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161535679419780615 + wwv_flow_api.g_id_offset,
  p_table_id => 161535554874780615 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_EVENTO');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'TIPOS_EVENTO_PLANIFICACION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161535832672781055 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'TIPOS_EVENTO_PLANIFICACION',
  p_report_region_title => 'Tipos Evento Planificacion',
  p_form_region_title => 'Tipos Evento Planificacion');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación del tipo.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161536061688781056 + wwv_flow_api.g_id_offset,
  p_table_id => 161535832672781055 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo de evento de planificación',
  p_help_text => 'Tipo de evento de contratación.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161535960609781056 + wwv_flow_api.g_id_offset,
  p_table_id => 161535832672781055 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_EVENTO');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'TIPOS_LEGAL');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161536180982781363 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'TIPOS_LEGAL',
  p_report_region_title => 'Tipos Legal',
  p_form_region_title => 'Tipos Legal');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación del tipo.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161536325078781363 + wwv_flow_api.g_id_offset,
  p_table_id => 161536180982781363 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo legal',
  p_help_text => 'Tipología de documentación legal.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161536236060781363 + wwv_flow_api.g_id_offset,
  p_table_id => 161536180982781363 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_LEGAL');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'TIPOS_MODELO');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161536416702781675 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'TIPOS_MODELO',
  p_report_region_title => 'Tipos Modelo',
  p_form_region_title => 'Tipos Modelo');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación del tipo.'||chr(10)||
''||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161536701171781676 + wwv_flow_api.g_id_offset,
  p_table_id => 161536416702781675 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Nombre',
  p_help_text => 'Denominación del modelo.'||chr(10)||
''||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161536622399781676 + wwv_flow_api.g_id_offset,
  p_table_id => 161536416702781675 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOMBRE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo de modelo de documentación',
  p_help_text => 'Tipo de modelo de documentación.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161536520017781675 + wwv_flow_api.g_id_offset,
  p_table_id => 161536416702781675 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_MODELO');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'TIPOS_MOD_PRESUP');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161536809787782011 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'TIPOS_MOD_PRESUP',
  p_report_region_title => 'Tipos Mod Presup',
  p_form_region_title => 'Tipos Mod Presup');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación del tipo.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161537027097782011 + wwv_flow_api.g_id_offset,
  p_table_id => 161536809787782011 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo de modificación presupuestaria',
  p_help_text => 'Tipo de modificación presupuestaria.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161536957068782011 + wwv_flow_api.g_id_offset,
  p_table_id => 161536809787782011 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_MOD_PRESUP');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'TIPOS_TRAMITACION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161537109726782360 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'TIPOS_TRAMITACION',
  p_report_region_title => 'Tipos Tramitacion',
  p_form_region_title => 'Tipos Tramitacion');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación del tipo.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161537311635782360 + wwv_flow_api.g_id_offset,
  p_table_id => 161537109726782360 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tipo de tramitación de expediente',
  p_help_text => 'Tipo de tramitación del expediente.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161537212811782360 + wwv_flow_api.g_id_offset,
  p_table_id => 161537109726782360 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIPO_TRAMITACION');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'TRAMITADORES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161537479690783059 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'TRAMITADORES',
  p_report_region_title => 'Tramitadores',
  p_form_region_title => 'Tramitadores');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Primer apellido',
  p_help_text => 'Primer apellido.'||chr(10)||
'',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161537780208783059 + wwv_flow_api.g_id_offset,
  p_table_id => 161537479690783059 + wwv_flow_api.g_id_offset,
  p_column_name => 'APELLIDO1');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Segundo apellido',
  p_help_text => 'Segundo apellido.'||chr(10)||
'',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161537886885783059 + wwv_flow_api.g_id_offset,
  p_table_id => 161537479690783059 + wwv_flow_api.g_id_offset,
  p_column_name => 'APELLIDO2');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id tramitador',
  p_help_text => 'Alias del reponsable de la tramitación.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 6,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161537589072783059 + wwv_flow_api.g_id_offset,
  p_table_id => 161537479690783059 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID_TRAMITADOR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Nombre',
  p_help_text => 'Nombre completo.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161537608783783059 + wwv_flow_api.g_id_offset,
  p_table_id => 161537479690783059 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOMBRE');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'UNIDADES_PROPONENTES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161537911430783461 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'UNIDADES_PROPONENTES',
  p_report_region_title => 'Unidades Proponentes',
  p_form_region_title => 'Unidades Proponentes');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Alias de la unidad proponente',
  p_help_text => 'Alias de la unidad proponente del expediente de contratación.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161538027460783461 + wwv_flow_api.g_id_offset,
  p_table_id => 161537911430783461 + wwv_flow_api.g_id_offset,
  p_column_name => 'ALIAS_UNIDAD');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Nombre de la unidad proponente',
  p_help_text => 'Nombre del órgano u organismo.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161538115638783461 + wwv_flow_api.g_id_offset,
  p_table_id => 161537911430783461 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOMBRE_UNIDAD');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'UNIDADES_SFAF');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161538224050783953 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'UNIDADES_SFAF',
  p_report_region_title => 'Unidades Sfaf',
  p_form_region_title => 'Unidades Sfaf');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación de la unidad.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161538465565783954 + wwv_flow_api.g_id_offset,
  p_table_id => 161538224050783953 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Unidad SGAF',
  p_help_text => 'Unidad finaciera.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161538337490783954 + wwv_flow_api.g_id_offset,
  p_table_id => 161538224050783953 + wwv_flow_api.g_id_offset,
  p_column_name => 'UDSGAF');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'VINCULANTES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 161538580347784426 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'VINCULANTES',
  p_report_region_title => 'Vinculantes',
  p_form_region_title => 'Vinculantes');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Descripción',
  p_help_text => 'Denominación legal.'||chr(10)||
'',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 161538793750784427 + wwv_flow_api.g_id_offset,
  p_table_id => 161538580347784426 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPCION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Vinculante',
  p_help_text => 'Nivel vinculante. Vinculación presupuestaria asociada según PGE.'||chr(10)||
'',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 161538665073784427 + wwv_flow_api.g_id_offset,
  p_table_id => 161538580347784426 + wwv_flow_api.g_id_offset,
  p_column_name => 'VINCULANTE');
 
end;
/

commit;
begin 
execute immediate 'alter session set nls_numeric_characters='''||wwv_flow_api.g_nls_numeric_chars||'''';
end;
/
set verify on
set feedback on
prompt  ...done
