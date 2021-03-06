-- Test temp table
CREATE TEMPORARY VIEW desc_col_temp_view (key int COMMENT 'column_comment') USING PARQUET;

DESC desc_col_temp_view key;

DESC EXTENDED desc_col_temp_view key;

DESC FORMATTED desc_col_temp_view key;

-- Describe a column with qualified name
DESC FORMATTED desc_col_temp_view desc_col_temp_view.key;

-- Describe a non-existent column
DESC desc_col_temp_view key1;

-- Test persistent table
CREATE TABLE desc_col_table (key int COMMENT 'column_comment') USING PARQUET;

ANALYZE TABLE desc_col_table COMPUTE STATISTICS FOR COLUMNS key;

DESC desc_col_table key;

DESC EXTENDED desc_col_table key;

DESC FORMATTED desc_col_table key;

-- Test complex columns
CREATE TABLE desc_complex_col_table (`a.b` int, col struct<x:int, y:string>) USING PARQUET;

DESC FORMATTED desc_complex_col_table `a.b`;

DESC FORMATTED desc_complex_col_table col;

-- Describe a nested column
DESC FORMATTED desc_complex_col_table col.x;

DROP VIEW desc_col_temp_view;

DROP TABLE desc_col_table;

DROP TABLE desc_complex_col_table;
