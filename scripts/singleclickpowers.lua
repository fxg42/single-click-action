--
--	Please see the LICENSE.md file included with this distribution for attribution and copyright information.
--

local WAIT_PERIOD = 0.5; -- approx. 500 milliseconds
local lastInvokeTime = nil;

local performPCPowerAction_old = nil;
local function performPCPowerAction_new(draginfo, nodeAction, sSubRoll)
	local currentTime = os.clock();
	if performPCPowerAction_old and (lastInvokeTime == nil or (currentTime - lastInvokeTime > WAIT_PERIOD)) then
		lastInvokeTime = currentTime;
		performPCPowerAction_old(draginfo, window.getDatabaseNode());
	end
end

function onInit()
	performPCPowerAction_old = PowerManager.performPCPowerAction;
	PowerManager.performPCPowerAction = performPCPowerAction_new;
end

function onClose()
	PowerManager.performPCPowerAction = performPCPowerAction_old;
end
