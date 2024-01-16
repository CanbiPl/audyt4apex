--------------------------------------------------------
--  Constraints for Table AP_HISTORIA
--------------------------------------------------------

  ALTER TABLE "AP_HISTORIA" ADD CHECK (action in ('I','U','D')) ENABLE;
  ALTER TABLE "AP_HISTORIA" ADD CONSTRAINT "AP_HISTORIA_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
