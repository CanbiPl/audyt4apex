create or replace PACKAGE BODY AUDYT_PKG 
AS
function LOG_ACTION_VC (
    l_INSERTING in boolean default true,
    l_UPDATING in boolean default false,
    l_DELETING in boolean default false  ) 
RETURN VARCHAR2
IS
BEGIN

  IF l_INSERTING THEN
    RETURN 'I';
  ELSIF l_UPDATING THEN
    RETURN 'U';
  ELSIF l_DELETING THEN
    RETURN 'D';
  END IF;

  RETURN NULL;

END LOG_ACTION_VC;
----------------------------------------------
PROCEDURE CHECK_VAL (
    l_TNAME IN VARCHAR2,
    l_CNAME IN VARCHAR2,
    l_NEW IN VARCHAR2,
    l_OLD IN VARCHAR2,
    l_ROWID IN VARCHAR2,
    l_CID IN NUMBER,
    l_INSERTING in boolean default true,
    l_UPDATING in boolean default false,
    l_DELETING in boolean default false  
)
IS
    V_LOG_ACTION_VC VARCHAR2(1 CHAR);
    v_sql_err_mag varchar2(4000);
    v_params AUDYT_PKG.tab_param;
BEGIN
V_LOG_ACTION_VC :=  LOG_ACTION_VC (l_INSERTING, l_UPDATING, l_DELETING );

    IF ( l_NEW <> l_OLD OR (l_NEW IS NULL AND l_OLD IS NOT NULL) OR (l_NEW IS NOT NULL AND l_OLD IS NULL) ) THEN
        INSERT INTO AP_HISTORIA(ACTION_DATE, ACTION_BY, TABLE_NAME, COLUMN_NAME, OLD_VC, NEW_VC, TAB_ROW_VERSION, PK1,
            ACTION ) 
        VALUES ( SYSDATE, nvl( V('APP_USER'),USER), UPPER(l_TNAME), UPPER(l_CNAME), l_OLD, l_NEW, l_ROWID, l_CID,
           V_LOG_ACTION_VC  ) ;

    END IF;
dbms_output.put_line('CHECK_VAL EXCEPTION OTHERS V_LOG_ACTION_VC='||V_LOG_ACTION_VC);

EXCEPTION
    WHEN OTHERS THEN v_sql_err_mag:=SQLERRM;
            dbms_output.put_line('CHECK_VAL EXCEPTION OTHERS V_LOG_ACTION_VC='||V_LOG_ACTION_VC||', '||v_sql_err_mag);
END;
----------------------------------------------
PROCEDURE CHECK_DATE ( 
    l_TNAME IN VARCHAR2, 
    l_CNAME IN VARCHAR2,
    l_NEW IN DATE, 
    l_OLD IN DATE,
    l_ROWID IN VARCHAR2,
    l_CID IN NUMBER,
    l_INSERTING in boolean default true,
    l_UPDATING in boolean default false,
    l_DELETING in boolean default false   
)
IS
V_LOG_ACTION_VC VARCHAR2(1 CHAR);
BEGIN
V_LOG_ACTION_VC :=  LOG_ACTION_VC (l_INSERTING, l_UPDATING, l_DELETING );

    IF ( l_NEW <> l_OLD OR (l_NEW IS NULL AND l_OLD IS NOT NULL) OR (l_NEW IS NOT NULL AND l_OLD IS NULL) ) THEN
        INSERT INTO AP_HISTORIA(ACTION_DATE, ACTION_BY, TABLE_NAME, COLUMN_NAME, OLD_DATE, NEW_DATE, TAB_ROW_VERSION, PK1,
            ACTION)
        VALUES ( SYSDATE, nvl( V('APP_USER'),USER), UPPER(l_TNAME), UPPER(l_CNAME), TO_CHAR( l_OLD, 'dd-mon-yyyy hh24:mi:ss' ), TO_CHAR( l_NEW, 'dd-mon-yyyy hh24:mi:ss' ), l_ROWID, l_CID,
            V_LOG_ACTION_VC );
    END IF;

EXCEPTION
    WHEN OTHERS THEN 
        NULL;
