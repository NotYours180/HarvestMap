function Harvest.newMapNameFishChest(type, newMapName, x, y)
    -- 1) type 2) map name 3) x 4) y 5) profession 6) nodeName 7) itemID 8) scale
    if type == "fish" then
        if not Harvest.savedVars["settings"].importFilters[ Harvest.fishID ] then
            Harvest.saveData("nodes", newMapName, x, y, Harvest.fishID, type, nil, Harvest.minReticleover, "valid" )
        else
            Harvest.NumNodesFiltered = Harvest.NumNodesFiltered + 1
        end
    elseif type == "chest" then
        if not Harvest.savedVars["settings"].importFilters[ Harvest.chestID ] then
            Harvest.saveData("nodes", newMapName, x, y, Harvest.chestID, type, nil, Harvest.minReticleover, "valid" )
        else
            Harvest.NumNodesFiltered = Harvest.NumNodesFiltered + 1
        end
    else
        d("Harvest : newMapName : unsupported type : " .. type)
        Harvest.saveData("rejected", newMapName, x, y, -1, type, nil, Harvest.minReticleover, "reject" )
    end
end

function Harvest.oldMapNameFishChest(type, oldMapName, x, y)
    -- 1) type 2) map name 3) x 4) y 5) profession 6) nodeName 7) itemID 8) scale
    if type == "fish" then
        if not Harvest.savedVars["settings"].importFilters[ Harvest.fishID ] then
            Harvest.saveData("esonodes", oldMapName, x, y, Harvest.fishID, type, nil, Harvest.minReticleover, "nonvalid" )
        else
            Harvest.NumNodesFiltered = Harvest.NumNodesFiltered + 1
        end
    elseif type == "chest" then
        if not Harvest.savedVars["settings"].importFilters[ Harvest.chestID ] then
            Harvest.saveData("esonodes", oldMapName, x, y, Harvest.chestID, type, nil, Harvest.minReticleover, "nonvalid" )
        else
            Harvest.NumNodesFiltered = Harvest.NumNodesFiltered + 1
        end
    else
        d("Harvest : oldMapName : unsupported type : " .. type)
        Harvest.saveData("rejected", oldMapName, x, y, -1, type, nil, Harvest.minReticleover, "reject" )
    end
end

function Harvest.newMapNilItemIDHarvest(newMapName, x, y, profession, nodeName)
    local itemIDFound
    local nameFound
    if not Harvest.IsValidContainerName(nodeName) then -- returns true or false
        if nodeName ~= nil then 
            itemIDFound = Harvest.GetItemIDFromItemName(nodeName)
        end

        nameFound = Harvest.GetItemNameFromItemID(itemIDFound)
        if nameFound == nil then 
                Harvest.saveData("unlocalnode", newMapName, x, y, profession, nodeName, nil, nil, "reject" )
            return
        end
        if nodeName == nil and nameFound ~= nil then
            nodeName = nameFound
        elseif nodeName ~= nil and nameFound ~= nil then
            if nodeName ~= nameFound then
                nodeName = nameFound
            end
        end
    end
    
    local itemID
    if itemIDFound ~= nil then
        itemID = itemIDFound
    end

    local professionFound
    professionFound = Harvest.GetProfessionTypeOnUpdate(nodeName) -- Get Profession by name only
    if professionFound <= 0 then
        professionFound = profession
    end
    if professionFound < 1 or professionFound > 8 then
        Harvest.saveData("rejected", newMapName, x, y, professionFound, nodeName, nil, nil, "reject" )
        return
    end

    -- 1) type 2) map name 3) x 4) y 5) profession 6) nodeName 7) itemID 8) scale
    if not Harvest.IsValidContainerName(nodeName) then
        if not Harvest.savedVars["settings"].importFilters[ professionFound ] then
            Harvest.saveData("nodes", newMapName, x, y, professionFound, nodeName, nil, nil, "valid" )
        else
            Harvest.NumNodesFiltered = Harvest.NumNodesFiltered + 1
        end
    else
        Harvest.NumContainerSkipped = Harvest.NumContainerSkipped +1
    end
