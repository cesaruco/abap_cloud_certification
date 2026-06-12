CLASS zcl_coa_flight DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

DATA: carrier_id    TYPE /dmo/carrier_id READ-ONLY,
      connection_id TYPE /dmo/connection_id READ-ONLY,
      airport_from  TYPE /dmo/airport_from_id READ-ONLY,
      airport_to    TYPE /dmo/airport_to_id READ-ONLY.

METHODS constructor
  IMPORTING
    i_carrier_id    TYPE /dmo/carrier_id
    i_connection_id TYPE /dmo/connection_id
    i_plane_type    TYPE /dmo/plane_type_id
  RAISING
    zcx_c_abapd_no_connection.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.

  DATA: plane_type TYPE /dmo/plane_type_id.

  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_coa_flight IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.
METHOD constructor.
  me->carrier_id    = i_carrier_id.
  me->connection_id = i_connection_id.
  me->plane_type    = i_plane_type.

  SELECT SINGLE FROM /dmo/connection
    FIELDS airport_from_id, airport_to_id
    WHERE carrier_id    = @me->carrier_id
      AND connection_id = @me->connection_id
    INTO ( @me->airport_from, @me->airport_to ).

  IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE zcx_c_abapd_no_connection.
  ENDIF.
ENDMETHOD.


ENDCLASS.
