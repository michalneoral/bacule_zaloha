[ timeOfStart, startPos ] = findTimeOfStartMove( msgs );
frontOfRGB=makeFrontOfRGB(msgs);
maskFrontOfRGB =maskReferenceFrame(frontOfRGB,rgb_back,15);
[ centerOfFabric ] = findCenterOfFabric( maskFrontOfRGB ); 
[ struct_points ] = makePointsFromCenter( centerOfFabric, 20, timeOfStart);