end

function Harvest.oldMapNilItemIDHarvest(oldMapName, x, y, profession, nodeName)
    local itemIDFound
    local nameFound
    if not Harvest.IsValidContainerName(nodeName) then -- returns true or false
        if nodeName ~= nil then 
            itemIDFound = Harvest.GetItemIDFromItemName(nodeName)
        end

        nameFound = Harvest.GetItemNameFromItemID(itemIDFound)
        if nameFound == nil then 
                Harvest.saveData("unlocalnode", newMapName, x, y, profession, nodeName, nil, nil, "reject" )
            return
        end
        if nodeName == nil and nameFound ~= nil then
            nodeName = nameFound
        elseif nodeName ~= nil and nameFound ~= nil then
            if nodeName ~= nameFound then
                nodeName = nameFound
            end
        end
    end
    
    local itemID
    if itemIDFound ~= nil then
        itemID = itemIDFound
    end

    local professionFound
    professionFound = Harvest.GetProfessionTypeOnUpdate(nodeName) -- Get Profession by name only
    if professionFound <= 0 then
        professionFound = profession
    end
    if professionFound < 1 or professionFound > 8 then
        Harvest.saveData("rejected", oldMapName, x, y, professionFound, nodeName, nil, nil, "reject" )
        return
    end

    -- 1) type 2) map name 3) x 4) y 5) profession 6) nodeName 7) itemID 8) scale
    if not Harvest.IsValidContainerName(nodeName) then
        if not Harvest.savedVars["settings"].importFilters[ professionFound ] then
            Harvest.saveData("esonodes", oldMapName, x, y, professionFound, nodeName, nil, nil, "nonvalid" )
        else
            Harvest.NumNodesFiltered = Harvest.NumNodesFiltered + 1
        end
    else
        Harvest.NumContainerSkipped = Harvest.NumContainerSkipped +1
    end
end

function Harvest.newMapItemIDHarvest(newMapName, x, y, profession, nodeName, itemID)
    local itemIDFound
    local nameFound
    if not Harvest.IsValidContainerName(nodeName) then -- returns true or false
        if nodeName ~= nil then 
            itemIDFound = Harvest.GetItemIDFromItemName(nodeName)
        end

        nameFound = Harvest.GetItemNameFromItemID(itemIDFound)
        if nameFound == nil then 
                Harvest.saveData("unlocalnode", newMapName, x, y, profession, nodeName, nil, nil, "reject" )
            return
        end
        if nodeName == nil and nameFound ~= nil then
            nodeName = nameFound
        elseif nodeName ~= nil and nameFound ~= nil then
            if nodeName ~= nameFound then
                nodeName = nameFound
            end
        end
    end
    
    local itemID
    if itemIDFound ~= nil then
        itemID = itemIDFound
    end

    local professionFound = 0
    professionFound = Harvest.GetProfessionTypeOnUpdate(nodeName) -- Get Profession by name only
    if professionFound <= 0 then
        professionFound = Harvest.GetProfessionType(itemID, nodeName)
    elseif professionFound <= 0 then
        professionFound = profession
    end
    if professionFound < 1 or professionFound > 8 then
        Harvest.saveData("rejected", newMapName, x, y, professionFound, nodeName, itemID, nil, "reject" )
        return
    end

    -- 1) type 2) map name 3) x 4) y 5) profession 6) nodeName 7) itemID 8) scale
    if not Harvest.IsValidContainerName(nodeName) then -- returns true or false
        if Harvest.CheckProfessionTypeOnImport(itemID, nodeName) then -- returns true or false no item Id number
            if not Harvest.savedVars["settings"].importFilters[ professionFound ] then
                Harvest.saveData("nodes", newMapName, x, y, professionFound, nodeName, itemID, nil, "valid" )
            else
                Harvest.NumNodesFiltered = Harvest.NumNodesFiltered + 1
            end
        else
            if not Harvest.savedVars["settings"].importFilters[ professionFound ] then
                Harvest.saveData("mapinvalid", newMapName, x, y, professionFound, nodeName, itemID, nil, "false" )
            else
                Harvest.NumNodesFiltered = Harvest.NumNodesFiltered + 1
            end
        end
    else
        Harvest.NumContainerSkipped = Harvest.NumContainerSkipped + 1
    end
