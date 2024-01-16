create or replace PACKAGE AUDYT_PKG 
as
--WYMAGANE UPRAWNIENIA UZYTKOWNIKA/SCHEMATU:
    --GRANT CREATE TRIGGER,CREATE TABLE,CREATE SEQUENCE TO "SCHEMAT" ;
TYPE rec_param is record(nazwa varchar2(255),wartosc varchar2(4000));
TYPE tab_param is table of rec_param index by binary_integer;

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
);

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
);

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
);

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
);

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
);

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
);

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
);

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
);

PROCEDURE REGENERUJ_TRIGGERY;

end;
