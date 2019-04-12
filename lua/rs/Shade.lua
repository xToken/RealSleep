-- lua/rs/Shade.lua

if Server then

    -- SHADE
    local originalShadeOnInitialized = Shade.OnInitialized
    function Shade:OnInitialized()
        originalShadeOnInitialized(self)
        InitMixin(self, SleeperMixin)
    end

    function Shade:GetCanSleep()
        return not self.moving and self:GetIsBuilt() and not self:GetHasOrder() and self:GetIsAlive() and not self.isRepositioning
    end

    function Shade:OnOrderGiven(order)
        if order then
            self:WakeUp()
        end
    end
    -- END SHADE

end