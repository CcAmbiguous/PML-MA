function par = params_settings(ttt)

params = [1 , 1e-2, 1e-1, 1e2  ;      %% 1.mirflickr;
          1 , 1e-4, 1e-3, 1e-1 ;      %% 2.music_emotion;
          10, 1e-4, 1e-3, 1e-1 ;      %% 3.music_style;
          10, 1e-4, 1e-3, 1e-2 ;      %% 4.YeastBP;
          10, 1e-1, 1e-1, 1e0  ;      %% 5.emotions-3;
          10, 1e-1, 1e-2, 1e1  ;      %% 6.emotions-4 and 5;
          10 , 1e-3, 1e-2, 1e-1 ;     %% 7.birds;
          10, 1e-4, 1e-1, 1e2  ;      %% 8.flags;
          10, 1e-2, 1e-2, 1e-1 ;      %% 9.image;
          10, 1e-2, 1e-2, 1e1  ;      %% 10.scene;
          10, 1e-4, 1e-4, 1e0  ;      %% 11.health;
          10, 1e-4, 1e-4, 1e1  ;      %% 12.recreation;
          10, 1e-3, 1e-3, 1e0  ;      %% 13.science.
          10, 1e-4, 1e-4, 1e1  ;      %% 14.eduction;
          10, 1e-4, 1e-4, 1e1  ;      %% 15.arts;
          10, 1e-4, 1e-3, 1e1  ;      %% 16.yeast;
          10, 1e-4, 1e-4, 1e0  ;      %% 17.reference；
          10, 1e-3, 1e-1, 1e2  ;      %% 18.foodtruck;
          10, 1e-3, 1e-3, 1e0  ;      %% 19.corel5k;
          10, 1e-3, 1e-3, 1e-1 ;      %% 20.enron;
          10, 1e-4, 1e-3, 1e-1 ;      %% 21.medical;
          ];
par = params(ttt,:);
end