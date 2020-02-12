


-- ************************************** "t_shirt_sizes"

CREATE TABLE "t_shirt_sizes"
(
 "t_shirt_size_id" int NOT NULL,
 "size"            text NOT NULL,
 CONSTRAINT "PK_t_shirt_sizes" PRIMARY KEY ( "t_shirt_size_id" )
);








-- ************************************** "locations"

CREATE TABLE "locations"
(
 "location_id" int NOT NULL,
 "location"    text NOT NULL,
 CONSTRAINT "PK_location" PRIMARY KEY ( "location_id" )
);








-- ************************************** "ideas"

CREATE TABLE "ideas"
(
 "idea_id" int NOT NULL,
 "idea"    text NOT NULL,
 CONSTRAINT "PK_ideas" PRIMARY KEY ( "idea_id" )
);








-- ************************************** "food_preferences"

CREATE TABLE "food_preferences"
(
 "food_pref_id"     int NOT NULL,
 "food_preferences" text NOT NULL,
 CONSTRAINT "PK_food_preferences" PRIMARY KEY ( "food_pref_id" )
);








-- ************************************** "users"

CREATE TABLE "users"
(
 "user_email_id"   text NOT NULL,
 "firstname"       text NOT NULL,
 "lastname"        text NOT NULL,
 "idea_id"         int NOT NULL,
 "team_name"       text NOT NULL,
 "location_id"     int NOT NULL,
 "t_shirt_size_id" int NOT NULL,
 "food_pref_id"    int NOT NULL,
 "product_desc"     text NULL,
 "sign_up_dt"      timestamp NOT NULL,
 CONSTRAINT "PK_users" PRIMARY KEY ( "user_email_id" ),
 CONSTRAINT "user_idea" FOREIGN KEY ( "idea_id" ) REFERENCES "ideas" ( "idea_id" ),
 CONSTRAINT "user_food_preferences" FOREIGN KEY ( "food_pref_id" ) REFERENCES "food_preferences" ( "food_pref_id" ),
 CONSTRAINT "user_location" FOREIGN KEY ( "location_id" ) REFERENCES "locations" ( "location_id" ),
 CONSTRAINT "user_t_shirt_size" FOREIGN KEY ( "t_shirt_size_id" ) REFERENCES "t_shirt_sizes" ( "t_shirt_size_id" )
);

CREATE INDEX "fkIdx_88" ON "users"
(
 "idea_id"
);

CREATE INDEX "fkIdx_91" ON "users"
(
 "food_pref_id"
);

CREATE INDEX "fkIdx_94" ON "users"
(
 "location_id"
);

CREATE INDEX "fkIdx_97" ON "users"
(
 "t_shirt_size_id"
);



-- ************************************** Below view is used for Subscriptions
CREATE OR REPLACE VIEW "public"."user_counts_by_types" AS 
 SELECT a.location,
    a.idea,
    a.size,
    a.food_preferences,
    count(*) AS users
   FROM ( SELECT l.location,
            i.idea,
            t.size,
            f.food_preferences,
            u.user_email_id
           FROM users u,
            locations l,
            ideas i,
            t_shirt_sizes t,
            food_preferences f
          WHERE ((u.location_id = l.location_id) AND (u.idea_id = i.idea_id) AND (u.t_shirt_size_id = t.t_shirt_size_id) AND (u.food_pref_id = f.food_pref_id))) a
  GROUP BY a.location, a.idea, a.size, a.food_preferences;







