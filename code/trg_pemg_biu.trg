CREATE OR REPLACE TRIGGER trg_pemg_biu
   BEFORE INSERT OR UPDATE ON pre_etl_migration_groups
   FOR EACH ROW
DECLARE
   /*=================================================================================================

       Supporting Trigger For ETL / Migration Utilities For Tabular to Tabular+JSON migration.
       
       Developed by Christian Leigh

       Copyright 2018 IHS Markit

       Licensed under the Apache License, Version 2.0 (the "License");
       you may not use this file except in compliance with the License.
       You may obtain a copy of the License at

           http://www.apache.org/licenses/LICENSE-2.0

       Unless required by applicable law or agreed to in writing, software
       distributed under the License is distributed on an "AS IS" BASIS,
       WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
       See the License for the specific language governing permissions and
       limitations under the License.

     =================================================================================================  
   */
BEGIN
   IF instr(:new.group_name, '_') > 0
   THEN
      raise_application_error(-20000
                             ,'GROUP_NAME should not include an underscore character.');
   END IF;
END trg_pemg_biu;
/
