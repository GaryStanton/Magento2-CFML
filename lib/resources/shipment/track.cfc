component {

	this.metadata = {
		methods: {
			'create': {
				arguments: deserializeJSON('
					{
						"entity": {
							"order_id": 0,
							"created_at": "string",
							"entity_id": 0,
							"parent_id": 0,
							"updated_at": "string",
							"weight": 0,
							"qty": 0,
							"description": "string",
							"extension_attributes": {},
							"track_number": "string",
							"title": "string",
							"carrier_code": "string"
						}
					}
				'),
				httpMethod: 'post',
				multipart: false,
				path: '/shipment/track/',
				hint: 'Performs persist operations for a specified shipment track.',
				docs: 'https://magento.redoc.ly/2.3.6-admin/tag/shipmenttrack##operation/salesShipmentTrackRepositoryV1SavePost'
			},

            'delete': {
                httpMethod: 'delete',
                path: '/shipment/track/{id}',
                hint: 'Deletes a specified shipment track by ID.',
                docs: 'https://magento.redoc.ly/2.3.6-admin/tag/shipmenttrackid##operation/salesShipmentTrackRepositoryV1DeleteByIdDelete'
            }
		}
	};

}
