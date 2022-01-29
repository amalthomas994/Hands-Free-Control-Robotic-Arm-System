if ~isempty(instrfind)
     fclose(instrfind);
      delete(instrfind);
end
a = arduino()
getAccelerationX()