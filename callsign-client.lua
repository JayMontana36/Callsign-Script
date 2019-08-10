local aircraft = ""
local callsign = false
local callsignset = false
local callsignjustset = false
local player = PlayerId()
local ped = GetPlayerPed(-1)
Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	while not callsignset do
		FreezePlayer()
		--exports.JaysFunctions:notification("Welcome! Before you can continue, you must first set a callsign for yourself by doing /callsign")
		--message prompt to do callsign
		Wait(5000)
		callsignjustset = true
	end
	
	if callsignset == true and callsignjustset == true then
		UnFreezePlayer()
		--exports.JaysFunctions:notification("Your callsign has just been set/updated; be sure to read the rules and follow proper proceedures")
		--message thanking for setting callsign and to read the rules blah blah etc
		callsignjustset = false
	end
	
	while true do
	ped = GetPlayerPed(-1)
	if callsign ~= false and IsPedInAnyVehicle(ped) then
		SetPlateText()
	end
	Citizen.Wait(5000)
	end
end)

RegisterNetEvent('setlocalvehicleplate')
AddEventHandler('setlocalvehicleplate', function(platetext)
	callsign = platetext
	callsignset = true
	callsignjustset = true
end)

local function FreezePlayer()
	player = PlayerId()
	ped = GetPlayerPed(-1)
	SetEntityCollision(ped, false)
	FreezeEntityPosition(ped, true)
	SetPlayerInvincible(player, true)
end)

local function UnFreezePlayer()
	player = PlayerId()
	ped = GetPlayerPed(-1)
	SetEntityCollision(ped, true)
	FreezeEntityPosition(ped, false)
	SetPlayerInvincible(player, false)
end)

local function SetPlateText()
	vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
	if DoesEntityExist(vehicle) and GetPedInVehicleSeat(vehicle, -1) == GetPlayerPed(-1) then
		SetVehicleNumberPlateText(vehicle, callsign)
	end
end)

Citizen.CreateThread(function()
    TriggerEvent("chat:addSuggestion", "/callsign", "Register your vehicle", {
        {name = "callsign", help = "Your vehicle's callsign. Max 8 character!"}
    })
    Citizen.Trace("Script made by @JayMontana36")
end)