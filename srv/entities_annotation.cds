using app.entities from '../db/entities';

//Annotation for Screen Structure
@odata.draft.enabled
annotate entities.FIDocumentItems with @(UI: {
    HeaderInfo                 : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Accounting Document',
        TypeNamePlural: 'Accounting Documents',
        Title         : {Value: accountingdocument_accountingdocument},
        Description   : {Value: 'Accounting Document'}
    },

    SelectionFields            : [accountingdocument_accountingdocument],

    LineItem                   : [
        {Value: accountingdocument_accountingdocument},
        {Value: itemnumber},
        {Value: glaccount},
        {Value: amount}
    ],

    Facets                     : [{
        $Type : 'UI.CollectionFacet',
        ID    : '1', //Grouping number.. incase you need to add more in the future
        Label : 'Document Details',
        Facets: [{
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#DocumentDetails',
        }]
    }, ],


    FieldGroup #DocumentDetails: {Data: [
        {Value: accountingdocument_accountingdocument},
        {Value: itemnumber},
        {Value: glaccount}
    ]},
});


//Functionality Annotation
annotate entities.FIDocumentItems with {
    glaccount @(
        title         : 'GL Account',
        sap.value.list: 'fixed-values',
        Common        : {
            ValueListWithFixedValues,
            ValueList: {
                CollectionPath: 'F4_GLAccounts',
                Parameters    : [{
                    $Type            : 'Common.ValueListParameterInOut',
                    ValueListProperty: 'GLNumber',
                    LocalDataProperty: glaccount
                }]
            }
        }
    )
};