end

function Harvest.oldMapItemIDHarvest(oldMapName, x, y, profession, nodeName, itemID)
    local itemIDFound
    local nameFound
    if not Harvest.IsValidContainerName(nodeName) then -- returns true or false
        if nodeName ~= nil then 
            itemIDFound = Harvest.GetItemIDFromItemName(nodeName)
        end

        nameFound = Harvest.GetItemNameFromItemID(itemIDFound)
        if nameFound == nil then 
                Harvest.saveData("unlocalnode", newMapName, x, y, profession, nodeName, nil, nil, "reject" )
            return
        end
        if nodeName == nil and nameFound ~= nil then
            nodeName = nameFound
        elseif nodeName ~= nil and nameFound ~= nil then
            if nodeName ~= nameFound then
                nodeName = nameFound
            end
        end
    end
    
    local itemID
    if itemIDFound ~= nil then
        itemID = itemIDFound
    end

    local professionFound = 0
    professionFound = Harvest.GetProfessionTypeOnUpdate(nodeName) -- Get Profession by name only
    if professionFound <= 0 then
        professionFound = Harvest.GetProfessionType(itemID, nodeName)
    elseif professionFound <= 0 then
        professionFound = profession
    end
    if professionFound < 1 or professionFound > 8 then
        Harvest.saveData("rejected", oldMapName, x, y, professionFound, nodeName, itemID, nil, "reject" )
        return
    end

    -- 1) type 2) map name 3) x 4) y 5) profession 6) nodeName 7) itemID 8) scale
    if not Harvest.IsValidContainerName(nodeName) then -- returns true or false
        if Harvest.CheckProfessionTypeOnImport(itemID, nodeName) then -- returns true or false no item Id number
            if not Harvest.savedVars["settings"].importFilters[ professionFound ] then
                Harvest.saveData("esonodes", oldMapName, x, y, professionFound, nodeName, itemID, nil, "nonvalid" )
            else
                Harvest.NumNodesFiltered = Harvest.NumNodesFiltered + 1
            end
        else
            if not Harvest.savedVars["settings"].importFilters[ professionFound ] then
                Harvest.saveData("esoinvalid", oldMapName, x, y, professionFound, nodeName, itemID, nil, "nonfalse" )
            else
                Harvest.NumNodesFiltered = Harvest.NumNodesFiltered + 1
            end
        end
    else
        Harvest.NumContainerSkipped = Harvest.NumContainerSkipped + 1
    end
end

