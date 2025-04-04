# Telecom Data Processing Pipeline

## Overview
This data engineering project processes telecom communication data using SQL Server Integration Services (SSIS). The pipeline handles multiple file formats, performs data cleaning, transformation, and validation, while maintaining robust error handling and comprehensive auditing throughout the ETL process.

## Features
- **Multi-format File Processing**: Reads data from files with multiple extensions
- **Iterative Processing**: Dynamically processes all files in specified directories
- **Data Enrichment**: Joins with reference tables to retrieve subscriber information
- **Data Cleaning**:
  - Handles missing values
  - Processes sparse rows
  - Corrects data type mismatches
- **Data Transformation**: Derives new columns including SNR and TAC values
- **Error Handling**:
  - Redirects rejected rows[According To Requirements File] to a dedicated table
  - Captures source errors in a separate error log table
- **File Management**: 
  - Moves or copies processed files to archive location
  - Flags files as processed
  - Adds audit_id column to processed files for traceability
- **Comprehensive Auditing**:
  - Tracks each file processing event
  - Records detailed metrics about data processing
  - Maintains processing history for reporting and troubleshooting
  - Links processed files to audit records via audit_id

## Technical Architecture
```
Source Files → SSIS Pipeline → SQL Server Database
                    ↓
           Error Management Tables
                    ↓
            Audit Tracking Tables
                    ↓
 Processed Files Archive (with audit_id)
```






## Usage
1. Deploy the SSIS package to SQL Server
2. Execute the package using SQL Server Agent or manually through SSMS
3. Monitor execution through SSMS or custom logging tables
4. Review audit tables for processing metrics and status


## Audit System
The package implements a comprehensive auditing system that tracks:

| Audit Field | Description |
|-------------|-------------|
| Audit ID | Unique identifier for each processing event |
| Batch ID | Identifier for processing batch (multiple files) |
| File Name | Name of the file being processed |
| Rows Extracted | Count of rows read from source file |
| Rows With Errors | Count of rows with source errors |
| Rows Rejected | Count of rows that failed validation rules |
| Rows Inserted | Count of rows successfully loaded to master table |
| Creation Time | Timestamp when processing started |
| Update Time | Timestamp of last status update |
| Success Flag | Indicator if processing completed successfully |

### File-to-Audit Traceability
Each processed file is tagged with the corresponding audit_id, creating a direct link between the physical files and their processing history in the audit table. This enables:

- Tracing each file to its specific processing event
- Identifying which audit record belongs to which physical file
- Maintaining data lineage throughout the system
- Quick troubleshooting by correlating file issues with audit metrics

## Monitoring and Logging
- Package execution logs are stored in SSISDB
- Custom error handling stores rejected rows with error details
- File processing status is tracked in the audit table
- Performance metrics are available through audit table analysis
- File-to-audit mapping enables complete data lineage tracking

## Reporting
The audit table enables several reporting capabilities:
- Processing success rates over time
- Data quality trends by tracking error and rejection rates
- Performance monitoring via processing duration analysis
- Load volume reporting through row count tracking
- Complete file processing history with direct file-to-audit linkage
