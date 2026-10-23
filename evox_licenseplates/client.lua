local resourceName = GetCurrentResourceName()

local textureNames = {
    'plate01',
    'plate01_n',
    'plate02',
    'plate02_n',
    'plate03',
    'plate03_n',
    'plate04',
    'plate04_n',
    'plate05',
    'plate05_n',
    'yankton_plate',
    'yankton_plate_n',
    'vehicle_generic_plate_font',
    'vehicle_generic_plate_font_n'
}

local replacementsApplied = false


local function applyPlatePattern()
    if not Config.ApplyPlatePattern then
        return
    end

    for plateIndex = 0, 5 do
        SetDefaultVehicleNumberPlateTextPattern(plateIndex, Config.PlatePattern)
    end
end

local function loadTextureDictionary()
    RequestStreamedTextureDict(Config.TextureDictionary, false)

    local deadline = GetGameTimer() + Config.TextureLoadTimeoutMs

    while not HasStreamedTextureDictLoaded(Config.TextureDictionary) do
        if GetGameTimer() >= deadline then
        
            return false
        end

        Wait(0)
    end

    return true
end

local function applyTextureReplacements()
    for i = 1, #textureNames do
        local textureName = textureNames[i]
        RemoveReplaceTexture('vehshare', textureName)
        AddReplaceTexture(
            'vehshare',
            textureName,
            Config.TextureDictionary,
            textureName
        )
    end

    replacementsApplied = true
end

CreateThread(function()
    applyPlatePattern()

    if not loadTextureDictionary() then
        return
    end

    applyTextureReplacements()

end)

AddEventHandler('onResourceStop', function(stoppedResource)
    if stoppedResource ~= resourceName or not replacementsApplied then
        return
    end

    for i = 1, #textureNames do
        RemoveReplaceTexture('vehshare', textureNames[i])
    end

    SetStreamedTextureDictAsNoLongerNeeded(Config.TextureDictionary)
    replacementsApplied = false
end)
