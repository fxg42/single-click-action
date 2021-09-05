function onInit()
  local WAIT_PERIOD = 0.5; -- approx. 500 milliseconds
  PowerManager.performPCPowerAction = debounce(PowerManager.performPCPowerAction, WAIT_PERIOD);
end

function debounce(subjectFn, waitPeriod)
  local lastInvokeTime = nil;
  return function(...)
    if lastInvokeTime == nil or (os.clock() - lastInvokeTime > waitPeriod) then
      lastInvokeTime = os.clock();
      return subjectFn(...);
    end
  end
end