function Harvest.importFromEsohead()
    Harvest.NumNodesAdded = 0
    Harvest.NumFalseNodes = 0
    Harvest.NumContainerSkipped = 0
    Harvest.NumNodesFiltered = 0
    Harvest.NumNodesProcessed = 0
    Harvest.NumUnlocalizedFalseNodes = 0
    Harvest.NumUnlocalizedNodesAdded = 0
    Harvest.NumRejectedNodes = 0

    if not EH then
        d("Please enable the Esohead addon to import data!")
        return
    end

    d("import data from Esohead")
    local profession
    local newMapName
    -- if not Harvest.oldData then
    --     Harvest.oldData = {}
    -- end

    -- Esohead "harvest" Profession designations
    -- 1 Mining
    -- 2 Clothing
    -- 3 Enchanting
    -- 4 Alchemy
    -- 5 Was Provisioning, moved to separate section in Esohead
    -- 6 Wood

    -- Additional HarvestMap Catagories
    -- 6 = Chest, 7 = Solvent, 8 = Fish

    local professionFound
    d("Import Harvest Nodes:")
    for map, data in pairs(EH.savedVars["harvest"].data) do
        d("import data from "..map)
        newMapName = Harvest.GetNewMapName(map)
        if newMapName then
            for index, nodes in pairs(data) do
                for _, node in pairs(nodes) do
                    Harvest.NumNodesProcessed = Harvest.NumNodesProcessed + 1
                    -- 1) map name 2) x 3) y 4) profession 5) nodeName 6) itemID
                    Harvest.newMapItemIDHarvest(newMapName, node[1], node[2], profession, node[4], node[5])
                end
            end
        else -- << New Map Name NOT found
            d(map .. " could not be localized.  Saving to oldData!")
            for index, nodes in pairs(data) do
                for v1, node in pairs(nodes) do
                    Harvest.NumNodesProcessed = Harvest.NumNodesProcessed + 1
                    -- 1) map name 2) x 3) y 4) profession 5) nodeName 6) itemID
                    Harvest.oldMapItemIDHarvest(map, node[1], node[2], profession, node[4], node[5])
                end
            end
        end
    end

    d("Import Chests:")
    for map, nodes in pairs(EH.savedVars["chest"].data) do
        d("import data from "..map)
        newMapName = Harvest.GetNewMapName(map)
        if newMapName then
            for _, node in pairs(nodes) do
                Harvest.NumNodesProcessed = Harvest.NumNodesProcessed + 1
                -- 1) map name 2) x 3) y 4) profession 5) nodeName 6) itemID
                Harvest.newMapNameFishChest("chest", newMapName, node[1], node[2])
            end
        else -- << New Map Name NOT found
            d(map .. " could not be localized.  Saving to oldData!")
            for v1, node in pairs(nodes) do
                Harvest.NumNodesProcessed = Harvest.NumNodesProcessed + 1
                -- 1) map name 2) x 3) y 4) profession 5) nodeName 6) itemID
                Harvest.oldMapNameFishChest("chest", map, node[1], node[2])
            end
        end
    end

    d("Import Fishing Holes:")
    for map, nodes in pairs(EH.savedVars["fish"].data) do
        d("import data from "..map)
        newMapName = Harvest.GetNewMapName(map)
        if newMapName then
            for _, node in pairs(nodes) do
                Harvest.NumNodesProcessed = Harvest.NumNodesProcessed + 1
                -- 1) map name 2) x 3) y 4) profession 5) nodeName 6) itemID
                Harvest.newMapNameFishChest("fish", newMapName, node[1], node[2])
            end
        else -- << New Map Name NOT found
            d(map .. " could not be localized.  Saving to oldData!")
            for v1, node in pairs(nodes) do
                Harvest.NumNodesProcessed = Harvest.NumNodesProcessed + 1
                -- 1) map name 2) x 3) y 4) profession 5) nodeName 6) itemID
                Harvest.oldMapNameFishChest("fish", map, node[1], node[2])
            end
        end
    end

    d("Number of nodes processed : " .. tostring(Harvest.NumNodesProcessed) )
    d("Number of nodes added : " .. tostring(Harvest.NumNodesAdded) )
    d("Number of nodes filtered : " .. tostring(Harvest.NumNodesFiltered) )
    d("Number of Containers skipped : " .. tostring(Harvest.NumContainerSkipped) )
    d("Number of False Nodes saved : " .. tostring(Harvest.NumFalseNodes) )
    d("Number of Unlocalized nodes saved : " .. tostring(Harvest.NumUnlocalizedNodesAdded) )
    d("Number of Unlocalized False Nodes saved : " .. tostring(Harvest.NumUnlocalizedFalseNodes) )
    -- d("Number of Rejected Nodes saved : " .. tostring(Harvest.NumRejectedNodes) )
    d("Finished.")
    Harvest.RefreshPins()
end

