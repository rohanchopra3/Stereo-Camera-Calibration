function [P] = get_world_points( x1, p1, x2, p2 )
P = zeros(4,size(p1,1));

for i=1:size(p1,1)
	A = [p1(i,2).* x1(3,:) - x1(2,:);
        x1(1,:) - p1(i,1).*(x1(3,:));
        p2(i,2).*x2(3,:) - x2(2,:); 
        x2(1,:) - p2(i,1).*(x2(3,:))];
	[s,d,V] = svd(A);
	val = V(:,end);
	P(:,i) =  val/ val(4);
end

end