END;
----------------------------------------------
PROCEDURE CHECK_NUMBER ( 
    l_TNAME IN VARCHAR2, 
    l_CNAME IN VARCHAR2,
    l_NEW IN NUMBER, 
    l_OLD IN NUMBER,
    l_ROWID IN VARCHAR2,
    l_CID IN NUMBER,
    l_INSERTING in boolean default true,
    l_UPDATING in boolean default false,
    l_DELETING in boolean default false   
)
IS
V_LOG_ACTION_VC VARCHAR2(1 CHAR);
BEGIN
V_LOG_ACTION_VC :=  LOG_ACTION_VC (l_INSERTING, l_UPDATING, l_DELETING );

    IF ( l_NEW <> l_OLD OR (l_NEW IS NULL AND l_OLD IS NOT NULL) OR (l_NEW IS NOT NULL AND l_OLD IS NULL) ) THEN
        INSERT INTO AP_HISTORIA(ACTION_DATE, ACTION_BY, TABLE_NAME, COLUMN_NAME, OLD_NUMBER, NEW_NUMBER, TAB_ROW_VERSION, PK1,
            ACTION)
        VALUES ( SYSDATE, nvl( V('APP_USER'),USER), UPPER(l_TNAME), UPPER(l_CNAME), l_OLD, l_NEW, l_ROWID, l_CID,
            V_LOG_ACTION_VC );
    END IF;

EXCEPTION
    WHEN OTHERS THEN 
        NULL;
END;

PROCEDURE CHECK_TIMESTAMP_WITH_TIMEZONE ( 
    l_TNAME IN VARCHAR2, 
    l_CNAME IN VARCHAR2,
    l_NEW IN TIMESTAMP, 
    l_OLD IN TIMESTAMP,
    l_ROWID IN VARCHAR2,
    l_CID IN NUMBER,
    l_INSERTING in boolean default true,
    l_UPDATING in boolean default false,
    l_DELETING in boolean default false   
)
IS
V_LOG_ACTION_VC VARCHAR2(1 CHAR);
BEGIN
V_LOG_ACTION_VC :=  LOG_ACTION_VC (l_INSERTING, l_UPDATING, l_DELETING );

    IF ( l_NEW <> l_OLD OR (l_NEW IS NULL AND l_OLD IS NOT NULL) OR (l_NEW IS NOT NULL AND l_OLD IS NULL) ) THEN
        INSERT INTO AP_HISTORIA(ACTION_DATE, ACTION_BY, TABLE_NAME, COLUMN_NAME, OLD_TSWTZ, NEW_TSWTZ, TAB_ROW_VERSION, PK1,
            ACTION)
        VALUES ( SYSDATE, nvl( V('APP_USER'),USER), UPPER(l_TNAME), UPPER(l_CNAME), TO_CHAR( l_OLD, 'dd-mon-yyyy hh24:mi:ss' ), TO_CHAR( l_NEW, 'dd-mon-yyyy hh24:mi:ss' ), l_ROWID, l_CID,
            V_LOG_ACTION_VC );
    END IF;

EXCEPTION
    WHEN OTHERS THEN 
        NULL;
END;

PROCEDURE CHECK_TIMESTAMP ( 
    l_TNAME IN VARCHAR2, 
    l_CNAME IN VARCHAR2,
    l_NEW IN TIMESTAMP, 
    l_OLD IN TIMESTAMP,
    l_ROWID IN VARCHAR2,
    l_CID IN NUMBER,
    l_INSERTING in boolean default true,
    l_UPDATING in boolean default false,
    l_DELETING in boolean default false   
)
IS
V_LOG_ACTION_VC VARCHAR2(1 CHAR);
BEGIN
V_LOG_ACTION_VC :=  LOG_ACTION_VC (l_INSERTING, l_UPDATING, l_DELETING );

    IF ( l_NEW <> l_OLD OR (l_NEW IS NULL AND l_OLD IS NOT NULL) OR (l_NEW IS NOT NULL AND l_OLD IS NULL) ) THEN
        INSERT INTO AP_HISTORIA(ACTION_DATE, ACTION_BY, TABLE_NAME, COLUMN_NAME, OLD_TS, NEW_TS, TAB_ROW_VERSION, PK1,
            ACTION)
        VALUES ( SYSDATE, nvl( V('APP_USER'),USER), UPPER(l_TNAME), UPPER(l_CNAME), TO_CHAR( l_OLD, 'dd-mon-yyyy hh24:mi:ss' ), TO_CHAR( l_NEW, 'dd-mon-yyyy hh24:mi:ss' ), l_ROWID, l_CID,
            V_LOG_ACTION_VC );
    END IF;

