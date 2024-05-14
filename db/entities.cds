namespace app.entities;

//Re-usables
using {managed} from '@sap/cds/common';

//Entities
//Header
entity FIDocumenHeaders : managed {
        // key id                 : Int32;
    key accountingdocument : String(10) @(title: 'Document Number');
        year               : Date       @(title: 'Year');
        documenttype       : String(2)  @(title: 'Document Type');
        description        : String(50) @(title: 'Document Description');
}

//Items
entity FIDocumentItems {
        // key id                 : Int32;
    key accountingdocument : Association to FIDocumenHeaders @(title: 'Document Number');
    key itemnumber         : Int32                           @(title: 'Item Number');
        glaccount          : String(10)                      @(title: 'GL Account');
        amount             : Decimal(15, 2)                  @(title: 'Amount');
}

//GL Account Details
entity GLAccounts {
        // key id          : Int32;
    key glaccount   : Association to FIDocumentItems @(title: 'GL Account');
        description : String(50)                     @(title: 'GL Description');
}

//View
view CV_Postings as
    select from GLAccounts {
        GLAccounts.glaccount.accountingdocument.accountingdocument as DocumentNumber,
        GLAccounts.glaccount.accountingdocument.description        as DocumentDescription,
        GLAccounts.glaccount.accountingdocument.createdBy          as CreatedBy,
        GLAccounts.glaccount.itemnumber                            as ItemNumber,
        GLAccounts.glaccount.glaccount                             as GLNumber,
        description                                                as GLDescription,
        GLAccounts.glaccount.amount                                as Amount
    }


view CV_GLAccounts as
    select from GLAccounts {
        GLAccounts.glaccount.glaccount as GLNumber,
        GLAccounts.description         as GLDescription
    }
