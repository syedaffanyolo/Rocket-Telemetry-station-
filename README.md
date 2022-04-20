# post-flight-rocket-orientation-viewer-software
  3D projection and orientation representation of a rocket's gyro measurements using quaternions
  
  bugs to fix 
  
1) small axis rotations in software compared to irl.
    - elapsed time "variable named 'c'" seems to the root cause to make the movements small.
    - movemnets become normal and as expected if elapsed time is omitted form the theta equation i.e theta = mag * c => theta = mag.
2) overshoot of angles.
    - this problem is deduced and found in the main data file itself. irl the angles goes from for example 0deg - 70 deg and back to 0deg. logged data shows 0deg - 70deg - (-70deg) - 0 deg.
    - pattern noticed that the overshooting angle is closely similar to the angle pitched/yaw.
    - this bug can be deduced and solved better with more plotted sims with a FC.
