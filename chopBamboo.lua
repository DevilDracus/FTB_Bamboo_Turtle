-- MAKE YOUR ADJUSTMENTS HERE
branch = {amount = 1, 	-- the amount of "branch-pairs"
	  length = 16,	-- the length of each branch
	  space  = 5,
	  height = 4}	-- the space between each branch-pair
slot = {fuel  = 1,	-- the slotnumber for fuel
	torch = 2}
other = {torch = true,  -- place torches? (true=yes/false=no)
         close = false,
	hasFuel = false}  -- close the branches? (true=yes/false=no)
-- END OF ADJUSTMENTS

function main()
	while true do
		refuel(1+(branch.height*branch.length*4)/96)
		up(branch.height)
		for i=1, branch.height, 1 do		  
		 forward(branch.length)
		 turtle.down()
		 --back(branch.length)
		turnAround()
		 end
		while turtle.detectDown() == false do
		 turtle.down()
		end
		dropLoot()
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
  turtle.refuel()
 end
end
function back(length)
 for i=1, length, 1 do
  turtle.back()
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

function up(height)
 for i=1, height, 1 do
	turtle.up()
end
end

function torch()
 if other.torch then
  turtle.select(slot.torch)
  turtle.place()
 end
end

function dropLoot()
	turnAround()
	if turtle.detect() then
		for i=2, 16, 1 do
			turtle.select(i)
			turtle.drop()
		end
	end
	turnAround()
end

main()
