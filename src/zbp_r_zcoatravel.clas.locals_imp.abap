CLASS LHC_ZR_ZCOATRAVEL DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrZcoatravel
        RESULT result,
      setInitialStatus FOR DETERMINE ON SAVE
            IMPORTING keys FOR ZrZcoatravel~setInitialStatus.
ENDCLASS.

CLASS LHC_ZR_ZCOATRAVEL IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD setInitialStatus.
         READ ENTITIES OF ZR_ZCOATRAVEL IN LOCAL MODE
        ENTITY ZrZcoatravel
        FIELDS ( Status )
        WITH CORRESPONDING #( keys )
        RESULT DATA(lt_travel).

     LOOP AT lt_travel ASSIGNING FIELD-SYMBOL(<ls_travel>).
        <ls_travel>-Status = 'N'.
      ENDLOOP.

    MODIFY ENTITIES OF ZR_ZCOATRAVEL IN LOCAL MODE
    ENTITY ZrZcoatravel
    UPDATE FIELDS ( Status )
    WITH VALUE #( FOR ls_travel IN lt_travel
                  ( %tky    = ls_travel-%tky
                    Status  = ls_travel-Status ) ).


  ENDMETHOD.

ENDCLASS.