function Harvest.importFromEsoheadMerge()
    Harvest.NumNodesAdded = 0
    Harvest.NumFalseNodes = 0
    Harvest.NumContainerSkipped = 0
    Harvest.NumNodesFiltered = 0
    Harvest.NumNodesProcessed = 0
    Harvest.NumUnlocalizedFalseNodes = 0
    Harvest.NumUnlocalizedNodesAdded = 0
    Harvest.NumRejectedNodes = 0

    if not EHM then
        d("Please enable the EsoheadMerge addon to import data!")
        return
    end

    d("import data from EsoheadMerge")
    local profession
    local newMapName
    -- if not Harvest.oldData then
    --     Harvest.oldData = {}
    -- end

    -- Esohead "harvest" Profession designations
    -- 1 Mining
    -- 2 Clothing
    -- 3 Enchanting
    -- 4 Alchemy
    -- 5 Was Provisioning, moved to separate section in Esohead
    -- 6 Wood

    -- Additional HarvestMap Catagories
    -- 6 = Chest, 7 = Solvent, 8 = Fish

    local professionFound
    d("Import Harvest Nodes:")
    for map, data in pairs(EHM.savedVars["harvest"].data) do
        d("import data from "..map)
        newMapName = Harvest.GetNewMapName(map)
        if newMapName then
            for index, nodes in pairs(data) do
                for _, node in pairs(nodes) do
                    Harvest.NumNodesProcessed = Harvest.NumNodesProcessed + 1
                    -- 1) map name 2) x 3) y 4) profession 5) nodeName 6) itemID
                    Harvest.newMapItemIDHarvest(newMapName, node[1], node[2], profession, node[4], node[5])
                end
            end
        else -- << New Map Name NOT found
            d(map .. " could not be localized.  Saving to oldData!")
            for index, nodes in pairs(data) do
                for v1, node in pairs(nodes) do
                    Harvest.NumNodesProcessed = Harvest.NumNodesProcessed + 1
                    -- 1) map name 2) x 3) y 4) profession 5) nodeName 6) itemID
                    Harvest.oldMapItemIDHarvest(map, node[1], node[2], profession, node[4], node[5])
                end
            end
        end
    end

    d("Import Chests:")
    for map, nodes in pairs(EHM.savedVars["chest"].data) do
        d("import data from "..map)
        newMapName = Harvest.GetNewMapName(map)
        if newMapName then
            for _, node in pairs(nodes) do
                Harvest.NumNodesProcessed = Harvest.NumNodesProcessed + 1
                -- 1) map name 2) x 3) y 4) profession 5) nodeName 6) itemID
                Harvest.newMapNameFishChest("chest", newMapName, node[1], node[2])
            end
        else -- << New Map Name NOT found
            d(map .. " could not be localized.  Saving to oldData!")
            for v1, node in pairs(nodes) do
                Harvest.NumNodesProcessed = Harvest.NumNodesProcessed + 1
                -- 1) map name 2) x 3) y 4) profession 5) nodeName 6) itemID
                Harvest.oldMapNameFishChest("chest", map, node[1], node[2])
            end
        end
    end

    d("Import Fishing Holes:")
    for map, nodes in pairs(EHM.savedVars["fish"].data) do
        d("import data from "..map)
        newMapName = Harvest.GetNewMapName(map)
        if newMapName then
            for _, node in pairs(nodes) do
                Harvest.NumNodesProcessed = Harvest.NumNodesProcessed + 1
                -- 1) map name 2) x 3) y 4) profession 5) nodeName 6) itemID
                Harvest.newMapNameFishChest("fish", newMapName, node[1], node[2])
            end
        else -- << New Map Name NOT found
            d(map .. " could not be localized.  Saving to oldData!")
            for v1, node in pairs(nodes) do
                Harvest.NumNodesProcessed = Harvest.NumNodesProcessed + 1
                -- 1) map name 2) x 3) y 4) profession 5) nodeName 6) itemID
                Harvest.oldMapNameFishChest("fish", map, node[1], node[2])
            end
        end
    end

    d("Number of nodes processed : " .. tostring(Harvest.NumNodesProcessed) )
    d("Number of nodes added : " .. tostring(Harvest.NumNodesAdded) )
    d("Number of nodes filtered : " .. tostring(Harvest.NumNodesFiltered) )
    d("Number of Containers skipped : " .. tostring(Harvest.NumContainerSkipped) )
    d("Number of False Nodes saved : " .. tostring(Harvest.NumFalseNodes) )
    d("Number of Unlocalized nodes saved : " .. tostring(Harvest.NumUnlocalizedNodesAdded) )
    d("Number of Unlocalized False Nodes saved : " .. tostring(Harvest.NumUnlocalizedFalseNodes) )
    -- d("Number of Rejected Nodes saved : " .. tostring(Harvest.NumRejectedNodes) )
    d("Finished.")
    Harvest.RefreshPins()
