import streamlit as st
from config.conexion import obtener_conexion

def mostrar_proveedores():
    st.header("Gestión de Proveedores")
    
    with st.form("form_proveedor"):
        nombre = st.text_input("Nombre del proveedor")
        dui_nit = st.text_input("DUI / NIT")
        telefono = st.text_input("Teléfono")
        direccion = st.text_input("Dirección")
        correo = st.text_input("Correo electrónico")
        
        guardar = st.form_submit_button("Guardar proveedor")
        
        if guardar:
            if nombre.strip() == "" or dui_nit.strip() == "":
                st.warning("El nombre y el DUI/NIT son obligatorios.")
            else:
                conexion = None
                cursor = None
                try:
                    conexion = obtener_conexion()
                    if conexion is None:
                        return
                    cursor = conexion.cursor()
                    consulta = """
                        INSERT INTO PROVEEDOR (Nombre, DUI_NIT, Telefono, Direccion, Correo)
                        VALUES (%s, %s, %s, %s, %s)
                    """
                    cursor.execute(consulta, (nombre, dui_nit, telefono, direccion, correo))
                    conexion.commit()
                    st.success("Proveedor registrado correctamente.")
                except Exception as error:
                    if conexion is not None:
                        conexion.rollback()
                    st.error(f"Error al registrar el proveedor: {error}")
                finally:
                    if cursor is not None:
                        cursor.close()
                    if conexion is not None and conexion.is_connected():
                        conexion.close()
