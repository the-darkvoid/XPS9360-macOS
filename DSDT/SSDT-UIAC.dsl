DefinitionBlock ("", "SSDT", 2, "hack", "UIAC", 0x00000000)
{
	Device (UIAC)
	{
		Name (_HID, "UIA00000")  // _HID: Hardware ID
		Name (RMCF, Package ()
		{
			"8086_9d2f", 
			Package ()
			{
				"port-count", 
				Buffer ()
				{
					0x12, 0x00, 0x00, 0x00
				}, 

				"ports", 
				Package ()
				{
					"HS01", 
					Package ()
					{
						"UsbConnector", 
						0x03, 
						"port", 
						Buffer ()
						{
							0x01, 0x00, 0x00, 0x00
						}
					}, 

					"HS02", 
					Package ()
					{
						"UsbConnector", 
						0x03, 
						"port", 
						Buffer ()
						{
							0x02, 0x00, 0x00, 0x00
						}
					}, 

					"HS03", 
					Package ()
					{
						"UsbConnector", 
						0xFF, 
						"port", 
						Buffer ()
						{
							0x03, 0x00, 0x00, 0x00
						}
					}, 

					"HS04", 
					Package ()
					{
						"UsbConnector", 
						0xFF, 
						"port", 
						Buffer ()
						{
							0x04, 0x00, 0x00, 0x00
						}
					}, 

					"HS05", 
					Package ()
					{
						"UsbConnector", 
						0xFF, 
						"port", 
						Buffer ()
						{
							0x05, 0x00, 0x00, 0x00
						}
					}, 

					"SS01", 
					Package ()
					{
						"UsbConnector", 
						0x03, 
						"port", 
						Buffer ()
						{
							0x0d, 0x00, 0x00, 0x00
						}
					}, 

					"SS02", 
					Package ()
					{
						"UsbConnector", 
						0x03, 
						"port", 
						Buffer ()
						{
							0x0e, 0x00, 0x00, 0x00
						}
					}
				}
			}
		})
	}
}

