RegisterCommand('callsign', function(source, args)
	--if args[2] ~= nil or args[2] ~= "" or args[2] ~= " " then
	--	TriggerClientEvent('makeengrip2', tonumber(args[1]), args[2])
	--elseif args[1] ~= nil then
	platetext = args[1]
	if source == 0 then
		print('You cannot set a callsign dummy!')
	elseif platetext == nil then
		TriggerClientEvent("chatMessage", source, "^1SERVER^0:^8 Usage: /callsign <callsign>")
		--exports.JaysFunctions:notification("~r~Usage: /callsign (callsign)")
	elseif #platetext > 8 then
		TriggerClientEvent("chatMessage", source, "^1SERVER^0:^3 The vehicle callsign must be less than 9 chars!")
		--exports.JaysFunctions:notification("~r~Failed to set callsign - over 9 character limit")
	elseif platetext ~= nil then
		--platetext = string.lower(args[1])
		TriggerClientEvent('setlocalvehicleplate', source, platetext)
		TriggerClientEvent("chatMessage", source, "^1SERVER^0:^3 Aircraft callsign set.")
	end
end, false)
