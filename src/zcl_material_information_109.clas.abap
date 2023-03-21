

CLASS zcl_material_information_109 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_material_art
      IMPORTING
        matnr               TYPE i_product-product
      RETURNING
        VALUE(material_art) TYPE i_product-producttype.
ENDCLASS.



CLASS zcl_material_information_109 IMPLEMENTATION.


  METHOD get_material_art.
*    DATA material TYPE mara.
    DATA material TYPE i_product.
    DATA production_date TYPE datn.
    DATA bool_tmp TYPE boole_d.

    production_date = sy-datum.


* Quick Fix Replace 'OLD SQL' with NEW SQL.
* 03/21/2023 08:04:35 STUDENTE109
* Transport S4HK902246 student 109
* Replaced Code:
*    SELECT SINGLE mtart FROM mara INTO CORRESPONDING FIELDS OF material WHERE matnr = matnr.

    SELECT SINGLE FROM i_product FIELDS ProductType WHERE Product = @matnr INTO CORRESPONDING FIELDS OF @material .

* End of Quick Fix



* Quick Fix Replace MOVE with an assignment.
* 03/21/2023 08:04:35 STUDENTE109
* Transport S4HK902246 student 109
* Replaced Code:
*    MOVE material-mtart TO material_art.

    material_art = material-ProductType.

* End of Quick Fix


  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    DATA material_info TYPE REF TO zcl_material_information_109.
    material_info = NEW zcl_material_information_109(  ).
    DATA(material_art) = material_info->get_material_art( 'RM34' ).
    out->write( material_art ).
  ENDMETHOD.
ENDCLASS.