EXCEPTION
    WHEN OTHERS THEN 
        NULL;
END;

PROCEDURE CHECK_TIMESTAMP_WLTZ ( 
    l_TNAME IN VARCHAR2, 
    l_CNAME IN VARCHAR2,
    l_NEW IN TIMESTAMP, 
    l_OLD IN TIMESTAMP,
    l_ROWID IN VARCHAR2,
    l_CID IN NUMBER,
    l_INSERTING in boolean default true,
    l_UPDATING in boolean default false,
    l_DELETING in boolean default false   
)
IS
V_LOG_ACTION_VC VARCHAR2(1 CHAR);
BEGIN
V_LOG_ACTION_VC :=  LOG_ACTION_VC (l_INSERTING, l_UPDATING, l_DELETING );

    IF ( l_NEW <> l_OLD OR (l_NEW IS NULL AND l_OLD IS NOT NULL) OR (l_NEW IS NOT NULL AND l_OLD IS NULL) ) THEN
        INSERT INTO AP_HISTORIA(ACTION_DATE, ACTION_BY, TABLE_NAME, COLUMN_NAME, OLD_TSWLTZ, NEW_TSWLTZ, TAB_ROW_VERSION, PK1,
            ACTION)
        VALUES ( SYSDATE, nvl( V('APP_USER'),USER), UPPER(l_TNAME), UPPER(l_CNAME), TO_CHAR( l_OLD, 'dd-mon-yyyy hh24:mi:ss' ), TO_CHAR( l_NEW, 'dd-mon-yyyy hh24:mi:ss' ), l_ROWID, l_CID,
            V_LOG_ACTION_VC );
    END IF;

EXCEPTION
    WHEN OTHERS THEN 
        NULL;
END;

PROCEDURE CHECK_CLOB ( 
    l_TNAME IN VARCHAR2, 
    l_CNAME IN VARCHAR2,
    l_NEW IN CLOB, 
    l_OLD IN CLOB,
    l_ROWID IN VARCHAR2,
    l_CID IN NUMBER,
    l_INSERTING in boolean default true,
    l_UPDATING in boolean default false,
    l_DELETING in boolean default false   
)
IS
V_LOG_ACTION_VC VARCHAR2(1 CHAR);
BEGIN
V_LOG_ACTION_VC :=  LOG_ACTION_VC (l_INSERTING, l_UPDATING, l_DELETING );

    IF ( l_NEW <> l_OLD OR (l_NEW IS NULL AND l_OLD IS NOT NULL) OR (l_NEW IS NOT NULL AND l_OLD IS NULL) ) THEN
        INSERT INTO AP_HISTORIA(ACTION_DATE, ACTION_BY, TABLE_NAME, COLUMN_NAME, OLD_CLOB, NEW_CLOB, TAB_ROW_VERSION, PK1,
            ACTION)
        VALUES ( SYSDATE, nvl( V('APP_USER'),USER), UPPER(l_TNAME), UPPER(l_CNAME), l_OLD, l_NEW, l_ROWID, l_CID,
            V_LOG_ACTION_VC );
    END IF;

EXCEPTION
    WHEN OTHERS THEN 
        NULL;
END;
-------------------------------------------
PROCEDURE AUDYTOWANIE (
	l_TNAME in varchar2,
	l_CNAME in varchar2,
    l_NEW_V IN VARCHAR2,
    l_OLD_V IN VARCHAR2,
	l_NEW_N IN NUMBER, 
	l_OLD_N IN NUMBER,
    l_NEW_D IN DATE, 
    l_OLD_D IN DATE,
    l_NEW_C IN CLOB, 
    l_OLD_C IN CLOB,
    l_ROWID IN VARCHAR2,
    l_CID IN NUMBER default null,
    l_INSERTING in boolean default true,
    l_UPDATING in boolean default false,
    l_DELETING in boolean default false  
)
IS
	v_typ_danych VARCHAR2(50);
	v_czy_audytowac VARCHAR2(50);
