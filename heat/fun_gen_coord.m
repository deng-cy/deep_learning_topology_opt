function [coords,coords_jacob]=fun_gen_coord(nx,ny,l)
% generates the coordinates and jacobian matrix for the mesh
coords=zeros(nx,ny,2);
coords_jacob=zeros(nx,ny);
for i=1:nx
    for j=1:ny
        theta=(i-1)/(nx-1)*pi/4; % angle from vertical line
        len= sec(theta)*l-l/2; % length from circle to line
        alpha=1/(ny-1)*(j-1); %ratio of d(point to circle) to len 
        dis =len*alpha+l/2; % radius from the origin
        coords(i,j,1)=dis*sin(theta);
        coords(i,j,2)=dis*cos(theta);
        % calculate the jacobian matrix of
        % \partial(x,y)/\partial(alpha,theta), equal to integration weight
        coords_jacob(i,j)=-(l*(cos(theta) - 2)*(l*cos(theta)^3 + 2*alpha*l*cos(theta)^2 - alpha*l*cos(theta)^3+ 2*alpha*l*sin(theta)^2 + l*cos(theta)*sin(theta)^2 - alpha*l*cos(theta)*sin(theta)^2))/(4*cos(theta)^2);

    end
end
coords_jacob(1,:)=coords_jacob(1,:)/2;
coords_jacob(end,:)=coords_jacob(end,:)/2;
coords_jacob(:,1)=coords_jacob(:,1)/2;
coords_jacob(:,end)=coords_jacob(:,end)/2;
% coords_jacob is unnormalized
end

