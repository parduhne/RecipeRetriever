PGDMP     7    	                w           SWEN400    10.10    10.10 9    3           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            4           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            5           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            6           1262    24747    SWEN400    DATABASE     �   CREATE DATABASE "SWEN400" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Croatian_Croatia.1250' LC_CTYPE = 'Croatian_Croatia.1250';
    DROP DATABASE "SWEN400";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            7           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            8           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    24750    Ingredients    TABLE     �   CREATE TABLE public."Ingredients" (
    "ID" integer NOT NULL,
    "Name" character varying NOT NULL,
    "Description" text,
    "MeasurementID" integer
);
 !   DROP TABLE public."Ingredients";
       public         postgres    false    3            �            1259    24759    IngredientsRecipes    TABLE     �   CREATE TABLE public."IngredientsRecipes" (
    "IngredientID" integer NOT NULL,
    "RecipeID" integer NOT NULL,
    "Size" real
);
 (   DROP TABLE public."IngredientsRecipes";
       public         postgres    false    3            �            1259    24748    Ingredients_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Ingredients_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Ingredients_ID_seq";
       public       postgres    false    3    197            9           0    0    Ingredients_ID_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Ingredients_ID_seq" OWNED BY public."Ingredients"."ID";
            public       postgres    false    196            �            1259    24764    Measurements    TABLE     i   CREATE TABLE public."Measurements" (
    "ID" integer NOT NULL,
    "Name" character varying NOT NULL
);
 "   DROP TABLE public."Measurements";
       public         postgres    false    3            �            1259    24762    Measurements_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Measurements_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Measurements_ID_seq";
       public       postgres    false    3    200            :           0    0    Measurements_ID_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Measurements_ID_seq" OWNED BY public."Measurements"."ID";
            public       postgres    false    199            �            1259    24773    Pantry    TABLE        CREATE TABLE public."Pantry" (
    "UserID" integer NOT NULL,
    "IngredientID" integer NOT NULL,
    "Size" real NOT NULL
);
    DROP TABLE public."Pantry";
       public         postgres    false    3            �            1259    24778    Recipes    TABLE     |   CREATE TABLE public."Recipes" (
    "ID" integer NOT NULL,
    "Name" character varying NOT NULL,
    "Description" text
);
    DROP TABLE public."Recipes";
       public         postgres    false    3            �            1259    24776    Recipes_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Recipes_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Recipes_ID_seq";
       public       postgres    false    3    203            ;           0    0    Recipes_ID_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Recipes_ID_seq" OWNED BY public."Recipes"."ID";
            public       postgres    false    202            �            1259    24789    Units    TABLE     �   CREATE TABLE public."Units" (
    "ID" integer NOT NULL,
    "Name" character varying NOT NULL,
    "ConversionFactor" real NOT NULL,
    "MeasurementID" integer
);
    DROP TABLE public."Units";
       public         postgres    false    3            �            1259    24787    Units_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Units_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Units_ID_seq";
       public       postgres    false    3    205            <           0    0    Units_ID_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Units_ID_seq" OWNED BY public."Units"."ID";
            public       postgres    false    204            �            1259    24800    Users    TABLE     �   CREATE TABLE public."Users" (
    "ID" integer NOT NULL,
    "Name" character varying NOT NULL,
    "Email" text NOT NULL,
    "Password" text NOT NULL
);
    DROP TABLE public."Users";
       public         postgres    false    3            �            1259    24798    Users_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Users_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Users_ID_seq";
       public       postgres    false    207    3            =           0    0    Users_ID_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Users_ID_seq" OWNED BY public."Users"."ID";
            public       postgres    false    206            �
           2604    24753    Ingredients ID    DEFAULT     v   ALTER TABLE ONLY public."Ingredients" ALTER COLUMN "ID" SET DEFAULT nextval('public."Ingredients_ID_seq"'::regclass);
 A   ALTER TABLE public."Ingredients" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    196    197    197            �
           2604    24767    Measurements ID    DEFAULT     x   ALTER TABLE ONLY public."Measurements" ALTER COLUMN "ID" SET DEFAULT nextval('public."Measurements_ID_seq"'::regclass);
 B   ALTER TABLE public."Measurements" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    199    200    200            �
           2604    24781 
   Recipes ID    DEFAULT     n   ALTER TABLE ONLY public."Recipes" ALTER COLUMN "ID" SET DEFAULT nextval('public."Recipes_ID_seq"'::regclass);
 =   ALTER TABLE public."Recipes" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    203    202    203            �
           2604    24792    Units ID    DEFAULT     j   ALTER TABLE ONLY public."Units" ALTER COLUMN "ID" SET DEFAULT nextval('public."Units_ID_seq"'::regclass);
 ;   ALTER TABLE public."Units" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    205    204    205            �
           2604    24803    Users ID    DEFAULT     j   ALTER TABLE ONLY public."Users" ALTER COLUMN "ID" SET DEFAULT nextval('public."Users_ID_seq"'::regclass);
 ;   ALTER TABLE public."Users" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    207    206    207            &          0    24750    Ingredients 
   TABLE DATA               U   COPY public."Ingredients" ("ID", "Name", "Description", "MeasurementID") FROM stdin;
    public       postgres    false    197   +<       '          0    24759    IngredientsRecipes 
   TABLE DATA               R   COPY public."IngredientsRecipes" ("IngredientID", "RecipeID", "Size") FROM stdin;
    public       postgres    false    198   H<       )          0    24764    Measurements 
   TABLE DATA               6   COPY public."Measurements" ("ID", "Name") FROM stdin;
    public       postgres    false    200   e<       *          0    24773    Pantry 
   TABLE DATA               D   COPY public."Pantry" ("UserID", "IngredientID", "Size") FROM stdin;
    public       postgres    false    201   �<       ,          0    24778    Recipes 
   TABLE DATA               @   COPY public."Recipes" ("ID", "Name", "Description") FROM stdin;
    public       postgres    false    203   �<       .          0    24789    Units 
   TABLE DATA               T   COPY public."Units" ("ID", "Name", "ConversionFactor", "MeasurementID") FROM stdin;
    public       postgres    false    205   �<       0          0    24800    Users 
   TABLE DATA               D   COPY public."Users" ("ID", "Name", "Email", "Password") FROM stdin;
    public       postgres    false    207   �<       >           0    0    Ingredients_ID_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Ingredients_ID_seq"', 1, false);
            public       postgres    false    196            ?           0    0    Measurements_ID_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Measurements_ID_seq"', 1, false);
            public       postgres    false    199            @           0    0    Recipes_ID_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Recipes_ID_seq"', 1, false);
            public       postgres    false    202            A           0    0    Units_ID_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Units_ID_seq"', 1, false);
            public       postgres    false    204            B           0    0    Users_ID_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Users_ID_seq"', 1, false);
            public       postgres    false    206            �
           2606    24758    Ingredients Ingredients_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Ingredients"
    ADD CONSTRAINT "Ingredients_pkey" PRIMARY KEY ("ID");
 J   ALTER TABLE ONLY public."Ingredients" DROP CONSTRAINT "Ingredients_pkey";
       public         postgres    false    197            �
           2606    24772    Measurements Measurement_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Measurements"
    ADD CONSTRAINT "Measurement_pkey" PRIMARY KEY ("ID");
 K   ALTER TABLE ONLY public."Measurements" DROP CONSTRAINT "Measurement_pkey";
       public         postgres    false    200            �
           2606    24786    Recipes Recipe_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."Recipes"
    ADD CONSTRAINT "Recipe_pkey" PRIMARY KEY ("ID");
 A   ALTER TABLE ONLY public."Recipes" DROP CONSTRAINT "Recipe_pkey";
       public         postgres    false    203            �
           2606    24797    Units Unit_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public."Units"
    ADD CONSTRAINT "Unit_pkey" PRIMARY KEY ("ID");
 =   ALTER TABLE ONLY public."Units" DROP CONSTRAINT "Unit_pkey";
       public         postgres    false    205            �
           2606    24808    Users User_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("ID");
 =   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "User_pkey";
       public         postgres    false    207            �
           1259    24826    fki_Ingredient_fkey    INDEX     T   CREATE INDEX "fki_Ingredient_fkey" ON public."Pantry" USING btree ("IngredientID");
 )   DROP INDEX public."fki_Ingredient_fkey";
       public         postgres    false    201            �
           1259    24814    fki_Measurement_fkey    INDEX     U   CREATE INDEX "fki_Measurement_fkey" ON public."Units" USING btree ("MeasurementID");
 *   DROP INDEX public."fki_Measurement_fkey";
       public         postgres    false    205            �
           1259    24837    fki_Recipe_fkey    INDEX     X   CREATE INDEX "fki_Recipe_fkey" ON public."IngredientsRecipes" USING btree ("RecipeID");
 %   DROP INDEX public."fki_Recipe_fkey";
       public         postgres    false    198            �
           1259    24820    fki_User_fkey    INDEX     H   CREATE INDEX "fki_User_fkey" ON public."Pantry" USING btree ("UserID");
 #   DROP INDEX public."fki_User_fkey";
       public         postgres    false    201            �
           2606    24821    Pantry Ingredient_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pantry"
    ADD CONSTRAINT "Ingredient_fkey" FOREIGN KEY ("IngredientID") REFERENCES public."Ingredients"("ID");
 D   ALTER TABLE ONLY public."Pantry" DROP CONSTRAINT "Ingredient_fkey";
       public       postgres    false    201    2713    197            �
           2606    24827 "   IngredientsRecipes Ingredient_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."IngredientsRecipes"
    ADD CONSTRAINT "Ingredient_fkey" FOREIGN KEY ("IngredientID") REFERENCES public."Ingredients"("ID");
 P   ALTER TABLE ONLY public."IngredientsRecipes" DROP CONSTRAINT "Ingredient_fkey";
       public       postgres    false    2713    197    198            �
           2606    24809    Units Measurement_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Units"
    ADD CONSTRAINT "Measurement_fkey" FOREIGN KEY ("MeasurementID") REFERENCES public."Measurements"("ID");
 D   ALTER TABLE ONLY public."Units" DROP CONSTRAINT "Measurement_fkey";
       public       postgres    false    2716    205    200            �
           2606    24838    Ingredients Measurement_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ingredients"
    ADD CONSTRAINT "Measurement_fkey" FOREIGN KEY ("MeasurementID") REFERENCES public."Measurements"("ID");
 J   ALTER TABLE ONLY public."Ingredients" DROP CONSTRAINT "Measurement_fkey";
       public       postgres    false    197    200    2716            �
           2606    24832    IngredientsRecipes Recipe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."IngredientsRecipes"
    ADD CONSTRAINT "Recipe_fkey" FOREIGN KEY ("RecipeID") REFERENCES public."Recipes"("ID");
 L   ALTER TABLE ONLY public."IngredientsRecipes" DROP CONSTRAINT "Recipe_fkey";
       public       postgres    false    2720    198    203            �
           2606    24815    Pantry User_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public."Pantry"
    ADD CONSTRAINT "User_fkey" FOREIGN KEY ("UserID") REFERENCES public."Users"("ID");
 >   ALTER TABLE ONLY public."Pantry" DROP CONSTRAINT "User_fkey";
       public       postgres    false    207    2725    201            &      x������ � �      '      x������ � �      )      x������ � �      *      x������ � �      ,      x������ � �      .      x������ � �      0      x������ � �     