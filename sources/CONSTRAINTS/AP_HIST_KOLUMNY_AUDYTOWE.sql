--------------------------------------------------------
--  Constraints for Table AP_HIST_KOLUMNY_AUDYTOWE
--------------------------------------------------------

  ALTER TABLE "AP_HIST_KOLUMNY_AUDYTOWE" ADD CONSTRAINT "ID_AP_HIST_KOLUMNY_AUDYTOWE_PK" PRIMARY KEY ("ID_AP_HIST_KOLUMNY_AUDYTOWE")
  USING INDEX  ENABLE;
  ALTER TABLE "AP_HIST_KOLUMNY_AUDYTOWE" MODIFY ("ID_AP_HIST_KOLUMNY_AUDYTOWE" NOT NULL ENABLE);