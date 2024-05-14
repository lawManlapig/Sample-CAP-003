using Entities_Service as service from '../../srv/entities_srv';
annotate service.FIDocumentItems with {
    accountingdocument @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'FIDocumenHeaders',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : accountingdocument_accountingdocument,
                ValueListProperty : 'accountingdocument',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'year',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'documenttype',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
        ],
    }
};

