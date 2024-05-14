using app.entities from '../db/entities';

service Entities_Service {
    entity FIDocumenHeaders as projection on entities.FIDocumenHeaders
    entity FIDocumentItems  as projection on entities.FIDocumentItems;
    entity GLAccounts       as projection on entities.GLAccounts;
}