-- lua/rs/LOSMixin.lua

if Server then

    local UpdateLOS = debug.getupvaluex(LOSMixin.__initmixin, "UpdateLOS")
    local SharedUpdate = debug.getupvaluex(LOSMixin.OnUpdate, "SharedUpdate")
    local MarkNearbyDirty = debug.getupvaluex(SharedUpdate, "MarkNearbyDirty")
    local UpdateSelfSighted = debug.getupvaluex(SharedUpdate, "UpdateSelfSighted")
    local LookForEnemies = debug.getupvaluex(SharedUpdate, "LookForEnemies")
    local kLOSTimeout = debug.getupvaluex(SharedUpdate, "kLOSTimeout")

    function LOSMixin:__initmixin()
        
        PROFILE("LOSMixin:__initmixin")
        
        if Server then
        
            self.sighted = false
            self.lastTimeLookedForEnemies = 0
            self.updateLOS = true
            self.timeLastLOSUpdate = 0
            self.dirtyLOS = true
            self.timeLastLOSDirty = 0
            self.prevLOSorigin = Vector(0,0,0)
        
            self:SetIsSighted(false)
            UpdateLOS(self)
            self.oldSighted = true
            self.lastViewerId = Entity.invalidId

            if self.AddTimedCallback then
                self:AddTimedCallback(LOSMixin.PeriodicUpdate, 0.2)
            end
            
        end
        
    end

    function LOSMixin:PeriodicUpdate()
        self:SharedUpdate()
        return self.GetIsAlive and self:GetIsAlive() or true
    end

    function LOSMixin:SharedUpdate()

        PROFILE("LOSMixin:SharedUpdate")
        
        local now = Shared.GetTime()
        if self.dirtyLOS and self.timeLastLOSDirty + 0.2 < now then
        
            MarkNearbyDirty(self)
            self.dirtyLOS = false
            self.timeLastLOSDirty = now
            
        end
        
        if self.updateLOS and self.timeLastLOSUpdate + 0.2 < now then
        
            UpdateSelfSighted(self)
            LookForEnemies(self)
            
            self.updateLOS = false
            self.timeLastLOSUpdate = now
            
        end
        
        if self.oldSighted ~= self.sighted then
        
            if self.sighted then
            
                UpdateLOS(self)
                self.timeUpdateLOS = nil
                
            else
                self.timeUpdateLOS = Shared.GetTime() + kLOSTimeout
            end
            
            self.oldSighted = self.sighted
            
        end
        
        if self.timeUpdateLOS and self.timeUpdateLOS < Shared.GetTime() then
        
            UpdateLOS(self)
            self.timeUpdateLOS = nil
            
        end

        return false
        
    end

    LOSMixin.OnUpdate = nil
    LOSMixin.OnProcessMove = nil

    function LOSMixin:SetIsSighted(sighted, viewer)

        PROFILE("LOSMixin:SetIsSighted")
        
        self.sighted = sighted
        
        if viewer then
        
            if not HasMixin(viewer, "LOS") then
                error(string.format("%s: %s added as a viewer without having LOS mixin", ToString(self), ToString(viewer)))
            end
            
            self.lastViewerId = viewer:GetId()
            
        end

        -- Run update immediately after
        if self.AddTimedCallback then
            self:AddTimedCallback(LOSMixin.SharedUpdate, 0)
        end
        
    end

end