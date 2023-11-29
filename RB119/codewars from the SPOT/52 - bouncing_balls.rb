=begin
Difficulty: ___

A child is playing with a ball on the nth floor of a tall building. The height 
of this floor, h, is known.

He drops the ball out of the window. The ball bounces (for example), to 
two-thirds of its height (a bounce of 0.66).

His mother looks out of a window 1.5 meters from the ground.

How many times will the mother see the ball pass in front of her window (including 
when it's falling and bouncing?

Three conditions must be met for a valid experiment:
- Float parameter "h" in meters must be greater than 0
- Float parameter "bounce" must be greater than 0 and less than 1
- Float parameter "window" must be less than h.

If all three conditions above are fulfilled, return a positive integer, otherwise return -1.

Note:
- The ball can only be seen if the height of the rebounding ball is strictly greater than the window parameter.

Example:

- h = 3, bounce = 0.66, window = 1.5, result is 3

- h = 3, bounce = 1, window = 1.5, result is -1 
(Condition 2) not fulfilled).


input: an integer (height), a float (height of ball bounce), a float (window __ meters from ground)
output: a positive integer (# times mother sees ball pass in front of window) or -1

RULES
- Given 3 parameters, height of floor, % of ball bounce height, height of window
- 3 conditions must be met for a valid experiment
  - h (in meters) must be greater than 0
  - bounce must be greater than 0 and less than 1
  - window must be less than h
    (h > 0) && (1 > bounce > 0) && (window < h)
- Return positive integer if all 3 conditions fulfilled
  - otherwise return -1

ALGORITHM
- Given 3 parameters: height of floor, bounce ratio, and window height
- return -1 if !(h > 0) OR !(1 >= bounce >= 0) OR !(window < h)
- Create a variable bounce_count and set it to 1
- While height is greater than window
  - Get new height by multiplying height with bounce
  - Increment bounce_count by 2 if new height is greater than window height (keep in mind can see bounce twice)
- Return bounce_count

=end

def bouncingBall(height, bounce, window)
  return -1 if !(height > 0) || bounce <= 0 || bounce >= 1 || !(window < height)

  bounce_count = 1

  while height > window
    height = height * bounce
    bounce_count += 2 if height > window
  end

  bounce_count
end

p bouncingBall(3, 0.66, 1.5) #== 3
p bouncingBall(30, 0.66, 1.5) #== 15
p bouncingBall(30, 0.75, 1.5) #== 21
p bouncingBall(30, 0.4, 10) #== 3
p bouncingBall(40, 1, 10) #== -1
p bouncingBall(-5, 0.66, 1.5) #== -1
p bouncingBall(1, 0.66, 0.66) #== 1
p bouncingBall(1, 0.66, 1) #== -1
