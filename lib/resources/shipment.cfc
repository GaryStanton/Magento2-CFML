component {

	this.metadata = {
		methods: {
			'retrieve': {
				path: '/shipment/{id}',
				hint: 'Loads a specified shipment.',
				docs: 'https://magento.redoc.ly/2.3.6-admin/tag/shipmentid'
			},

			'create': {
				arguments: deserializeJSON('
					{
						"entity": {
							"billing_address_id": 0,
							"created_at": "string",
							"customer_id": 0,
							"email_sent": 0,
							"entity_id": 0,
							"increment_id": "string",
							"order_id": 0,
							"packages": [
								{
									"extension_attributes": {}
								}
							],
							"shipment_status": 0,
							"shipping_address_id": 0,
							"shipping_label": "string",
							"store_id": 0,
							"total_qty": 0,
							"total_weight": 0,
							"updated_at": "string",
							"items": [
								{
									"additional_data": "string",
									"description": "string",
									"entity_id": 0,
									"name": "string",
									"parent_id": 0,
									"price": 0,
									"product_id": 0,
									"row_total": 0,
									"sku": "string",
									"weight": 0,
									"extension_attributes": {},
									"order_item_id": 0,
									"qty": 0
								}
							],
							"tracks": [
								{
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
							],
							"comments": [
								{
									"is_customer_notified": 0,
									"parent_id": 0,
									"extension_attributes": {},
									"comment": "string",
									"is_visible_on_front": 0,
									"created_at": "string",
									"entity_id": 0
								}
							],
							"extension_attributes": {
								"source_code": "string"
							}
						}
					}
				'),
				httpMethod: 'post',
				multipart: false,
				path: '/shipment/',
				hint: 'Performs persist operations for a specified shipment.',
				docs: 'https://magento.redoc.ly/2.3.6-admin/tag/shipment/##operation/salesShipmentRepositoryV1SavePost'
			}
		}
	}
}