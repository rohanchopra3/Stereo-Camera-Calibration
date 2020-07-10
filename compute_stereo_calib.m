function [Kl,Tl,Kr,Tr] = compute_stereo_calib(P,pl,pr)
    
    n = size(pl,1);
    
    L = zeros(2*n,11);
    M = zeros(2*n,1);
    
    a1 = pl(:,1);
    a2 = pl(:,2);
    a3 = P(:,1);
    a4 = P(:,2);
    a5 = P(:,3);
    for i = 1:n
		j = 2 * i;
        M(j-1,1)= a1(i);
 		M(j, 1)= a2(i);
		L(j- 1,:) = [a3(i),a4(i), a5(i), 1, 1, 1, 1, 0,-a1(i)*a3(i), -a1(i)*a4(i), -a1(i)*a5(i)];
		L(j,:) = [1, 1, 1, 1, a3(i), a4(i), a5(i), 1,-a2(i)*a3(i), -a2(i)*a4(i), -a2(i)*a5(i)];
    end
    p = ([L\M;1])';
	Tl = [p(1:4); p(5:8); p(9:12)];
    n = size(pr,1);
    
    L = zeros(2*n,11);
    M = zeros(2*n,1);
    
    a1 = pr(:,1);
    a2 = pr(:,2);
    a3 = P(:,1);
    a4 = P(:,2);
    a5 = P(:,3);
    for i = 1:n
		j = 2 * i;
        M(j-1,1)= a1(i);
 		M(j, 1)= a2(i);
		L(j- 1,:) = [a3(i),a4(i), a5(i), 1, 1, 1, 1, 0,-a1(i)*a3(i), -a1(i)*a4(i), -a1(i)*a5(i)];
		L(j,:) = [1, 1, 1, 1, a3(i), a4(i), a5(i), 1,-a2(i)*a3(i), -a2(i)*a4(i), -a2(i)*a5(i)];
    end
    p = ([L\M;1])';
	Tr = [p(1:4); p(5:8); p(9:12)];
    
    Kl = Tl(1:3,1:3);
    Kr = Tr(1:3,1:3);
end

