local WAIT_PERIOD = 0.5; -- approx. 500 milliseconds

function action(draginfo)
  if lastInvokeTime == nil or (os.clock() - lastInvokeTime > WAIT_PERIOD) then
    lastInvokeTime = os.clock();
    super.action(draginfo);
  end
end

function onButtonPress()
  action();
end

function onDragStart(button, x, y, draginfo)
  action(draginfo);
  return true;
end
