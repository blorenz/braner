--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO mlorenz;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO mlorenz;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO mlorenz;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO mlorenz;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO mlorenz;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO mlorenz;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO mlorenz;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO mlorenz;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO mlorenz;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO mlorenz;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO mlorenz;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO mlorenz;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: cms_cmsplugin; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cms_cmsplugin (
    id integer NOT NULL,
    placeholder_id integer,
    parent_id integer,
    "position" smallint,
    language character varying(15) NOT NULL,
    plugin_type character varying(50) NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    changed_date timestamp with time zone NOT NULL,
    level integer NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    CONSTRAINT cms_cmsplugin_level_check CHECK ((level >= 0)),
    CONSTRAINT cms_cmsplugin_lft_check CHECK ((lft >= 0)),
    CONSTRAINT cms_cmsplugin_position_check CHECK (("position" >= 0)),
    CONSTRAINT cms_cmsplugin_rght_check CHECK ((rght >= 0)),
    CONSTRAINT cms_cmsplugin_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.cms_cmsplugin OWNER TO mlorenz;

--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE cms_cmsplugin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_cmsplugin_id_seq OWNER TO mlorenz;

--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE cms_cmsplugin_id_seq OWNED BY cms_cmsplugin.id;


--
-- Name: cms_globalpagepermission; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cms_globalpagepermission (
    id integer NOT NULL,
    user_id integer,
    group_id integer,
    can_change boolean NOT NULL,
    can_add boolean NOT NULL,
    can_delete boolean NOT NULL,
    can_change_advanced_settings boolean NOT NULL,
    can_publish boolean NOT NULL,
    can_change_permissions boolean NOT NULL,
    can_move_page boolean NOT NULL,
    can_view boolean NOT NULL,
    can_recover_page boolean NOT NULL
);


ALTER TABLE public.cms_globalpagepermission OWNER TO mlorenz;

--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE cms_globalpagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_globalpagepermission_id_seq OWNER TO mlorenz;

--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE cms_globalpagepermission_id_seq OWNED BY cms_globalpagepermission.id;


--
-- Name: cms_globalpagepermission_sites; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cms_globalpagepermission_sites (
    id integer NOT NULL,
    globalpagepermission_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.cms_globalpagepermission_sites OWNER TO mlorenz;

--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE cms_globalpagepermission_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_globalpagepermission_sites_id_seq OWNER TO mlorenz;

--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE cms_globalpagepermission_sites_id_seq OWNED BY cms_globalpagepermission_sites.id;


--
-- Name: cms_page; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cms_page (
    id integer NOT NULL,
    created_by character varying(70) NOT NULL,
    changed_by character varying(70) NOT NULL,
    parent_id integer,
    creation_date timestamp with time zone NOT NULL,
    changed_date timestamp with time zone NOT NULL,
    publication_date timestamp with time zone,
    publication_end_date timestamp with time zone,
    in_navigation boolean NOT NULL,
    soft_root boolean NOT NULL,
    reverse_id character varying(40),
    navigation_extenders character varying(80),
    published boolean NOT NULL,
    template character varying(100) NOT NULL,
    site_id integer NOT NULL,
    login_required boolean NOT NULL,
    limit_visibility_in_menu smallint,
    level integer NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    publisher_is_draft boolean NOT NULL,
    publisher_public_id integer,
    publisher_state smallint NOT NULL,
    CONSTRAINT cms_page_level_check CHECK ((level >= 0)),
    CONSTRAINT cms_page_lft_check CHECK ((lft >= 0)),
    CONSTRAINT cms_page_rght_check CHECK ((rght >= 0)),
    CONSTRAINT cms_page_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.cms_page OWNER TO mlorenz;

--
-- Name: cms_page_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE cms_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_page_id_seq OWNER TO mlorenz;

--
-- Name: cms_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE cms_page_id_seq OWNED BY cms_page.id;


--
-- Name: cms_page_placeholders; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cms_page_placeholders (
    id integer NOT NULL,
    page_id integer NOT NULL,
    placeholder_id integer NOT NULL
);


ALTER TABLE public.cms_page_placeholders OWNER TO mlorenz;

--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE cms_page_placeholders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_page_placeholders_id_seq OWNER TO mlorenz;

--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE cms_page_placeholders_id_seq OWNED BY cms_page_placeholders.id;


--
-- Name: cms_pagemoderatorstate; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cms_pagemoderatorstate (
    id integer NOT NULL,
    page_id integer NOT NULL,
    user_id integer,
    created timestamp with time zone NOT NULL,
    action character varying(3),
    message text NOT NULL
);


ALTER TABLE public.cms_pagemoderatorstate OWNER TO mlorenz;

--
-- Name: cms_pagemoderatorstate_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE cms_pagemoderatorstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_pagemoderatorstate_id_seq OWNER TO mlorenz;

--
-- Name: cms_pagemoderatorstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE cms_pagemoderatorstate_id_seq OWNED BY cms_pagemoderatorstate.id;


--
-- Name: cms_pagepermission; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cms_pagepermission (
    id integer NOT NULL,
    user_id integer,
    group_id integer,
    can_change boolean NOT NULL,
    can_add boolean NOT NULL,
    can_delete boolean NOT NULL,
    can_change_advanced_settings boolean NOT NULL,
    can_publish boolean NOT NULL,
    can_change_permissions boolean NOT NULL,
    can_move_page boolean NOT NULL,
    can_view boolean NOT NULL,
    grant_on integer NOT NULL,
    page_id integer
);


ALTER TABLE public.cms_pagepermission OWNER TO mlorenz;

--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE cms_pagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_pagepermission_id_seq OWNER TO mlorenz;

--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE cms_pagepermission_id_seq OWNED BY cms_pagepermission.id;


--
-- Name: cms_pageuser; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cms_pageuser (
    user_ptr_id integer NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.cms_pageuser OWNER TO mlorenz;

--
-- Name: cms_pageusergroup; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cms_pageusergroup (
    group_ptr_id integer NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.cms_pageusergroup OWNER TO mlorenz;

--
-- Name: cms_placeholder; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cms_placeholder (
    id integer NOT NULL,
    slot character varying(50) NOT NULL,
    default_width smallint,
    CONSTRAINT cms_placeholder_default_width_check CHECK ((default_width >= 0))
);


ALTER TABLE public.cms_placeholder OWNER TO mlorenz;

--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE cms_placeholder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_placeholder_id_seq OWNER TO mlorenz;

--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE cms_placeholder_id_seq OWNED BY cms_placeholder.id;


--
-- Name: cms_title; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cms_title (
    id integer NOT NULL,
    language character varying(15) NOT NULL,
    title character varying(255) NOT NULL,
    menu_title character varying(255),
    slug character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    has_url_overwrite boolean NOT NULL,
    application_urls character varying(200),
    redirect character varying(255),
    meta_description text,
    meta_keywords character varying(255),
    page_title character varying(255),
    page_id integer NOT NULL,
    creation_date timestamp with time zone NOT NULL
);


ALTER TABLE public.cms_title OWNER TO mlorenz;

--
-- Name: cms_title_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE cms_title_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_title_id_seq OWNER TO mlorenz;

--
-- Name: cms_title_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE cms_title_id_seq OWNED BY cms_title.id;


--
-- Name: cmsplugin_file_gallery_downloadablefile; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cmsplugin_file_gallery_downloadablefile (
    id integer NOT NULL,
    inline_ordering_position integer,
    gallery_id integer NOT NULL,
    src character varying(100) NOT NULL,
    src_height smallint,
    src_width smallint,
    title character varying(255) NOT NULL,
    alt text NOT NULL,
    link character varying(255) NOT NULL,
    extended_content text NOT NULL,
    downloadable_file character varying(100) NOT NULL,
    CONSTRAINT cmsplugin_file_gallery_downloadablefile_src_height_check CHECK ((src_height >= 0)),
    CONSTRAINT cmsplugin_file_gallery_downloadablefile_src_width_check CHECK ((src_width >= 0))
);


ALTER TABLE public.cmsplugin_file_gallery_downloadablefile OWNER TO mlorenz;

--
-- Name: cmsplugin_file_gallery_downloadablefile_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE cmsplugin_file_gallery_downloadablefile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_file_gallery_downloadablefile_id_seq OWNER TO mlorenz;

--
-- Name: cmsplugin_file_gallery_downloadablefile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE cmsplugin_file_gallery_downloadablefile_id_seq OWNED BY cmsplugin_file_gallery_downloadablefile.id;


--
-- Name: cmsplugin_filegalleryplugin; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cmsplugin_filegalleryplugin (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(255) NOT NULL,
    template character varying(255) NOT NULL
);


ALTER TABLE public.cmsplugin_filegalleryplugin OWNER TO mlorenz;

--
-- Name: cmsplugin_filer_image_thumbnailoption; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cmsplugin_filer_image_thumbnailoption (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    crop boolean NOT NULL,
    upscale boolean NOT NULL
);


ALTER TABLE public.cmsplugin_filer_image_thumbnailoption OWNER TO mlorenz;

--
-- Name: cmsplugin_filer_image_thumbnailoption_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE cmsplugin_filer_image_thumbnailoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_filer_image_thumbnailoption_id_seq OWNER TO mlorenz;

--
-- Name: cmsplugin_filer_image_thumbnailoption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE cmsplugin_filer_image_thumbnailoption_id_seq OWNED BY cmsplugin_filer_image_thumbnailoption.id;


--
-- Name: cmsplugin_filerfile; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cmsplugin_filerfile (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(255),
    file_id integer NOT NULL,
    target_blank boolean NOT NULL
);


ALTER TABLE public.cmsplugin_filerfile OWNER TO mlorenz;

--
-- Name: cmsplugin_filerfolder; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cmsplugin_filerfolder (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(255),
    view_option character varying(10) NOT NULL,
    folder_id integer NOT NULL
);


ALTER TABLE public.cmsplugin_filerfolder OWNER TO mlorenz;

--
-- Name: cmsplugin_filerimage; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cmsplugin_filerimage (
    cmsplugin_ptr_id integer NOT NULL,
    caption_text character varying(255),
    image_id integer,
    image_url character varying(200),
    alt_text character varying(255),
    use_original_image boolean NOT NULL,
    thumbnail_option_id integer,
    use_autoscale boolean NOT NULL,
    width integer,
    height integer,
    crop boolean NOT NULL,
    upscale boolean NOT NULL,
    alignment character varying(10),
    free_link character varying(255),
    page_link_id integer,
    file_link_id integer,
    original_link boolean NOT NULL,
    description text,
    target_blank boolean NOT NULL,
    CONSTRAINT cmsplugin_filerimage_height_check CHECK ((height >= 0)),
    CONSTRAINT cmsplugin_filerimage_width_check CHECK ((width >= 0))
);


ALTER TABLE public.cmsplugin_filerimage OWNER TO mlorenz;

--
-- Name: cmsplugin_filerteaser; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cmsplugin_filerteaser (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(255) NOT NULL,
    image_id integer,
    image_url character varying(200),
    style character varying(255),
    use_autoscale boolean NOT NULL,
    width integer,
    height integer,
    free_link character varying(255),
    page_link_id integer,
    description text,
    target_blank boolean NOT NULL,
    CONSTRAINT cmsplugin_filerteaser_height_check CHECK ((height >= 0)),
    CONSTRAINT cmsplugin_filerteaser_width_check CHECK ((width >= 0))
);


ALTER TABLE public.cmsplugin_filerteaser OWNER TO mlorenz;

--
-- Name: cmsplugin_filervideo; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cmsplugin_filervideo (
    cmsplugin_ptr_id integer NOT NULL,
    movie_id integer,
    movie_url character varying(255),
    image_id integer,
    width smallint NOT NULL,
    height smallint NOT NULL,
    auto_play boolean NOT NULL,
    auto_hide boolean NOT NULL,
    fullscreen boolean NOT NULL,
    loop boolean NOT NULL,
    bgcolor character varying(6) NOT NULL,
    textcolor character varying(6) NOT NULL,
    seekbarcolor character varying(6) NOT NULL,
    seekbarbgcolor character varying(6) NOT NULL,
    loadingbarcolor character varying(6) NOT NULL,
    buttonoutcolor character varying(6) NOT NULL,
    buttonovercolor character varying(6) NOT NULL,
    buttonhighlightcolor character varying(6) NOT NULL,
    CONSTRAINT cmsplugin_filervideo_height_check CHECK ((height >= 0)),
    CONSTRAINT cmsplugin_filervideo_width_check CHECK ((width >= 0))
);


ALTER TABLE public.cmsplugin_filervideo OWNER TO mlorenz;

--
-- Name: cmsplugin_gallery_image; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cmsplugin_gallery_image (
    id integer NOT NULL,
    inline_ordering_position integer,
    gallery_id integer NOT NULL,
    src character varying(100) NOT NULL,
    src_height smallint,
    src_width smallint,
    title character varying(255) NOT NULL,
    alt text NOT NULL,
    link character varying(255) NOT NULL,
    extended_content text NOT NULL,
    CONSTRAINT cmsplugin_gallery_image_src_height_check CHECK ((src_height >= 0)),
    CONSTRAINT cmsplugin_gallery_image_src_width_check CHECK ((src_width >= 0))
);


ALTER TABLE public.cmsplugin_gallery_image OWNER TO mlorenz;

--
-- Name: cmsplugin_gallery_image_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE cmsplugin_gallery_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_gallery_image_id_seq OWNER TO mlorenz;

--
-- Name: cmsplugin_gallery_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE cmsplugin_gallery_image_id_seq OWNED BY cmsplugin_gallery_image.id;


--
-- Name: cmsplugin_galleryplugin; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cmsplugin_galleryplugin (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(255) NOT NULL,
    slide_duration double precision NOT NULL,
    template character varying(255) NOT NULL,
    fade_duration double precision NOT NULL
);


ALTER TABLE public.cmsplugin_galleryplugin OWNER TO mlorenz;

--
-- Name: cmsplugin_link; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cmsplugin_link (
    cmsplugin_ptr_id integer NOT NULL,
    name character varying(256) NOT NULL,
    url character varying(200),
    page_link_id integer,
    mailto character varying(75),
    target character varying(100) NOT NULL
);


ALTER TABLE public.cmsplugin_link OWNER TO mlorenz;

--
-- Name: cmsplugin_text; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cmsplugin_text (
    cmsplugin_ptr_id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.cmsplugin_text OWNER TO mlorenz;

--
-- Name: cmsplugin_video_gallery_video; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cmsplugin_video_gallery_video (
    id integer NOT NULL,
    inline_ordering_position integer,
    gallery_id integer NOT NULL,
    src character varying(100) NOT NULL,
    src_height smallint,
    src_width smallint,
    title character varying(255) NOT NULL,
    alt text NOT NULL,
    link character varying(255) NOT NULL,
    extended_content text NOT NULL,
    poster_src character varying(100),
    poster_src_height smallint,
    poster_src_width smallint,
    mp4_file character varying(100),
    ogv_file character varying(100),
    webm_file character varying(100),
    video_width smallint,
    video_height smallint,
    video_duration character varying(20),
    CONSTRAINT cmsplugin_video_gallery_video_poster_src_height_check CHECK ((poster_src_height >= 0)),
    CONSTRAINT cmsplugin_video_gallery_video_poster_src_width_check CHECK ((poster_src_width >= 0)),
    CONSTRAINT cmsplugin_video_gallery_video_src_height_check CHECK ((src_height >= 0)),
    CONSTRAINT cmsplugin_video_gallery_video_src_width_check CHECK ((src_width >= 0)),
    CONSTRAINT cmsplugin_video_gallery_video_video_height_check CHECK ((video_height >= 0)),
    CONSTRAINT cmsplugin_video_gallery_video_video_width_check CHECK ((video_width >= 0))
);


ALTER TABLE public.cmsplugin_video_gallery_video OWNER TO mlorenz;

--
-- Name: cmsplugin_video_gallery_video_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE cmsplugin_video_gallery_video_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_video_gallery_video_id_seq OWNER TO mlorenz;

--
-- Name: cmsplugin_video_gallery_video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE cmsplugin_video_gallery_video_id_seq OWNED BY cmsplugin_video_gallery_video.id;


--
-- Name: cmsplugin_videogalleryplugin; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE cmsplugin_videogalleryplugin (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(255) NOT NULL,
    template character varying(255) NOT NULL
);


ALTER TABLE public.cmsplugin_videogalleryplugin OWNER TO mlorenz;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO mlorenz;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO mlorenz;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO mlorenz;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO mlorenz;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO mlorenz;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO mlorenz;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO mlorenz;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE easy_thumbnails_source (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.easy_thumbnails_source OWNER TO mlorenz;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE easy_thumbnails_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_source_id_seq OWNER TO mlorenz;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE easy_thumbnails_source_id_seq OWNED BY easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnail (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE public.easy_thumbnails_thumbnail OWNER TO mlorenz;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE easy_thumbnails_thumbnail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnail_id_seq OWNER TO mlorenz;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE easy_thumbnails_thumbnail_id_seq OWNED BY easy_thumbnails_thumbnail.id;


--
-- Name: filer_clipboard; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE filer_clipboard (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.filer_clipboard OWNER TO mlorenz;

--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE filer_clipboard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_clipboard_id_seq OWNER TO mlorenz;

--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE filer_clipboard_id_seq OWNED BY filer_clipboard.id;


--
-- Name: filer_clipboarditem; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE filer_clipboarditem (
    id integer NOT NULL,
    file_id integer NOT NULL,
    clipboard_id integer NOT NULL
);


ALTER TABLE public.filer_clipboarditem OWNER TO mlorenz;

--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE filer_clipboarditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_clipboarditem_id_seq OWNER TO mlorenz;

--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE filer_clipboarditem_id_seq OWNED BY filer_clipboarditem.id;


--
-- Name: filer_file; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE filer_file (
    id integer NOT NULL,
    polymorphic_ctype_id integer,
    folder_id integer,
    file character varying(255),
    _file_size integer,
    sha1 character varying(40) NOT NULL,
    has_all_mandatory_data boolean NOT NULL,
    original_filename character varying(255),
    name character varying(255) NOT NULL,
    description text,
    owner_id integer,
    uploaded_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    is_public boolean NOT NULL
);


ALTER TABLE public.filer_file OWNER TO mlorenz;

--
-- Name: filer_file_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE filer_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_file_id_seq OWNER TO mlorenz;

--
-- Name: filer_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE filer_file_id_seq OWNED BY filer_file.id;


--
-- Name: filer_folder; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE filer_folder (
    id integer NOT NULL,
    parent_id integer,
    name character varying(255) NOT NULL,
    owner_id integer,
    uploaded_at timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    CONSTRAINT filer_folder_level_check CHECK ((level >= 0)),
    CONSTRAINT filer_folder_lft_check CHECK ((lft >= 0)),
    CONSTRAINT filer_folder_rght_check CHECK ((rght >= 0)),
    CONSTRAINT filer_folder_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.filer_folder OWNER TO mlorenz;

--
-- Name: filer_folder_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE filer_folder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_folder_id_seq OWNER TO mlorenz;

--
-- Name: filer_folder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE filer_folder_id_seq OWNED BY filer_folder.id;


--
-- Name: filer_folderpermission; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE filer_folderpermission (
    id integer NOT NULL,
    folder_id integer,
    type smallint NOT NULL,
    user_id integer,
    group_id integer,
    everybody boolean NOT NULL,
    can_edit smallint,
    can_read smallint,
    can_add_children smallint
);


ALTER TABLE public.filer_folderpermission OWNER TO mlorenz;

--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE filer_folderpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_folderpermission_id_seq OWNER TO mlorenz;

--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE filer_folderpermission_id_seq OWNED BY filer_folderpermission.id;


--
-- Name: filer_image; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE filer_image (
    file_ptr_id integer NOT NULL,
    _height integer,
    _width integer,
    date_taken timestamp with time zone,
    default_alt_text character varying(255),
    default_caption character varying(255),
    author character varying(255),
    must_always_publish_author_credit boolean NOT NULL,
    must_always_publish_copyright boolean NOT NULL,
    subject_location character varying(64)
);


ALTER TABLE public.filer_image OWNER TO mlorenz;

--
-- Name: menus_cachekey; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE menus_cachekey (
    id integer NOT NULL,
    language character varying(255) NOT NULL,
    site integer NOT NULL,
    key character varying(255) NOT NULL,
    CONSTRAINT menus_cachekey_site_check CHECK ((site >= 0))
);


ALTER TABLE public.menus_cachekey OWNER TO mlorenz;

--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE menus_cachekey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_cachekey_id_seq OWNER TO mlorenz;

--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE menus_cachekey_id_seq OWNED BY menus_cachekey.id;


--
-- Name: reversion_revision; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE reversion_revision (
    id integer NOT NULL,
    manager_slug character varying(200) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    user_id integer,
    comment text NOT NULL
);


ALTER TABLE public.reversion_revision OWNER TO mlorenz;

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE reversion_revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_revision_id_seq OWNER TO mlorenz;

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE reversion_revision_id_seq OWNED BY reversion_revision.id;


--
-- Name: reversion_version; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE reversion_version (
    id integer NOT NULL,
    revision_id integer NOT NULL,
    object_id text NOT NULL,
    object_id_int integer,
    content_type_id integer NOT NULL,
    format character varying(255) NOT NULL,
    serialized_data text NOT NULL,
    object_repr text NOT NULL,
    type smallint NOT NULL,
    CONSTRAINT reversion_version_type_check CHECK ((type >= 0))
);


ALTER TABLE public.reversion_version OWNER TO mlorenz;

--
-- Name: reversion_version_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE reversion_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_version_id_seq OWNER TO mlorenz;

--
-- Name: reversion_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE reversion_version_id_seq OWNED BY reversion_version.id;


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO mlorenz;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: mlorenz
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO mlorenz;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mlorenz
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_cmsplugin ALTER COLUMN id SET DEFAULT nextval('cms_cmsplugin_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_globalpagepermission ALTER COLUMN id SET DEFAULT nextval('cms_globalpagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_globalpagepermission_sites ALTER COLUMN id SET DEFAULT nextval('cms_globalpagepermission_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_page ALTER COLUMN id SET DEFAULT nextval('cms_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_page_placeholders ALTER COLUMN id SET DEFAULT nextval('cms_page_placeholders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_pagemoderatorstate ALTER COLUMN id SET DEFAULT nextval('cms_pagemoderatorstate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_pagepermission ALTER COLUMN id SET DEFAULT nextval('cms_pagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_placeholder ALTER COLUMN id SET DEFAULT nextval('cms_placeholder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_title ALTER COLUMN id SET DEFAULT nextval('cms_title_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_file_gallery_downloadablefile ALTER COLUMN id SET DEFAULT nextval('cmsplugin_file_gallery_downloadablefile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_filer_image_thumbnailoption ALTER COLUMN id SET DEFAULT nextval('cmsplugin_filer_image_thumbnailoption_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_gallery_image ALTER COLUMN id SET DEFAULT nextval('cmsplugin_gallery_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_video_gallery_video ALTER COLUMN id SET DEFAULT nextval('cmsplugin_video_gallery_video_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY filer_clipboard ALTER COLUMN id SET DEFAULT nextval('filer_clipboard_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY filer_clipboarditem ALTER COLUMN id SET DEFAULT nextval('filer_clipboarditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY filer_file ALTER COLUMN id SET DEFAULT nextval('filer_file_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY filer_folder ALTER COLUMN id SET DEFAULT nextval('filer_folder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY filer_folderpermission ALTER COLUMN id SET DEFAULT nextval('filer_folderpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY menus_cachekey ALTER COLUMN id SET DEFAULT nextval('menus_cachekey_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY reversion_revision ALTER COLUMN id SET DEFAULT nextval('reversion_revision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY reversion_version ALTER COLUMN id SET DEFAULT nextval('reversion_version_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add placeholder	8	add_placeholder
23	Can change placeholder	8	change_placeholder
24	Can delete placeholder	8	delete_placeholder
25	Can add cms plugin	9	add_cmsplugin
26	Can change cms plugin	9	change_cmsplugin
27	Can delete cms plugin	9	delete_cmsplugin
28	Can add page	10	add_page
29	Can change page	10	change_page
30	Can delete page	10	delete_page
31	Can view page	10	view_page
32	Can publish page	10	publish_page
33	Can add Page moderator state	11	add_pagemoderatorstate
34	Can change Page moderator state	11	change_pagemoderatorstate
35	Can delete Page moderator state	11	delete_pagemoderatorstate
36	Can add Page global permission	12	add_globalpagepermission
37	Can change Page global permission	12	change_globalpagepermission
38	Can delete Page global permission	12	delete_globalpagepermission
39	Can add Page permission	13	add_pagepermission
40	Can change Page permission	13	change_pagepermission
41	Can delete Page permission	13	delete_pagepermission
42	Can add User (page)	14	add_pageuser
43	Can change User (page)	14	change_pageuser
44	Can delete User (page)	14	delete_pageuser
45	Can add User group (page)	15	add_pageusergroup
46	Can change User group (page)	15	change_pageusergroup
47	Can delete User group (page)	15	delete_pageusergroup
48	Can add title	16	add_title
49	Can change title	16	change_title
50	Can delete title	16	delete_title
51	Can add cache key	17	add_cachekey
52	Can change cache key	17	change_cachekey
53	Can delete cache key	17	delete_cachekey
54	Can add migration history	18	add_migrationhistory
55	Can change migration history	18	change_migrationhistory
56	Can delete migration history	18	delete_migrationhistory
57	Can add link	19	add_link
58	Can change link	19	change_link
59	Can delete link	19	delete_link
60	Can add text	20	add_text
61	Can change text	20	change_text
62	Can delete text	20	delete_text
63	Can add revision	21	add_revision
64	Can change revision	21	change_revision
65	Can delete revision	21	delete_revision
66	Can add version	22	add_version
67	Can change version	22	change_version
68	Can delete version	22	delete_version
69	Can add Folder	23	add_folder
70	Can change Folder	23	change_folder
71	Can delete Folder	23	delete_folder
72	Can use directory listing	23	can_use_directory_listing
73	Can add folder permission	24	add_folderpermission
74	Can change folder permission	24	change_folderpermission
75	Can delete folder permission	24	delete_folderpermission
76	Can add file	25	add_file
77	Can change file	25	change_file
78	Can delete file	25	delete_file
79	Can add clipboard	26	add_clipboard
80	Can change clipboard	26	change_clipboard
81	Can delete clipboard	26	delete_clipboard
82	Can add clipboard item	27	add_clipboarditem
83	Can change clipboard item	27	change_clipboarditem
84	Can delete clipboard item	27	delete_clipboarditem
85	Can add image	28	add_image
86	Can change image	28	change_image
87	Can delete image	28	delete_image
88	Can add filer file	29	add_filerfile
89	Can change filer file	29	change_filerfile
90	Can delete filer file	29	delete_filerfile
91	Can add filer folder	30	add_filerfolder
92	Can change filer folder	30	change_filerfolder
93	Can delete filer folder	30	delete_filerfolder
94	Can add filer image	31	add_filerimage
95	Can change filer image	31	change_filerimage
96	Can delete filer image	31	delete_filerimage
97	Can add thumbnail option	32	add_thumbnailoption
98	Can change thumbnail option	32	change_thumbnailoption
99	Can delete thumbnail option	32	delete_thumbnailoption
100	Can add filer teaser	33	add_filerteaser
101	Can change filer teaser	33	change_filerteaser
102	Can delete filer teaser	33	delete_filerteaser
103	Can add filer video	34	add_filervideo
104	Can change filer video	34	change_filervideo
105	Can delete filer video	34	delete_filervideo
106	Can add gallery plugin	35	add_galleryplugin
107	Can change gallery plugin	35	change_galleryplugin
108	Can delete gallery plugin	35	delete_galleryplugin
109	Can add image	36	add_image
110	Can change image	36	change_image
111	Can delete image	36	delete_image
112	Can add source	37	add_source
113	Can change source	37	change_source
114	Can delete source	37	delete_source
115	Can add thumbnail	38	add_thumbnail
116	Can change thumbnail	38	change_thumbnail
117	Can delete thumbnail	38	delete_thumbnail
118	Can add video gallery plugin	39	add_videogalleryplugin
119	Can change video gallery plugin	39	change_videogalleryplugin
120	Can delete video gallery plugin	39	delete_videogalleryplugin
121	Can add video	40	add_video
122	Can change video	40	change_video
123	Can delete video	40	delete_video
124	Can add file gallery plugin	41	add_filegalleryplugin
125	Can change file gallery plugin	41	change_filegalleryplugin
126	Can delete file gallery plugin	41	delete_filegalleryplugin
127	Can add downloadable file	42	add_downloadablefile
128	Can change downloadable file	42	change_downloadablefile
129	Can delete downloadable file	42	delete_downloadablefile
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('auth_permission_id_seq', 129, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$10000$5najxJrXLip0$CVQjPk21UkltVs7SRNAl9sTEaqG93WX6rEPx6ei4cVM=	2013-12-26 13:03:37.329828-05	t	brandon			blorenz@gmail.com	t	t	2013-12-26 13:02:52.172605-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: cms_cmsplugin; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cms_cmsplugin (id, placeholder_id, parent_id, "position", language, plugin_type, creation_date, changed_date, level, lft, rght, tree_id) FROM stdin;
1	1	\N	0	en	CMSGalleryPlugin	2013-12-27 13:10:32.343669-05	2013-12-27 13:10:32.344827-05	0	1	2	1
2	1	\N	1	en	CMSGalleryPlugin	2013-12-27 15:12:15.437273-05	2013-12-27 15:12:15.439075-05	0	1	2	2
3	1	\N	2	en	CMSGalleryPlugin	2013-12-27 15:15:03.483238-05	2013-12-27 15:15:03.484324-05	0	1	2	3
41	29	\N	7	en	CMSGalleryPlugin	2013-12-28 14:42:46.312211-05	2013-12-28 14:52:13.585377-05	0	1	2	24
4	30	\N	0	en	TextPlugin	2013-12-27 15:17:02.850731-05	2013-12-28 09:46:56.200803-05	0	1	2	4
226	95	\N	0	en	CMSVideoGalleryPlugin	2013-12-30 22:17:52.710725-05	2013-12-30 22:17:52.712597-05	0	1	2	91
227	95	\N	1	en	CMSVideoGalleryPlugin	2014-01-01 18:50:42.248077-05	2014-01-01 18:50:42.251371-05	0	1	2	92
17	29	\N	0	en	CMSGalleryPlugin	2013-12-28 13:58:58.405686-05	2013-12-28 14:17:30.317557-05	0	1	2	9
19	29	\N	1	en	CMSGalleryPlugin	2013-12-28 14:23:42.52221-05	2013-12-28 14:23:42.52329-05	0	1	2	10
20	29	\N	2	en	CMSGalleryPlugin	2013-12-28 14:26:45.812528-05	2013-12-28 14:26:45.813671-05	0	1	2	11
207	31	\N	8	en	CMSGalleryPlugin	2013-12-28 15:04:09.18295-05	2013-12-30 15:50:47.701499-05	0	1	2	72
208	32	\N	0	en	TextPlugin	2013-12-27 15:17:02.850731-05	2013-12-30 15:50:47.757727-05	0	1	2	73
21	29	\N	3	en	CMSGalleryPlugin	2013-12-28 14:33:42.292011-05	2013-12-28 14:35:02.744426-05	0	1	2	12
209	89	\N	0	en	CMSFileGalleryPlugin	2013-12-30 21:14:23.844371-05	2013-12-30 21:14:23.847021-05	0	1	2	74
38	29	\N	4	en	CMSGalleryPlugin	2013-12-28 14:41:45.840491-05	2013-12-28 14:41:45.841835-05	0	1	2	21
39	29	\N	5	en	CMSGalleryPlugin	2013-12-28 14:41:57.156137-05	2013-12-28 14:41:57.157267-05	0	1	2	22
40	29	\N	6	en	CMSGalleryPlugin	2013-12-28 14:42:25.343961-05	2013-12-28 14:42:25.34527-05	0	1	2	23
188	78	\N	0	en	CMSGalleryPlugin	2013-12-29 21:18:01.813745-05	2013-12-29 21:18:01.814894-05	0	1	2	53
189	80	\N	0	en	CMSGalleryPlugin	2013-12-29 21:18:09.344752-05	2013-12-29 21:18:09.34596-05	0	1	2	54
186	73	\N	0	en	CMSGalleryPlugin	2013-12-29 21:03:09.936413-05	2013-12-29 21:21:17.674381-05	0	1	2	51
210	87	\N	0	en	CMSVideoGalleryPlugin	2013-12-30 21:17:03.453142-05	2013-12-30 21:17:03.454419-05	0	1	2	75
191	74	\N	0	en	CMSGalleryPlugin	2013-12-29 21:28:35.061063-05	2013-12-29 21:29:25.744325-05	0	1	2	56
192	76	\N	0	en	CMSGalleryPlugin	2013-12-29 21:03:09.936413-05	2013-12-29 21:29:34.128037-05	0	1	2	57
193	75	\N	0	en	CMSGalleryPlugin	2013-12-29 21:28:35.061063-05	2013-12-29 21:29:34.16241-05	0	1	2	58
194	83	\N	0	en	CMSGalleryPlugin	2013-12-29 21:57:50.276334-05	2013-12-29 22:00:00.641745-05	0	1	2	59
195	84	\N	0	en	CMSGalleryPlugin	2013-12-29 21:57:50.276334-05	2013-12-29 22:00:21.229298-05	0	1	2	60
66	29	\N	8	en	CMSGalleryPlugin	2013-12-28 15:04:09.18295-05	2013-12-30 15:50:44.786377-05	0	1	2	37
196	3	\N	0	en	CMSGalleryPlugin	2013-12-30 15:50:47.654183-05	2013-12-30 15:50:47.656984-05	0	1	2	61
197	3	\N	1	en	CMSGalleryPlugin	2013-12-30 15:50:47.662615-05	2013-12-30 15:50:47.663595-05	0	1	2	62
198	3	\N	2	en	CMSGalleryPlugin	2013-12-30 15:50:47.665208-05	2013-12-30 15:50:47.666025-05	0	1	2	63
199	31	\N	0	en	CMSGalleryPlugin	2013-12-30 15:50:47.67719-05	2013-12-30 15:50:47.678114-05	0	1	2	64
200	31	\N	1	en	CMSGalleryPlugin	2013-12-30 15:50:47.679729-05	2013-12-30 15:50:47.680574-05	0	1	2	65
201	31	\N	2	en	CMSGalleryPlugin	2013-12-30 15:50:47.682129-05	2013-12-30 15:50:47.683078-05	0	1	2	66
202	31	\N	3	en	CMSGalleryPlugin	2013-12-30 15:50:47.684762-05	2013-12-30 15:50:47.685786-05	0	1	2	67
203	31	\N	4	en	CMSGalleryPlugin	2013-12-30 15:50:47.687529-05	2013-12-30 15:50:47.688546-05	0	1	2	68
204	31	\N	5	en	CMSGalleryPlugin	2013-12-30 15:50:47.690354-05	2013-12-30 15:50:47.691293-05	0	1	2	69
205	31	\N	6	en	CMSGalleryPlugin	2013-12-30 15:50:47.6929-05	2013-12-30 15:50:47.693717-05	0	1	2	70
206	31	\N	7	en	CMSGalleryPlugin	2013-12-30 15:50:47.695248-05	2013-12-30 15:50:47.69614-05	0	1	2	71
211	87	\N	1	en	CMSVideoGalleryPlugin	2013-12-30 21:17:32.335713-05	2013-12-30 21:17:32.336884-05	0	1	2	76
212	87	\N	2	en	CMSVideoGalleryPlugin	2013-12-30 21:18:29.930181-05	2013-12-30 21:18:29.93131-05	0	1	2	77
213	87	\N	3	en	CMSVideoGalleryPlugin	2013-12-30 21:19:46.920678-05	2013-12-30 21:19:46.921909-05	0	1	2	78
214	87	\N	4	en	CMSVideoGalleryPlugin	2013-12-30 21:21:26.405725-05	2013-12-30 21:21:26.406921-05	0	1	2	79
215	87	\N	5	en	CMSVideoGalleryPlugin	2013-12-30 21:23:32.161367-05	2013-12-30 21:23:32.162511-05	0	1	2	80
216	91	\N	0	en	CMSFileGalleryPlugin	2013-12-30 21:34:58.235765-05	2013-12-30 21:34:58.236894-05	0	1	2	81
228	95	\N	2	en	CMSVideoGalleryPlugin	2014-01-01 19:15:53.961578-05	2014-01-01 19:16:46.768985-05	0	1	2	93
217	91	\N	1	en	CMSFileGalleryPlugin	2013-12-30 21:38:35.988994-05	2013-12-30 21:39:17.998957-05	0	1	2	82
218	93	\N	0	en	CMSVideoGalleryPlugin	2013-12-30 21:40:31.976706-05	2013-12-30 21:40:31.977873-05	0	1	2	83
219	93	\N	1	en	CMSVideoGalleryPlugin	2013-12-30 21:40:31.979595-05	2013-12-30 21:40:31.980425-05	0	1	2	84
220	93	\N	2	en	CMSVideoGalleryPlugin	2013-12-30 21:40:31.98207-05	2013-12-30 21:40:31.98293-05	0	1	2	85
221	93	\N	3	en	CMSVideoGalleryPlugin	2013-12-30 21:40:31.984423-05	2013-12-30 21:40:31.985276-05	0	1	2	86
222	93	\N	4	en	CMSVideoGalleryPlugin	2013-12-30 21:40:31.986789-05	2013-12-30 21:40:31.987605-05	0	1	2	87
223	93	\N	5	en	CMSVideoGalleryPlugin	2013-12-30 21:40:31.989292-05	2013-12-30 21:40:31.990117-05	0	1	2	88
224	92	\N	0	en	CMSFileGalleryPlugin	2013-12-30 21:40:32.007646-05	2013-12-30 21:40:32.008573-05	0	1	2	89
225	92	\N	1	en	CMSFileGalleryPlugin	2013-12-30 21:38:35.988994-05	2013-12-30 21:40:32.013366-05	0	1	2	90
229	97	\N	0	en	CMSFileGalleryPlugin	2014-01-01 19:22:18.512385-05	2014-01-01 19:22:18.513491-05	0	1	2	94
230	96	\N	0	en	CMSVideoGalleryPlugin	2014-01-01 19:22:18.526493-05	2014-01-01 19:22:18.527453-05	0	1	2	95
231	96	\N	1	en	CMSVideoGalleryPlugin	2014-01-01 19:22:18.528993-05	2014-01-01 19:22:18.529825-05	0	1	2	96
232	96	\N	2	en	CMSVideoGalleryPlugin	2014-01-01 19:15:53.961578-05	2014-01-01 19:22:18.534677-05	0	1	2	97
\.


--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('cms_cmsplugin_id_seq', 232, true);


--
-- Data for Name: cms_globalpagepermission; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cms_globalpagepermission (id, user_id, group_id, can_change, can_add, can_delete, can_change_advanced_settings, can_publish, can_change_permissions, can_move_page, can_view, can_recover_page) FROM stdin;
\.


--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('cms_globalpagepermission_id_seq', 1, false);


--
-- Data for Name: cms_globalpagepermission_sites; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cms_globalpagepermission_sites (id, globalpagepermission_id, site_id) FROM stdin;
\.


--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('cms_globalpagepermission_sites_id_seq', 1, false);


--
-- Data for Name: cms_page; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cms_page (id, created_by, changed_by, parent_id, creation_date, changed_date, publication_date, publication_end_date, in_navigation, soft_root, reverse_id, navigation_extenders, published, template, site_id, login_required, limit_visibility_in_menu, level, lft, rght, tree_id, publisher_is_draft, publisher_public_id, publisher_state) FROM stdin;
3	brandon	brandon	\N	2013-12-26 13:07:54.919059-05	2013-12-30 15:50:47.76749-05	2013-12-26 13:14:24.682839-05	\N	t	f	\N		t	home.html	1	f	\N	0	1	2	2	t	4	0
10	brandon	brandon	\N	2013-12-27 12:51:01.723573-05	2013-12-27 13:00:38.945523-05	2013-12-27 12:50:56.76082-05	\N	t	f	\N		t	home.html	1	f	\N	0	1	2	13	f	8	0
8	brandon	brandon	\N	2013-12-27 12:50:44.988937-05	2013-12-27 13:00:38.981348-05	2013-12-27 12:50:56.76082-05	\N	t	f	\N		t	home.html	1	f	\N	0	1	2	6	t	10	0
28	brandon	brandon	6	2013-12-29 20:08:56.437704-05	2013-12-29 21:18:09.306154-05	2013-12-29 20:08:51.478361-05	\N	t	f	\N		t	products.html	1	f	\N	1	2	13	10	f	27	0
24	brandon	brandon	28	2013-12-29 20:05:31.025323-05	2013-12-30 21:40:31.93885-05	2013-12-29 20:05:26.069291-05	\N	t	f	\N		t	products_installations.html	1	f	\N	2	9	10	10	f	21	0
5	brandon	brandon	\N	2013-12-27 12:39:00.539367-05	2013-12-29 20:01:37.74882-05	2013-12-27 12:44:20.565796-05	\N	t	f	\N		t	products.html	1	f	\N	0	1	14	3	t	6	0
21	brandon	brandon	27	2013-12-29 20:05:13.907275-05	2013-12-30 21:40:32.030722-05	2013-12-29 20:05:26.069291-05	\N	t	f	\N		t	products_installations.html	1	f	\N	2	9	10	3	t	24	0
27	brandon	brandon	5	2013-12-29 20:08:20.517057-05	2013-12-29 21:18:09.354773-05	2013-12-29 20:08:51.478361-05	\N	t	f	\N		t	products.html	1	f	\N	1	2	13	3	t	28	0
7	brandon	brandon	\N	2013-12-27 12:50:28.873483-05	2013-12-27 13:00:40.479598-05	2013-12-27 12:50:56.136089-05	\N	t	f	\N		t	home.html	1	f	\N	0	1	6	4	t	9	0
25	brandon	brandon	28	2013-12-29 20:05:31.572109-05	2014-01-01 19:22:18.468854-05	2013-12-29 20:05:26.616801-05	\N	t	f	\N		t	products_movies.html	1	f	\N	2	7	8	10	f	20	0
20	brandon	brandon	27	2013-12-29 20:04:51.228548-05	2014-01-01 19:22:18.551594-05	2013-12-29 20:05:26.616801-05	\N	t	f	\N		t	products_movies.html	1	f	\N	2	7	8	3	t	25	0
12	brandon	brandon	9	2013-12-27 12:53:24.289658-05	2013-12-27 13:03:22.069816-05	2013-12-27 12:53:19.323881-05	\N	t	f	\N		t	home.html	1	f	\N	1	2	3	11	f	11	0
11	brandon	brandon	7	2013-12-27 12:53:17.06012-05	2013-12-27 13:03:22.103037-05	2013-12-27 12:53:19.323881-05	\N	t	f	\N		t	home.html	1	f	\N	1	2	3	4	t	12	0
9	brandon	brandon	\N	2013-12-27 12:51:01.102054-05	2013-12-27 13:00:40.442902-05	2013-12-27 12:50:56.136089-05	\N	t	f	\N		t	home.html	1	f	\N	0	1	6	11	f	7	0
16	brandon	brandon	9	2013-12-27 13:03:30.120624-05	2013-12-27 13:04:39.55916-05	2013-12-27 13:03:25.153813-05	\N	t	f	\N		t	home.html	1	f	\N	1	4	5	11	f	15	0
15	brandon	brandon	7	2013-12-27 13:02:47.846711-05	2013-12-27 13:04:39.592209-05	2013-12-27 13:03:25.153813-05	\N	t	f	\N		t	home.html	1	f	\N	1	4	5	4	t	16	0
18	brandon	brandon	28	2013-12-29 20:02:26.221773-05	2013-12-29 21:29:34.073868-05	2013-12-29 20:02:21.261716-05	\N	t	f	\N		t	products.html	1	f	\N	2	3	4	10	f	17	0
17	brandon	brandon	27	2013-12-29 20:02:16.238878-05	2013-12-29 21:29:34.177483-05	2013-12-29 20:02:21.261716-05	\N	t	f	\N		t	products.html	1	f	\N	2	3	4	3	t	18	0
26	brandon	brandon	28	2013-12-29 20:05:32.238117-05	2013-12-29 22:00:21.181308-05	2013-12-29 20:05:27.29045-05	\N	t	f	\N		t	products_features.html	1	f	\N	2	5	6	10	f	19	0
19	brandon	brandon	27	2013-12-29 20:04:40.249181-05	2013-12-29 22:00:21.252292-05	2013-12-29 20:05:27.29045-05	\N	t	f	\N		t	products_features.html	1	f	\N	2	5	6	3	t	26	0
4	brandon	brandon	\N	2013-12-26 13:15:25.205629-05	2013-12-30 15:50:47.562704-05	2013-12-26 13:14:24.682839-05	\N	t	f	\N		t	home.html	1	f	\N	0	1	2	9	f	3	0
6	brandon	brandon	\N	2013-12-27 12:44:25.53382-05	2013-12-29 20:01:37.708584-05	2013-12-27 12:44:20.565796-05	\N	t	f	\N		t	products.html	1	f	\N	0	1	14	10	f	5	0
23	brandon	brandon	28	2013-12-29 20:05:30.388915-05	2013-12-29 20:09:35.132093-05	2013-12-29 20:05:25.431466-05	\N	t	f	\N		t	products.html	1	f	\N	2	11	12	10	f	22	0
22	brandon	brandon	27	2013-12-29 20:05:24.721094-05	2013-12-29 20:09:35.20016-05	2013-12-29 20:05:25.431466-05	\N	t	f	\N		t	products.html	1	f	\N	2	11	12	3	t	23	0
\.


--
-- Name: cms_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('cms_page_id_seq', 28, true);


--
-- Data for Name: cms_page_placeholders; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cms_page_placeholders (id, page_id, placeholder_id) FROM stdin;
1	3	1
2	3	2
3	4	3
4	4	4
5	5	5
6	5	6
7	6	7
8	6	8
9	7	9
10	7	10
11	8	11
12	8	12
13	9	13
14	9	14
15	10	15
16	10	16
17	11	17
18	11	18
19	12	19
20	12	20
25	15	25
26	15	26
27	16	27
28	16	28
29	3	29
30	3	30
31	4	31
32	4	32
33	5	33
34	5	34
35	6	35
36	6	36
37	17	37
38	17	38
39	17	39
40	18	40
41	18	41
42	18	42
43	19	43
44	19	44
45	19	45
46	20	46
47	20	47
48	20	48
49	21	49
50	21	50
51	21	51
52	22	52
53	22	53
54	22	54
55	23	55
56	23	56
57	23	57
58	24	58
59	24	59
60	24	60
61	25	61
62	25	62
63	25	63
64	26	64
65	26	65
66	26	66
67	27	67
68	27	68
69	27	69
70	28	70
71	28	71
72	28	72
73	17	73
74	17	74
75	18	75
76	18	76
77	27	77
78	27	78
79	28	79
80	28	80
81	19	81
82	19	82
83	19	83
84	26	84
85	26	85
86	26	86
87	21	87
88	21	88
89	20	89
90	20	90
91	21	91
92	24	92
93	24	93
94	24	94
95	20	95
96	25	96
97	25	97
98	25	98
\.


--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('cms_page_placeholders_id_seq', 98, true);


--
-- Data for Name: cms_pagemoderatorstate; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cms_pagemoderatorstate (id, page_id, user_id, created, action, message) FROM stdin;
\.


--
-- Name: cms_pagemoderatorstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('cms_pagemoderatorstate_id_seq', 46, true);


--
-- Data for Name: cms_pagepermission; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cms_pagepermission (id, user_id, group_id, can_change, can_add, can_delete, can_change_advanced_settings, can_publish, can_change_permissions, can_move_page, can_view, grant_on, page_id) FROM stdin;
\.


--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('cms_pagepermission_id_seq', 1, false);


--
-- Data for Name: cms_pageuser; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cms_pageuser (user_ptr_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cms_pageusergroup; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cms_pageusergroup (group_ptr_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cms_placeholder; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cms_placeholder (id, slot, default_width) FROM stdin;
1	home_content	\N
2	base_content	\N
3	home_content	\N
4	base_content	\N
5	template_1_content	\N
6	base_content	\N
7	template_1_content	\N
8	base_content	\N
9	home_content	\N
10	base_content	\N
11	home_content	\N
12	base_content	\N
13	home_content	\N
14	base_content	\N
15	home_content	\N
16	base_content	\N
17	home_content	\N
18	base_content	\N
19	home_content	\N
20	base_content	\N
23	home_content	\N
24	base_content	\N
25	home_content	\N
26	base_content	\N
27	home_content	\N
28	base_content	\N
29	slideshow_content	\N
30	homepage_text_content	\N
31	slideshow_content	\N
32	homepage_text_content	\N
33	slideshow_content	\N
34	homepage_text_content	\N
35	slideshow_content	\N
36	homepage_text_content	\N
37	slideshow_content	\N
38	homepage_text_content	\N
39	base_content	\N
40	slideshow_content	\N
41	homepage_text_content	\N
42	base_content	\N
43	slideshow_content	\N
44	homepage_text_content	\N
45	base_content	\N
46	slideshow_content	\N
47	homepage_text_content	\N
48	base_content	\N
49	slideshow_content	\N
50	homepage_text_content	\N
51	base_content	\N
52	slideshow_content	\N
53	homepage_text_content	\N
54	base_content	\N
55	slideshow_content	\N
56	homepage_text_content	\N
57	base_content	\N
58	slideshow_content	\N
59	homepage_text_content	\N
60	base_content	\N
61	slideshow_content	\N
62	homepage_text_content	\N
63	base_content	\N
64	slideshow_content	\N
65	homepage_text_content	\N
66	base_content	\N
67	slideshow_content	\N
68	homepage_text_content	\N
69	base_content	\N
70	slideshow_content	\N
71	homepage_text_content	\N
72	base_content	\N
73	products_content	\N
74	hero_content	\N
75	hero_content	\N
76	products_content	\N
77	hero_content	\N
78	products_content	\N
79	hero_content	\N
80	products_content	\N
81	hero_content	\N
82	products_content	\N
83	features	\N
84	features	\N
85	hero_content	\N
86	products_content	\N
87	hero_content	\N
88	products_content	\N
89	hero_content	\N
90	products_content	\N
91	products_installations_content	\N
92	products_installations_content	\N
93	hero_content	\N
94	products_content	\N
95	products_movies_content	\N
96	products_movies_content	\N
97	hero_content	\N
98	products_content	\N
\.


--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('cms_placeholder_id_seq', 98, true);


--
-- Data for Name: cms_title; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cms_title (id, language, title, menu_title, slug, path, has_url_overwrite, application_urls, redirect, meta_description, meta_keywords, page_title, page_id, creation_date) FROM stdin;
13	en	In-House Machine Repair		in-house-machine-repair	support-services/in-house-machine-repair	f						15	2013-12-27 13:02:47.862553-05
14	en	In-House Machine Repair		in-house-machine-repair	support-services/in-house-machine-repair	f						16	2013-12-27 13:02:47.862553-05
23	en	Articles	\N	articles	products/slitting-lines/articles	f	\N	\N	\N	\N	\N	23	2013-12-29 20:05:24.739243-05
15	es	Casa		casa		f	\N	\N				3	2013-12-28 12:34:15.150056-05
1	en	Home		home		f						3	2013-12-26 13:07:54.937819-05
28	en	Slitting Lines		slitting-lines	products/slitting-lines	f						28	2013-12-29 20:08:20.53632-05
18	en	Overview	\N	overview	products/slitting-lines/overview	f	\N	\N	\N	\N	\N	18	2013-12-29 20:02:16.261311-05
26	en	Features	\N	features	products/slitting-lines/features	f	\N	\N	\N	\N	\N	26	2013-12-29 20:04:40.267709-05
16	es	Casa		casa		f	\N	\N				4	2013-12-28 12:34:15.150056-05
2	en	Home		home		f						4	2013-12-26 13:07:54.937819-05
5	en	Support Services	\N	support-services	support-services	f	\N	\N	\N	\N	\N	7	2013-12-27 12:50:28.888531-05
24	en	Installations	\N	installations	products/slitting-lines/installations	f	\N	\N	\N	\N	\N	24	2013-12-29 20:05:13.926321-05
6	en	Contact Us	\N	contact-us	contact-us	f	\N	\N	\N	\N	\N	8	2013-12-27 12:50:45.003941-05
25	en	Movies	\N	movies	products/slitting-lines/movies	f	\N	\N	\N	\N	\N	25	2013-12-29 20:04:51.247213-05
3	en	Products		products	products	f						5	2013-12-27 12:39:00.558525-05
4	en	Products		products	products	f						6	2013-12-27 12:39:00.558525-05
8	en	Contact Us	\N	contact-us	contact-us	f	\N	\N	\N	\N	\N	10	2013-12-27 12:50:45.003941-05
7	en	Support Services	\N	support-services	support-services	f	\N	\N	\N	\N	\N	9	2013-12-27 12:50:28.888531-05
9	en	Field Service and Repair		field-service-repair	support-services/field-service-repair	f						11	2013-12-27 12:53:17.076676-05
10	en	Field Service and Repair		field-service-repair	support-services/field-service-repair	f						12	2013-12-27 12:53:17.076676-05
27	en	Slitting Lines		slitting-lines	products/slitting-lines	f						27	2013-12-29 20:08:20.53632-05
17	en	Overview	\N	overview	products/slitting-lines/overview	f	\N	\N	\N	\N	\N	17	2013-12-29 20:02:16.261311-05
19	en	Features	\N	features	products/slitting-lines/features	f	\N	\N	\N	\N	\N	19	2013-12-29 20:04:40.267709-05
20	en	Movies	\N	movies	products/slitting-lines/movies	f	\N	\N	\N	\N	\N	20	2013-12-29 20:04:51.247213-05
21	en	Installations	\N	installations	products/slitting-lines/installations	f	\N	\N	\N	\N	\N	21	2013-12-29 20:05:13.926321-05
22	en	Articles	\N	articles	products/slitting-lines/articles	f	\N	\N	\N	\N	\N	22	2013-12-29 20:05:24.739243-05
\.


--
-- Name: cms_title_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('cms_title_id_seq', 28, true);


--
-- Data for Name: cmsplugin_file_gallery_downloadablefile; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cmsplugin_file_gallery_downloadablefile (id, inline_ordering_position, gallery_id, src, src_height, src_width, title, alt, link, extended_content, downloadable_file) FROM stdin;
4	1	217	cms_page_media/21/Berlin_1.JPG	600	600	Berlin Hammond			Berlin	cms_page_media/21/Berlin Hammond_1.pdf
5	2	225	cms_page_media/21/Berlin_1.JPG	600	600	Berlin Hammond			Berlin	cms_page_media/21/Berlin Hammond_1.pdf
\.


--
-- Name: cmsplugin_file_gallery_downloadablefile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('cmsplugin_file_gallery_downloadablefile_id_seq', 5, true);


--
-- Data for Name: cmsplugin_filegalleryplugin; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cmsplugin_filegalleryplugin (cmsplugin_ptr_id, title, template) FROM stdin;
217	Slitting Lines Installations	cmsplugin_file_gallery/installations_image_title_description.html
225	Slitting Lines Installations	cmsplugin_file_gallery/installations_image_title_description.html
\.


--
-- Data for Name: cmsplugin_filer_image_thumbnailoption; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cmsplugin_filer_image_thumbnailoption (id, name, width, height, crop, upscale) FROM stdin;
\.


--
-- Name: cmsplugin_filer_image_thumbnailoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('cmsplugin_filer_image_thumbnailoption_id_seq', 1, false);


--
-- Data for Name: cmsplugin_filerfile; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cmsplugin_filerfile (cmsplugin_ptr_id, title, file_id, target_blank) FROM stdin;
\.


--
-- Data for Name: cmsplugin_filerfolder; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cmsplugin_filerfolder (cmsplugin_ptr_id, title, view_option, folder_id) FROM stdin;
\.


--
-- Data for Name: cmsplugin_filerimage; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cmsplugin_filerimage (cmsplugin_ptr_id, caption_text, image_id, image_url, alt_text, use_original_image, thumbnail_option_id, use_autoscale, width, height, crop, upscale, alignment, free_link, page_link_id, file_link_id, original_link, description, target_blank) FROM stdin;
\.


--
-- Data for Name: cmsplugin_filerteaser; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cmsplugin_filerteaser (cmsplugin_ptr_id, title, image_id, image_url, style, use_autoscale, width, height, free_link, page_link_id, description, target_blank) FROM stdin;
\.


--
-- Data for Name: cmsplugin_filervideo; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cmsplugin_filervideo (cmsplugin_ptr_id, movie_id, movie_url, image_id, width, height, auto_play, auto_hide, fullscreen, loop, bgcolor, textcolor, seekbarcolor, seekbarbgcolor, loadingbarcolor, buttonoutcolor, buttonovercolor, buttonhighlightcolor) FROM stdin;
\.


--
-- Data for Name: cmsplugin_gallery_image; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cmsplugin_gallery_image (id, inline_ordering_position, gallery_id, src, src_height, src_width, title, alt, link, extended_content) FROM stdin;
38	15	192	cms_page_media/17/IMG_0157 600px.jpg	600	600	Heavy Gauge			45-ton x .625” (16.0mm) gauge coils in widths to 84” (2133mm) is the capacity of this Turret Head™ Slitter that generates 35,000 tons/month of slit coil to satisfy the appetite of heavy-wall OCTG welded tube mills.
11	3	66	cms_page_media/3/03 Cut to Length Lines.jpg	2736	3648	And this			
27	7	186	cms_page_media/17/100_0455 600px.jpg	600	600	Thin Gauge			Sitting and rewinding a 20-ton coil into fifty narrow 0.007” (0.18mm) gauge tightly wound straight wall virtually burr-free slit coils requires both precision and finesse. This Turret Head™ Slitter achieves both.
29	9	186	cms_page_media/17/100_1860 600px.jpg	600	600	Exposed Automotive			Coils destined for exposed automotive applications is a high-quality and surface sensitive product. Surface inspection is required to assure that the product quality meets stringent quality standards. This “double-loop” Turret Head™ Slitter is dedicated to processing 30-ton x 72” (1828mm) wide exposed automotive coil.
28	8	186	cms_page_media/17/IMG_0157 600px.jpg	600	600	Heavy Gauge			45-ton x .625” (16.0mm) gauge coils in widths to 84” (2133mm) is the capacity of this Turret Head™ Slitter that generates 35,000 tons/month of slit coil to satisfy the appetite of heavy-wall OCTG welded tube mills.
36	13	191	cms_page_media/17/100_0168.JPG	1500	2000	World Leader			Braner/Loopco has designed and manufactured 600+ ferrous and non-ferrous Coil Slitting Lines that produce high-quality slit coil at metal producing mills, metal service centers, welded tube & pipe manufacturers, building products manufacturers, and metal products OEMs in 24-countries. Braner/Loopco Slitting Lines are processing coils weighing up to 45-tons in gauges from 0.006” (0.18mm) through 0.63” (16.0mm).
37	14	192	cms_page_media/17/100_0455 600px.jpg	600	600	Thin Gauge			Sitting and rewinding a 20-ton coil into fifty narrow 0.007” (0.18mm) gauge tightly wound straight wall virtually burr-free slit coils requires both precision and finesse. This Turret Head™ Slitter achieves both.
39	16	192	cms_page_media/17/100_1860 600px.jpg	600	600	Exposed Automotive			Coils destined for exposed automotive applications is a high-quality and surface sensitive product. Surface inspection is required to assure that the product quality meets stringent quality standards. This “double-loop” Turret Head™ Slitter is dedicated to processing 30-ton x 72” (1828mm) wide exposed automotive coil.
40	17	193	cms_page_media/17/100_0168.JPG	1500	2000	World Leader			Braner/Loopco has designed and manufactured 600+ ferrous and non-ferrous Coil Slitting Lines that produce high-quality slit coil at metal producing mills, metal service centers, welded tube & pipe manufacturers, building products manufacturers, and metal products OEMs in 24-countries. Braner/Loopco Slitting Lines are processing coils weighing up to 45-tons in gauges from 0.006” (0.18mm) through 0.63” (16.0mm).
41	18	194	cms_page_media/19/01 Compact Slitting Line Footprint.jpg	500	1000	1.  Compact Slitting Line foot print			conserves floor space, reduces thread-up time, and\r\nimproves strip tracking
42	19	194	cms_page_media/19/02 Andiamo Automatic Hands Free Threading.jpg	500	1000	2.  Andiamo automatic hands-free multi-strip threading			
43	20	194	cms_page_media/19/03 Wireless Remote Coil Car Operation.jpg	500	1000	3. Wireless remote coil car operation improves safety 			
44	21	194	cms_page_media/19/04 Laser Aided Master Coil Centering.jpg	500	1000	4.  Laser aided master coil centering 			reduces coil loading alignment time
45	22	195	cms_page_media/19/01 Compact Slitting Line Footprint.jpg	500	1000	1.  Compact Slitting Line foot print			conserves floor space, reduces thread-up time, and\r\nimproves strip tracking
46	23	195	cms_page_media/19/02 Andiamo Automatic Hands Free Threading.jpg	500	1000	2.  Andiamo automatic hands-free multi-strip threading			
47	24	195	cms_page_media/19/03 Wireless Remote Coil Car Operation.jpg	500	1000	3. Wireless remote coil car operation improves safety 			
48	25	195	cms_page_media/19/04 Laser Aided Master Coil Centering.jpg	500	1000	4.  Laser aided master coil centering 			reduces coil loading alignment time
1	2	66	cms_page_media/3/01 Slitting Lines_2.jpg	2304	3072	something here			
2	1	66	cms_page_media/3/02 Slit Coil Packaging Lines_2.jpg	1420	1800	something there			
49	26	207	cms_page_media/3/02 Slit Coil Packaging Lines_2.jpg	1420	1800	something there			
50	27	207	cms_page_media/3/01 Slitting Lines_2.jpg	2304	3072	something here			
51	28	207	cms_page_media/3/03 Cut to Length Lines.jpg	2736	3648	And this			
\.


--
-- Name: cmsplugin_gallery_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('cmsplugin_gallery_image_id_seq', 51, true);


--
-- Data for Name: cmsplugin_galleryplugin; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cmsplugin_galleryplugin (cmsplugin_ptr_id, title, slide_duration, template, fade_duration) FROM stdin;
186	Products	0	cmsplugin_gallery/products_image_title_description.html	0
191	Product Hero	3	cmsplugin_gallery/products_hero_image_title_description.html	1
192	Products	0	cmsplugin_gallery/products_image_title_description.html	0
193	Product Hero	3	cmsplugin_gallery/products_hero_image_title_description.html	1
194	Slitting Lines Features	0	cmsplugin_gallery/products_features.html	0
195	Slitting Lines Features	0	cmsplugin_gallery/products_features.html	0
66	homepage	3	cmsplugin_gallery/homepage_gallery.html	1
207	homepage	3	cmsplugin_gallery/homepage_gallery.html	1
\.


--
-- Data for Name: cmsplugin_link; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cmsplugin_link (cmsplugin_ptr_id, name, url, page_link_id, mailto, target) FROM stdin;
\.


--
-- Data for Name: cmsplugin_text; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cmsplugin_text (cmsplugin_ptr_id, body) FROM stdin;
4	<h3>Welcome to Braner</h3>\n<p>Welcome to our web page, we appreciate your interest! Braner USA manufactures slitting lines, slit coil packaging lines, cut-to-length lines, multi-blanking lines and other flat rolled coil processing equipment. We also provide equipment upgrade feasibility studies, in-house machine repairs, field service and repair, installation service and OEM spare parts for Braner, Loopco, Stanat and Coiltech machines. We are committed to continuous improvement of our designs targeting increased operating efficiency for our customers.</p>
208	<h3>Welcome to Braner</h3>\n<p>Welcome to our web page, we appreciate your interest! Braner USA manufactures slitting lines, slit coil packaging lines, cut-to-length lines, multi-blanking lines and other flat rolled coil processing equipment. We also provide equipment upgrade feasibility studies, in-house machine repairs, field service and repair, installation service and OEM spare parts for Braner, Loopco, Stanat and Coiltech machines. We are committed to continuous improvement of our designs targeting increased operating efficiency for our customers.</p>
\.


--
-- Data for Name: cmsplugin_video_gallery_video; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cmsplugin_video_gallery_video (id, inline_ordering_position, gallery_id, src, src_height, src_width, title, alt, link, extended_content, poster_src, poster_src_height, poster_src_width, mp4_file, ogv_file, webm_file, video_width, video_height, video_duration) FROM stdin;
1	1	228	cms_page_media/20/poster.png	241	241	Yummy			Lorem ipsum		\N	\N	cms_page_media/20/01.m4v	cms_page_media/20/01.ogv	cms_page_media/20/01.webm	\N	\N	3:53
2	2	232	cms_page_media/20/poster.png	\N	\N	Yummy			Lorem ipsum		\N	\N	cms_page_media/20/01.m4v	cms_page_media/20/01.ogv	cms_page_media/20/01.webm	\N	\N	3:53
\.


--
-- Name: cmsplugin_video_gallery_video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('cmsplugin_video_gallery_video_id_seq', 2, true);


--
-- Data for Name: cmsplugin_videogalleryplugin; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY cmsplugin_videogalleryplugin (cmsplugin_ptr_id, title, template) FROM stdin;
228	Something	cmsplugin_video_gallery/products_movies_title_description.html
232	Something	cmsplugin_video_gallery/products_movies_title_description.html
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2013-12-26 13:07:54.949226-05	1	10	3	Home	1	
2	2013-12-26 13:14:29.706431-05	1	10	3	Home	2	Changed published.
3	2013-12-27 12:36:40.41346-05	1	10	3	Home	2	Changed in_navigation.
4	2013-12-27 12:39:00.569807-05	1	10	5	Products	1	
5	2013-12-27 12:50:28.897629-05	1	10	7	Support Services	1	
6	2013-12-27 12:50:45.013447-05	1	10	8	Contact Us	1	
7	2013-12-27 12:51:01.148214-05	1	10	7	Support Services	2	
8	2013-12-27 12:51:01.772787-05	1	10	8	Contact Us	2	
9	2013-12-27 12:53:17.086842-05	1	10	11	Field Service Repair	1	
10	2013-12-27 12:53:24.335696-05	1	10	11	Field Service Repair	2	
11	2013-12-27 12:58:18.950806-05	1	10	13	test	1	
12	2013-12-27 12:58:24.401783-05	1	10	13	test	2	
13	2013-12-27 12:58:32.351554-05	1	10	13	test	2	
14	2013-12-27 12:58:39.869654-05	1	10	13	test	2	Changed published and in_navigation.
15	2013-12-27 12:59:06.264233-05	1	10	5	Products	2	
16	2013-12-27 12:59:06.819299-05	1	10	7	Support Services	2	
17	2013-12-27 12:59:07.350511-05	1	10	8	Contact Us	2	
18	2013-12-27 12:59:38.296329-05	1	10	11	Field Service Repair	2	
19	2013-12-27 12:59:39.163067-05	1	10	11	Field Service Repair	2	
20	2013-12-27 12:59:51.531505-05	1	10	11	Field Service Repair	2	
21	2013-12-27 12:59:55.316651-05	1	10	11	Field Service Repair	2	
22	2013-12-27 12:59:59.478193-05	1	10	11	Field Service Repair	2	
23	2013-12-27 13:00:04.207504-05	1	10	11	Field Service Repair	2	
24	2013-12-27 13:00:25.47385-05	1	10	11	Field Service Repair	2	
25	2013-12-27 13:00:30.04523-05	1	10	13	test	2	
26	2013-12-27 13:00:34.713998-05	1	10	5	Products	2	
27	2013-12-27 13:00:35.97322-05	1	10	7	Support Services	2	
28	2013-12-27 13:00:36.993559-05	1	10	7	Support Services	2	
29	2013-12-27 13:00:37.98147-05	1	10	11	Field Service Repair	2	
30	2013-12-27 13:00:38.993916-05	1	10	8	Contact Us	2	
31	2013-12-27 13:00:39.659175-05	1	10	13	test	2	
32	2013-12-27 13:00:40.518617-05	1	10	7	Support Services	2	
33	2013-12-27 13:01:29.101824-05	1	10	13	test	3	
34	2013-12-27 13:02:47.868474-05	1	10	15	In-House Machine Repair	1	
35	2013-12-27 13:03:04.820452-05	1	10	11	Field Service Repair	2	Changed title.
36	2013-12-27 13:03:19.943042-05	1	10	11	Field Service and Repair	2	
37	2013-12-27 13:03:22.111393-05	1	10	11	Field Service and Repair	2	
38	2013-12-27 13:03:30.1653-05	1	10	15	In-House Machine Repair	2	
39	2013-12-27 13:03:38.687994-05	1	10	3	Home	2	
40	2013-12-27 13:03:39.447509-05	1	10	3	Home	2	
41	2013-12-27 13:04:31.147014-05	1	10	15	In-House Machine Repair	2	Changed slug.
42	2013-12-27 13:04:37.409172-05	1	10	15	In-House Machine Repair	2	
43	2013-12-27 13:04:39.600138-05	1	10	15	In-House Machine Repair	2	
44	2013-12-28 12:34:15.165675-05	1	10	3	Home	2	Changed title, slug and language.
45	2013-12-28 14:00:39.644156-05	1	28	1	01 Slitting Lines.jpg	2	No fields changed.
46	2013-12-28 14:01:14.542001-05	1	28	1	01 Slitting Lines.jpg	2	No fields changed.
47	2013-12-28 14:02:23.482139-05	1	28	1	01 Slitting Lines.jpg	2	No fields changed.
48	2013-12-28 14:02:29.774006-05	1	28	1	01 Slitting Lines.jpg	2	No fields changed.
49	2013-12-28 14:02:33.95463-05	1	28	1	01 Slitting Lines.jpg	2	No fields changed.
50	2013-12-28 14:18:07.118579-05	1	25	1	01 Slitting Lines.jpg	3	
51	2013-12-28 14:18:25.224844-05	1	28	2	01 Slitting Lines.jpg	2	No fields changed.
52	2013-12-28 14:18:33.483853-05	1	28	2	01 Slitting Lines.jpg	2	No fields changed.
53	2013-12-29 20:01:36.365599-05	1	10	5	Products	2	Changed template.
54	2013-12-29 20:02:16.268024-05	1	10	17	Overview	1	
55	2013-12-29 20:02:26.273651-05	1	10	17	Overview	2	
56	2013-12-29 20:04:40.274049-05	1	10	19	Features	1	
57	2013-12-29 20:04:51.253637-05	1	10	20	Movies	1	
58	2013-12-29 20:05:13.932203-05	1	10	21	Installations	1	
59	2013-12-29 20:05:24.745086-05	1	10	22	Articles	1	
60	2013-12-29 20:05:30.443992-05	1	10	22	Articles	2	
61	2013-12-29 20:05:31.082028-05	1	10	21	Installations	2	
62	2013-12-29 20:05:31.630766-05	1	10	20	Movies	2	
63	2013-12-29 20:05:32.303487-05	1	10	19	Features	2	
64	2013-12-29 20:08:20.542753-05	1	10	27	Slitting lines	1	
65	2013-12-29 20:08:34.18075-05	1	10	27	Slitting lines	2	Changed title.
66	2013-12-29 20:08:56.500048-05	1	10	27	Slitting Lines	2	
67	2013-12-29 20:09:27.756266-05	1	10	17	Overview	2	
68	2013-12-29 20:09:28.388339-05	1	10	17	Overview	2	
69	2013-12-29 20:09:29.058239-05	1	10	19	Features	2	
70	2013-12-29 20:09:29.693984-05	1	10	19	Features	2	
71	2013-12-29 20:09:30.424142-05	1	10	20	Movies	2	
72	2013-12-29 20:09:31.094883-05	1	10	20	Movies	2	
73	2013-12-29 20:09:32.683111-05	1	10	21	Installations	2	
74	2013-12-29 20:09:33.444984-05	1	10	21	Installations	2	
75	2013-12-29 20:09:34.38214-05	1	10	22	Articles	2	
76	2013-12-29 20:09:35.208753-05	1	10	22	Articles	2	
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 76, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	log entry	admin	logentry
2	permission	auth	permission
3	group	auth	group
4	user	auth	user
5	content type	contenttypes	contenttype
6	session	sessions	session
7	site	sites	site
8	placeholder	cms	placeholder
9	cms plugin	cms	cmsplugin
10	page	cms	page
11	Page moderator state	cms	pagemoderatorstate
12	Page global permission	cms	globalpagepermission
13	Page permission	cms	pagepermission
14	User (page)	cms	pageuser
15	User group (page)	cms	pageusergroup
16	title	cms	title
17	cache key	menus	cachekey
18	migration history	south	migrationhistory
19	link	link	link
20	text	text	text
21	revision	reversion	revision
22	version	reversion	version
23	Folder	filer	folder
24	folder permission	filer	folderpermission
25	file	filer	file
26	clipboard	filer	clipboard
27	clipboard item	filer	clipboarditem
28	image	filer	image
29	filer file	cmsplugin_filer_file	filerfile
30	filer folder	cmsplugin_filer_folder	filerfolder
31	filer image	cmsplugin_filer_image	filerimage
32	thumbnail option	cmsplugin_filer_image	thumbnailoption
33	filer teaser	cmsplugin_filer_teaser	filerteaser
34	filer video	cmsplugin_filer_video	filervideo
35	gallery plugin	cmsplugin_gallery	galleryplugin
36	image	cmsplugin_gallery	image
37	source	easy_thumbnails	source
38	thumbnail	easy_thumbnails	thumbnail
39	video gallery plugin	cmsplugin_video_gallery	videogalleryplugin
40	video	cmsplugin_video_gallery	video
41	file gallery plugin	cmsplugin_file_gallery	filegalleryplugin
42	downloadable file	cmsplugin_file_gallery	downloadablefile
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('django_content_type_id_seq', 42, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
xc4lge94w0ksocak7thmdu8awrhueja5	MGU5MTkxNDQ2ZTRmNDRkM2FmNmNiNWM4NzNjMzhiYWEyM2NhMzA4YzqAAn1xAShVDmNtc19hZG1pbl9zaXRlSwFVCV9tZXNzYWdlc1RJKgAAW1siX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwidGVzdFwiIHdhcyBzdWNjZXNzZnVsbHkgcHVibGlzaGVkIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJ0ZXN0XCIgd2FzIHN1Y2Nlc3NmdWxseSB1bnB1Ymxpc2hlZCJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwidGVzdFwiIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIlByb2R1Y3RzXCIgd2FzIHN1Y2Nlc3NmdWxseSB1bnB1Ymxpc2hlZCJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiU3VwcG9ydCBTZXJ2aWNlc1wiIHdhcyBzdWNjZXNzZnVsbHkgdW5wdWJsaXNoZWQiXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkNvbnRhY3QgVXNcIiB3YXMgc3VjY2Vzc2Z1bGx5IHVucHVibGlzaGVkIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJGaWVsZCBTZXJ2aWNlIFJlcGFpclwiIHdhcyBzdWNjZXNzZnVsbHkgdW5wdWJsaXNoZWQiXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkZpZWxkIFNlcnZpY2UgUmVwYWlyXCIgd2FzIHN1Y2Nlc3NmdWxseSBwdWJsaXNoZWQiXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkZpZWxkIFNlcnZpY2UgUmVwYWlyXCIgd2FzIHN1Y2Nlc3NmdWxseSB1bnB1Ymxpc2hlZCJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiRmllbGQgU2VydmljZSBSZXBhaXJcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZCJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiRmllbGQgU2VydmljZSBSZXBhaXJcIiB3YXMgc3VjY2Vzc2Z1bGx5IHVucHVibGlzaGVkIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJGaWVsZCBTZXJ2aWNlIFJlcGFpclwiIHdhcyBzdWNjZXNzZnVsbHkgcHVibGlzaGVkIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJGaWVsZCBTZXJ2aWNlIFJlcGFpclwiIHdhcyBzdWNjZXNzZnVsbHkgdW5wdWJsaXNoZWQiXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcInRlc3RcIiB3YXMgc3VjY2Vzc2Z1bGx5IHVucHVibGlzaGVkIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJQcm9kdWN0c1wiIHdhcyBzdWNjZXNzZnVsbHkgcHVibGlzaGVkIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJTdXBwb3J0IFNlcnZpY2VzXCIgd2FzIHN1Y2Nlc3NmdWxseSBwdWJsaXNoZWQiXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIlN1cHBvcnQgU2VydmljZXNcIiB3YXMgc3VjY2Vzc2Z1bGx5IHVucHVibGlzaGVkIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJGaWVsZCBTZXJ2aWNlIFJlcGFpclwiIHdhcyBzdWNjZXNzZnVsbHkgcHVibGlzaGVkIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJDb250YWN0IFVzXCIgd2FzIHN1Y2Nlc3NmdWxseSBwdWJsaXNoZWQiXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcInRlc3RcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZCJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiU3VwcG9ydCBTZXJ2aWNlc1wiIHdhcyBzdWNjZXNzZnVsbHkgcHVibGlzaGVkIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJ0ZXN0XCIgd2FzIGRlbGV0ZWQgc3VjY2Vzc2Z1bGx5LiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiSW4tSG91c2UgTWFjaGluZSBSZXBhaXJcIiB3YXMgYWRkZWQgc3VjY2Vzc2Z1bGx5LiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiRmllbGQgU2VydmljZSBSZXBhaXJcIiB3YXMgY2hhbmdlZCBzdWNjZXNzZnVsbHkuIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJGaWVsZCBTZXJ2aWNlIGFuZCBSZXBhaXJcIiB3YXMgc3VjY2Vzc2Z1bGx5IHVucHVibGlzaGVkIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJGaWVsZCBTZXJ2aWNlIGFuZCBSZXBhaXJcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZCJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiSW4tSG91c2UgTWFjaGluZSBSZXBhaXJcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZCJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiSG9tZVwiIHdhcyBzdWNjZXNzZnVsbHkgdW5wdWJsaXNoZWQiXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkhvbWVcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZCJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiSW4tSG91c2UgTWFjaGluZSBSZXBhaXJcIiB3YXMgY2hhbmdlZCBzdWNjZXNzZnVsbHkuIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJJbi1Ib3VzZSBNYWNoaW5lIFJlcGFpclwiIHdhcyBzdWNjZXNzZnVsbHkgdW5wdWJsaXNoZWQiXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkluLUhvdXNlIE1hY2hpbmUgUmVwYWlyXCIgd2FzIHN1Y2Nlc3NmdWxseSBwdWJsaXNoZWQiXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgdGV4dCBcIldlbGNvbWUgdG8gQnJhbmVyV2VsY29tZSB0by4uLlwiIHdhcyBhZGRlZCBzdWNjZXNzZnVsbHkuIFlvdSBtYXkgZWRpdCBpdCBhZ2FpbiBiZWxvdy4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkhvbWVcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZC4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgdGV4dCBcIldlbGNvbWUgdG8gQnJhbmVyV2VsY29tZSB0by4uLlwiIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBlZGl0IGl0IGFnYWluIGJlbG93LiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSB0ZXh0IFwiV2VsY29tZSB0byBCcmFuZXJcbldlbGNvbWUgdC4uLlwiIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBlZGl0IGl0IGFnYWluIGJlbG93LiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSB0ZXh0IFwiV2VsY29tZSB0byBCcmFuZXJcbmhpIHRoZXJlXHUwMGEwLi4uXCIgd2FzIGNoYW5nZWQgc3VjY2Vzc2Z1bGx5LiBZb3UgbWF5IGVkaXQgaXQgYWdhaW4gYmVsb3cuIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHRleHQgXCJXZWxjb21lIHRvIEJyYW5lclxuV2VsY29tZSB0Li4uXCIgd2FzIGNoYW5nZWQgc3VjY2Vzc2Z1bGx5LiBZb3UgbWF5IGVkaXQgaXQgYWdhaW4gYmVsb3cuIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJIb21lXCIgd2FzIHN1Y2Nlc3NmdWxseSBwdWJsaXNoZWQuIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJIb21lXCIgd2FzIGNoYW5nZWQgc3VjY2Vzc2Z1bGx5LiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiSG9tZVwiIHdhcyBzdWNjZXNzZnVsbHkgcHVibGlzaGVkLiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBpbWFnZSBcIjAxIFNsaXR0aW5nIExpbmVzLmpwZ1wiIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgaW1hZ2UgXCIwMSBTbGl0dGluZyBMaW5lcy5qcGdcIiB3YXMgY2hhbmdlZCBzdWNjZXNzZnVsbHkuIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIGdhbGxlcnkgcGx1Z2luIFwiMSBpbWFnZShzKSBpbiBnYWxsZXJ5XCIgd2FzIGFkZGVkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBlZGl0IGl0IGFnYWluIGJlbG93LiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBpbWFnZSBcIjAxIFNsaXR0aW5nIExpbmVzLmpwZ1wiIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgaW1hZ2UgXCIwMSBTbGl0dGluZyBMaW5lcy5qcGdcIiB3YXMgY2hhbmdlZCBzdWNjZXNzZnVsbHkuIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIGltYWdlIFwiMDEgU2xpdHRpbmcgTGluZXMuanBnXCIgd2FzIGNoYW5nZWQgc3VjY2Vzc2Z1bGx5LiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBnYWxsZXJ5IHBsdWdpbiBcIjEgaW1hZ2UocykgaW4gZ2FsbGVyeVwiIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBlZGl0IGl0IGFnYWluIGJlbG93LiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBmaWxlIFwiMDEgU2xpdHRpbmcgTGluZXMuanBnXCIgd2FzIGRlbGV0ZWQgc3VjY2Vzc2Z1bGx5LiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBpbWFnZSBcIjAxIFNsaXR0aW5nIExpbmVzLmpwZ1wiIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgaW1hZ2UgXCIwMSBTbGl0dGluZyBMaW5lcy5qcGdcIiB3YXMgY2hhbmdlZCBzdWNjZXNzZnVsbHkuIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIGdhbGxlcnkgcGx1Z2luIFwiMSBpbWFnZShzKSBpbiBnYWxsZXJ5XCIgd2FzIGFkZGVkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBlZGl0IGl0IGFnYWluIGJlbG93LiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBnYWxsZXJ5IHBsdWdpbiBcIjEgaW1hZ2UocykgaW4gZ2FsbGVyeVwiIHdhcyBhZGRlZCBzdWNjZXNzZnVsbHkuIFlvdSBtYXkgZWRpdCBpdCBhZ2FpbiBiZWxvdy4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkhvbWVcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZC4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgZ2FsbGVyeSBwbHVnaW4gXCIyIGltYWdlKHMpIGluIGdhbGxlcnlcIiB3YXMgY2hhbmdlZCBzdWNjZXNzZnVsbHkuIFlvdSBtYXkgZWRpdCBpdCBhZ2FpbiBiZWxvdy4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkhvbWVcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZC4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgZ2FsbGVyeSBwbHVnaW4gXCIxIGltYWdlKHMpIGluIGdhbGxlcnlcIiB3YXMgYWRkZWQgc3VjY2Vzc2Z1bGx5LiBZb3UgbWF5IGVkaXQgaXQgYWdhaW4gYmVsb3cuIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJIb21lXCIgd2FzIHN1Y2Nlc3NmdWxseSBwdWJsaXNoZWQuIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIGdhbGxlcnkgcGx1Z2luIFwiMiBpbWFnZShzKSBpbiBnYWxsZXJ5XCIgd2FzIGNoYW5nZWQgc3VjY2Vzc2Z1bGx5LiBZb3UgbWF5IGVkaXQgaXQgYWdhaW4gYmVsb3cuIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJIb21lXCIgd2FzIHN1Y2Nlc3NmdWxseSBwdWJsaXNoZWQuIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIGdhbGxlcnkgcGx1Z2luIFwiMiBpbWFnZShzKSBpbiBnYWxsZXJ5XCIgd2FzIGFkZGVkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBlZGl0IGl0IGFnYWluIGJlbG93LiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiSG9tZVwiIHdhcyBzdWNjZXNzZnVsbHkgcHVibGlzaGVkLiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBnYWxsZXJ5IHBsdWdpbiBcIjIgaW1hZ2UocykgaW4gZ2FsbGVyeVwiIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBlZGl0IGl0IGFnYWluIGJlbG93LiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiSG9tZVwiIHdhcyBzdWNjZXNzZnVsbHkgcHVibGlzaGVkLiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBnYWxsZXJ5IHBsdWdpbiBcIjAgaW1hZ2UocykgaW4gZ2FsbGVyeVwiIHdhcyBhZGRlZCBzdWNjZXNzZnVsbHkuIFlvdSBtYXkgZWRpdCBpdCBhZ2FpbiBiZWxvdy4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkhvbWVcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZC4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkhvbWVcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZC4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgZ2FsbGVyeSBwbHVnaW4gXCIzIGltYWdlKHMpIGluIGdhbGxlcnlcIiB3YXMgY2hhbmdlZCBzdWNjZXNzZnVsbHkuIFlvdSBtYXkgZWRpdCBpdCBhZ2FpbiBiZWxvdy4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkhvbWVcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZC4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgZ2FsbGVyeSBwbHVnaW4gXCIzIGltYWdlKHMpIGluIGdhbGxlcnlcIiB3YXMgY2hhbmdlZCBzdWNjZXNzZnVsbHkuIFlvdSBtYXkgZWRpdCBpdCBhZ2FpbiBiZWxvdy4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkhvbWVcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZC4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgZ2FsbGVyeSBwbHVnaW4gXCIzIGltYWdlKHMpIGluIGdhbGxlcnlcIiB3YXMgY2hhbmdlZCBzdWNjZXNzZnVsbHkuIFlvdSBtYXkgZWRpdCBpdCBhZ2FpbiBiZWxvdy4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkhvbWVcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZC4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgZ2FsbGVyeSBwbHVnaW4gXCIzIGltYWdlKHMpIGluIGdhbGxlcnlcIiB3YXMgY2hhbmdlZCBzdWNjZXNzZnVsbHkuIFlvdSBtYXkgZWRpdCBpdCBhZ2FpbiBiZWxvdy4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkhvbWVcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZC4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgZ2FsbGVyeSBwbHVnaW4gXCIzIGltYWdlKHMpIGluIGdhbGxlcnlcIiB3YXMgY2hhbmdlZCBzdWNjZXNzZnVsbHkuIFlvdSBtYXkgZWRpdCBpdCBhZ2FpbiBiZWxvdy4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgZ2FsbGVyeSBwbHVnaW4gXCIzIGltYWdlKHMpIGluIGdhbGxlcnlcIiB3YXMgY2hhbmdlZCBzdWNjZXNzZnVsbHkuIFlvdSBtYXkgZWRpdCBpdCBhZ2FpbiBiZWxvdy4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkhvbWVcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZC4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIlByb2R1Y3RzXCIgd2FzIHN1Y2Nlc3NmdWxseSBwdWJsaXNoZWQuIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJQcm9kdWN0c1wiIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBlZGl0IGl0IGFnYWluIGJlbG93LiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiUHJvZHVjdHNcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZC4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIk92ZXJ2aWV3XCIgd2FzIGFkZGVkIHN1Y2Nlc3NmdWxseS4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIk92ZXJ2aWV3XCIgd2FzIHN1Y2Nlc3NmdWxseSBwdWJsaXNoZWQiXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkZlYXR1cmVzXCIgd2FzIGFkZGVkIHN1Y2Nlc3NmdWxseS4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIk1vdmllc1wiIHdhcyBhZGRlZCBzdWNjZXNzZnVsbHkuIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJJbnN0YWxsYXRpb25zXCIgd2FzIGFkZGVkIHN1Y2Nlc3NmdWxseS4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkFydGljbGVzXCIgd2FzIGFkZGVkIHN1Y2Nlc3NmdWxseS4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkFydGljbGVzXCIgd2FzIHN1Y2Nlc3NmdWxseSBwdWJsaXNoZWQiXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkluc3RhbGxhdGlvbnNcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZCJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiTW92aWVzXCIgd2FzIHN1Y2Nlc3NmdWxseSBwdWJsaXNoZWQiXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkZlYXR1cmVzXCIgd2FzIHN1Y2Nlc3NmdWxseSBwdWJsaXNoZWQiXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIlNsaXR0aW5nIGxpbmVzXCIgd2FzIGFkZGVkIHN1Y2Nlc3NmdWxseS4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIlNsaXR0aW5nIGxpbmVzXCIgd2FzIGNoYW5nZWQgc3VjY2Vzc2Z1bGx5LiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiU2xpdHRpbmcgTGluZXNcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZCJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiT3ZlcnZpZXdcIiB3YXMgc3VjY2Vzc2Z1bGx5IHVucHVibGlzaGVkIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJPdmVydmlld1wiIHdhcyBzdWNjZXNzZnVsbHkgcHVibGlzaGVkIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJGZWF0dXJlc1wiIHdhcyBzdWNjZXNzZnVsbHkgdW5wdWJsaXNoZWQiXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkZlYXR1cmVzXCIgd2FzIHN1Y2Nlc3NmdWxseSBwdWJsaXNoZWQiXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIk1vdmllc1wiIHdhcyBzdWNjZXNzZnVsbHkgdW5wdWJsaXNoZWQiXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIk1vdmllc1wiIHdhcyBzdWNjZXNzZnVsbHkgcHVibGlzaGVkIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJJbnN0YWxsYXRpb25zXCIgd2FzIHN1Y2Nlc3NmdWxseSB1bnB1Ymxpc2hlZCJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiSW5zdGFsbGF0aW9uc1wiIHdhcyBzdWNjZXNzZnVsbHkgcHVibGlzaGVkIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJBcnRpY2xlc1wiIHdhcyBzdWNjZXNzZnVsbHkgdW5wdWJsaXNoZWQiXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIkFydGljbGVzXCIgd2FzIHN1Y2Nlc3NmdWxseSBwdWJsaXNoZWQiXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgZ2FsbGVyeSBwbHVnaW4gXCIzIGltYWdlKHMpIGluIGdhbGxlcnlcIiB3YXMgYWRkZWQgc3VjY2Vzc2Z1bGx5LiBZb3UgbWF5IGVkaXQgaXQgYWdhaW4gYmVsb3cuIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJPdmVydmlld1wiIHdhcyBzdWNjZXNzZnVsbHkgcHVibGlzaGVkLiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiU2xpdHRpbmcgTGluZXNcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZC4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgZ2FsbGVyeSBwbHVnaW4gXCIzIGltYWdlKHMpIGluIGdhbGxlcnlcIiB3YXMgY2hhbmdlZCBzdWNjZXNzZnVsbHkuIFlvdSBtYXkgZWRpdCBpdCBhZ2FpbiBiZWxvdy4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIk92ZXJ2aWV3XCIgd2FzIHN1Y2Nlc3NmdWxseSBwdWJsaXNoZWQuIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIGdhbGxlcnkgcGx1Z2luIFwiMSBpbWFnZShzKSBpbiBnYWxsZXJ5XCIgd2FzIGFkZGVkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBlZGl0IGl0IGFnYWluIGJlbG93LiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiT3ZlcnZpZXdcIiB3YXMgc3VjY2Vzc2Z1bGx5IHB1Ymxpc2hlZC4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgZ2FsbGVyeSBwbHVnaW4gXCI0IGltYWdlKHMpIGluIGdhbGxlcnlcIiB3YXMgYWRkZWQgc3VjY2Vzc2Z1bGx5LiBZb3UgbWF5IGVkaXQgaXQgYWdhaW4gYmVsb3cuIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIHBhZ2UgXCJGZWF0dXJlc1wiIHdhcyBzdWNjZXNzZnVsbHkgcHVibGlzaGVkLiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBnYWxsZXJ5IHBsdWdpbiBcIjMgaW1hZ2UocykgaW4gZ2FsbGVyeVwiIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBlZGl0IGl0IGFnYWluIGJlbG93LiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiSG9tZVwiIHdhcyBzdWNjZXNzZnVsbHkgcHVibGlzaGVkLiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBmaWxlIGdhbGxlcnkgcGx1Z2luIFwiMSBmaWxlKHMpIGluIGdhbGxlcnlcIiB3YXMgYWRkZWQgc3VjY2Vzc2Z1bGx5LiBZb3UgbWF5IGVkaXQgaXQgYWdhaW4gYmVsb3cuIl0sWyJfX2pzb25fbWVzc2FnZSIsMCwyMCwiVGhlIGZpbGUgZ2FsbGVyeSBwbHVnaW4gXCIxIGZpbGUocykgaW4gZ2FsbGVyeVwiIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBlZGl0IGl0IGFnYWluIGJlbG93LiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSBwYWdlIFwiSW5zdGFsbGF0aW9uc1wiIHdhcyBzdWNjZXNzZnVsbHkgcHVibGlzaGVkLiJdLFsiX19qc29uX21lc3NhZ2UiLDAsMjAsIlRoZSB2aWRlbyBnYWxsZXJ5IHBsdWdpbiBcIjEgdmlkZW8ocykgaW4gZ2FsbGVyeVwiIHdhcyBhZGRlZCBzdWNjZXNzZnVsbHkuIFlvdSBtYXkgZWRpdCBpdCBhZ2FpbiBiZWxvdy4iXSxbIl9fanNvbl9tZXNzYWdlIiwwLDIwLCJUaGUgcGFnZSBcIk1vdmllc1wiIHdhcyBzdWNjZXNzZnVsbHkgcHVibGlzaGVkLiJdXVUNX2F1dGhfdXNlcl9pZEsBVRRmaWxlcl9sYXN0X2ZvbGRlcl9pZFgBAAAAMVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZFUIY21zX2VkaXSIdS4=	2014-01-15 19:22:18.73346-05
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY easy_thumbnails_source (id, storage_hash, name, modified) FROM stdin;
1	f9bde26a1556cd667f742bd34ec7c55e	cms_page_media/3/01 Slitting Lines.jpg	2013-12-28 14:33:49-05
2	f9bde26a1556cd667f742bd34ec7c55e	cms_page_media/3/02 Slit Coil Packaging Lines.jpg	2013-12-28 14:35:02-05
3	f9bde26a1556cd667f742bd34ec7c55e	cms_page_media/3/01 Slitting Lines_1.jpg	2013-12-28 14:43:01-05
4	f9bde26a1556cd667f742bd34ec7c55e	cms_page_media/3/02 Slit Coil Packaging Lines_1.jpg	2013-12-28 14:52:13-05
5	f9bde26a1556cd667f742bd34ec7c55e	filer_public/2013/12/28/01_slitting_lines_1.jpg	2013-12-28 14:17:48-05
6	f9bde26a1556cd667f742bd34ec7c55e	cms_page_media/3/01 Slitting Lines_2.jpg	2013-12-28 15:05:11-05
7	f9bde26a1556cd667f742bd34ec7c55e	cms_page_media/3/02 Slit Coil Packaging Lines_2.jpg	2013-12-28 15:05:11-05
8	f9bde26a1556cd667f742bd34ec7c55e	cms_page_media/3/03 Cut to Length Lines.jpg	2013-12-28 15:29:57-05
9	f9bde26a1556cd667f742bd34ec7c55e	cms_page_media/17/100_0455 600px.jpg	2013-12-29 21:08:08-05
10	f9bde26a1556cd667f742bd34ec7c55e	cms_page_media/17/IMG_0157 600px.jpg	2013-12-29 21:08:08-05
11	f9bde26a1556cd667f742bd34ec7c55e	cms_page_media/17/100_1860 600px.jpg	2013-12-29 21:08:08-05
12	f9bde26a1556cd667f742bd34ec7c55e	cms_page_media/17/100_0168.JPG	2013-12-29 21:29:25-05
13	f9bde26a1556cd667f742bd34ec7c55e	cms_page_media/19/01 Compact Slitting Line Footprint.jpg	2013-12-29 22:00:00-05
14	f9bde26a1556cd667f742bd34ec7c55e	cms_page_media/19/02 Andiamo Automatic Hands Free Threading.jpg	2013-12-29 22:00:00-05
15	f9bde26a1556cd667f742bd34ec7c55e	cms_page_media/19/03 Wireless Remote Coil Car Operation.jpg	2013-12-29 22:00:00-05
16	f9bde26a1556cd667f742bd34ec7c55e	cms_page_media/19/04 Laser Aided Master Coil Centering.jpg	2013-12-29 22:00:00-05
17	f9bde26a1556cd667f742bd34ec7c55e	cms_page_media/21/Berlin_1.JPG	2013-12-30 21:38:58-05
18	f9bde26a1556cd667f742bd34ec7c55e	cms_page_media/20/poster.png	2014-01-01 19:16:46-05
\.


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('easy_thumbnails_source_id_seq', 18, true);


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY easy_thumbnails_thumbnail (id, storage_hash, name, modified, source_id) FROM stdin;
1	d26becbf46ac48eda79c7a39a13a02dd	cms_page_media/3/01 Slitting Lines.jpg.115x80_q85_crop.jpg	2013-12-28 14:33:51-05	1
2	d26becbf46ac48eda79c7a39a13a02dd	cms_page_media/3/02 Slit Coil Packaging Lines.jpg.115x80_q85_crop.jpg	2013-12-28 14:35:04-05	2
3	d26becbf46ac48eda79c7a39a13a02dd	cms_page_media/3/01 Slitting Lines_1.jpg.115x80_q85_crop.jpg	2013-12-28 14:43:02-05	3
4	d26becbf46ac48eda79c7a39a13a02dd	cms_page_media/3/01 Slitting Lines_1.jpg.790x391_q85_crop.jpg	2013-12-28 14:45:01-05	3
5	d26becbf46ac48eda79c7a39a13a02dd	cms_page_media/3/02 Slit Coil Packaging Lines_1.jpg.790x391_q85_crop.jpg	2013-12-28 14:52:15-05	4
6	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/2013/12/28/01_slitting_lines_1.jpg__16x16_q85_crop_upscale.jpg	2013-12-28 14:57:31-05	5
7	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/2013/12/28/01_slitting_lines_1.jpg__32x32_q85_crop_upscale.jpg	2013-12-28 14:57:31-05	5
8	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/2013/12/28/01_slitting_lines_1.jpg__48x48_q85_crop_upscale.jpg	2013-12-28 14:57:32-05	5
9	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/2013/12/28/01_slitting_lines_1.jpg__64x64_q85_crop_upscale.jpg	2013-12-28 14:57:32-05	5
10	d26becbf46ac48eda79c7a39a13a02dd	cms_page_media/3/01 Slitting Lines_2.jpg.790x391_q85_crop.jpg	2013-12-28 15:05:13-05	6
11	d26becbf46ac48eda79c7a39a13a02dd	cms_page_media/3/02 Slit Coil Packaging Lines_2.jpg.790x391_q85_crop.jpg	2013-12-28 15:05:13-05	7
12	d26becbf46ac48eda79c7a39a13a02dd	cms_page_media/3/03 Cut to Length Lines.jpg.790x391_q85_crop.jpg	2013-12-28 15:29:59-05	8
13	d26becbf46ac48eda79c7a39a13a02dd	cms_page_media/17/100_0455 600px.jpg.240x240_q85_crop.jpg	2013-12-29 21:08:10-05	9
14	d26becbf46ac48eda79c7a39a13a02dd	cms_page_media/17/IMG_0157 600px.jpg.240x240_q85_crop.jpg	2013-12-29 21:08:10-05	10
15	d26becbf46ac48eda79c7a39a13a02dd	cms_page_media/17/100_1860 600px.jpg.240x240_q85_crop.jpg	2013-12-29 21:08:10-05	11
16	d26becbf46ac48eda79c7a39a13a02dd	cms_page_media/17/100_0168.JPG.548x411_q85_crop.jpg	2013-12-29 21:29:27-05	12
17	d26becbf46ac48eda79c7a39a13a02dd	cms_page_media/19/01 Compact Slitting Line Footprint.jpg.790x391_q85_crop.jpg	2013-12-29 22:00:02-05	13
18	d26becbf46ac48eda79c7a39a13a02dd	cms_page_media/19/02 Andiamo Automatic Hands Free Threading.jpg.790x391_q85_crop.jpg	2013-12-29 22:00:02-05	14
19	d26becbf46ac48eda79c7a39a13a02dd	cms_page_media/19/03 Wireless Remote Coil Car Operation.jpg.790x391_q85_crop.jpg	2013-12-29 22:00:02-05	15
20	d26becbf46ac48eda79c7a39a13a02dd	cms_page_media/19/04 Laser Aided Master Coil Centering.jpg.790x391_q85_crop.jpg	2013-12-29 22:00:02-05	16
21	d26becbf46ac48eda79c7a39a13a02dd	cms_page_media/21/Berlin_1.JPG.240x240_q85_crop.jpg	2013-12-30 21:39:19-05	17
22	d26becbf46ac48eda79c7a39a13a02dd	cms_page_media/20/poster.png.240x240_q85_crop.jpg	2014-01-01 19:16:48-05	18
\.


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnail_id_seq', 22, true);


--
-- Data for Name: filer_clipboard; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY filer_clipboard (id, user_id) FROM stdin;
1	1
\.


--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('filer_clipboard_id_seq', 1, true);


--
-- Data for Name: filer_clipboarditem; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY filer_clipboarditem (id, file_id, clipboard_id) FROM stdin;
\.


--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('filer_clipboarditem_id_seq', 3, true);


--
-- Data for Name: filer_file; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY filer_file (id, polymorphic_ctype_id, folder_id, file, _file_size, sha1, has_all_mandatory_data, original_filename, name, description, owner_id, uploaded_at, modified_at, is_public) FROM stdin;
2	28	1	filer_public/2013/12/28/01_slitting_lines_1.jpg	928578	09aa51aca80511269f158d1ca6c4e886b58ffd25	f	01 Slitting Lines.jpg			1	2013-12-28 14:17:48.883744-05	2013-12-28 14:18:50.44675-05	t
\.


--
-- Name: filer_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('filer_file_id_seq', 2, true);


--
-- Data for Name: filer_folder; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY filer_folder (id, parent_id, name, owner_id, uploaded_at, created_at, modified_at, lft, rght, tree_id, level) FROM stdin;
1	\N	homepage	1	2013-12-28 13:59:47.559601-05	2013-12-28 13:59:47.559633-05	2013-12-28 13:59:47.559649-05	1	2	1	0
\.


--
-- Name: filer_folder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('filer_folder_id_seq', 1, true);


--
-- Data for Name: filer_folderpermission; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY filer_folderpermission (id, folder_id, type, user_id, group_id, everybody, can_edit, can_read, can_add_children) FROM stdin;
\.


--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('filer_folderpermission_id_seq', 1, false);


--
-- Data for Name: filer_image; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY filer_image (file_ptr_id, _height, _width, date_taken, default_alt_text, default_caption, author, must_always_publish_author_credit, must_always_publish_copyright, subject_location) FROM stdin;
2	2304	3072	2013-12-28 14:17:48.872306-05			\N	f	f	
\.


--
-- Data for Name: menus_cachekey; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY menus_cachekey (id, language, site, key) FROM stdin;
92	en	1	menu_cache_menu_nodes_en_1_1_user
\.


--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('menus_cachekey_id_seq', 92, true);


--
-- Data for Name: reversion_revision; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY reversion_revision (id, manager_slug, date_created, user_id, comment) FROM stdin;
1	default	2013-12-26 13:07:54.966423-05	1	Initial version.
3	default	2013-12-26 13:15:25.272814-05	1	Publish
5	default	2013-12-27 12:39:00.578411-05	1	Initial version.
6	default	2013-12-27 12:44:25.590043-05	1	Publish
7	default	2013-12-27 12:50:28.906417-05	1	Initial version.
8	default	2013-12-27 12:50:45.021443-05	1	Initial version.
9	default	2013-12-27 12:53:17.096635-05	1	Initial version.
10	default	2013-12-27 12:58:18.95904-05	1	Initial version.
11	default	2013-12-27 12:58:39.87775-05	1	Changed published and in_navigation.
12	default	2013-12-27 13:01:29.109704-05	1	Deleted page.
13	default	2013-12-27 13:02:47.876893-05	1	Initial version.
14	default	2013-12-27 13:03:04.829216-05	1	Changed title.
15	default	2013-12-27 13:04:31.154777-05	1	Changed slug.
116	default	2014-01-01 19:22:18.607932-05	1	Publish
21	default	2013-12-27 15:18:09.555456-05	1	Publish
26	default	2013-12-28 09:46:59.75343-05	1	Publish
28	default	2013-12-28 12:34:27.255909-05	1	Publish
39	default	2013-12-28 14:34:00.039978-05	1	Publish
41	default	2013-12-28 14:35:37.015951-05	1	Publish
47	default	2013-12-28 14:51:47.808104-05	1	Publish
49	default	2013-12-28 14:53:28.296933-05	1	Publish
52	default	2013-12-28 15:18:08.911523-05	1	Publish
54	default	2013-12-28 15:18:44.382828-05	1	Publish
57	default	2013-12-28 15:24:28.23187-05	1	Publish
59	default	2013-12-28 15:25:58.993041-05	1	Publish
61	default	2013-12-28 15:30:02.023884-05	1	Publish
63	default	2013-12-28 15:33:35.607148-05	1	Publish
65	default	2013-12-28 16:19:16.657781-05	1	Publish
67	default	2013-12-28 17:23:44.888346-05	1	Publish
70	default	2013-12-29 14:20:05.433222-05	1	Publish
71	default	2013-12-29 20:01:29.988792-05	1	Publish
73	default	2013-12-29 20:01:37.777992-05	1	Publish
74	default	2013-12-29 20:02:16.277154-05	1	Initial version.
75	default	2013-12-29 20:04:40.282722-05	1	Initial version.
76	default	2013-12-29 20:04:51.262437-05	1	Initial version.
77	default	2013-12-29 20:05:13.940987-05	1	Initial version.
78	default	2013-12-29 20:05:24.753756-05	1	Initial version.
79	default	2013-12-29 20:08:20.552736-05	1	Initial version.
83	default	2013-12-29 21:08:22.59494-05	1	Publish
85	default	2013-12-29 21:18:09.392953-05	1	Publish
87	default	2013-12-29 21:21:20.38705-05	1	Publish
90	default	2013-12-29 21:29:34.21066-05	1	Publish
94	default	2013-12-29 22:00:21.287064-05	1	Publish
96	default	2013-12-30 15:50:47.829744-05	1	Publish
110	default	2013-12-30 21:40:32.097592-05	1	Publish
\.


--
-- Name: reversion_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('reversion_revision_id_seq', 116, true);


--
-- Data for Name: reversion_version; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY reversion_version (id, revision_id, object_id, object_id_int, content_type_id, format, serialized_data, object_repr, type) FROM stdin;
1	1	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "Home", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-26T18:07:54.937Z", "page": 3, "path": "home", "meta_description": null, "slug": "home"}}]	Home (home, en)	1
2	1	2	2	8	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
3	1	3	3	10	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-26T18:07:54.919Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-26T18:07:54.919Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": false, "publication_date": null, "placeholders": [1, 2], "in_navigation": false, "rght": 2, "tree_id": 1}}]	Home	0
4	1	1	1	8	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
533	49	3	3	10	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-28T19:53:28.242Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-26T18:07:54.919Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-26T18:14:24.682Z", "placeholders": [1, 2, 29, 30], "in_navigation": true, "rght": 2, "tree_id": 2}}]	Home	1
534	49	1	1	9	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T18:10:32.344Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T18:10:32.343Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	1	1
535	49	2	2	9	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:12:15.439Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:12:15.437Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	2	1
536	49	3	3	9	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:15:03.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:15:03.483Z", "lft": 1, "tree_id": 3, "position": 2, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	3	1
9	3	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-26T18:07:54.937Z", "page": 3, "path": "", "meta_description": "", "slug": "home"}}]	Home (home, en)	1
10	3	2	2	8	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
11	3	3	3	10	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-26T18:15:25.245Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-26T18:07:54.919Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-26T18:14:24.682Z", "placeholders": [1, 2], "in_navigation": false, "rght": 2, "tree_id": 1}}]	Home	1
12	3	1	1	8	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
537	49	4	4	20	json	[{"pk": 4, "model": "text.text", "fields": {"body": "<h3>Welcome to Braner</h3>\\n<p>Welcome to our web page, we appreciate your interest! Braner USA manufactures slitting lines, slit coil packaging lines, cut-to-length lines, multi-blanking lines and other flat rolled coil processing equipment. We also provide equipment upgrade feasibility studies, in-house machine repairs, field service and repair, installation service and OEM spare parts for Braner, Loopco, Stanat and Coiltech machines. We are committed to continuous improvement of our designs targeting increased operating efficiency for our customers.</p>"}}]	Welcome to Braner\nWelcome t...	1
538	49	38	38	9	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:45.841Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:45.840Z", "lft": 1, "tree_id": 21, "position": 4, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	38	1
17	5	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "Products", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-27T17:39:00.558Z", "page": 5, "path": "products", "meta_description": null, "slug": "products"}}]	Products (products, en)	1
18	5	5	5	10	json	[{"pk": 5, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-27T17:39:00.539Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-27T17:39:00.539Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "template_1.html", "published": false, "publication_date": null, "placeholders": [5, 6], "in_navigation": false, "rght": 2, "tree_id": 3}}]	Products	0
19	5	6	6	8	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
20	5	5	5	8	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content	1
21	6	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "Products", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-27T17:39:00.558Z", "page": 5, "path": "products", "meta_description": null, "slug": "products"}}]	Products (products, en)	1
22	6	5	5	10	json	[{"pk": 5, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-27T17:44:25.569Z", "limit_visibility_in_menu": null, "parent": 3, "level": 1, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-27T17:39:00.539Z", "lft": 2, "publication_end_date": null, "soft_root": false, "template": "template_1.html", "published": true, "publication_date": "2013-12-27T17:44:20.565Z", "placeholders": [5, 6], "in_navigation": true, "rght": 3, "tree_id": 1}}]	Products	1
23	6	6	6	8	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
24	6	5	5	8	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content	1
25	7	9	9	8	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
26	7	10	10	8	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
27	7	5	5	16	json	[{"pk": 5, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "Support Services", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-27T17:50:28.888Z", "page": 7, "path": "support-services", "meta_description": null, "slug": "support-services"}}]	Support Services (support-services, en)	1
28	7	7	7	10	json	[{"pk": 7, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-27T17:50:28.873Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-27T17:50:28.873Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": false, "publication_date": null, "placeholders": [9, 10], "in_navigation": false, "rght": 2, "tree_id": 4}}]	Support Services	0
29	8	8	8	10	json	[{"pk": 8, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-27T17:50:44.988Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-27T17:50:44.988Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": false, "publication_date": null, "placeholders": [11, 12], "in_navigation": false, "rght": 2, "tree_id": 4}}]	Contact Us	0
30	8	11	11	8	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
31	8	12	12	8	json	[{"pk": 12, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
32	8	6	6	16	json	[{"pk": 6, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "Contact Us", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-27T17:50:45.003Z", "page": 8, "path": "contact-us", "meta_description": null, "slug": "contact-us"}}]	Contact Us (contact-us, en)	1
33	9	9	9	16	json	[{"pk": 9, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "Field Service Repair", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-27T17:53:17.076Z", "page": 11, "path": "field-service-repair", "meta_description": null, "slug": "field-service-repair"}}]	Field Service Repair (field-service-repair, en)	1
34	9	18	18	8	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
35	9	11	11	10	json	[{"pk": 11, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-27T17:53:17.060Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-27T17:53:17.060Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": false, "publication_date": null, "placeholders": [17, 18], "in_navigation": false, "rght": 2, "tree_id": 10}}]	Field Service Repair	0
36	9	17	17	8	json	[{"pk": 17, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
37	10	11	11	16	json	[{"pk": 11, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "test", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-27T17:58:18.941Z", "page": 13, "path": "test", "meta_description": null, "slug": "test"}}]	test (test, en)	1
38	10	13	13	10	json	[{"pk": 13, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-27T17:58:18.924Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-27T17:58:18.924Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": false, "publication_date": null, "placeholders": [21, 22], "in_navigation": false, "rght": 2, "tree_id": 12}}]	test	0
39	10	22	22	8	json	[{"pk": 22, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
40	10	21	21	8	json	[{"pk": 21, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
41	11	11	11	16	json	[{"pk": 11, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "test", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-27T17:58:18.941Z", "page": 13, "path": "test", "meta_description": "", "slug": "test"}}]	test (test, en)	1
42	11	13	13	10	json	[{"pk": 13, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-27T17:58:39.851Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-27T17:58:18.924Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-27T17:58:19.384Z", "placeholders": [21, 22], "in_navigation": true, "rght": 2, "tree_id": 13}}]	test	1
43	11	22	22	8	json	[{"pk": 22, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
44	11	21	21	8	json	[{"pk": 21, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
45	12	11	11	16	json	[{"pk": 11, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "test", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-27T17:58:18.941Z", "page": 13, "path": "test", "meta_description": "", "slug": "test"}}]	test (test, en)	1
539	49	39	39	9	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:57.157Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:57.156Z", "lft": 1, "tree_id": 22, "position": 5, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	39	1
1020	71	33	33	8	json	[{"pk": 33, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
46	12	13	13	10	json	[{"pk": 13, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-27T18:00:39.646Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-27T17:58:18.924Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-27T17:58:19.384Z", "placeholders": [21, 22], "in_navigation": true, "rght": 2, "tree_id": 15}}]	test	2
47	12	22	22	8	json	[{"pk": 22, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
48	12	21	21	8	json	[{"pk": 21, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
49	13	25	25	8	json	[{"pk": 25, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
50	13	26	26	8	json	[{"pk": 26, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
51	13	13	13	16	json	[{"pk": 13, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "In-House Machine Repair", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-27T18:02:47.862Z", "page": 15, "path": "support-services/-house-machine-repair", "meta_description": null, "slug": "-house-machine-repair"}}]	In-House Machine Repair (-house-machine-repair, en)	1
52	13	15	15	10	json	[{"pk": 15, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-27T18:02:47.846Z", "limit_visibility_in_menu": null, "parent": 7, "level": 1, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-27T18:02:47.846Z", "lft": 4, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": false, "publication_date": null, "placeholders": [25, 26], "in_navigation": false, "rght": 5, "tree_id": 4}}]	In-House Machine Repair	0
53	14	9	9	16	json	[{"pk": 9, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Field Service and Repair", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-27T17:53:17.076Z", "page": 11, "path": "support-services/field-service-repair", "meta_description": "", "slug": "field-service-repair"}}]	Field Service and Repair (field-service-repair, en)	1
54	14	18	18	8	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
55	14	11	11	10	json	[{"pk": 11, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-27T18:03:04.806Z", "limit_visibility_in_menu": null, "parent": 7, "level": 1, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-27T17:53:17.060Z", "lft": 2, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-27T17:53:19.323Z", "placeholders": [17, 18], "in_navigation": true, "rght": 3, "tree_id": 4}}]	Field Service Repair	1
56	14	17	17	8	json	[{"pk": 17, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
57	15	25	25	8	json	[{"pk": 25, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
58	15	26	26	8	json	[{"pk": 26, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
59	15	13	13	16	json	[{"pk": 13, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "In-House Machine Repair", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-27T18:02:47.862Z", "page": 15, "path": "support-services/in-house-machine-repair", "meta_description": "", "slug": "in-house-machine-repair"}}]	In-House Machine Repair (in-house-machine-repair, en)	1
60	15	15	15	10	json	[{"pk": 15, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-27T18:04:31.133Z", "limit_visibility_in_menu": null, "parent": 7, "level": 1, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-27T18:02:47.846Z", "lft": 4, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-27T18:03:25.153Z", "placeholders": [25, 26], "in_navigation": true, "rght": 5, "tree_id": 4}}]	In-House Machine Repair	1
540	49	40	40	9	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:42:25.345Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:25.343Z", "lft": 1, "tree_id": 23, "position": 6, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	40	1
541	49	41	41	35	json	[{"pk": 41, "model": "cmsplugin_gallery.galleryplugin", "fields": {"template": "cmsplugin_gallery/gallery.html"}}]	2 image(s) in gallery	1
542	49	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-26T18:07:54.937Z", "page": 3, "path": "", "meta_description": "", "slug": "home"}}]	Home (home, en)	1
543	49	2	2	8	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
544	49	15	15	16	json	[{"pk": 15, "model": "cms.title", "fields": {"menu_title": "", "redirect": null, "meta_keywords": "", "page_title": "", "language": "es", "title": "Casa", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-28T17:34:15.150Z", "page": 3, "path": "", "meta_description": "", "slug": "casa"}}]	Casa (casa, es)	1
545	49	17	17	9	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:17:30.317Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T18:58:58.405Z", "lft": 1, "tree_id": 9, "position": 0, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	17	1
546	49	19	19	9	json	[{"pk": 19, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:23:42.523Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:23:42.522Z", "lft": 1, "tree_id": 10, "position": 1, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	19	1
547	49	20	20	9	json	[{"pk": 20, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:26:45.813Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:26:45.812Z", "lft": 1, "tree_id": 11, "position": 2, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	20	1
178	28	1	1	9	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T18:10:32.344Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T18:10:32.343Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	1	1
179	28	2	2	9	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:12:15.439Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:12:15.437Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	2	1
180	28	3	3	10	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-28T17:34:27.218Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-26T18:07:54.919Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-26T18:14:24.682Z", "placeholders": [1, 2, 29, 30], "in_navigation": true, "rght": 2, "tree_id": 2}}]	Home	1
181	28	4	4	20	json	[{"pk": 4, "model": "text.text", "fields": {"body": "<h3>Welcome to Braner</h3>\\n<p>Welcome to our web page, we appreciate your interest! Braner USA manufactures slitting lines, slit coil packaging lines, cut-to-length lines, multi-blanking lines and other flat rolled coil processing equipment. We also provide equipment upgrade feasibility studies, in-house machine repairs, field service and repair, installation service and OEM spare parts for Braner, Loopco, Stanat and Coiltech machines. We are committed to continuous improvement of our designs targeting increased operating efficiency for our customers.</p>"}}]	Welcome to Braner\nWelcome t...	1
182	28	1	1	8	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
183	28	2	2	8	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
184	28	15	15	16	json	[{"pk": 15, "model": "cms.title", "fields": {"menu_title": "", "redirect": null, "meta_keywords": "", "page_title": "", "language": "es", "title": "Casa", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-28T17:34:15.150Z", "page": 3, "path": "", "meta_description": "", "slug": "casa"}}]	Casa (casa, es)	1
185	28	3	3	9	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:15:03.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:15:03.483Z", "lft": 1, "tree_id": 3, "position": 2, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	3	1
186	28	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-26T18:07:54.937Z", "page": 3, "path": "", "meta_description": "", "slug": "home"}}]	Home (home, en)	1
187	28	4	4	9	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T14:46:56.200Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:17:02.850Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 30, "plugin_type": "TextPlugin"}}]	4	1
188	28	29	29	8	json	[{"pk": 29, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
189	28	30	30	8	json	[{"pk": 30, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
548	49	21	21	9	json	[{"pk": 21, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:35:02.744Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:33:42.292Z", "lft": 1, "tree_id": 12, "position": 3, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	21	1
549	49	41	41	9	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:52:13.585Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:46.312Z", "lft": 1, "tree_id": 24, "position": 7, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	41	1
550	49	4	4	9	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T14:46:56.200Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:17:02.850Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 30, "plugin_type": "TextPlugin"}}]	4	1
551	49	29	29	8	json	[{"pk": 29, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
552	49	30	30	8	json	[{"pk": 30, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
553	49	1	1	8	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
642	54	2	2	9	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:12:15.439Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:12:15.437Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	2	1
643	54	3	3	10	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-28T20:18:44.327Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-26T18:07:54.919Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-26T18:14:24.682Z", "placeholders": [1, 2, 29, 30], "in_navigation": true, "rght": 2, "tree_id": 2}}]	Home	1
644	54	4	4	20	json	[{"pk": 4, "model": "text.text", "fields": {"body": "<h3>Welcome to Braner</h3>\\n<p>Welcome to our web page, we appreciate your interest! Braner USA manufactures slitting lines, slit coil packaging lines, cut-to-length lines, multi-blanking lines and other flat rolled coil processing equipment. We also provide equipment upgrade feasibility studies, in-house machine repairs, field service and repair, installation service and OEM spare parts for Braner, Loopco, Stanat and Coiltech machines. We are committed to continuous improvement of our designs targeting increased operating efficiency for our customers.</p>"}}]	Welcome to Braner\nWelcome t...	1
645	54	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-26T18:07:54.937Z", "page": 3, "path": "", "meta_description": "", "slug": "home"}}]	Home (home, en)	1
646	54	2	2	8	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
378	41	3	3	10	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-28T19:35:36.967Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-26T18:07:54.919Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-26T18:14:24.682Z", "placeholders": [1, 2, 29, 30], "in_navigation": true, "rght": 2, "tree_id": 2}}]	Home	1
379	41	1	1	9	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T18:10:32.344Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T18:10:32.343Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	1	1
380	41	2	2	9	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:12:15.439Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:12:15.437Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	2	1
381	41	3	3	9	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:15:03.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:15:03.483Z", "lft": 1, "tree_id": 3, "position": 2, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	3	1
382	41	4	4	20	json	[{"pk": 4, "model": "text.text", "fields": {"body": "<h3>Welcome to Braner</h3>\\n<p>Welcome to our web page, we appreciate your interest! Braner USA manufactures slitting lines, slit coil packaging lines, cut-to-length lines, multi-blanking lines and other flat rolled coil processing equipment. We also provide equipment upgrade feasibility studies, in-house machine repairs, field service and repair, installation service and OEM spare parts for Braner, Loopco, Stanat and Coiltech machines. We are committed to continuous improvement of our designs targeting increased operating efficiency for our customers.</p>"}}]	Welcome to Braner\nWelcome t...	1
383	41	1	1	8	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
384	41	17	17	35	json	[{"pk": 17, "model": "cmsplugin_gallery.galleryplugin", "fields": {"template": "cmsplugin_gallery/gallery.html"}}]	0 image(s) in gallery	1
385	41	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-26T18:07:54.937Z", "page": 3, "path": "", "meta_description": "", "slug": "home"}}]	Home (home, en)	1
386	41	2	2	8	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
100	21	1	1	9	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T18:10:32.344Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T18:10:32.343Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	1	1
101	21	2	2	9	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:12:15.439Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:12:15.437Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	2	1
102	21	3	3	10	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-27T20:18:09.503Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-26T18:07:54.919Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-26T18:14:24.682Z", "placeholders": [1, 2, 29, 30], "in_navigation": true, "rght": 2, "tree_id": 2}}]	Home	1
103	21	4	4	20	json	[{"pk": 4, "model": "text.text", "fields": {"body": "<h3>Welcome to Braner</h3><p><span style=\\"line-height: 5px;\\">Welcome to our web page, we appreciate your interest! Braner USA manufactures slitting lines, slit coil packaging lines, cut-to-length lines, multi-blanking lines and other flat rolled coil processing equipment. We also provide equipment upgrade feasibility studies, in-house machine repairs, field service and repair, installation service and OEM spare parts for Braner, Loopco, Stanat and Coiltech machines. We are committed to continuous improvement of our designs targeting increased operating efficiency for our customers.</span></p>"}}]	Welcome to BranerWelcome to...	1
104	21	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-26T18:07:54.937Z", "page": 3, "path": "", "meta_description": "", "slug": "home"}}]	Home (home, en)	1
105	21	2	2	8	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
106	21	3	3	9	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:15:03.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:15:03.483Z", "lft": 1, "tree_id": 3, "position": 2, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	3	1
107	21	1	1	8	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
108	21	4	4	9	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:17:59.930Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:17:02.850Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 30, "plugin_type": "TextPlugin"}}]	4	1
109	21	29	29	8	json	[{"pk": 29, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
110	21	30	30	8	json	[{"pk": 30, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
387	41	15	15	16	json	[{"pk": 15, "model": "cms.title", "fields": {"menu_title": "", "redirect": null, "meta_keywords": "", "page_title": "", "language": "es", "title": "Casa", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-28T17:34:15.150Z", "page": 3, "path": "", "meta_description": "", "slug": "casa"}}]	Casa (casa, es)	1
388	41	17	17	9	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:17:30.317Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T18:58:58.405Z", "lft": 1, "tree_id": 9, "position": 0, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	17	1
389	41	19	19	9	json	[{"pk": 19, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:23:42.523Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:23:42.522Z", "lft": 1, "tree_id": 10, "position": 1, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	19	1
390	41	20	20	9	json	[{"pk": 20, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:26:45.813Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:26:45.812Z", "lft": 1, "tree_id": 11, "position": 2, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	20	1
391	41	21	21	35	json	[{"pk": 21, "model": "cmsplugin_gallery.galleryplugin", "fields": {"template": "cmsplugin_gallery/gallery.html"}}]	2 image(s) in gallery	1
392	41	4	4	9	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T14:46:56.200Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:17:02.850Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 30, "plugin_type": "TextPlugin"}}]	4	1
393	41	29	29	8	json	[{"pk": 29, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
394	41	30	30	8	json	[{"pk": 30, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
395	41	21	21	9	json	[{"pk": 21, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:35:02.744Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:33:42.292Z", "lft": 1, "tree_id": 12, "position": 3, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	21	1
1021	71	34	34	8	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
1022	71	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "Products", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-27T17:39:00.558Z", "page": 5, "path": "products", "meta_description": null, "slug": "products"}}]	Products (products, en)	1
1023	71	5	5	10	json	[{"pk": 5, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-30T01:01:29.954Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-27T17:39:00.539Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "template_1.html", "published": true, "publication_date": "2013-12-27T17:44:20.565Z", "placeholders": [5, 6, 33, 34], "in_navigation": true, "rght": 2, "tree_id": 3}}]	Products	1
1024	71	6	6	8	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
1025	71	5	5	8	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content	1
1092	83	17	17	16	json	[{"pk": 17, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "Overview", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-30T01:02:16.261Z", "page": 17, "path": "products/slitting-lines/overview", "meta_description": null, "slug": "overview"}}]	Overview (overview, en)	1
1093	83	73	73	8	json	[{"pk": 73, "model": "cms.placeholder", "fields": {"slot": "products_content", "default_width": null}}]	products_content	1
1094	83	74	74	8	json	[{"pk": 74, "model": "cms.placeholder", "fields": {"slot": "hero_content", "default_width": null}}]	hero_content	1
1095	83	39	39	8	json	[{"pk": 39, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
1096	83	17	17	10	json	[{"pk": 17, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-30T02:08:22.563Z", "limit_visibility_in_menu": null, "parent": 27, "level": 2, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-30T01:02:16.238Z", "lft": 3, "publication_end_date": null, "soft_root": false, "template": "products.html", "published": true, "publication_date": "2013-12-30T01:02:21.261Z", "placeholders": [37, 38, 39, 73, 74], "in_navigation": true, "rght": 4, "tree_id": 3}}]	Overview	1
1097	83	186	186	35	json	[{"pk": 186, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 0.0, "fade_duration": 0.0, "template": "cmsplugin_gallery/products_image_title_description.html", "title": "Products"}}]	3 image(s) in gallery	1
1098	83	186	186	9	json	[{"pk": 186, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-30T02:08:08.958Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-30T02:03:09.936Z", "lft": 1, "tree_id": 51, "position": 0, "placeholder": 73, "plugin_type": "CMSGalleryPlugin"}}]	186	1
1124	87	37	37	8	json	[{"pk": 37, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
1125	87	38	38	8	json	[{"pk": 38, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
1126	87	17	17	16	json	[{"pk": 17, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "Overview", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-30T01:02:16.261Z", "page": 17, "path": "products/slitting-lines/overview", "meta_description": null, "slug": "overview"}}]	Overview (overview, en)	1
1127	87	73	73	8	json	[{"pk": 73, "model": "cms.placeholder", "fields": {"slot": "products_content", "default_width": null}}]	products_content	1
1128	87	74	74	8	json	[{"pk": 74, "model": "cms.placeholder", "fields": {"slot": "hero_content", "default_width": null}}]	hero_content	1
1129	87	39	39	8	json	[{"pk": 39, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
1130	87	17	17	10	json	[{"pk": 17, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-30T02:21:20.358Z", "limit_visibility_in_menu": null, "parent": 27, "level": 2, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-30T01:02:16.238Z", "lft": 3, "publication_end_date": null, "soft_root": false, "template": "products.html", "published": true, "publication_date": "2013-12-30T01:02:21.261Z", "placeholders": [37, 38, 39, 73, 74], "in_navigation": true, "rght": 4, "tree_id": 3}}]	Overview	1
1131	87	186	186	35	json	[{"pk": 186, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 0.0, "fade_duration": 0.0, "template": "cmsplugin_gallery/products_image_title_description.html", "title": "Products"}}]	3 image(s) in gallery	1
1032	73	33	33	8	json	[{"pk": 33, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
1033	73	34	34	8	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
1034	73	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Products", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-27T17:39:00.558Z", "page": 5, "path": "products", "meta_description": "", "slug": "products"}}]	Products (products, en)	1
1035	73	5	5	10	json	[{"pk": 5, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-30T01:01:37.748Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-27T17:39:00.539Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "products.html", "published": true, "publication_date": "2013-12-27T17:44:20.565Z", "placeholders": [5, 6, 33, 34], "in_navigation": true, "rght": 2, "tree_id": 3}}]	Products	1
1036	73	6	6	8	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
1037	73	5	5	8	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content	1
1038	74	17	17	10	json	[{"pk": 17, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-30T01:02:16.238Z", "limit_visibility_in_menu": null, "parent": 5, "level": 1, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-30T01:02:16.238Z", "lft": 2, "publication_end_date": null, "soft_root": false, "template": "products.html", "published": false, "publication_date": null, "placeholders": [37, 38, 39], "in_navigation": false, "rght": 3, "tree_id": 3}}]	Overview	0
1039	74	17	17	16	json	[{"pk": 17, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "Overview", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-30T01:02:16.261Z", "page": 17, "path": "products/overview", "meta_description": null, "slug": "overview"}}]	Overview (overview, en)	1
1040	74	37	37	8	json	[{"pk": 37, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
1041	74	38	38	8	json	[{"pk": 38, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
1042	74	39	39	8	json	[{"pk": 39, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
1043	75	19	19	16	json	[{"pk": 19, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "Features", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-30T01:04:40.267Z", "page": 19, "path": "products/features", "meta_description": null, "slug": "features"}}]	Features (features, en)	1
1044	75	43	43	8	json	[{"pk": 43, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
1045	75	19	19	10	json	[{"pk": 19, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-30T01:04:40.249Z", "limit_visibility_in_menu": null, "parent": 5, "level": 1, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-30T01:04:40.249Z", "lft": 4, "publication_end_date": null, "soft_root": false, "template": "products.html", "published": false, "publication_date": null, "placeholders": [43, 44, 45], "in_navigation": false, "rght": 5, "tree_id": 3}}]	Features	0
155	26	1	1	9	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T18:10:32.344Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T18:10:32.343Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	1	1
156	26	2	2	9	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:12:15.439Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:12:15.437Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	2	1
157	26	3	3	10	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-28T14:46:59.701Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-26T18:07:54.919Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-26T18:14:24.682Z", "placeholders": [1, 2, 29, 30], "in_navigation": true, "rght": 2, "tree_id": 2}}]	Home	1
1046	75	44	44	8	json	[{"pk": 44, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
1047	75	45	45	8	json	[{"pk": 45, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
158	26	4	4	20	json	[{"pk": 4, "model": "text.text", "fields": {"body": "<h3>Welcome to Braner</h3>\\n<p>Welcome to our web page, we appreciate your interest! Braner USA manufactures slitting lines, slit coil packaging lines, cut-to-length lines, multi-blanking lines and other flat rolled coil processing equipment. We also provide equipment upgrade feasibility studies, in-house machine repairs, field service and repair, installation service and OEM spare parts for Braner, Loopco, Stanat and Coiltech machines. We are committed to continuous improvement of our designs targeting increased operating efficiency for our customers.</p>"}}]	Welcome to Braner\nWelcome t...	1
159	26	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-26T18:07:54.937Z", "page": 3, "path": "", "meta_description": "", "slug": "home"}}]	Home (home, en)	1
160	26	2	2	8	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
161	26	3	3	9	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:15:03.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:15:03.483Z", "lft": 1, "tree_id": 3, "position": 2, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	3	1
162	26	1	1	8	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
163	26	4	4	9	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T14:46:56.200Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:17:02.850Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 30, "plugin_type": "TextPlugin"}}]	4	1
164	26	29	29	8	json	[{"pk": 29, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
165	26	30	30	8	json	[{"pk": 30, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
756	59	1	1	9	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T18:10:32.344Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T18:10:32.343Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	1	1
757	59	2	2	9	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:12:15.439Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:12:15.437Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	2	1
647	54	15	15	16	json	[{"pk": 15, "model": "cms.title", "fields": {"menu_title": "", "redirect": null, "meta_keywords": "", "page_title": "", "language": "es", "title": "Casa", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-28T17:34:15.150Z", "page": 3, "path": "", "meta_description": "", "slug": "casa"}}]	Casa (casa, es)	1
648	54	17	17	9	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:17:30.317Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T18:58:58.405Z", "lft": 1, "tree_id": 9, "position": 0, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	17	1
649	54	3	3	9	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:15:03.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:15:03.483Z", "lft": 1, "tree_id": 3, "position": 2, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	3	1
650	54	20	20	9	json	[{"pk": 20, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:26:45.813Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:26:45.812Z", "lft": 1, "tree_id": 11, "position": 2, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	20	1
651	54	21	21	9	json	[{"pk": 21, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:35:02.744Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:33:42.292Z", "lft": 1, "tree_id": 12, "position": 3, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	21	1
652	54	4	4	9	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T14:46:56.200Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:17:02.850Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 30, "plugin_type": "TextPlugin"}}]	4	1
653	54	29	29	8	json	[{"pk": 29, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
654	54	30	30	8	json	[{"pk": 30, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
655	54	1	1	8	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
656	54	38	38	9	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:45.841Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:45.840Z", "lft": 1, "tree_id": 21, "position": 4, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	38	1
657	54	39	39	9	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:57.157Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:57.156Z", "lft": 1, "tree_id": 22, "position": 5, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	39	1
658	54	40	40	9	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:42:25.345Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:25.343Z", "lft": 1, "tree_id": 23, "position": 6, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	40	1
659	54	41	41	9	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:52:13.585Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:46.312Z", "lft": 1, "tree_id": 24, "position": 7, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	41	1
660	54	66	66	9	json	[{"pk": 66, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T20:18:41.757Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T20:04:09.182Z", "lft": 1, "tree_id": 37, "position": 8, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	66	1
661	54	66	66	35	json	[{"pk": 66, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 10.0, "template": "cmsplugin_gallery/gallery.html", "title": "homepage"}}]	2 image(s) in gallery	1
758	59	3	3	10	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-28T20:25:58.935Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-26T18:07:54.919Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-26T18:14:24.682Z", "placeholders": [1, 2, 29, 30], "in_navigation": true, "rght": 2, "tree_id": 2}}]	Home	1
491	47	3	3	10	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-28T19:51:47.744Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-26T18:07:54.919Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-26T18:14:24.682Z", "placeholders": [1, 2, 29, 30], "in_navigation": true, "rght": 2, "tree_id": 2}}]	Home	1
492	47	1	1	9	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T18:10:32.344Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T18:10:32.343Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	1	1
493	47	2	2	9	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:12:15.439Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:12:15.437Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	2	1
494	47	3	3	9	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:15:03.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:15:03.483Z", "lft": 1, "tree_id": 3, "position": 2, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	3	1
495	47	4	4	20	json	[{"pk": 4, "model": "text.text", "fields": {"body": "<h3>Welcome to Braner</h3>\\n<p>Welcome to our web page, we appreciate your interest! Braner USA manufactures slitting lines, slit coil packaging lines, cut-to-length lines, multi-blanking lines and other flat rolled coil processing equipment. We also provide equipment upgrade feasibility studies, in-house machine repairs, field service and repair, installation service and OEM spare parts for Braner, Loopco, Stanat and Coiltech machines. We are committed to continuous improvement of our designs targeting increased operating efficiency for our customers.</p>"}}]	Welcome to Braner\nWelcome t...	1
496	47	38	38	9	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:45.841Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:45.840Z", "lft": 1, "tree_id": 21, "position": 4, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	38	1
497	47	39	39	9	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:57.157Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:57.156Z", "lft": 1, "tree_id": 22, "position": 5, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	39	1
498	47	40	40	9	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:42:25.345Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:25.343Z", "lft": 1, "tree_id": 23, "position": 6, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	40	1
499	47	41	41	35	json	[{"pk": 41, "model": "cmsplugin_gallery.galleryplugin", "fields": {"template": "cmsplugin_gallery/gallery.html"}}]	1 image(s) in gallery	1
500	47	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-26T18:07:54.937Z", "page": 3, "path": "", "meta_description": "", "slug": "home"}}]	Home (home, en)	1
501	47	2	2	8	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
502	47	15	15	16	json	[{"pk": 15, "model": "cms.title", "fields": {"menu_title": "", "redirect": null, "meta_keywords": "", "page_title": "", "language": "es", "title": "Casa", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-28T17:34:15.150Z", "page": 3, "path": "", "meta_description": "", "slug": "casa"}}]	Casa (casa, es)	1
503	47	17	17	9	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:17:30.317Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T18:58:58.405Z", "lft": 1, "tree_id": 9, "position": 0, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	17	1
504	47	19	19	9	json	[{"pk": 19, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:23:42.523Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:23:42.522Z", "lft": 1, "tree_id": 10, "position": 1, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	19	1
505	47	20	20	9	json	[{"pk": 20, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:26:45.813Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:26:45.812Z", "lft": 1, "tree_id": 11, "position": 2, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	20	1
506	47	21	21	9	json	[{"pk": 21, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:35:02.744Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:33:42.292Z", "lft": 1, "tree_id": 12, "position": 3, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	21	1
507	47	41	41	9	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:43:01.146Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:46.312Z", "lft": 1, "tree_id": 24, "position": 7, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	41	1
508	47	4	4	9	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T14:46:56.200Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:17:02.850Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 30, "plugin_type": "TextPlugin"}}]	4	1
509	47	29	29	8	json	[{"pk": 29, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
510	47	30	30	8	json	[{"pk": 30, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
511	47	1	1	8	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
1048	76	48	48	8	json	[{"pk": 48, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
759	59	4	4	20	json	[{"pk": 4, "model": "text.text", "fields": {"body": "<h3>Welcome to Braner</h3>\\n<p>Welcome to our web page, we appreciate your interest! Braner USA manufactures slitting lines, slit coil packaging lines, cut-to-length lines, multi-blanking lines and other flat rolled coil processing equipment. We also provide equipment upgrade feasibility studies, in-house machine repairs, field service and repair, installation service and OEM spare parts for Braner, Loopco, Stanat and Coiltech machines. We are committed to continuous improvement of our designs targeting increased operating efficiency for our customers.</p>"}}]	Welcome to Braner\nWelcome t...	1
760	59	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-26T18:07:54.937Z", "page": 3, "path": "", "meta_description": "", "slug": "home"}}]	Home (home, en)	1
761	59	2	2	8	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
762	59	15	15	16	json	[{"pk": 15, "model": "cms.title", "fields": {"menu_title": "", "redirect": null, "meta_keywords": "", "page_title": "", "language": "es", "title": "Casa", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-28T17:34:15.150Z", "page": 3, "path": "", "meta_description": "", "slug": "casa"}}]	Casa (casa, es)	1
763	59	17	17	9	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:17:30.317Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T18:58:58.405Z", "lft": 1, "tree_id": 9, "position": 0, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	17	1
764	59	3	3	9	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:15:03.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:15:03.483Z", "lft": 1, "tree_id": 3, "position": 2, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	3	1
765	59	20	20	9	json	[{"pk": 20, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:26:45.813Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:26:45.812Z", "lft": 1, "tree_id": 11, "position": 2, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	20	1
766	59	21	21	9	json	[{"pk": 21, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:35:02.744Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:33:42.292Z", "lft": 1, "tree_id": 12, "position": 3, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	21	1
767	59	4	4	9	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T14:46:56.200Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:17:02.850Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 30, "plugin_type": "TextPlugin"}}]	4	1
768	59	29	29	8	json	[{"pk": 29, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
769	59	30	30	8	json	[{"pk": 30, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
770	59	1	1	8	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
771	59	38	38	9	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:45.841Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:45.840Z", "lft": 1, "tree_id": 21, "position": 4, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	38	1
772	59	39	39	9	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:57.157Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:57.156Z", "lft": 1, "tree_id": 22, "position": 5, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	39	1
773	59	40	40	9	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:42:25.345Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:25.343Z", "lft": 1, "tree_id": 23, "position": 6, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	40	1
774	59	41	41	9	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:52:13.585Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:46.312Z", "lft": 1, "tree_id": 24, "position": 7, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	41	1
775	59	66	66	9	json	[{"pk": 66, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T20:18:41.757Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T20:04:09.182Z", "lft": 1, "tree_id": 37, "position": 8, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	66	1
776	59	66	66	35	json	[{"pk": 66, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 10.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/gallery.html", "title": "homepage"}}]	2 image(s) in gallery	1
777	59	19	19	9	json	[{"pk": 19, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:23:42.523Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:23:42.522Z", "lft": 1, "tree_id": 10, "position": 1, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	19	1
1049	76	20	20	16	json	[{"pk": 20, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "Movies", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-30T01:04:51.247Z", "page": 20, "path": "products/movies", "meta_description": null, "slug": "movies"}}]	Movies (movies, en)	1
1050	76	20	20	10	json	[{"pk": 20, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-30T01:04:51.228Z", "limit_visibility_in_menu": null, "parent": 5, "level": 1, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-30T01:04:51.228Z", "lft": 6, "publication_end_date": null, "soft_root": false, "template": "products.html", "published": false, "publication_date": null, "placeholders": [46, 47, 48], "in_navigation": false, "rght": 7, "tree_id": 3}}]	Movies	0
1051	76	46	46	8	json	[{"pk": 46, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
597	52	1	1	9	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T18:10:32.344Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T18:10:32.343Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	1	1
1052	76	47	47	8	json	[{"pk": 47, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
598	52	2	2	9	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:12:15.439Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:12:15.437Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	2	1
599	52	3	3	10	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-28T20:18:08.842Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-26T18:07:54.919Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-26T18:14:24.682Z", "placeholders": [1, 2, 29, 30], "in_navigation": true, "rght": 2, "tree_id": 2}}]	Home	1
600	52	4	4	20	json	[{"pk": 4, "model": "text.text", "fields": {"body": "<h3>Welcome to Braner</h3>\\n<p>Welcome to our web page, we appreciate your interest! Braner USA manufactures slitting lines, slit coil packaging lines, cut-to-length lines, multi-blanking lines and other flat rolled coil processing equipment. We also provide equipment upgrade feasibility studies, in-house machine repairs, field service and repair, installation service and OEM spare parts for Braner, Loopco, Stanat and Coiltech machines. We are committed to continuous improvement of our designs targeting increased operating efficiency for our customers.</p>"}}]	Welcome to Braner\nWelcome t...	1
601	52	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-26T18:07:54.937Z", "page": 3, "path": "", "meta_description": "", "slug": "home"}}]	Home (home, en)	1
602	52	2	2	8	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
603	52	15	15	16	json	[{"pk": 15, "model": "cms.title", "fields": {"menu_title": "", "redirect": null, "meta_keywords": "", "page_title": "", "language": "es", "title": "Casa", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-28T17:34:15.150Z", "page": 3, "path": "", "meta_description": "", "slug": "casa"}}]	Casa (casa, es)	1
604	52	17	17	9	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:17:30.317Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T18:58:58.405Z", "lft": 1, "tree_id": 9, "position": 0, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	17	1
605	52	3	3	9	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:15:03.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:15:03.483Z", "lft": 1, "tree_id": 3, "position": 2, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	3	1
606	52	20	20	9	json	[{"pk": 20, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:26:45.813Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:26:45.812Z", "lft": 1, "tree_id": 11, "position": 2, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	20	1
607	52	21	21	9	json	[{"pk": 21, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:35:02.744Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:33:42.292Z", "lft": 1, "tree_id": 12, "position": 3, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	21	1
608	52	4	4	9	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T14:46:56.200Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:17:02.850Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 30, "plugin_type": "TextPlugin"}}]	4	1
609	52	29	29	8	json	[{"pk": 29, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
610	52	30	30	8	json	[{"pk": 30, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
611	52	1	1	8	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
612	52	38	38	9	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:45.841Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:45.840Z", "lft": 1, "tree_id": 21, "position": 4, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	38	1
613	52	39	39	9	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:57.157Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:57.156Z", "lft": 1, "tree_id": 22, "position": 5, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	39	1
1053	77	49	49	8	json	[{"pk": 49, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
1054	77	50	50	8	json	[{"pk": 50, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
342	39	3	3	10	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-28T19:33:59.966Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-26T18:07:54.919Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-26T18:14:24.682Z", "placeholders": [1, 2, 29, 30], "in_navigation": true, "rght": 2, "tree_id": 2}}]	Home	1
343	39	1	1	9	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T18:10:32.344Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T18:10:32.343Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	1	1
344	39	2	2	9	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:12:15.439Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:12:15.437Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	2	1
345	39	3	3	9	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:15:03.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:15:03.483Z", "lft": 1, "tree_id": 3, "position": 2, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	3	1
1055	77	51	51	8	json	[{"pk": 51, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
346	39	4	4	20	json	[{"pk": 4, "model": "text.text", "fields": {"body": "<h3>Welcome to Braner</h3>\\n<p>Welcome to our web page, we appreciate your interest! Braner USA manufactures slitting lines, slit coil packaging lines, cut-to-length lines, multi-blanking lines and other flat rolled coil processing equipment. We also provide equipment upgrade feasibility studies, in-house machine repairs, field service and repair, installation service and OEM spare parts for Braner, Loopco, Stanat and Coiltech machines. We are committed to continuous improvement of our designs targeting increased operating efficiency for our customers.</p>"}}]	Welcome to Braner\nWelcome t...	1
347	39	1	1	8	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
348	39	17	17	35	json	[{"pk": 17, "model": "cmsplugin_gallery.galleryplugin", "fields": {"template": "cmsplugin_gallery/gallery.html"}}]	0 image(s) in gallery	1
349	39	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-26T18:07:54.937Z", "page": 3, "path": "", "meta_description": "", "slug": "home"}}]	Home (home, en)	1
350	39	2	2	8	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
351	39	15	15	16	json	[{"pk": 15, "model": "cms.title", "fields": {"menu_title": "", "redirect": null, "meta_keywords": "", "page_title": "", "language": "es", "title": "Casa", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-28T17:34:15.150Z", "page": 3, "path": "", "meta_description": "", "slug": "casa"}}]	Casa (casa, es)	1
352	39	17	17	9	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:17:30.317Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T18:58:58.405Z", "lft": 1, "tree_id": 9, "position": 0, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	17	1
353	39	19	19	9	json	[{"pk": 19, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:23:42.523Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:23:42.522Z", "lft": 1, "tree_id": 10, "position": 1, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	19	1
354	39	20	20	9	json	[{"pk": 20, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:26:45.813Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:26:45.812Z", "lft": 1, "tree_id": 11, "position": 2, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	20	1
355	39	21	21	35	json	[{"pk": 21, "model": "cmsplugin_gallery.galleryplugin", "fields": {"template": "cmsplugin_gallery/gallery.html"}}]	1 image(s) in gallery	1
356	39	4	4	9	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T14:46:56.200Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:17:02.850Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 30, "plugin_type": "TextPlugin"}}]	4	1
357	39	29	29	8	json	[{"pk": 29, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
358	39	30	30	8	json	[{"pk": 30, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
359	39	21	21	9	json	[{"pk": 21, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:33:49.575Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:33:42.292Z", "lft": 1, "tree_id": 12, "position": 3, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	21	1
614	52	40	40	9	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:42:25.345Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:25.343Z", "lft": 1, "tree_id": 23, "position": 6, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	40	1
615	52	41	41	9	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:52:13.585Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:46.312Z", "lft": 1, "tree_id": 24, "position": 7, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	41	1
616	52	66	66	9	json	[{"pk": 66, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T20:05:11.938Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T20:04:09.182Z", "lft": 1, "tree_id": 37, "position": 8, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	66	1
617	52	66	66	35	json	[{"pk": 66, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "template": "cmsplugin_gallery/gallery.html", "title": "homepage"}}]	2 image(s) in gallery	1
618	52	19	19	9	json	[{"pk": 19, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:23:42.523Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:23:42.522Z", "lft": 1, "tree_id": 10, "position": 1, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	19	1
662	54	19	19	9	json	[{"pk": 19, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:23:42.523Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:23:42.522Z", "lft": 1, "tree_id": 10, "position": 1, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	19	1
1056	77	21	21	10	json	[{"pk": 21, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-30T01:05:13.907Z", "limit_visibility_in_menu": null, "parent": 5, "level": 1, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-30T01:05:13.907Z", "lft": 8, "publication_end_date": null, "soft_root": false, "template": "products.html", "published": false, "publication_date": null, "placeholders": [49, 50, 51], "in_navigation": false, "rght": 9, "tree_id": 3}}]	Installations	0
1057	77	21	21	16	json	[{"pk": 21, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "Installations", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-30T01:05:13.926Z", "page": 21, "path": "products/installations", "meta_description": null, "slug": "installations"}}]	Installations (installations, en)	1
1058	78	22	22	16	json	[{"pk": 22, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "Articles", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-30T01:05:24.739Z", "page": 22, "path": "products/articles", "meta_description": null, "slug": "articles"}}]	Articles (articles, en)	1
1059	78	52	52	8	json	[{"pk": 52, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
1060	78	54	54	8	json	[{"pk": 54, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
641	54	1	1	9	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T18:10:32.344Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T18:10:32.343Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	1	1
932	67	1	1	9	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T18:10:32.344Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T18:10:32.343Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	1	1
933	67	2	2	9	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:12:15.439Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:12:15.437Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	2	1
934	67	3	3	10	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-28T22:23:44.833Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-26T18:07:54.919Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-26T18:14:24.682Z", "placeholders": [1, 2, 29, 30], "in_navigation": true, "rght": 2, "tree_id": 2}}]	Home	1
935	67	4	4	20	json	[{"pk": 4, "model": "text.text", "fields": {"body": "<h3>Welcome to Braner</h3>\\n<p>Welcome to our web page, we appreciate your interest! Braner USA manufactures slitting lines, slit coil packaging lines, cut-to-length lines, multi-blanking lines and other flat rolled coil processing equipment. We also provide equipment upgrade feasibility studies, in-house machine repairs, field service and repair, installation service and OEM spare parts for Braner, Loopco, Stanat and Coiltech machines. We are committed to continuous improvement of our designs targeting increased operating efficiency for our customers.</p>"}}]	Welcome to Braner\nWelcome t...	1
936	67	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-26T18:07:54.937Z", "page": 3, "path": "", "meta_description": "", "slug": "home"}}]	Home (home, en)	1
937	67	2	2	8	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
938	67	15	15	16	json	[{"pk": 15, "model": "cms.title", "fields": {"menu_title": "", "redirect": null, "meta_keywords": "", "page_title": "", "language": "es", "title": "Casa", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-28T17:34:15.150Z", "page": 3, "path": "", "meta_description": "", "slug": "casa"}}]	Casa (casa, es)	1
939	67	17	17	9	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:17:30.317Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T18:58:58.405Z", "lft": 1, "tree_id": 9, "position": 0, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	17	1
940	67	3	3	9	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:15:03.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:15:03.483Z", "lft": 1, "tree_id": 3, "position": 2, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	3	1
941	67	20	20	9	json	[{"pk": 20, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:26:45.813Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:26:45.812Z", "lft": 1, "tree_id": 11, "position": 2, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	20	1
942	67	21	21	9	json	[{"pk": 21, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:35:02.744Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:33:42.292Z", "lft": 1, "tree_id": 12, "position": 3, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	21	1
943	67	4	4	9	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T14:46:56.200Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:17:02.850Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 30, "plugin_type": "TextPlugin"}}]	4	1
944	67	29	29	8	json	[{"pk": 29, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
945	67	30	30	8	json	[{"pk": 30, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
946	67	1	1	8	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
947	67	38	38	9	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:45.841Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:45.840Z", "lft": 1, "tree_id": 21, "position": 4, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	38	1
948	67	39	39	9	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:57.157Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:57.156Z", "lft": 1, "tree_id": 22, "position": 5, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	39	1
949	67	40	40	9	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:42:25.345Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:25.343Z", "lft": 1, "tree_id": 23, "position": 6, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	40	1
950	67	41	41	9	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:52:13.585Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:46.312Z", "lft": 1, "tree_id": 24, "position": 7, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	41	1
800	61	1	1	9	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T18:10:32.344Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T18:10:32.343Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	1	1
801	61	2	2	9	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:12:15.439Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:12:15.437Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	2	1
802	61	3	3	10	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-28T20:30:01.967Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-26T18:07:54.919Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-26T18:14:24.682Z", "placeholders": [1, 2, 29, 30], "in_navigation": true, "rght": 2, "tree_id": 2}}]	Home	1
803	61	4	4	20	json	[{"pk": 4, "model": "text.text", "fields": {"body": "<h3>Welcome to Braner</h3>\\n<p>Welcome to our web page, we appreciate your interest! Braner USA manufactures slitting lines, slit coil packaging lines, cut-to-length lines, multi-blanking lines and other flat rolled coil processing equipment. We also provide equipment upgrade feasibility studies, in-house machine repairs, field service and repair, installation service and OEM spare parts for Braner, Loopco, Stanat and Coiltech machines. We are committed to continuous improvement of our designs targeting increased operating efficiency for our customers.</p>"}}]	Welcome to Braner\nWelcome t...	1
804	61	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-26T18:07:54.937Z", "page": 3, "path": "", "meta_description": "", "slug": "home"}}]	Home (home, en)	1
805	61	2	2	8	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
806	61	15	15	16	json	[{"pk": 15, "model": "cms.title", "fields": {"menu_title": "", "redirect": null, "meta_keywords": "", "page_title": "", "language": "es", "title": "Casa", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-28T17:34:15.150Z", "page": 3, "path": "", "meta_description": "", "slug": "casa"}}]	Casa (casa, es)	1
807	61	17	17	9	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:17:30.317Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T18:58:58.405Z", "lft": 1, "tree_id": 9, "position": 0, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	17	1
808	61	3	3	9	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:15:03.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:15:03.483Z", "lft": 1, "tree_id": 3, "position": 2, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	3	1
809	61	20	20	9	json	[{"pk": 20, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:26:45.813Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:26:45.812Z", "lft": 1, "tree_id": 11, "position": 2, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	20	1
810	61	21	21	9	json	[{"pk": 21, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:35:02.744Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:33:42.292Z", "lft": 1, "tree_id": 12, "position": 3, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	21	1
811	61	4	4	9	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T14:46:56.200Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:17:02.850Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 30, "plugin_type": "TextPlugin"}}]	4	1
812	61	29	29	8	json	[{"pk": 29, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
813	61	30	30	8	json	[{"pk": 30, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
814	61	1	1	8	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
815	61	38	38	9	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:45.841Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:45.840Z", "lft": 1, "tree_id": 21, "position": 4, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	38	1
816	61	39	39	9	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:57.157Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:57.156Z", "lft": 1, "tree_id": 22, "position": 5, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	39	1
817	61	40	40	9	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:42:25.345Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:25.343Z", "lft": 1, "tree_id": 23, "position": 6, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	40	1
818	61	41	41	9	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:52:13.585Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:46.312Z", "lft": 1, "tree_id": 24, "position": 7, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	41	1
819	61	66	66	9	json	[{"pk": 66, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T20:29:57.120Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T20:04:09.182Z", "lft": 1, "tree_id": 37, "position": 8, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	66	1
820	61	66	66	35	json	[{"pk": 66, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 10.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/gallery.html", "title": "homepage"}}]	3 image(s) in gallery	1
821	61	19	19	9	json	[{"pk": 19, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:23:42.523Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:23:42.522Z", "lft": 1, "tree_id": 10, "position": 1, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	19	1
888	65	1	1	9	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T18:10:32.344Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T18:10:32.343Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	1	1
889	65	2	2	9	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:12:15.439Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:12:15.437Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	2	1
890	65	3	3	10	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-28T21:19:16.596Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-26T18:07:54.919Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-26T18:14:24.682Z", "placeholders": [1, 2, 29, 30], "in_navigation": true, "rght": 2, "tree_id": 2}}]	Home	1
891	65	4	4	20	json	[{"pk": 4, "model": "text.text", "fields": {"body": "<h3>Welcome to Braner</h3>\\n<p>Welcome to our web page, we appreciate your interest! Braner USA manufactures slitting lines, slit coil packaging lines, cut-to-length lines, multi-blanking lines and other flat rolled coil processing equipment. We also provide equipment upgrade feasibility studies, in-house machine repairs, field service and repair, installation service and OEM spare parts for Braner, Loopco, Stanat and Coiltech machines. We are committed to continuous improvement of our designs targeting increased operating efficiency for our customers.</p>"}}]	Welcome to Braner\nWelcome t...	1
892	65	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-26T18:07:54.937Z", "page": 3, "path": "", "meta_description": "", "slug": "home"}}]	Home (home, en)	1
893	65	2	2	8	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
894	65	15	15	16	json	[{"pk": 15, "model": "cms.title", "fields": {"menu_title": "", "redirect": null, "meta_keywords": "", "page_title": "", "language": "es", "title": "Casa", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-28T17:34:15.150Z", "page": 3, "path": "", "meta_description": "", "slug": "casa"}}]	Casa (casa, es)	1
895	65	17	17	9	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:17:30.317Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T18:58:58.405Z", "lft": 1, "tree_id": 9, "position": 0, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	17	1
896	65	3	3	9	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:15:03.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:15:03.483Z", "lft": 1, "tree_id": 3, "position": 2, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	3	1
897	65	20	20	9	json	[{"pk": 20, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:26:45.813Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:26:45.812Z", "lft": 1, "tree_id": 11, "position": 2, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	20	1
898	65	21	21	9	json	[{"pk": 21, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:35:02.744Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:33:42.292Z", "lft": 1, "tree_id": 12, "position": 3, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	21	1
899	65	4	4	9	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T14:46:56.200Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:17:02.850Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 30, "plugin_type": "TextPlugin"}}]	4	1
900	65	29	29	8	json	[{"pk": 29, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
901	65	30	30	8	json	[{"pk": 30, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
902	65	1	1	8	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
903	65	38	38	9	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:45.841Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:45.840Z", "lft": 1, "tree_id": 21, "position": 4, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	38	1
904	65	39	39	9	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:57.157Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:57.156Z", "lft": 1, "tree_id": 22, "position": 5, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	39	1
905	65	40	40	9	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:42:25.345Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:25.343Z", "lft": 1, "tree_id": 23, "position": 6, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	40	1
906	65	41	41	9	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:52:13.585Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:46.312Z", "lft": 1, "tree_id": 24, "position": 7, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	41	1
907	65	66	66	9	json	[{"pk": 66, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T21:19:15.031Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T20:04:09.182Z", "lft": 1, "tree_id": 37, "position": 8, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	66	1
908	65	66	66	35	json	[{"pk": 66, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/gallery.html", "title": "homepage"}}]	3 image(s) in gallery	1
909	65	19	19	9	json	[{"pk": 19, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:23:42.523Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:23:42.522Z", "lft": 1, "tree_id": 10, "position": 1, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	19	1
710	57	1	1	9	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T18:10:32.344Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T18:10:32.343Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	1	1
711	57	2	2	9	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:12:15.439Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:12:15.437Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	2	1
712	57	3	3	10	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-28T20:24:28.168Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-26T18:07:54.919Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-26T18:14:24.682Z", "placeholders": [1, 2, 29, 30], "in_navigation": true, "rght": 2, "tree_id": 2}}]	Home	1
713	57	4	4	20	json	[{"pk": 4, "model": "text.text", "fields": {"body": "<h3>Welcome to Braner</h3>\\n<p>Welcome to our web page, we appreciate your interest! Braner USA manufactures slitting lines, slit coil packaging lines, cut-to-length lines, multi-blanking lines and other flat rolled coil processing equipment. We also provide equipment upgrade feasibility studies, in-house machine repairs, field service and repair, installation service and OEM spare parts for Braner, Loopco, Stanat and Coiltech machines. We are committed to continuous improvement of our designs targeting increased operating efficiency for our customers.</p>"}}]	Welcome to Braner\nWelcome t...	1
714	57	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-26T18:07:54.937Z", "page": 3, "path": "", "meta_description": "", "slug": "home"}}]	Home (home, en)	1
715	57	2	2	8	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
716	57	15	15	16	json	[{"pk": 15, "model": "cms.title", "fields": {"menu_title": "", "redirect": null, "meta_keywords": "", "page_title": "", "language": "es", "title": "Casa", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-28T17:34:15.150Z", "page": 3, "path": "", "meta_description": "", "slug": "casa"}}]	Casa (casa, es)	1
717	57	17	17	9	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:17:30.317Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T18:58:58.405Z", "lft": 1, "tree_id": 9, "position": 0, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	17	1
718	57	3	3	9	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:15:03.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:15:03.483Z", "lft": 1, "tree_id": 3, "position": 2, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	3	1
719	57	20	20	9	json	[{"pk": 20, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:26:45.813Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:26:45.812Z", "lft": 1, "tree_id": 11, "position": 2, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	20	1
720	57	21	21	9	json	[{"pk": 21, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:35:02.744Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:33:42.292Z", "lft": 1, "tree_id": 12, "position": 3, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	21	1
721	57	4	4	9	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T14:46:56.200Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:17:02.850Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 30, "plugin_type": "TextPlugin"}}]	4	1
722	57	29	29	8	json	[{"pk": 29, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
723	57	30	30	8	json	[{"pk": 30, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
724	57	1	1	8	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
725	57	38	38	9	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:45.841Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:45.840Z", "lft": 1, "tree_id": 21, "position": 4, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	38	1
726	57	39	39	9	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:57.157Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:57.156Z", "lft": 1, "tree_id": 22, "position": 5, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	39	1
727	57	40	40	9	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:42:25.345Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:25.343Z", "lft": 1, "tree_id": 23, "position": 6, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	40	1
728	57	41	41	9	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:52:13.585Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:46.312Z", "lft": 1, "tree_id": 24, "position": 7, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	41	1
729	57	93	93	9	json	[{"pk": 93, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T20:24:17.312Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T20:24:08.235Z", "lft": 1, "tree_id": 51, "position": 9, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	93	1
730	57	66	66	9	json	[{"pk": 66, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T20:18:41.757Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T20:04:09.182Z", "lft": 1, "tree_id": 37, "position": 8, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	66	1
731	57	66	66	35	json	[{"pk": 66, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 10.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/gallery.html", "title": "homepage"}}]	2 image(s) in gallery	1
732	57	93	93	35	json	[{"pk": 93, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/gallery.html", "title": "Some title"}}]	0 image(s) in gallery	1
733	57	19	19	9	json	[{"pk": 19, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:23:42.523Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:23:42.522Z", "lft": 1, "tree_id": 10, "position": 1, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	19	1
844	63	1	1	9	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T18:10:32.344Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T18:10:32.343Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	1	1
845	63	2	2	9	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:12:15.439Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:12:15.437Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	2	1
846	63	3	3	10	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-28T20:33:35.546Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-26T18:07:54.919Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-26T18:14:24.682Z", "placeholders": [1, 2, 29, 30], "in_navigation": true, "rght": 2, "tree_id": 2}}]	Home	1
847	63	4	4	20	json	[{"pk": 4, "model": "text.text", "fields": {"body": "<h3>Welcome to Braner</h3>\\n<p>Welcome to our web page, we appreciate your interest! Braner USA manufactures slitting lines, slit coil packaging lines, cut-to-length lines, multi-blanking lines and other flat rolled coil processing equipment. We also provide equipment upgrade feasibility studies, in-house machine repairs, field service and repair, installation service and OEM spare parts for Braner, Loopco, Stanat and Coiltech machines. We are committed to continuous improvement of our designs targeting increased operating efficiency for our customers.</p>"}}]	Welcome to Braner\nWelcome t...	1
848	63	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-26T18:07:54.937Z", "page": 3, "path": "", "meta_description": "", "slug": "home"}}]	Home (home, en)	1
849	63	2	2	8	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
850	63	15	15	16	json	[{"pk": 15, "model": "cms.title", "fields": {"menu_title": "", "redirect": null, "meta_keywords": "", "page_title": "", "language": "es", "title": "Casa", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-28T17:34:15.150Z", "page": 3, "path": "", "meta_description": "", "slug": "casa"}}]	Casa (casa, es)	1
851	63	17	17	9	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:17:30.317Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T18:58:58.405Z", "lft": 1, "tree_id": 9, "position": 0, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	17	1
852	63	3	3	9	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:15:03.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:15:03.483Z", "lft": 1, "tree_id": 3, "position": 2, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	3	1
853	63	20	20	9	json	[{"pk": 20, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:26:45.813Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:26:45.812Z", "lft": 1, "tree_id": 11, "position": 2, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	20	1
854	63	21	21	9	json	[{"pk": 21, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:35:02.744Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:33:42.292Z", "lft": 1, "tree_id": 12, "position": 3, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	21	1
855	63	4	4	9	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T14:46:56.200Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:17:02.850Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 30, "plugin_type": "TextPlugin"}}]	4	1
856	63	29	29	8	json	[{"pk": 29, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
857	63	30	30	8	json	[{"pk": 30, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
858	63	1	1	8	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
859	63	38	38	9	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:45.841Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:45.840Z", "lft": 1, "tree_id": 21, "position": 4, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	38	1
860	63	39	39	9	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:57.157Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:57.156Z", "lft": 1, "tree_id": 22, "position": 5, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	39	1
861	63	40	40	9	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:42:25.345Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:25.343Z", "lft": 1, "tree_id": 23, "position": 6, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	40	1
862	63	41	41	9	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:52:13.585Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:46.312Z", "lft": 1, "tree_id": 24, "position": 7, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	41	1
863	63	66	66	9	json	[{"pk": 66, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T20:33:31.757Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T20:04:09.182Z", "lft": 1, "tree_id": 37, "position": 8, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	66	1
864	63	66	66	35	json	[{"pk": 66, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 10.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/gallery.html", "title": "homepage"}}]	3 image(s) in gallery	1
865	63	19	19	9	json	[{"pk": 19, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:23:42.523Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:23:42.522Z", "lft": 1, "tree_id": 10, "position": 1, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	19	1
1061	78	22	22	10	json	[{"pk": 22, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-30T01:05:24.721Z", "limit_visibility_in_menu": null, "parent": 5, "level": 1, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-30T01:05:24.721Z", "lft": 10, "publication_end_date": null, "soft_root": false, "template": "products.html", "published": false, "publication_date": null, "placeholders": [52, 53, 54], "in_navigation": false, "rght": 11, "tree_id": 3}}]	Articles	0
1062	78	53	53	8	json	[{"pk": 53, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
1132	87	186	186	9	json	[{"pk": 186, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-30T02:21:17.674Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-30T02:03:09.936Z", "lft": 1, "tree_id": 51, "position": 0, "placeholder": 73, "plugin_type": "CMSGalleryPlugin"}}]	186	1
1163	90	186	186	9	json	[{"pk": 186, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-30T02:21:17.674Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-30T02:03:09.936Z", "lft": 1, "tree_id": 51, "position": 0, "placeholder": 73, "plugin_type": "CMSGalleryPlugin"}}]	186	1
1164	90	191	191	35	json	[{"pk": 191, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/products_hero_image_title_description.html", "title": "Product Hero"}}]	1 image(s) in gallery	1
951	67	66	66	9	json	[{"pk": 66, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T22:23:36.821Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T20:04:09.182Z", "lft": 1, "tree_id": 37, "position": 8, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	66	1
952	67	66	66	35	json	[{"pk": 66, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/gallery.html", "title": "homepage"}}]	3 image(s) in gallery	1
953	67	19	19	9	json	[{"pk": 19, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:23:42.523Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:23:42.522Z", "lft": 1, "tree_id": 10, "position": 1, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	19	1
1063	79	27	27	16	json	[{"pk": 27, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "Slitting lines", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-30T01:08:20.536Z", "page": 27, "path": "products/slitting-lines", "meta_description": null, "slug": "slitting-lines"}}]	Slitting lines (slitting-lines, en)	1
1064	79	67	67	8	json	[{"pk": 67, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
1065	79	27	27	10	json	[{"pk": 27, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-30T01:08:20.517Z", "limit_visibility_in_menu": null, "parent": 5, "level": 1, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-30T01:08:20.517Z", "lft": 12, "publication_end_date": null, "soft_root": false, "template": "products.html", "published": false, "publication_date": null, "placeholders": [67, 68, 69], "in_navigation": false, "rght": 13, "tree_id": 3}}]	Slitting lines	0
1066	79	68	68	8	json	[{"pk": 68, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
1067	79	69	69	8	json	[{"pk": 69, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
1107	85	67	67	8	json	[{"pk": 67, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
1108	85	68	68	8	json	[{"pk": 68, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
1109	85	69	69	8	json	[{"pk": 69, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
1110	85	77	77	8	json	[{"pk": 77, "model": "cms.placeholder", "fields": {"slot": "hero_content", "default_width": null}}]	hero_content	1
1111	85	78	78	8	json	[{"pk": 78, "model": "cms.placeholder", "fields": {"slot": "products_content", "default_width": null}}]	products_content	1
1112	85	27	27	16	json	[{"pk": 27, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Slitting Lines", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-30T01:08:20.536Z", "page": 27, "path": "products/slitting-lines", "meta_description": "", "slug": "slitting-lines"}}]	Slitting Lines (slitting-lines, en)	1
1113	85	27	27	10	json	[{"pk": 27, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-30T02:18:09.354Z", "limit_visibility_in_menu": null, "parent": 5, "level": 1, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-30T01:08:20.517Z", "lft": 2, "publication_end_date": null, "soft_root": false, "template": "products.html", "published": true, "publication_date": "2013-12-30T01:08:51.478Z", "placeholders": [67, 68, 69, 77, 78], "in_navigation": true, "rght": 13, "tree_id": 3}}]	Slitting Lines	1
1114	85	188	188	9	json	[{"pk": 188, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-30T02:18:01.814Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-30T02:18:01.813Z", "lft": 1, "tree_id": 53, "position": 0, "placeholder": 78, "plugin_type": "CMSGalleryPlugin"}}]	188	1
1154	90	37	37	8	json	[{"pk": 37, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
1155	90	38	38	8	json	[{"pk": 38, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
1156	90	17	17	16	json	[{"pk": 17, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "Overview", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-30T01:02:16.261Z", "page": 17, "path": "products/slitting-lines/overview", "meta_description": null, "slug": "overview"}}]	Overview (overview, en)	1
1157	90	73	73	8	json	[{"pk": 73, "model": "cms.placeholder", "fields": {"slot": "products_content", "default_width": null}}]	products_content	1
1158	90	74	74	8	json	[{"pk": 74, "model": "cms.placeholder", "fields": {"slot": "hero_content", "default_width": null}}]	hero_content	1
1159	90	39	39	8	json	[{"pk": 39, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
1160	90	17	17	10	json	[{"pk": 17, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-30T02:29:34.177Z", "limit_visibility_in_menu": null, "parent": 27, "level": 2, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-30T01:02:16.238Z", "lft": 3, "publication_end_date": null, "soft_root": false, "template": "products.html", "published": true, "publication_date": "2013-12-30T01:02:21.261Z", "placeholders": [37, 38, 39, 73, 74], "in_navigation": true, "rght": 4, "tree_id": 3}}]	Overview	1
1161	90	186	186	35	json	[{"pk": 186, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 0.0, "fade_duration": 0.0, "template": "cmsplugin_gallery/products_image_title_description.html", "title": "Products"}}]	3 image(s) in gallery	1
1162	90	191	191	9	json	[{"pk": 191, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-30T02:29:25.744Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-30T02:28:35.061Z", "lft": 1, "tree_id": 56, "position": 0, "placeholder": 74, "plugin_type": "CMSGalleryPlugin"}}]	191	1
998	70	1	1	9	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T18:10:32.344Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T18:10:32.343Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	1	1
999	70	2	2	9	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:12:15.439Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:12:15.437Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	2	1
1000	70	3	3	10	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-29T19:20:05.359Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-26T18:07:54.919Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-26T18:14:24.682Z", "placeholders": [1, 2, 29, 30], "in_navigation": true, "rght": 2, "tree_id": 2}}]	Home	1
1001	70	4	4	20	json	[{"pk": 4, "model": "text.text", "fields": {"body": "<h3>Welcome to Braner</h3>\\n<p>Welcome to our web page, we appreciate your interest! Braner USA manufactures slitting lines, slit coil packaging lines, cut-to-length lines, multi-blanking lines and other flat rolled coil processing equipment. We also provide equipment upgrade feasibility studies, in-house machine repairs, field service and repair, installation service and OEM spare parts for Braner, Loopco, Stanat and Coiltech machines. We are committed to continuous improvement of our designs targeting increased operating efficiency for our customers.</p>"}}]	Welcome to Braner\nWelcome t...	1
1002	70	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-26T18:07:54.937Z", "page": 3, "path": "", "meta_description": "", "slug": "home"}}]	Home (home, en)	1
1003	70	2	2	8	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
1004	70	15	15	16	json	[{"pk": 15, "model": "cms.title", "fields": {"menu_title": "", "redirect": null, "meta_keywords": "", "page_title": "", "language": "es", "title": "Casa", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-28T17:34:15.150Z", "page": 3, "path": "", "meta_description": "", "slug": "casa"}}]	Casa (casa, es)	1
1005	70	17	17	9	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:17:30.317Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T18:58:58.405Z", "lft": 1, "tree_id": 9, "position": 0, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	17	1
1006	70	3	3	9	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:15:03.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:15:03.483Z", "lft": 1, "tree_id": 3, "position": 2, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	3	1
1007	70	20	20	9	json	[{"pk": 20, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:26:45.813Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:26:45.812Z", "lft": 1, "tree_id": 11, "position": 2, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	20	1
1008	70	21	21	9	json	[{"pk": 21, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:35:02.744Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:33:42.292Z", "lft": 1, "tree_id": 12, "position": 3, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	21	1
1009	70	4	4	9	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T14:46:56.200Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:17:02.850Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 30, "plugin_type": "TextPlugin"}}]	4	1
1010	70	29	29	8	json	[{"pk": 29, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
1011	70	30	30	8	json	[{"pk": 30, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
1012	70	1	1	8	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
1013	70	38	38	9	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:45.841Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:45.840Z", "lft": 1, "tree_id": 21, "position": 4, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	38	1
1014	70	39	39	9	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:57.157Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:57.156Z", "lft": 1, "tree_id": 22, "position": 5, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	39	1
1015	70	40	40	9	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:42:25.345Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:25.343Z", "lft": 1, "tree_id": 23, "position": 6, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	40	1
1016	70	41	41	9	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:52:13.585Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:46.312Z", "lft": 1, "tree_id": 24, "position": 7, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	41	1
1017	70	66	66	9	json	[{"pk": 66, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-29T19:20:02.391Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T20:04:09.182Z", "lft": 1, "tree_id": 37, "position": 8, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	66	1
1018	70	66	66	35	json	[{"pk": 66, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/homepage_gallery.html", "title": "homepage"}}]	3 image(s) in gallery	1
1019	70	19	19	9	json	[{"pk": 19, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:23:42.523Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:23:42.522Z", "lft": 1, "tree_id": 10, "position": 1, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	19	1
1090	83	37	37	8	json	[{"pk": 37, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
1091	83	38	38	8	json	[{"pk": 38, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
1192	94	19	19	16	json	[{"pk": 19, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "Features", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-30T01:04:40.267Z", "page": 19, "path": "products/slitting-lines/features", "meta_description": null, "slug": "features"}}]	Features (features, en)	1
1193	94	194	194	35	json	[{"pk": 194, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 0.0, "fade_duration": 0.0, "template": "cmsplugin_gallery/products_features.html", "title": "Slitting Lines Features"}}]	4 image(s) in gallery	1
1194	94	43	43	8	json	[{"pk": 43, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
1195	94	44	44	8	json	[{"pk": 44, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
1196	94	194	194	9	json	[{"pk": 194, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-30T03:00:00.641Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-30T02:57:50.276Z", "lft": 1, "tree_id": 59, "position": 0, "placeholder": 83, "plugin_type": "CMSGalleryPlugin"}}]	194	1
1197	94	45	45	8	json	[{"pk": 45, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
1198	94	81	81	8	json	[{"pk": 81, "model": "cms.placeholder", "fields": {"slot": "hero_content", "default_width": null}}]	hero_content	1
1199	94	82	82	8	json	[{"pk": 82, "model": "cms.placeholder", "fields": {"slot": "products_content", "default_width": null}}]	products_content	1
1200	94	19	19	10	json	[{"pk": 19, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-30T03:00:21.252Z", "limit_visibility_in_menu": null, "parent": 27, "level": 2, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-30T01:04:40.249Z", "lft": 5, "publication_end_date": null, "soft_root": false, "template": "products_features.html", "published": true, "publication_date": "2013-12-30T01:05:27.290Z", "placeholders": [43, 44, 45, 81, 82, 83], "in_navigation": true, "rght": 6, "tree_id": 3}}]	Features	1
1201	94	83	83	8	json	[{"pk": 83, "model": "cms.placeholder", "fields": {"slot": "features", "default_width": null}}]	features	1
1224	96	1	1	9	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T18:10:32.344Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T18:10:32.343Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	1	1
1225	96	2	2	9	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:12:15.439Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:12:15.437Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	2	1
1226	96	3	3	10	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-30T20:50:47.767Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-26T18:07:54.919Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "home.html", "published": true, "publication_date": "2013-12-26T18:14:24.682Z", "placeholders": [1, 2, 29, 30], "in_navigation": true, "rght": 2, "tree_id": 2}}]	Home	1
1227	96	4	4	20	json	[{"pk": 4, "model": "text.text", "fields": {"body": "<h3>Welcome to Braner</h3>\\n<p>Welcome to our web page, we appreciate your interest! Braner USA manufactures slitting lines, slit coil packaging lines, cut-to-length lines, multi-blanking lines and other flat rolled coil processing equipment. We also provide equipment upgrade feasibility studies, in-house machine repairs, field service and repair, installation service and OEM spare parts for Braner, Loopco, Stanat and Coiltech machines. We are committed to continuous improvement of our designs targeting increased operating efficiency for our customers.</p>"}}]	Welcome to Braner\nWelcome t...	1
1228	96	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-12-26T18:07:54.937Z", "page": 3, "path": "", "meta_description": "", "slug": "home"}}]	Home (home, en)	1
1229	96	2	2	8	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
1230	96	15	15	16	json	[{"pk": 15, "model": "cms.title", "fields": {"menu_title": "", "redirect": null, "meta_keywords": "", "page_title": "", "language": "es", "title": "Casa", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-28T17:34:15.150Z", "page": 3, "path": "", "meta_description": "", "slug": "casa"}}]	Casa (casa, es)	1
1231	96	17	17	9	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:17:30.317Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T18:58:58.405Z", "lft": 1, "tree_id": 9, "position": 0, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	17	1
1232	96	3	3	9	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-27T20:15:03.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:15:03.483Z", "lft": 1, "tree_id": 3, "position": 2, "placeholder": 1, "plugin_type": "CMSGalleryPlugin"}}]	3	1
1233	96	20	20	9	json	[{"pk": 20, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:26:45.813Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:26:45.812Z", "lft": 1, "tree_id": 11, "position": 2, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	20	1
1234	96	21	21	9	json	[{"pk": 21, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:35:02.744Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:33:42.292Z", "lft": 1, "tree_id": 12, "position": 3, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	21	1
1235	96	4	4	9	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T14:46:56.200Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-27T20:17:02.850Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 30, "plugin_type": "TextPlugin"}}]	4	1
1236	96	29	29	8	json	[{"pk": 29, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
1237	96	30	30	8	json	[{"pk": 30, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
1238	96	1	1	8	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "home_content", "default_width": null}}]	home_content	1
1239	96	38	38	9	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:45.841Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:45.840Z", "lft": 1, "tree_id": 21, "position": 4, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	38	1
1240	96	39	39	9	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:41:57.157Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:41:57.156Z", "lft": 1, "tree_id": 22, "position": 5, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	39	1
1241	96	40	40	9	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:42:25.345Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:25.343Z", "lft": 1, "tree_id": 23, "position": 6, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	40	1
1242	96	41	41	9	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:52:13.585Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:42:46.312Z", "lft": 1, "tree_id": 24, "position": 7, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	41	1
1243	96	66	66	9	json	[{"pk": 66, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-30T20:50:44.786Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T20:04:09.182Z", "lft": 1, "tree_id": 37, "position": 8, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	66	1
1244	96	66	66	35	json	[{"pk": 66, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/homepage_gallery.html", "title": "homepage"}}]	3 image(s) in gallery	1
1245	96	19	19	9	json	[{"pk": 19, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-28T19:23:42.523Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-28T19:23:42.522Z", "lft": 1, "tree_id": 10, "position": 1, "placeholder": 29, "plugin_type": "CMSGalleryPlugin"}}]	19	1
1481	116	226	226	9	json	[{"pk": 226, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-31T03:17:52.712Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-31T03:17:52.710Z", "lft": 1, "tree_id": 91, "position": 0, "placeholder": 95, "plugin_type": "CMSVideoGalleryPlugin"}}]	226	1
1482	116	227	227	9	json	[{"pk": 227, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-01-01T23:50:42.251Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-01-01T23:50:42.248Z", "lft": 1, "tree_id": 92, "position": 1, "placeholder": 95, "plugin_type": "CMSVideoGalleryPlugin"}}]	227	1
1483	116	228	228	9	json	[{"pk": 228, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-01-02T00:16:46.768Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-01-02T00:15:53.961Z", "lft": 1, "tree_id": 93, "position": 2, "placeholder": 95, "plugin_type": "CMSVideoGalleryPlugin"}}]	228	1
1484	116	46	46	8	json	[{"pk": 46, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
1485	116	47	47	8	json	[{"pk": 47, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
1486	116	48	48	8	json	[{"pk": 48, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
1487	116	209	209	9	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-31T02:14:23.847Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-31T02:14:23.844Z", "lft": 1, "tree_id": 74, "position": 0, "placeholder": 89, "plugin_type": "CMSFileGalleryPlugin"}}]	209	1
1488	116	20	20	10	json	[{"pk": 20, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2014-01-02T00:22:18.551Z", "limit_visibility_in_menu": null, "parent": 27, "level": 2, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-30T01:04:51.228Z", "lft": 7, "publication_end_date": null, "soft_root": false, "template": "products_movies.html", "published": true, "publication_date": "2013-12-30T01:05:26.616Z", "placeholders": [46, 47, 48, 89, 90, 95], "in_navigation": true, "rght": 8, "tree_id": 3}}]	Movies	1
1489	116	89	89	8	json	[{"pk": 89, "model": "cms.placeholder", "fields": {"slot": "hero_content", "default_width": null}}]	hero_content	1
1490	116	228	228	39	json	[{"pk": 228, "model": "cmsplugin_video_gallery.videogalleryplugin", "fields": {"template": "cmsplugin_video_gallery/products_movies_title_description.html", "title": "Something"}}]	1 video(s) in gallery	1
1491	116	90	90	8	json	[{"pk": 90, "model": "cms.placeholder", "fields": {"slot": "products_content", "default_width": null}}]	products_content	1
1492	116	20	20	16	json	[{"pk": 20, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "Movies", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-30T01:04:51.247Z", "page": 20, "path": "products/slitting-lines/movies", "meta_description": null, "slug": "movies"}}]	Movies (movies, en)	1
1493	116	95	95	8	json	[{"pk": 95, "model": "cms.placeholder", "fields": {"slot": "products_movies_content", "default_width": null}}]	products_movies_content	1
1409	110	51	51	8	json	[{"pk": 51, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content	1
1410	110	87	87	8	json	[{"pk": 87, "model": "cms.placeholder", "fields": {"slot": "hero_content", "default_width": null}}]	hero_content	1
1411	110	50	50	8	json	[{"pk": 50, "model": "cms.placeholder", "fields": {"slot": "homepage_text_content", "default_width": null}}]	homepage_text_content	1
1412	110	49	49	8	json	[{"pk": 49, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content	1
1413	110	210	210	9	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-31T02:17:03.454Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-31T02:17:03.453Z", "lft": 1, "tree_id": 75, "position": 0, "placeholder": 87, "plugin_type": "CMSVideoGalleryPlugin"}}]	210	1
1414	110	211	211	9	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-31T02:17:32.336Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-31T02:17:32.335Z", "lft": 1, "tree_id": 76, "position": 1, "placeholder": 87, "plugin_type": "CMSVideoGalleryPlugin"}}]	211	1
1415	110	212	212	9	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-31T02:18:29.931Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-31T02:18:29.930Z", "lft": 1, "tree_id": 77, "position": 2, "placeholder": 87, "plugin_type": "CMSVideoGalleryPlugin"}}]	212	1
1416	110	21	21	10	json	[{"pk": 21, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-12-31T02:40:32.030Z", "limit_visibility_in_menu": null, "parent": 27, "level": 2, "reverse_id": null, "changed_by": "brandon", "navigation_extenders": "", "site": 1, "created_by": "brandon", "creation_date": "2013-12-30T01:05:13.907Z", "lft": 9, "publication_end_date": null, "soft_root": false, "template": "products_installations.html", "published": true, "publication_date": "2013-12-30T01:05:26.069Z", "placeholders": [49, 50, 51, 87, 88, 91], "in_navigation": true, "rght": 10, "tree_id": 3}}]	Installations	1
1417	110	214	214	9	json	[{"pk": 214, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-31T02:21:26.406Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-31T02:21:26.405Z", "lft": 1, "tree_id": 79, "position": 4, "placeholder": 87, "plugin_type": "CMSVideoGalleryPlugin"}}]	214	1
1418	110	215	215	9	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-31T02:23:32.162Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-31T02:23:32.161Z", "lft": 1, "tree_id": 80, "position": 5, "placeholder": 87, "plugin_type": "CMSVideoGalleryPlugin"}}]	215	1
1419	110	216	216	9	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-31T02:34:58.236Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-31T02:34:58.235Z", "lft": 1, "tree_id": 81, "position": 0, "placeholder": 91, "plugin_type": "CMSFileGalleryPlugin"}}]	216	1
1420	110	217	217	41	json	[{"pk": 217, "model": "cmsplugin_file_gallery.filegalleryplugin", "fields": {"template": "cmsplugin_file_gallery/installations_image_title_description.html", "title": "Slitting Lines Installations"}}]	1 file(s) in gallery	1
1421	110	217	217	9	json	[{"pk": 217, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-31T02:39:17.998Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-31T02:38:35.988Z", "lft": 1, "tree_id": 82, "position": 1, "placeholder": 91, "plugin_type": "CMSFileGalleryPlugin"}}]	217	1
1422	110	91	91	8	json	[{"pk": 91, "model": "cms.placeholder", "fields": {"slot": "products_installations_content", "default_width": null}}]	products_installations_content	1
1423	110	21	21	16	json	[{"pk": 21, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "en", "title": "Installations", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-12-30T01:05:13.926Z", "page": 21, "path": "products/slitting-lines/installations", "meta_description": null, "slug": "installations"}}]	Installations (installations, en)	1
1424	110	88	88	8	json	[{"pk": 88, "model": "cms.placeholder", "fields": {"slot": "products_content", "default_width": null}}]	products_content	1
1425	110	213	213	9	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-12-31T02:19:46.921Z", "parent": null, "language": "en", "level": 0, "creation_date": "2013-12-31T02:19:46.920Z", "lft": 1, "tree_id": 78, "position": 3, "placeholder": 87, "plugin_type": "CMSVideoGalleryPlugin"}}]	213	1
\.


--
-- Name: reversion_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('reversion_version_id_seq', 1493, true);


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: mlorenz
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	cmsplugin_gallery	0001_initial	2013-12-28 15:23:04.082532-05
2	cmsplugin_gallery	0002_auto__add_field_galleryplugin_template	2013-12-28 15:23:04.085553-05
3	cmsplugin_gallery	0003_move_images_to_media_path	2013-12-28 15:23:04.087276-05
4	cmsplugin_gallery	0004_auto__add_field_image_link__add_field_image_extended_content__add_fiel	2013-12-28 15:23:04.08906-05
5	cmsplugin_gallery	0005_auto__add_field_galleryplugin_fade_duration	2013-12-28 15:23:41.811379-05
6	cms	0001_initial	2013-12-28 15:23:51.683382-05
7	cms	0002_auto_start	2013-12-28 15:23:51.685974-05
8	cms	0003_remove_placeholder	2013-12-28 15:23:51.687585-05
9	cms	0004_textobjects	2013-12-28 15:23:51.689272-05
10	cms	0005_mptt_added_to_plugins	2013-12-28 15:23:51.690913-05
11	cms	0006_apphook	2013-12-28 15:23:51.692829-05
12	cms	0007_apphook_longer	2013-12-28 15:23:51.694528-05
13	cms	0008_redirects	2013-12-28 15:23:51.696198-05
14	cms	0009_added_meta_fields	2013-12-28 15:23:51.698097-05
15	cms	0010_5char_language	2013-12-28 15:23:51.699938-05
16	cms	0011_title_overwrites	2013-12-28 15:23:51.701842-05
17	cms	0012_publisher	2013-12-28 15:23:51.703793-05
18	cms	0013_site_copy	2013-12-28 15:23:51.705489-05
19	cms	0014_sites_removed	2013-12-28 15:23:51.707154-05
20	cms	0015_modified_by_added	2013-12-28 15:23:51.708796-05
21	cms	0016_author_copy	2013-12-28 15:23:51.71052-05
22	cms	0017_author_removed	2013-12-28 15:23:51.712237-05
23	cms	0018_site_permissions	2013-12-28 15:23:51.713923-05
24	cms	0019_public_table_renames	2013-12-28 15:23:51.715582-05
25	cms	0020_advanced_permissions	2013-12-28 15:23:51.717291-05
26	cms	0021_publisher2	2013-12-28 15:23:51.718967-05
27	cms	0022_login_required_added	2013-12-28 15:23:51.72056-05
28	cms	0023_plugin_table_naming_function_changed	2013-12-28 15:23:51.722257-05
29	cms	0024_added_placeholder_model	2013-12-28 15:23:51.724026-05
30	cms	0025_placeholder_migration	2013-12-28 15:23:51.72563-05
31	cms	0026_finish_placeholder_migration	2013-12-28 15:23:51.727303-05
32	cms	0027_added_width_to_placeholder	2013-12-28 15:23:51.728934-05
33	cms	0028_limit_visibility_in_menu_step1of3	2013-12-28 15:23:51.730554-05
34	cms	0029_limit_visibility_in_menu_step2of3_data	2013-12-28 15:23:51.732258-05
35	cms	0030_limit_visibility_in_menu_step3of3	2013-12-28 15:23:51.733967-05
36	cms	0031_improved_language_code_support	2013-12-28 15:23:51.735756-05
37	cms	0032_auto__del_field_cmsplugin_publisher_public__del_field_cmsplugin_publis	2013-12-28 15:23:51.738269-05
38	cms	0033_auto__del_field_title_publisher_is_draft__del_field_title_publisher_st	2013-12-28 15:23:51.74108-05
39	cms	0034_auto__chg_field_title_language__chg_field_cmsplugin_language__add_fiel	2013-12-28 15:23:51.743015-05
40	cms	0035_auto__add_field_globalpagepermission_can_view__add_field_pagepermissio	2013-12-28 15:23:51.744708-05
41	cms	0036_auto__add_field_cmsplugin_changed_date	2013-12-28 15:23:51.74632-05
42	cms	0037_auto__del_pagemoderator__del_field_globalpagepermission_can_moderate__	2013-12-28 15:23:51.747982-05
43	cms	0038_publish_page_permission	2013-12-28 15:23:51.74962-05
44	cms	0039_auto__del_field_page_moderator_state	2013-12-28 15:23:51.751272-05
45	menus	0001_initial	2013-12-28 15:23:51.784154-05
46	link	0001_initial	2013-12-28 15:23:51.855626-05
47	link	0002_link_rename	2013-12-28 15:23:51.857696-05
48	link	0003_page_link	2013-12-28 15:23:51.859428-05
49	link	0004_larger_link_names	2013-12-28 15:23:51.86111-05
50	link	0005_publisher	2013-12-28 15:23:51.862858-05
51	link	0006_table_rename	2013-12-28 15:23:51.864515-05
52	link	0007_publisher2	2013-12-28 15:23:51.866315-05
53	link	0008_mailto	2013-12-28 15:23:51.86808-05
54	link	0009_add_target	2013-12-28 15:23:51.870147-05
55	text	0001_initial	2013-12-28 15:23:51.901699-05
56	text	0002_freeze	2013-12-28 15:23:51.903668-05
57	text	0003_publisher	2013-12-28 15:23:51.905386-05
58	text	0004_table_rename	2013-12-28 15:23:51.907117-05
59	text	0005_publisher2	2013-12-28 15:23:51.908963-05
60	text	0006_2_1_4_upgrade	2013-12-28 15:23:51.911223-05
61	easy_thumbnails	0001_initial	2013-12-28 15:23:51.94678-05
62	easy_thumbnails	0002_filename_indexes	2013-12-28 15:23:51.948558-05
63	easy_thumbnails	0003_auto__add_storagenew	2013-12-28 15:23:51.950231-05
64	easy_thumbnails	0004_auto__add_field_source_storage_new__add_field_thumbnail_storage_new	2013-12-28 15:23:51.952284-05
65	easy_thumbnails	0005_storage_fks_null	2013-12-28 15:23:51.954385-05
66	easy_thumbnails	0006_copy_storage	2013-12-28 15:23:51.956199-05
67	easy_thumbnails	0007_storagenew_fks_not_null	2013-12-28 15:23:51.957913-05
68	easy_thumbnails	0008_auto__del_field_source_storage__del_field_thumbnail_storage	2013-12-28 15:23:51.959695-05
69	easy_thumbnails	0009_auto__del_storage	2013-12-28 15:23:51.961373-05
70	easy_thumbnails	0010_rename_storage	2013-12-28 15:23:51.963039-05
71	easy_thumbnails	0011_auto__add_field_source_storage_hash__add_field_thumbnail_storage_hash	2013-12-28 15:23:51.964685-05
72	easy_thumbnails	0012_build_storage_hashes	2013-12-28 15:23:51.966974-05
73	easy_thumbnails	0013_auto__del_storage__del_field_source_storage__del_field_thumbnail_stora	2013-12-28 15:23:51.969092-05
74	easy_thumbnails	0014_auto__add_unique_source_name_storage_hash__add_unique_thumbnail_name_s	2013-12-28 15:23:51.970872-05
75	easy_thumbnails	0015_auto__del_unique_thumbnail_name_storage_hash__add_unique_thumbnail_sou	2013-12-28 15:23:51.972509-05
76	cmsplugin_video_gallery	0001_initial	2013-12-31 09:28:00.294163-05
77	cmsplugin_file_gallery	0001_initial	2013-12-31 09:39:18.540664-05
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mlorenz
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 77, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cms_cmsplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT cms_cmsplugin_pkey PRIMARY KEY (id);


--
-- Name: cms_globalpagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermission_pkey PRIMARY KEY (id);


--
-- Name: cms_globalpagepermission_site_globalpagepermission_id_site__key; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermission_site_globalpagepermission_id_site__key UNIQUE (globalpagepermission_id, site_id);


--
-- Name: cms_globalpagepermission_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermission_sites_pkey PRIMARY KEY (id);


--
-- Name: cms_page_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_pkey PRIMARY KEY (id);


--
-- Name: cms_page_placeholders_page_id_placeholder_id_key; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_page_id_placeholder_id_key UNIQUE (page_id, placeholder_id);


--
-- Name: cms_page_placeholders_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_pkey PRIMARY KEY (id);


--
-- Name: cms_page_publisher_public_id_key; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_publisher_public_id_key UNIQUE (publisher_public_id);


--
-- Name: cms_pagemoderatorstate_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cms_pagemoderatorstate
    ADD CONSTRAINT cms_pagemoderatorstate_pkey PRIMARY KEY (id);


--
-- Name: cms_pagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_pkey PRIMARY KEY (id);


--
-- Name: cms_pageuser_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT cms_pageuser_pkey PRIMARY KEY (user_ptr_id);


--
-- Name: cms_pageusergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_pkey PRIMARY KEY (group_ptr_id);


--
-- Name: cms_placeholder_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cms_placeholder
    ADD CONSTRAINT cms_placeholder_pkey PRIMARY KEY (id);


--
-- Name: cms_title_language_page_id_key; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_language_page_id_key UNIQUE (language, page_id);


--
-- Name: cms_title_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_file_gallery_downloadablefile_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_file_gallery_downloadablefile
    ADD CONSTRAINT cmsplugin_file_gallery_downloadablefile_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_filegalleryplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_filegalleryplugin
    ADD CONSTRAINT cmsplugin_filegalleryplugin_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_filer_image_thumbnailoption_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_filer_image_thumbnailoption
    ADD CONSTRAINT cmsplugin_filer_image_thumbnailoption_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_filerfile_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_filerfile
    ADD CONSTRAINT cmsplugin_filerfile_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_filerfolder_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_filerfolder
    ADD CONSTRAINT cmsplugin_filerfolder_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_filerimage_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_filerimage
    ADD CONSTRAINT cmsplugin_filerimage_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_filerteaser_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_filerteaser
    ADD CONSTRAINT cmsplugin_filerteaser_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_filervideo_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_filervideo
    ADD CONSTRAINT cmsplugin_filervideo_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_gallery_image_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_gallery_image
    ADD CONSTRAINT cmsplugin_gallery_image_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_galleryplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_galleryplugin
    ADD CONSTRAINT cmsplugin_galleryplugin_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_link_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_link
    ADD CONSTRAINT cmsplugin_link_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_text_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_text
    ADD CONSTRAINT cmsplugin_text_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_video_gallery_video_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_video_gallery_video
    ADD CONSTRAINT cmsplugin_video_gallery_video_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_videogalleryplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_videogalleryplugin
    ADD CONSTRAINT cmsplugin_videogalleryplugin_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source_storage_hash_name_key; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_storage_hash_name_key UNIQUE (storage_hash, name);


--
-- Name: easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_name_source_id_key; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_storage_hash_name_source_id_key UNIQUE (storage_hash, name, source_id);


--
-- Name: filer_clipboard_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY filer_clipboard
    ADD CONSTRAINT filer_clipboard_pkey PRIMARY KEY (id);


--
-- Name: filer_clipboarditem_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY filer_clipboarditem
    ADD CONSTRAINT filer_clipboarditem_pkey PRIMARY KEY (id);


--
-- Name: filer_file_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT filer_file_pkey PRIMARY KEY (id);


--
-- Name: filer_folder_parent_id_name_key; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT filer_folder_parent_id_name_key UNIQUE (parent_id, name);


--
-- Name: filer_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT filer_folder_pkey PRIMARY KEY (id);


--
-- Name: filer_folderpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_pkey PRIMARY KEY (id);


--
-- Name: filer_image_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY filer_image
    ADD CONSTRAINT filer_image_pkey PRIMARY KEY (file_ptr_id);


--
-- Name: menus_cachekey_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY menus_cachekey
    ADD CONSTRAINT menus_cachekey_pkey PRIMARY KEY (id);


--
-- Name: reversion_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY reversion_revision
    ADD CONSTRAINT reversion_revision_pkey PRIMARY KEY (id);


--
-- Name: reversion_version_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reversion_version_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: mlorenz; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: cms_cmsplugin_language; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_cmsplugin_language ON cms_cmsplugin USING btree (language);


--
-- Name: cms_cmsplugin_language_like; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_cmsplugin_language_like ON cms_cmsplugin USING btree (language varchar_pattern_ops);


--
-- Name: cms_cmsplugin_level; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_cmsplugin_level ON cms_cmsplugin USING btree (level);


--
-- Name: cms_cmsplugin_lft; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_cmsplugin_lft ON cms_cmsplugin USING btree (lft);


--
-- Name: cms_cmsplugin_parent_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_cmsplugin_parent_id ON cms_cmsplugin USING btree (parent_id);


--
-- Name: cms_cmsplugin_placeholder_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_cmsplugin_placeholder_id ON cms_cmsplugin USING btree (placeholder_id);


--
-- Name: cms_cmsplugin_plugin_type; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_cmsplugin_plugin_type ON cms_cmsplugin USING btree (plugin_type);


--
-- Name: cms_cmsplugin_plugin_type_like; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_cmsplugin_plugin_type_like ON cms_cmsplugin USING btree (plugin_type varchar_pattern_ops);


--
-- Name: cms_cmsplugin_rght; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_cmsplugin_rght ON cms_cmsplugin USING btree (rght);


--
-- Name: cms_cmsplugin_tree_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_cmsplugin_tree_id ON cms_cmsplugin USING btree (tree_id);


--
-- Name: cms_globalpagepermission_group_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_group_id ON cms_globalpagepermission USING btree (group_id);


--
-- Name: cms_globalpagepermission_sites_globalpagepermission_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_sites_globalpagepermission_id ON cms_globalpagepermission_sites USING btree (globalpagepermission_id);


--
-- Name: cms_globalpagepermission_sites_site_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_sites_site_id ON cms_globalpagepermission_sites USING btree (site_id);


--
-- Name: cms_globalpagepermission_user_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_user_id ON cms_globalpagepermission USING btree (user_id);


--
-- Name: cms_page_in_navigation; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_page_in_navigation ON cms_page USING btree (in_navigation);


--
-- Name: cms_page_level; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_page_level ON cms_page USING btree (level);


--
-- Name: cms_page_lft; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_page_lft ON cms_page USING btree (lft);


--
-- Name: cms_page_limit_visibility_in_menu; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_page_limit_visibility_in_menu ON cms_page USING btree (limit_visibility_in_menu);


--
-- Name: cms_page_navigation_extenders; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_page_navigation_extenders ON cms_page USING btree (navigation_extenders);


--
-- Name: cms_page_navigation_extenders_like; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_page_navigation_extenders_like ON cms_page USING btree (navigation_extenders varchar_pattern_ops);


--
-- Name: cms_page_parent_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_page_parent_id ON cms_page USING btree (parent_id);


--
-- Name: cms_page_placeholders_page_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_page_placeholders_page_id ON cms_page_placeholders USING btree (page_id);


--
-- Name: cms_page_placeholders_placeholder_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_page_placeholders_placeholder_id ON cms_page_placeholders USING btree (placeholder_id);


--
-- Name: cms_page_publication_date; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_page_publication_date ON cms_page USING btree (publication_date);


--
-- Name: cms_page_publication_end_date; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_page_publication_end_date ON cms_page USING btree (publication_end_date);


--
-- Name: cms_page_publisher_is_draft; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_page_publisher_is_draft ON cms_page USING btree (publisher_is_draft);


--
-- Name: cms_page_publisher_state; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_page_publisher_state ON cms_page USING btree (publisher_state);


--
-- Name: cms_page_reverse_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_page_reverse_id ON cms_page USING btree (reverse_id);


--
-- Name: cms_page_reverse_id_like; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_page_reverse_id_like ON cms_page USING btree (reverse_id varchar_pattern_ops);


--
-- Name: cms_page_rght; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_page_rght ON cms_page USING btree (rght);


--
-- Name: cms_page_site_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_page_site_id ON cms_page USING btree (site_id);


--
-- Name: cms_page_soft_root; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_page_soft_root ON cms_page USING btree (soft_root);


--
-- Name: cms_page_tree_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_page_tree_id ON cms_page USING btree (tree_id);


--
-- Name: cms_pagemoderatorstate_page_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_pagemoderatorstate_page_id ON cms_pagemoderatorstate USING btree (page_id);


--
-- Name: cms_pagemoderatorstate_user_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_pagemoderatorstate_user_id ON cms_pagemoderatorstate USING btree (user_id);


--
-- Name: cms_pagepermission_group_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_pagepermission_group_id ON cms_pagepermission USING btree (group_id);


--
-- Name: cms_pagepermission_page_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_pagepermission_page_id ON cms_pagepermission USING btree (page_id);


--
-- Name: cms_pagepermission_user_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_pagepermission_user_id ON cms_pagepermission USING btree (user_id);


--
-- Name: cms_pageuser_created_by_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_pageuser_created_by_id ON cms_pageuser USING btree (created_by_id);


--
-- Name: cms_pageusergroup_created_by_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_pageusergroup_created_by_id ON cms_pageusergroup USING btree (created_by_id);


--
-- Name: cms_placeholder_slot; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_placeholder_slot ON cms_placeholder USING btree (slot);


--
-- Name: cms_placeholder_slot_like; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_placeholder_slot_like ON cms_placeholder USING btree (slot varchar_pattern_ops);


--
-- Name: cms_title_application_urls; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_title_application_urls ON cms_title USING btree (application_urls);


--
-- Name: cms_title_application_urls_like; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_title_application_urls_like ON cms_title USING btree (application_urls varchar_pattern_ops);


--
-- Name: cms_title_has_url_overwrite; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_title_has_url_overwrite ON cms_title USING btree (has_url_overwrite);


--
-- Name: cms_title_language; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_title_language ON cms_title USING btree (language);


--
-- Name: cms_title_language_like; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_title_language_like ON cms_title USING btree (language varchar_pattern_ops);


--
-- Name: cms_title_page_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_title_page_id ON cms_title USING btree (page_id);


--
-- Name: cms_title_path; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_title_path ON cms_title USING btree (path);


--
-- Name: cms_title_path_like; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_title_path_like ON cms_title USING btree (path varchar_pattern_ops);


--
-- Name: cms_title_slug; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_title_slug ON cms_title USING btree (slug);


--
-- Name: cms_title_slug_like; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cms_title_slug_like ON cms_title USING btree (slug varchar_pattern_ops);


--
-- Name: cmsplugin_file_gallery_downloadablefile_gallery_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cmsplugin_file_gallery_downloadablefile_gallery_id ON cmsplugin_file_gallery_downloadablefile USING btree (gallery_id);


--
-- Name: cmsplugin_filerfile_file_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cmsplugin_filerfile_file_id ON cmsplugin_filerfile USING btree (file_id);


--
-- Name: cmsplugin_filerfolder_folder_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cmsplugin_filerfolder_folder_id ON cmsplugin_filerfolder USING btree (folder_id);


--
-- Name: cmsplugin_filerimage_file_link_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cmsplugin_filerimage_file_link_id ON cmsplugin_filerimage USING btree (file_link_id);


--
-- Name: cmsplugin_filerimage_image_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cmsplugin_filerimage_image_id ON cmsplugin_filerimage USING btree (image_id);


--
-- Name: cmsplugin_filerimage_page_link_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cmsplugin_filerimage_page_link_id ON cmsplugin_filerimage USING btree (page_link_id);


--
-- Name: cmsplugin_filerimage_thumbnail_option_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cmsplugin_filerimage_thumbnail_option_id ON cmsplugin_filerimage USING btree (thumbnail_option_id);


--
-- Name: cmsplugin_filerteaser_image_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cmsplugin_filerteaser_image_id ON cmsplugin_filerteaser USING btree (image_id);


--
-- Name: cmsplugin_filerteaser_page_link_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cmsplugin_filerteaser_page_link_id ON cmsplugin_filerteaser USING btree (page_link_id);


--
-- Name: cmsplugin_filervideo_image_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cmsplugin_filervideo_image_id ON cmsplugin_filervideo USING btree (image_id);


--
-- Name: cmsplugin_filervideo_movie_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cmsplugin_filervideo_movie_id ON cmsplugin_filervideo USING btree (movie_id);


--
-- Name: cmsplugin_gallery_image_gallery_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cmsplugin_gallery_image_gallery_id ON cmsplugin_gallery_image USING btree (gallery_id);


--
-- Name: cmsplugin_link_page_link_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cmsplugin_link_page_link_id ON cmsplugin_link USING btree (page_link_id);


--
-- Name: cmsplugin_video_gallery_video_gallery_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX cmsplugin_video_gallery_video_gallery_id ON cmsplugin_video_gallery_video USING btree (gallery_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_name; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_name ON easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_name_like; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_name_like ON easy_thumbnails_source USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_storage_hash; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_storage_hash ON easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_source_storage_hash_like; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_storage_hash_like ON easy_thumbnails_source USING btree (storage_hash varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_name; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_name ON easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_name_like; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_name_like ON easy_thumbnails_thumbnail USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_source_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_source_id ON easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash ON easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_like; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_like ON easy_thumbnails_thumbnail USING btree (storage_hash varchar_pattern_ops);


--
-- Name: filer_clipboard_user_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX filer_clipboard_user_id ON filer_clipboard USING btree (user_id);


--
-- Name: filer_clipboarditem_clipboard_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX filer_clipboarditem_clipboard_id ON filer_clipboarditem USING btree (clipboard_id);


--
-- Name: filer_clipboarditem_file_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX filer_clipboarditem_file_id ON filer_clipboarditem USING btree (file_id);


--
-- Name: filer_file_folder_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX filer_file_folder_id ON filer_file USING btree (folder_id);


--
-- Name: filer_file_owner_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX filer_file_owner_id ON filer_file USING btree (owner_id);


--
-- Name: filer_file_polymorphic_ctype_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX filer_file_polymorphic_ctype_id ON filer_file USING btree (polymorphic_ctype_id);


--
-- Name: filer_folder_level; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX filer_folder_level ON filer_folder USING btree (level);


--
-- Name: filer_folder_lft; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX filer_folder_lft ON filer_folder USING btree (lft);


--
-- Name: filer_folder_owner_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX filer_folder_owner_id ON filer_folder USING btree (owner_id);


--
-- Name: filer_folder_parent_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX filer_folder_parent_id ON filer_folder USING btree (parent_id);


--
-- Name: filer_folder_rght; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX filer_folder_rght ON filer_folder USING btree (rght);


--
-- Name: filer_folder_tree_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX filer_folder_tree_id ON filer_folder USING btree (tree_id);


--
-- Name: filer_folderpermission_folder_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX filer_folderpermission_folder_id ON filer_folderpermission USING btree (folder_id);


--
-- Name: filer_folderpermission_group_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX filer_folderpermission_group_id ON filer_folderpermission USING btree (group_id);


--
-- Name: filer_folderpermission_user_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX filer_folderpermission_user_id ON filer_folderpermission USING btree (user_id);


--
-- Name: reversion_revision_manager_slug; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX reversion_revision_manager_slug ON reversion_revision USING btree (manager_slug);


--
-- Name: reversion_revision_manager_slug_like; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX reversion_revision_manager_slug_like ON reversion_revision USING btree (manager_slug varchar_pattern_ops);


--
-- Name: reversion_revision_user_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX reversion_revision_user_id ON reversion_revision USING btree (user_id);


--
-- Name: reversion_version_content_type_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX reversion_version_content_type_id ON reversion_version USING btree (content_type_id);


--
-- Name: reversion_version_object_id_int; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX reversion_version_object_id_int ON reversion_version USING btree (object_id_int);


--
-- Name: reversion_version_revision_id; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX reversion_version_revision_id ON reversion_version USING btree (revision_id);


--
-- Name: reversion_version_type; Type: INDEX; Schema: public; Owner: mlorenz; Tablespace: 
--

CREATE INDEX reversion_version_type ON reversion_version USING btree (type);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_cmsplugin_placeholder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT cms_cmsplugin_placeholder_id_fkey FOREIGN KEY (placeholder_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_globalpagepermission_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermission_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_globalpagepermission_sites_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermission_sites_site_id_fkey FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_globalpagepermission_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermission_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_page_placeholders_placeholder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_placeholder_id_fkey FOREIGN KEY (placeholder_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_page_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_site_id_fkey FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagemoderatorstate_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_pagemoderatorstate
    ADD CONSTRAINT cms_pagemoderatorstate_page_id_fkey FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagemoderatorstate_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_pagemoderatorstate
    ADD CONSTRAINT cms_pagemoderatorstate_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagepermission_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagepermission_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_page_id_fkey FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagepermission_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageuser_created_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT cms_pageuser_created_by_id_fkey FOREIGN KEY (created_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageuser_user_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT cms_pageuser_user_ptr_id_fkey FOREIGN KEY (user_ptr_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageusergroup_created_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_created_by_id_fkey FOREIGN KEY (created_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageusergroup_group_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_group_ptr_id_fkey FOREIGN KEY (group_ptr_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_title_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_page_id_fkey FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_file_gallery_downloadablefile_gallery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_file_gallery_downloadablefile
    ADD CONSTRAINT cmsplugin_file_gallery_downloadablefile_gallery_id_fkey FOREIGN KEY (gallery_id) REFERENCES cmsplugin_filegalleryplugin(cmsplugin_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_filegalleryplugin_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_filegalleryplugin
    ADD CONSTRAINT cmsplugin_filegalleryplugin_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_filerfile_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_filerfile
    ADD CONSTRAINT cmsplugin_filerfile_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_filerfile_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_filerfile
    ADD CONSTRAINT cmsplugin_filerfile_file_id_fkey FOREIGN KEY (file_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_filerfolder_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_filerfolder
    ADD CONSTRAINT cmsplugin_filerfolder_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_filerfolder_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_filerfolder
    ADD CONSTRAINT cmsplugin_filerfolder_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_filerimage_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_filerimage
    ADD CONSTRAINT cmsplugin_filerimage_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_filerimage_file_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_filerimage
    ADD CONSTRAINT cmsplugin_filerimage_file_link_id_fkey FOREIGN KEY (file_link_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_filerimage_image_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_filerimage
    ADD CONSTRAINT cmsplugin_filerimage_image_id_fkey FOREIGN KEY (image_id) REFERENCES filer_image(file_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_filerimage_page_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_filerimage
    ADD CONSTRAINT cmsplugin_filerimage_page_link_id_fkey FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_filerteaser_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_filerteaser
    ADD CONSTRAINT cmsplugin_filerteaser_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_filerteaser_image_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_filerteaser
    ADD CONSTRAINT cmsplugin_filerteaser_image_id_fkey FOREIGN KEY (image_id) REFERENCES filer_image(file_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_filerteaser_page_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_filerteaser
    ADD CONSTRAINT cmsplugin_filerteaser_page_link_id_fkey FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_filervideo_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_filervideo
    ADD CONSTRAINT cmsplugin_filervideo_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_filervideo_image_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_filervideo
    ADD CONSTRAINT cmsplugin_filervideo_image_id_fkey FOREIGN KEY (image_id) REFERENCES filer_image(file_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_filervideo_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_filervideo
    ADD CONSTRAINT cmsplugin_filervideo_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_gallery_image_gallery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_gallery_image
    ADD CONSTRAINT cmsplugin_gallery_image_gallery_id_fkey FOREIGN KEY (gallery_id) REFERENCES cmsplugin_galleryplugin(cmsplugin_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_galleryplugin_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_galleryplugin
    ADD CONSTRAINT cmsplugin_galleryplugin_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_link_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_link
    ADD CONSTRAINT cmsplugin_link_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_link_page_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_link
    ADD CONSTRAINT cmsplugin_link_page_link_id_fkey FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_text_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_text
    ADD CONSTRAINT cmsplugin_text_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_video_gallery_video_gallery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_video_gallery_video
    ADD CONSTRAINT cmsplugin_video_gallery_video_gallery_id_fkey FOREIGN KEY (gallery_id) REFERENCES cmsplugin_videogalleryplugin(cmsplugin_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_videogalleryplugin_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_videogalleryplugin
    ADD CONSTRAINT cmsplugin_videogalleryplugin_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_93d2d1f8; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT content_type_id_refs_id_93d2d1f8 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_thumbnail_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_source_id_fkey FOREIGN KEY (source_id) REFERENCES easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_clipboard_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY filer_clipboard
    ADD CONSTRAINT filer_clipboard_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_clipboarditem_clipboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY filer_clipboarditem
    ADD CONSTRAINT filer_clipboarditem_clipboard_id_fkey FOREIGN KEY (clipboard_id) REFERENCES filer_clipboard(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_clipboarditem_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY filer_clipboarditem
    ADD CONSTRAINT filer_clipboarditem_file_id_fkey FOREIGN KEY (file_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_file_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT filer_file_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_file_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT filer_file_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_file_polymorphic_ctype_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT filer_file_polymorphic_ctype_id_fkey FOREIGN KEY (polymorphic_ctype_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folder_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT filer_folder_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folderpermission_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folderpermission_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folderpermission_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_image_file_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY filer_image
    ADD CONSTRAINT filer_image_file_ptr_id_fkey FOREIGN KEY (file_ptr_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globalpagepermission_id_refs_id_09b826f9; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT globalpagepermission_id_refs_id_09b826f9 FOREIGN KEY (globalpagepermission_id) REFERENCES cms_globalpagepermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_id_refs_id_88abf373; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT page_id_refs_id_88abf373 FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_42b2c54f; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT parent_id_refs_id_42b2c54f FOREIGN KEY (parent_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_8d462df0; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT parent_id_refs_id_8d462df0 FOREIGN KEY (parent_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_ca1f299f; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT parent_id_refs_id_ca1f299f FOREIGN KEY (parent_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publisher_public_id_refs_id_ca1f299f; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT publisher_public_id_refs_id_ca1f299f FOREIGN KEY (publisher_public_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_revision_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY reversion_revision
    ADD CONSTRAINT reversion_revision_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_version_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reversion_version_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_version_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reversion_version_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES reversion_revision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: thumbnail_option_id_refs_id_c267cfb1; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY cmsplugin_filerimage
    ADD CONSTRAINT thumbnail_option_id_refs_id_c267cfb1 FOREIGN KEY (thumbnail_option_id) REFERENCES cmsplugin_filer_image_thumbnailoption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_c0d12874; Type: FK CONSTRAINT; Schema: public; Owner: mlorenz
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT user_id_refs_id_c0d12874 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: mlorenz
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM mlorenz;
GRANT ALL ON SCHEMA public TO mlorenz;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

