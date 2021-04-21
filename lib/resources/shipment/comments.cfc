component {

	this.metadata = {
		methods: {
            'list': {
                path: '/shipment/{id}/comments',
                hint: 'Lists comments for a specified shipment.',
                docs: 'https://magento.redoc.ly/2.3.6-admin/tag/shipmentidcomments##operation/salesShipmentManagementV1GetCommentsListGet'
            },

			'create': {
				arguments: deserializeJSON('
					{
						"entity": {
							"is_customer_notified": 0,
							"parent_id": 0,
							"extension_attributes": {},
							"comment": "string",
							"is_visible_on_front": 0,
							"created_at": "string",
							"entity_id": 0
						}
					}
				'),
				httpMethod: 'post',
				multipart: false,
				path: '/shipment/{id}/comments',
				hint: 'Performs persist operations for a specified shipment comment.',
				docs: 'https://magento.redoc.ly/2.3.6-admin/tag/shipmentidcomments##operation/salesShipmentCommentRepositoryV1SavePost'
			}
		}
	};

}
