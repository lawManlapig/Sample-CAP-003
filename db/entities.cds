namespace app.entities;

//Re-usables
using {managed} from '@sap/cds/common';

//Entities
//Header
entity FIDocumenHeaders : managed {
        // key id                 : Int32;
    key accountingdocument : String(10);
        year               : Date;
        documenttype       : String(2);
        description        : String(50);
}

//Items
entity FIDocumentItems {
        // key id                 : Int32;
    key accountingdocument : Association to FIDocumenHeaders;
    key itemnumber         : Int32;
        glaccount          : String(10);
        amount             : Decimal(15, 2);
}

//GL Account Details
entity GLAccounts {
        // key id          : Int32;
    key glaccount   : Association to FIDocumentItems;
        description : String(50);
}

//View
view CV_Postings as
    select from entities.GLAccounts {
        GLAccounts.glaccount.accountingdocument.accountingdocument,
        GLAccounts.glaccount.accountingdocument.description as AccDesc,
        GLAccounts.glaccount.accountingdocument.createdBy,
        GLAccounts.glaccount.itemnumber,
        GLAccounts.glaccount,
        GLAccounts.description                              as GLDesc,
        GLAccounts.glaccount.amount
    }
