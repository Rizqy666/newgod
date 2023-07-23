Citizen.CreateThread(function()


	RequestIpl("bangdai_int_pal")
	
		local interiorID = GetInteriorAtCoords(72.39165000, 6533.91700000, 29.99167000)
		
		if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "utama")
		EnableInteriorProp(interiorID, "bossroom")
		EnableInteriorProp(interiorID, "ruang_tamu")
		EnableInteriorProp(interiorID, "ruang_rapat")
		RefreshInterior(interiorID)
		end
	end)
	