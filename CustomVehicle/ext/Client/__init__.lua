class 'CustomVehicleClient'


function CustomVehicleClient:__init()
	print("Initializing CustomVehicleClient")
	self:RegisterVars()
	self:RegisterEvents()
end


function CustomVehicleClient:RegisterVars()
	--self.m_this = that
end


function CustomVehicleClient:RegisterEvents()
	self.m_PartitionLoadedEvent = Events:Subscribe('Partition:Loaded', self, self.OnPartitionLoaded)
end


function CustomVehicleClient:OnPartitionLoaded(p_Partition)
	if p_Partition == nil then
		return
	end
	
	local s_Instances = p_Partition.instances


	for _, l_Instance in ipairs(s_Instances) do
		if l_Instance == nil then
			print('Instance is null?')
			break
		end
		if(l_Instance.typeInfo.name == "SomeType") then
			local s_Instance = SomeType(l_Instance:Clone(l_Instance.instanceGuid))
			s_Instance.someThing = 1
			p_Partition:ReplaceInstance(l_Instance, s_Instance, true)
		end
		if(l_Instance.instanceGuid == Guid("SomeGuid")) then
			local s_Instance = SomeType(l_Instance:Clone(l_Instance.instanceGuid))
			s_Instance.someThing = 1
			p_Partition:ReplaceInstance(l_Instance, s_Instance, true)
		end
	end
end


g_CustomVehicleClient = CustomVehicleClient()

