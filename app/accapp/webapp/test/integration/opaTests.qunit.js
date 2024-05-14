sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'acdoc/accapp/test/integration/FirstJourney',
		'acdoc/accapp/test/integration/pages/FIDocumentItemsList',
		'acdoc/accapp/test/integration/pages/FIDocumentItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, FIDocumentItemsList, FIDocumentItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('acdoc/accapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheFIDocumentItemsList: FIDocumentItemsList,
					onTheFIDocumentItemsObjectPage: FIDocumentItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);