--PRAGMA AUTONOMOUS_TRANSACTION;
begin
	select UPPER(CZY_AUDYTOWAC) into v_czy_audytowac from AP_HIST_KOLUMNY_AUDYTOWE
		where tabela = l_TNAME and KOLUMNA = l_CNAME;

	if v_czy_audytowac = 'TAK' THEN
		select TYP_DANYCH into v_typ_danych from AP_HIST_KOLUMNY_AUDYTOWE
			where tabela = l_TNAME and KOLUMNA = l_CNAME;   
		if v_typ_danych = 'VARCHAR2' THEN
			CHECK_VAL(l_TNAME, l_CNAME, l_NEW_V, l_OLD_V, l_ROWID, l_CID, l_INSERTING, l_UPDATING, l_DELETING);
		ELSIF v_typ_danych = 'NUMBER' then
			CHECK_NUMBER (l_TNAME, l_CNAME, l_NEW_N, l_OLD_N, l_ROWID, l_CID, l_INSERTING, l_UPDATING, l_DELETING);		
		ELSIF v_typ_danych = 'DATE' THEN
			CHECK_DATE (l_TNAME, l_CNAME, l_NEW_D, l_OLD_D, l_ROWID, l_CID, l_INSERTING, l_UPDATING, l_DELETING);
        ELSIF v_typ_danych LIKE 'TIMESTAMP WITH TIMEZONE' THEN
            CHECK_TIMESTAMP_WITH_TIMEZONE (l_TNAME, l_CNAME, l_NEW_D, l_OLD_D, l_ROWID, l_CID, l_INSERTING, l_UPDATING, l_DELETING);
        ELSIF v_typ_danych LIKE 'TIMESTAMP' THEN
            CHECK_TIMESTAMP (l_TNAME, l_CNAME, l_NEW_D, l_OLD_D, l_ROWID, l_CID, l_INSERTING, l_UPDATING, l_DELETING);
        ELSIF v_typ_danych LIKE 'TIMESTAMP' THEN
            CHECK_TIMESTAMP_WLTZ(l_TNAME, l_CNAME, l_NEW_D, l_OLD_D, l_ROWID, l_CID, l_INSERTING, l_UPDATING, l_DELETING);
        ELSIF v_typ_danych LIKE 'CLOB' THEN
            CHECK_CLOB(l_TNAME, l_CNAME, l_NEW_C, l_OLD_C, l_ROWID, l_CID, l_INSERTING, l_UPDATING, l_DELETING);
		ELSE
			null;
		end if; 
	ELSE
		null;
	end if;
EXCEPTION
	when no_data_found THEN
		dbms_output.put_line('AUDYTOWANIE EXCEPTION no_data_found v_typ_danych='||v_typ_danych||' v_czy_audytowac='||v_czy_audytowac);
end AUDYTOWANIE;

PROCEDURE REGENERUJ_TRIGGERY
AS
v_sql_trg varchar2(6000);
v_sql_seq varchar2(6000);
v_sql varchar2(6000);
v_identity_column_name varchar(30 char);
v_params AUDYT_PKG.tab_param;
v_sql_err_mag varchar2(4000);
cursor c_trigger is select trigger_name from all_triggers where trigger_name like '%HISTLOG_TRG' order by 1;
cursor c_tabele is select distinct TABELA from AP_HIST_KOLUMNY_AUDYTOWE WHERE czy_audytowac='TAK' order by 1;
BEGIN
--usuwanie wszystkich triggerów historyzujących
for c in c_trigger loop
    v_sql_trg :='';
    v_sql_trg:= 'DROP TRIGGER '||c.trigger_name; 
begin DBMS_OUTPUT.PUT_LINE(v_sql_seq);
    execute immediate v_sql_trg;
