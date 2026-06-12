CLASS zcl_coa_agency_model DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS get_agency
      IMPORTING
        i_agency        TYPE /dmo/agency_id
      RETURNING
        VALUE(r_agency) TYPE zc_abapd_agency
      RAISING
         zcx_coa_no_agency.

ENDCLASS.

CLASS zcl_coa_agency_model IMPLEMENTATION.

  METHOD get_agency.

    SELECT SINGLE
      FROM zc_1686_agency
      FIELDS *
      WHERE agencyid = @i_agency
      INTO @r_agency.

    IF sy-subrc <> 0.

    RAISE EXCEPTION TYPE zcx_coa_no_agency
      EXPORTING
        agency_id = i_agency.


    ENDIF.

  ENDMETHOD.

ENDCLASS.