end

function Harvest.importFromHarvester()
    Harvest.NumNodesAdded = 0
    Harvest.NumFalseNodes = 0
    Harvest.NumContainerSkipped = 0
    Harvest.NumNodesFiltered = 0
    Harvest.NumNodesProcessed = 0
    Harvest.NumUnlocalizedFalseNodes = 0
    Harvest.NumUnlocalizedNodesAdded = 0
    Harvest.NumRejectedNodes = 0

    if not Harvester then
        d("Please enable the Harvester addon to import data!")
        return
    end

    d("import data from Harvester")
    local profession
    local newMapName
    -- if not Harvest.oldData then
    --     Harvest.oldData = {}
    -- end

    -- Esohead "harvest" Profession designations
    -- 1 Mining
    -- 2 Clothing
    -- 3 Enchanting
    -- 4 Alchemy
    -- 5 Was Provisioning, moved to separate section in Esohead
    -- 6 Wood

    -- Additional HarvestMap Catagories
    -- 6 = Chest, 7 = Solvent, 8 = Fish

    local professionFound
    d("Import Harvest Nodes:")
    for map, data in pairs(Harvester.savedVars["harvest"].data) do
        d("import data from "..map)
        newMapName = Harvest.GetNewMapName(map)
        if newMapName then
            for index, nodes in pairs(data) do
                for _, node in pairs(nodes) do
                    Harvest.NumNodesProcessed = Harvest.NumNodesProcessed + 1
                    -- 1) map name 2) x 3) y 4) profession 5) nodeName 6) itemID
                    Harvest.newMapItemIDHarvest(newMapName, node[1], node[2], profession, node[4], node[5])
                end
            end
        else -- << New Map Name NOT found
            d(map .. " could not be localized.  Saving to oldData!")
            for index, nodes in pairs(data) do
                for v1, node in pairs(nodes) do
                    Harvest.NumNodesProcessed = Harvest.NumNodesProcessed + 1
                    -- 1) map name 2) x 3) y 4) profession 5) nodeName 6) itemID
                    Harvest.oldMapItemIDHarvest(map, node[1], node[2], profession, node[4], node[5])
                end
            end
        end
    end

    d("Import Chests:")
    for map, nodes in pairs(Harvester.savedVars["chest"].data) do
        d("import data from "..map)
        newMapName = Harvest.GetNewMapName(map)
        if newMapName then
            for _, node in pairs(nodes) do
                Harvest.NumNodesProcessed = Harvest.NumNodesProcessed + 1
                -- 1) map name 2) x 3) y 4) profession 5) nodeName 6) itemID
                Harvest.newMapNameFishChest("chest", newMapName, node[1], node[2])
            end
        else -- << New Map Name NOT found
            d(map .. " could not be localized.  Saving to oldData!")
            for v1, node in pairs(nodes) do
                Harvest.NumNodesProcessed = Harvest.NumNodesProcessed + 1
                -- 1) map name 2) x 3) y 4) profession 5) nodeName 6) itemID
                Harvest.oldMapNameFishChest("chest", map, node[1], node[2])
            end
        end
    end

    d("Import Fishing Holes:")
    for map, nodes in pairs(Harvester.savedVars["fish"].data) do
        d("import data from "..map)
        newMapName = Harvest.GetNewMapName(map)
        if newMapName then
            for _, node in pairs(nodes) do
                Harvest.NumNodesProcessed = Harvest.NumNodesProcessed + 1
                -- 1) map name 2) x 3) y 4) profession 5) nodeName 6) itemID
                Harvest.newMapNameFishChest("fish", newMapName, node[1], node[2])
            end
        else -- << New Map Name NOT found
            d(map .. " could not be localized.  Saving to oldData!")
            for v1, node in pairs(nodes) do
                Harvest.NumNodesProcessed = Harvest.NumNodesProcessed + 1
                -- 1) map name 2) x 3) y 4) profession 5) nodeName 6) itemID
                Harvest.oldMapNameFishChest("fish", map, node[1], node[2])
            end
        end
    end

    d("Number of nodes processed : " .. tostring(Harvest.NumNodesProcessed) )
    d("Number of nodes added : " .. tostring(Harvest.NumNodesAdded) )
    d("Number of nodes filtered : " .. tostring(Harvest.NumNodesFiltered) )
    d("Number of Containers skipped : " .. tostring(Harvest.NumContainerSkipped) )
    d("Number of False Nodes saved : " .. tostring(Harvest.NumFalseNodes) )
    d("Number of Unlocalized nodes saved : " .. tostring(Harvest.NumUnlocalizedNodesAdded) )
    d("Number of Unlocalized False Nodes saved : " .. tostring(Harvest.NumUnlocalizedFalseNodes) )
    -- d("Number of Rejected Nodes saved : " .. tostring(Harvest.NumRejectedNodes) )
    d("Finished.")
    Harvest.RefreshPins()
