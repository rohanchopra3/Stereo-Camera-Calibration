function disp = compute_corrs(img_left, img_right,method )


    img_left =  double(rgb2gray(img_left));
    img_right =  double(rgb2gray(img_right));
    dispvalue = 50;        
    winSize = 15;
    win = (winSize-1)/2;

    minD = 0.0;

    disp = zeros(size(img_left,1), size(img_left,2));
    tic();
    for i = 1+win:size(img_left,1)-win
        for j = 1+win:size(img_left,2)-win-dispvalue
           
            if method == "SSD"
                minssd = 65535;
                val = minD;
                for dispRange = minD:dispvalue
                    ssd=0.0;
                    t = -win:win;
                    if (j+win+dispRange <= size(img_left,2))
                        a = img_right(i+t,j+t)-img_left(i+t,j+t+dispRange);
                        a = a.^2;
                    ssd = sum(sum(a));
                    end
                    if (minssd > ssd)
                        minssd = ssd;
                        val = dispRange;
                    end
                end
               
                
            elseif method == "NCC"  
                maxCorr = 0.0;
                val = minD;
                for dispRange = minD:dispvalue
                    t = -win:win;
                    Correl=sum(sum(img_right(i+t,j+t).*img_left(i+t,j+t+dispRange)))/sqrt((sum(sum(img_right(i+t,j+t).*img_right(i+t,j+t))))*(sum(sum(img_left(i+t,j+t+dispRange).*img_left(i+t,j+t+dispRange)))));

                     if (maxCorr < Correl)
                        maxCorr = Correl;
                        val = dispRange;
                    end
                end
             elseif method =="CC"
                    maxCorr = 0.0;
                val = minD;
                for dispRange = minD:dispvalue
                    t = -win:win;
                    Correl=sum(sum(img_right(i+t,j+t).*img_left(i+t,j+t+dispRange)));

                     if (maxCorr < Correl)
                        maxCorr = Correl;
                        val = dispRange;
                    end
                end 
             end
            disp(i,j) = val;
        end
        
    if mod(i, 10) == 0
		fprintf(' %d / %d (%.0f%%)\n', i, size(img_left,1), (i / size(img_left,1)) * 100);
    end 
    
    end
    timeElapsed = toc();
    fprintf('Calculating disparity map took %.2f min.\n', timeElapsed / 60.0);
end