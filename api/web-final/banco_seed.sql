-- Script para criar o schema do banco web_final
-- Execute este arquivo conectado ao banco web_final

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';
SET default_table_access_method = heap;

-- ============================================================
-- Tabelas
-- ============================================================

CREATE TABLE public.card (
                             id                        integer NOT NULL,
                             nome                      character varying,
                             type                      character varying,
                             "humanReadableCardType"   character varying,
                             "frameType"               character varying,
                             "desc"                    text,
                             race                      character varying,
                             ygoprodeck_url            character varying,
                             cardmarket_price          numeric(12,2),
                             tcgplayer_price           numeric(12,2),
                             ebay_price                numeric(12,2),
                             amazon_price              numeric(12,2),
                             coolstuffinc_price        numeric(12,2)
);

CREATE TABLE public.cardset (
                                id              integer NOT NULL,
                                set_name        character varying,
                                set_code        character varying,
                                num_of_cards    integer,
                                set_image       text
);

CREATE TABLE public.card_cardset (
                                     id                integer NOT NULL,   -- PK surrogate
                                     card_id           integer NOT NULL,   -- lowercase (era "card_Id")
                                     cardset_id        integer NOT NULL,
                                     set_name          character varying,
                                     set_code          character varying,
                                     set_rarity        character varying,
                                     set_rarity_code   character varying,
                                     set_price         numeric(12,2)
);

CREATE TABLE public.monstro (
                                card_id              integer NOT NULL,
                                id                   integer NOT NULL,
                                atk                  integer,
                                def                  integer,
                                level                integer,
                                attribute_character  character varying   -- alinhado ao Java (era "attribute")
);

CREATE TABLE public.usuario (
                                id              integer NOT NULL,
                                nome            character varying NOT NULL,
                                login           character varying NOT NULL,
                                senha           character varying NOT NULL,
                                administrador   boolean NOT NULL,
                                email           character varying NOT NULL,
                                endereco        character varying
);

CREATE TABLE public.venda (
                              id           integer NOT NULL,
                              data_hora    timestamp,             -- era timestamptz; alinha com LocalDateTime
                              usuario_id   integer NOT NULL
);

CREATE TABLE public.venda_card (
                                   id          integer NOT NULL,       -- PK surrogate
                                   card_id     integer NOT NULL,
                                   venda_id    integer NOT NULL,
                                   preco       numeric(12,2),
                                   quantidade  integer                 -- era character varying
);

-- ============================================================
-- Sequences
-- ============================================================

CREATE SEQUENCE public.card_id_seq              AS integer
    START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER SEQUENCE public.card_id_seq OWNED BY public.card.id;

CREATE SEQUENCE public.cardset_id_seq           AS integer
    START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER SEQUENCE public.cardset_id_seq OWNED BY public.cardset.id;

CREATE SEQUENCE public.usuario_id_seq           AS integer
    START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;

CREATE SEQUENCE public.venda_id_seq             AS integer
    START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER SEQUENCE public.venda_id_seq OWNED BY public.venda.id;

CREATE SEQUENCE public.monstro_id_seq           AS integer
    START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER SEQUENCE public.monstro_id_seq OWNED BY public.monstro.id;

CREATE SEQUENCE public.card_cardset_id_seq      AS integer
    START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER SEQUENCE public.card_cardset_id_seq OWNED BY public.card_cardset.id;

CREATE SEQUENCE public.venda_card_id_seq        AS integer
    START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER SEQUENCE public.venda_card_id_seq OWNED BY public.venda_card.id;

-- ============================================================
-- Defaults (apenas em colunas PK geradas)
-- ============================================================

ALTER TABLE ONLY public.card         ALTER COLUMN id SET DEFAULT nextval('public.card_id_seq'::regclass);
ALTER TABLE ONLY public.cardset      ALTER COLUMN id SET DEFAULT nextval('public.cardset_id_seq'::regclass);
ALTER TABLE ONLY public.usuario      ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);
ALTER TABLE ONLY public.venda        ALTER COLUMN id SET DEFAULT nextval('public.venda_id_seq'::regclass);
ALTER TABLE ONLY public.monstro      ALTER COLUMN id SET DEFAULT nextval('public.monstro_id_seq'::regclass);
ALTER TABLE ONLY public.card_cardset ALTER COLUMN id SET DEFAULT nextval('public.card_cardset_id_seq'::regclass);
ALTER TABLE ONLY public.venda_card   ALTER COLUMN id SET DEFAULT nextval('public.venda_card_id_seq'::regclass);

-- ============================================================
-- Primary Keys
-- ============================================================

ALTER TABLE ONLY public.card         ADD CONSTRAINT card_pkey         PRIMARY KEY (id);
ALTER TABLE ONLY public.cardset      ADD CONSTRAINT cardset_pkey      PRIMARY KEY (id);
ALTER TABLE ONLY public.usuario      ADD CONSTRAINT usuario_pkey      PRIMARY KEY (id);
ALTER TABLE ONLY public.venda        ADD CONSTRAINT venda_pkey        PRIMARY KEY (id);
ALTER TABLE ONLY public.monstro      ADD CONSTRAINT monstro_pkey      PRIMARY KEY (id);
ALTER TABLE ONLY public.card_cardset ADD CONSTRAINT card_cardset_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.venda_card   ADD CONSTRAINT venda_card_pkey   PRIMARY KEY (id);

-- ============================================================
-- Unique constraints (par natural)
-- ============================================================

ALTER TABLE ONLY public.card_cardset
    ADD CONSTRAINT uk_card_cardset UNIQUE (card_id, cardset_id);

ALTER TABLE ONLY public.venda_card
    ADD CONSTRAINT uk_venda_card UNIQUE (card_id, venda_id);

-- ============================================================
-- Foreign Keys
-- ============================================================

ALTER TABLE ONLY public.card_cardset ADD CONSTRAINT card_id
    FOREIGN KEY (card_id) REFERENCES public.card(id);
ALTER TABLE ONLY public.card_cardset ADD CONSTRAINT cardset_id
    FOREIGN KEY (cardset_id) REFERENCES public.cardset(id);

ALTER TABLE ONLY public.monstro ADD CONSTRAINT card_id
    FOREIGN KEY (card_id) REFERENCES public.card(id);

ALTER TABLE ONLY public.venda ADD CONSTRAINT usuario_id
    FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);

ALTER TABLE ONLY public.venda_card ADD CONSTRAINT card_id
    FOREIGN KEY (card_id) REFERENCES public.card(id);
ALTER TABLE ONLY public.venda_card ADD CONSTRAINT venda_id
    FOREIGN KEY (venda_id) REFERENCES public.venda(id);