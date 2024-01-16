--------------------------------------------------------
--  DDL for Trigger KOLUMNY_AUDYTOWE_TRG_IU_AUDYT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "KOLUMNY_AUDYTOWE_TRG_IU_AUDYT" 
BEFORE INSERT OR UPDATE ON AP_HIST_KOLUMNY_AUDYTOWE 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
      SELECT NVL(v('APP_USER'),USER) INTO :NEW.AUDYT_USR_INS FROM SYS.DUAL;
    END IF;
    IF UPDATING THEN
      SELECT NVL(v('APP_USER'),USER),SYSDATE INTO :NEW.AUDYT_USR_UPD,:NEW.AUDYT_TS_UPD FROM SYS.DUAL;
    END IF;
END;


/
ALTER TRIGGER "KOLUMNY_AUDYTOWE_TRG_IU_AUDYT" ENABLE;