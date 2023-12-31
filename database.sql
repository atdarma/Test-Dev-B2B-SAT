PGDMP                          {            postgres    15.3    15.3                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    5    postgres    DATABASE        CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE postgres;
                postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3353                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    5            �            1259    16413    hobi    TABLE     W   CREATE TABLE public.hobi (
    id integer NOT NULL,
    nama character varying(255)
);
    DROP TABLE public.hobi;
       public         heap    postgres    false    5            �            1259    16412    hobi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hobi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.hobi_id_seq;
       public          postgres    false    5    220                       0    0    hobi_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.hobi_id_seq OWNED BY public.hobi.id;
          public          postgres    false    219            �            1259    16399    jurusan    TABLE     Z   CREATE TABLE public.jurusan (
    id integer NOT NULL,
    nama character varying(255)
);
    DROP TABLE public.jurusan;
       public         heap    postgres    false    5            �            1259    16398    jurusan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jurusan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.jurusan_id_seq;
       public          postgres    false    216    5                       0    0    jurusan_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.jurusan_id_seq OWNED BY public.jurusan.id;
          public          postgres    false    215            �            1259    16406 	   mahasiswa    TABLE     �   CREATE TABLE public.mahasiswa (
    id integer NOT NULL,
    nama character varying(255),
    tgl_lahir date,
    gender integer,
    id_jurusan integer
);
    DROP TABLE public.mahasiswa;
       public         heap    postgres    false    5            �            1259    16419    mahasiswa_hobi    TABLE     V   CREATE TABLE public.mahasiswa_hobi (
    id_mahasiswa integer,
    id_hobi integer
);
 "   DROP TABLE public.mahasiswa_hobi;
       public         heap    postgres    false    5            �            1259    16405    mahasiswa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mahasiswa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.mahasiswa_id_seq;
       public          postgres    false    218    5                       0    0    mahasiswa_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.mahasiswa_id_seq OWNED BY public.mahasiswa.id;
          public          postgres    false    217            v           2604    16416    hobi id    DEFAULT     b   ALTER TABLE ONLY public.hobi ALTER COLUMN id SET DEFAULT nextval('public.hobi_id_seq'::regclass);
 6   ALTER TABLE public.hobi ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            t           2604    16402 
   jurusan id    DEFAULT     h   ALTER TABLE ONLY public.jurusan ALTER COLUMN id SET DEFAULT nextval('public.jurusan_id_seq'::regclass);
 9   ALTER TABLE public.jurusan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            u           2604    16409    mahasiswa id    DEFAULT     l   ALTER TABLE ONLY public.mahasiswa ALTER COLUMN id SET DEFAULT nextval('public.mahasiswa_id_seq'::regclass);
 ;   ALTER TABLE public.mahasiswa ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218                      0    16413    hobi 
   TABLE DATA           (   COPY public.hobi (id, nama) FROM stdin;
    public          postgres    false    220                     0    16399    jurusan 
   TABLE DATA           +   COPY public.jurusan (id, nama) FROM stdin;
    public          postgres    false    216   i                  0    16406 	   mahasiswa 
   TABLE DATA           L   COPY public.mahasiswa (id, nama, tgl_lahir, gender, id_jurusan) FROM stdin;
    public          postgres    false    218   �                  0    16419    mahasiswa_hobi 
   TABLE DATA           ?   COPY public.mahasiswa_hobi (id_mahasiswa, id_hobi) FROM stdin;
    public          postgres    false    221   m!                  0    0    hobi_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.hobi_id_seq', 5, true);
          public          postgres    false    219                        0    0    jurusan_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.jurusan_id_seq', 5, true);
          public          postgres    false    215            !           0    0    mahasiswa_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.mahasiswa_id_seq', 9, true);
          public          postgres    false    217            |           2606    16418    hobi hobi_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.hobi
    ADD CONSTRAINT hobi_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.hobi DROP CONSTRAINT hobi_pkey;
       public            postgres    false    220            x           2606    16404    jurusan jurusan_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.jurusan
    ADD CONSTRAINT jurusan_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.jurusan DROP CONSTRAINT jurusan_pkey;
       public            postgres    false    216            z           2606    16411    mahasiswa mahasiswa_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.mahasiswa
    ADD CONSTRAINT mahasiswa_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.mahasiswa DROP CONSTRAINT mahasiswa_pkey;
       public            postgres    false    218            }           2606    16427 *   mahasiswa_hobi mahasiswa_hobi_id_hobi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mahasiswa_hobi
    ADD CONSTRAINT mahasiswa_hobi_id_hobi_fkey FOREIGN KEY (id_hobi) REFERENCES public.hobi(id);
 T   ALTER TABLE ONLY public.mahasiswa_hobi DROP CONSTRAINT mahasiswa_hobi_id_hobi_fkey;
       public          postgres    false    220    221    3196            ~           2606    16422 /   mahasiswa_hobi mahasiswa_hobi_id_mahasiswa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mahasiswa_hobi
    ADD CONSTRAINT mahasiswa_hobi_id_mahasiswa_fkey FOREIGN KEY (id_mahasiswa) REFERENCES public.mahasiswa(id);
 Y   ALTER TABLE ONLY public.mahasiswa_hobi DROP CONSTRAINT mahasiswa_hobi_id_mahasiswa_fkey;
       public          postgres    false    221    3194    218               E   x�3��M�MJLN�2�tJ-�M��S�--���2���I�(JLO�2*�+��,�2)*N-HMI����� ��;         U   x�3�I����V��K�/�M,��N�2�(�����O��2��M�K�J�M��2����-U���-jI,��2�t�.�+I��c���� 6�         �   x�U���0Dg�+���P
�3 :ұ��"�
)����T�n:�{:�>O��<�gfb9�zM��&�Z⚤�7��l�]�e6M��岯��W���
6�(梖Eݽغhz��H�|8m-��돭���;��"~ ��)�            x�3�4�2�4�2�=... $     