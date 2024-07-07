local function createBox(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")

    -- Create a BillboardGui
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "PlayerBox"
    billboardGui.Adornee = rootPart
    billboardGui.Size = UDim2.new(4, 0, 5, 0)
    billboardGui.AlwaysOnTop = true

    -- Create a Frame to represent the box
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BorderSizePixel = 2
    frame.BackgroundTransparency = 1
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    frame.Parent = billboardGui

    billboardGui.Parent = rootPart
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        createBox(player)
    end)

    if player.Character then
        createBox(player)
    end
end

-- Connect the PlayerAdded event to the onPlayerAdded function
game.Players.PlayerAdded:Connect(onPlayerAdded)

-- Add boxes for players already in the game
for _, player in ipairs(game.Players:GetPlayers()) do
    onPlayerAdded(player)
end
