-- MAKE YOUR ADJUSTMENTS HERE
branch = {amount = 1, 	-- the amount of "branch-pairs"
	  length = 16,	-- the length of each branch
	  space  = 5,
	  height = 10}	-- the space between each branch-pair
slot = {fuel  = 1,	-- the slotnumber for fuel
	torch = 2,	-- the slotnumber for torches
	fill  = 3}	-- the slotnumber for filling material
other = {torch = true,  -- place torches? (true=yes/false=no)
         close = false}  -- close the branches? (true=yes/false=no)
-- END OF ADJUSTMENTS

function main()
	while true do
		turtle.up(branch.height)
		for i=1, branch.heigth, 1 do
		 for i=1, branch.amount, 1 do
		  refuel(1+(branch.space+branch.length*4)/96)
		  turtle.up()
		  forward(branch.length)
		  turtle.down()
		  back(branch.length)
		 end
		 turtle.down()
		 end
		 sleep(10)
	end
end

function forward(length)
 for i=1, length, 1 do
	turnLeft()
  while turtle.detect() do
   turtle.dig()
   sleep(0.5)
  end
  turnAround()
  while turtle.detect() do
   turtle.dig()
   sleep(0.5)
  end
  turnLeft()
  turtle.forward()
 end
end

-- TurtleAPI

function refuel(amount)
 if turtle.getFuelLevel() == "unlimited" then return end
 if turtle.getFuelLevel() < 96*amount then
  turtle.select(slot.fuel)
  turtle.refuel(amount)
 end
end

function back(length)
 for i=1, length, 1 do
  -- if i==9 then torch() end --places a torch after the first 8 blocks and
  -- if (i-8)%16==0 and i>9 then torch() end --then another every 16 blocks  -- if i==9 then torch() end --places a torch after the first 8 blocks and
  -- if (i-8)%16==0 and i>9 then torch() end --then another every 16 blocks
  turtle.back()
  if i==length-1 and other.close then --closes the branch 
   turtle.select(slot.fill)
   turtle.placeUp()
  end
 end
end

function turnLeft()
 turtle.turnLeft()
end

function turnRight()
 turtle.turnRight()
end

function turnAround()
 turtle.turnRight()
 turtle.turnRight()
end

function torch()
 if other.torch then
  turtle.select(slot.torch)
  turtle.place()
 end
end

main()
