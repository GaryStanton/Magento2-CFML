component {

	this.metadata = {
		methods: {
            'send': {
				httpMethod: 'post',
				multipart: false,
                path: '/shipment/{id}/emails',
                hint: 'Emails user a specified shipment.',
                docs: 'https://magento.redoc.ly/2.3.6-admin/tag/shipmentidemails##operation/salesShipmentManagementV1NotifyPost'
            }
		}
	};

}
