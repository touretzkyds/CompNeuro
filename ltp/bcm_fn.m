function phi = bcm_fn(y_B)

  global bcm_flag bcm_theta

  bcm_flag = 1;

  phi = -sin(pi*min(y_B/bcm_theta,1.5));

  bcm_theta = 0.93*bcm_theta + 0.07*y_B^2;
