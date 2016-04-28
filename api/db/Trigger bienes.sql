
--
-- Name: auditoriabienesgeneral(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION auditoriabienesgeneral() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

    BEGIN

        INSERT INTO auditoria_bienesgeneral VALUES (old.item, old.cod_general, old.cod_subcat, old.cod_catespf, old.descripcion, old.estatus_uso_bien, old.marca, old.modelo, old.serial, old.tipo_comp, old.colores, old.num_bien, old.estado_bien, old.status);

        RETURN NULL;

    END;

$$;


ALTER FUNCTION public.auditoriabienesgeneral() OWNER TO postgres;


CREATE TRIGGER actualizarbienesgeneral AFTER UPDATE ON bienesgeneral FOR EACH ROW EXECUTE PROCEDURE auditoriabienesgeneral();
CREATE TRIGGER auditoriabienesgeneral AFTER DELETE ON bienesgeneral FOR EACH ROW EXECUTE PROCEDURE auditoriabienesgeneral();

