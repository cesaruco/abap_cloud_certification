CLASS zcl_coa_connection DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  METHODS get_connections
  IMPORTING
    i_departure          TYPE /dmo/airport_from_id
  RETURNING
    VALUE(r_connections) TYPE zcert_connections.


    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_coa_connection IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.
METHOD get_connections.
   SELECT carrier_id,
         airport_from_id,
         airport_to_id,
         '-' AS airport_via_id
    FROM /dmo/connection
    WHERE airport_from_id = @i_departure
      AND airport_to_id   <> @i_departure
    INTO TABLE @r_connections.

ENDMETHOD.


ENDCLASS.