exception when others then null;
end;
end loop;
--resetowanie sequencera
v_sql_seq := '';
v_sql_seq := 'DROP SEQUENCE AP_HISTLOG_SEQ';
begin DBMS_OUTPUT.PUT_LINE(v_sql_seq);
    execute immediate v_sql_seq;
exception when others then null;
end;
v_sql_seq := '';
v_sql_seq := 'create sequence AP_HISTLOG_SEQ start with 1 increment by 1 minvalue 1 maxvalue 999';
begin DBMS_OUTPUT.PUT_LINE(v_sql_seq);
    execute immediate v_sql_seq;
exception when others then null;
end;
--generowanie nowych triggerów
for c in c_tabele loop
SELECT COLUMN_NAME INTO v_identity_column_name FROM ALL_TAB_IDENTITY_COLS WHERE TABLE_NAME=c.TABELA;
    v_sql :='create or replace trigger '||SUBSTR(c.TABELA,1,15)||LPAD(AP_HISTLOG_SEQ.nextval,3,0)||'_HISTLOG_TRG after INSERT OR UPDATE OR DELETE ON '||c.TABELA||' FOR EACH ROW BEGIN '||CHR(13);
    for i in (select distinct tabela,kolumna,typ_danych from AP_HIST_KOLUMNY_AUDYTOWE where czy_audytowac='TAK' and tabela=c.TABELA order by 1 ,2)loop    
        if i.typ_danych like '%CHAR%' then v_sql:=v_sql||' AUDYT_PKG.AUDYTOWANIE ('''||i.tabela||''', '''||i.kolumna||''', :new.'||i.kolumna||', :old.'||i.kolumna||', null, null, null, null, null, null, ';
            v_sql:=v_sql||' :NEW.ROWID, :new.'||v_identity_column_name||', INSERTING, UPDATING, DELETING);';
        elsif i.typ_danych like '%NUMBER%' then v_sql:=v_sql||' AUDYT_PKG.AUDYTOWANIE ('''||i.tabela||''', '''||i.kolumna||''',null,null, :new.'||i.kolumna||', :old.'||i.kolumna||', null, null, null, null, ';
            v_sql:=v_sql||' :NEW.ROWID, :new.'||v_identity_column_name||', INSERTING, UPDATING, DELETING);';
        elsif i.typ_danych like '%DATE%' then v_sql:=v_sql||' AUDYT_PKG.AUDYTOWANIE ('''||i.tabela||''', '''||i.kolumna||''',null, null, null, null, :new.'||i.kolumna||', :old.'||i.kolumna||', null, null, ';
            v_sql:=v_sql||' :NEW.ROWID, :new.'||v_identity_column_name||', INSERTING, UPDATING, DELETING);';
        elsif i.typ_danych like '%TIMESTAMP%' then v_sql:=v_sql||' AUDYT_PKG.AUDYTOWANIE ('''||i.tabela||''', '''||i.kolumna||''',null, null, null, null, :new.'||i.kolumna||', :old.'||i.kolumna||', null, null, ';
            v_sql:=v_sql||' :NEW.ROWID, :new.'||v_identity_column_name||', INSERTING, UPDATING, DELETING);';
        elsif i.typ_danych like '%CLOB%' then v_sql:=v_sql||' AUDYT_PKG.AUDYTOWANIE ('''||i.tabela||''', '''||i.kolumna||''',null, null, null, null, null, null, :new.'||i.kolumna||', :old.'||i.kolumna||', ';
            v_sql:=v_sql||' :NEW.ROWID, :new.'||v_identity_column_name||', INSERTING, UPDATING, DELETING);';
        end if;
    end loop;
    v_sql:=v_sql||' end;';
    begin DBMS_OUTPUT.PUT_LINE(v_sql);
        EXECUTE IMMEDIATE v_sql;   
    exception when others then v_sql_err_mag:=SQLERRM;
        DBMS_OUTPUT.PUT_LINE('AUDYT_PKG.REGENERUJ_TRIGGERY exception when others v_sql_err_mag='||v_sql_err_mag||' v_sql='||v_sql);
    end;
end loop;

END;

END ;
