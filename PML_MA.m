function model = PML_MA(train_data,train_target,opt)
%Feature-Label Modal Alignment for Robust Partial Multi-Label Learning.
warning('off');
rng('default')
lambda = opt.lambda;
alpha = opt.alpha;
beta = opt.beta;
gamma = opt.gamma;
max_iter = opt.max_iter;

model = [];

[~,d]=size(train_data);
[~,c]=size(train_target);

%% Training
X = train_data;
Y = train_target;
R = Y;
m = min(d,c);
P1 = randn(d,m);
P2 = randn(c,m);
V   = (X' * R) ./ sum(R, 1);   
Q = eye(c);
D = diag(sum(R,2));
S = opt.S;
Ds = opt.Ds;
miniLossMargin = 1e-4;
tic;
loss(1) = norm(X*P1-R*P2,'fro')^2+norm(Y-R*Q','fro')^2+lambda*trace(sqrt(R'*R))+alpha*trace(P1'*X'*Ds*(X*P1) + P2'*R'*Ds*R*P2-2*P1'*X'*S*R*P2)+beta*norm(X'*D-V*R','fro')^2+gamma*norm(P2*P1','fro')^2;
for ii = 1:max_iter
 
    %% update P2
    A2 = R'*(R + alpha*Ds*R);
    B2 = gamma*(P1')*P1;
    C2 = R'*(X*P1 - alpha*S*X*P1);   
    P2 = mysylvester(A2,B2,C2);
    [U_P,~,V_P] = svd(P2,"econ");
    P2 = U_P*V_P';
    clear A2 B2 C2 U_P V_P
    
    %% update P1   
    A1 = X'*(X + alpha*Ds*X);
    B1 = gamma*(P2')*P2;
    C1 = X'*(R*P2 + alpha*S*R*P2);
    P1 = mysylvester(A1,B1,C1);
    clear A1 B1 C1

   

    %% update V
    V = (X' * R) ./ sum(R, 1); 

    %% update Q
    [U_Q,~,V_Q] = svd((R')*Y,"econ");
    Q = U_Q*(V_Q');
    clear U_Q V_Q 

    %% update R
    Lipschitz = 2*norm(P2*(P2') + Q'*Q + beta*(V')*V,'fro') + alpha*max(max(Ds));
    fR = 2*(R*P2*(P2') - X*P1*(P2') + R*(Q')*Q - 2*Y*Q + alpha*Ds*R*P2*(P2') - alpha*S*X*P1*(P2')  + beta*R*(V')*V -beta*D*X*V);
    Z = R - (1/Lipschitz)*fR;
    [U_Z,SS_Z,V_Z] = svd(Z,'econ');   
    sp = diag(SS_Z);   
    svp = length(find(sp>lambda/Lipschitz));    
    if svp>=1
       sp = sp(1:svp)-lambda/Lipschitz;
    else
       svp=1;
       sp=0;
    end
    Rhat =  U_Z(:,1:svp)*diag(sp)*V_Z(:,1:svp)' ;    
    seita = max(R-Y,0);
    RA = R + eps;
    RB = Rhat;
    RC = seita.*Y;
    R = R.*(RB)./(RA)-RC./RA;

    %% update D
    D = diag(sum(R,2));

    %%
    
    loss(ii+1) = norm(X*P1-R*P2,'fro')^2+norm(Y-R*Q','fro')^2+lambda*trace(sqrt(R'*R))+alpha*trace(P1'*X'*Ds*(X*P1) + P2'*R'*Ds*R*P2-2*P1'*X'*S*R*P2)+beta*norm(X'*D-V*R','fro')^2+gamma*norm(P2*P1','fro')^2;

    if ii>2
        temp_loss = (loss(ii-1) - loss(ii))/loss(ii-1); 
        if temp_loss<miniLossMargin
            break;
        end
    end
    time = toc;
    

end
model.W = P1*(P2');
model.loss = loss;
model.R = R;
model.time = time;
end





function X = mysylvester(A,B,C)
%         Solve the equation A*X + X*B = C 
A = (A + A') / 2;
B = (B + B') / 2;
[QA, dA] = eig(A, 'vector');
[QB, dB] = eig(B, 'vector');
CC = QA'*C*QB;
tmp = dA + dB';
idx = find(abs(tmp) <= 0.00001);
tmp(idx) = inf;
X = CC ./ tmp;
X = QA*X*QB';
end