end

function Harvest.importFromHarvestMerge()
    Harvest.NumNodesAdded = 0
    Harvest.NumFalseNodes = 0
    Harvest.NumContainerSkipped = 0
    Harvest.NumNodesFiltered = 0
    Harvest.NumNodesProcessed = 0
    Harvest.NumUnlocalizedFalseNodes = 0
    Harvest.NumUnlocalizedNodesAdded = 0
    Harvest.NumRejectedNodes = 0

    if not HarvestMerge then
        d("Please enable the HarvestMerge addon to import data!")
        return
    end

    if HarvestMerge.internal.internalVersion < 3 then
        d("Please upgrade to HarvestMerge 0.2.2 or newer to import data!")
        return
    end
    d("import data from HarvestMerge")
    for newMapName, data in pairs(HarvestMerge.savedVars["nodes"].data) do
        for profession, nodes in pairs(data) do
            for index, node in pairs(nodes) do
                Harvest.NumNodesProcessed = Harvest.NumNodesProcessed + 1
                for contents, nodeName in ipairs(node[3]) do

                    if (nodeName) == "chest" or (nodeName) == "fish" then
                        Harvest.newMapNameFishChest(nodeName, newMapName, node[1], node[2])
                    elseif node[4] == nil then
                        Harvest.newMapNilItemIDHarvest(newMapName, node[1], node[2], profession, nodeName)
                    elseif node[4] ~= nil then -- node[4] which is the ItemID should not be nil at this point
                        Harvest.newMapItemIDHarvest(newMapName, node[1], node[2], profession, nodeName, node[4])
                    else
                        d("I didn't know what to do with the node")
                    end

                end
            end
        end
    end

    d("Number of nodes processed : " .. tostring(Harvest.NumNodesProcessed) )
    d("Number of nodes added : " .. tostring(Harvest.NumNodesAdded) )
    d("Number of nodes filtered : " .. tostring(Harvest.NumNodesFiltered) )
    -- d("Number of Rejected Nodes saved : " .. tostring(Harvest.NumRejectedNodes) )
    d("Finished.")
    Harvest.RefreshPins()
end
