function findNearestEntity(entities, position, max_distance, l)
	local closest_entity = nil
	local closest_distance = -1
	for i=1, #entities do
		local x_dist = entities[i].position.x - position.x
		local y_dist = entities[i].position.y - position.y
        l:log("x_dist: " .. x_dist)
        l:log("y_dist: " .. y_dist)

		local dist_squared = (x_dist * x_dist) + (y_dist * y_dist)
        l:log("dist_squared: " .. dist_squared)

		if dist_squared < closest_distance or closest_distance == -1 then
			closest_entity = entities[i]
			closest_distance = dist_squared
		end
	end
	if closest_distance < max_distance then
        l:log("Closest distance: " .. closest_distance)
		return closest_entity
	else
		return nil
	end
end

function findEntitiesInGeneratedChunks(nameList)
	local entityList = {}
	for chunk in game.get_surface(1).get_chunks()
	do
		if game.get_surface(1).is_chunk_generated(chunk)
		then
			for i=1, #nameList
			do
				local temp = game.get_surface(1).find_entities_filtered({area = chunkArea(chunk), name = nameList[i]})
				entityList = mergeTables(entityList, temp)
			end
		end
	end
	return entityList
end

function chunkArea(chunk)
	position1 = {x = chunk.x*32, y = chunk.y*32}
	position2 = {x = chunk.x*32+32, y = chunk.y*32+32}
	area = {lefttop = position1, rightbottom = position2}
	return area
end

function mergeTables(table1, table2)
	newTable = table1
	for i=1, #table2
	do
		table.insert(newTable, table2[i])
	end
	return newTable
end
