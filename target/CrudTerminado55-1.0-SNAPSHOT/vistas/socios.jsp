<%-- 
    Document   : socios
    Created on : 6 dic 2022, 12:55:28
    Author     : windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Socios" %>
<%@page import="modelo.SociosDAO" %>
<%@page import="java.util.List"%>



<!DOCTYPE html>
<html>
    <head>
        <title>Pacientes</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    </head>
    <body>
        
        <div id="app" class="">
            
            <h1 class="text-center">{{ titulo }}</h1>
        
        
            <div class="container">

                <div class="row">   

                    <a class="btn btn-primary col-4 m-4 float-end" href="SociosController?accion=nuevo">Agregar Paciente</a>
                    
                    <table class="table table-striped table-hover">
                        
                        <thead>
                                <th>id</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Direccion</th>
                                <th>Localidad</th>
                                <th>Fecha Nac.</th>
                                <th>Telefono</th>
                                <th>mail</th>
                                <th>Acciones</th>
                              
                        </thead>
                        
                        <%
                        List<Socios> resultado=null;
                        SociosDAO s1=new SociosDAO();
                        resultado=s1.listarSocios();
                        
                                    for(int i=0;i<resultado.size();i++)
                    {
                    String ruta="SociosController?accion=modificar&id="+resultado.get(i).getIdSocio();	
                    String rutaE="SociosController?accion=eliminar&id="+resultado.get(i).getIdSocio();
                    %>                
                        
                    
                        <tr>
                            <td><%=resultado.get(i).getIdSocio()%></td>
                            <td><%=resultado.get(i).getNombre()%></td>
                            <td><%=resultado.get(i).getApellido()%></td>
                            <td><%=resultado.get(i).getDireccion()%></td>
                            <td><%=resultado.get(i).getLocalidad()%></td>
                            <td><%=resultado.get(i).getFnac()%></td>
                            <td><%=resultado.get(i).getTelefono()%></td>
                            <td><%=resultado.get(i).getMail()%></td>
                            <td class="text-center">

                                <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                    
                                    <button type="button" class="btn btn-warning"><a href=<%=ruta%> ><i class="fa fa-pencil-square-o"></i></a></button>
                                    <!-- <button type="button" class="btn btn-danger"><a href=<%=rutaE%>><i class="fa fa-trash"></i></a></button> -->
                                    <button type="button" class="btn btn-secondary"><a @click="eliminar('<%=rutaE%>')" ><i class="fa fa-trash"></i></a></button>
                                </div>
                                
                            </td>
                          
                        </tr>
                        <%
                            }
                        %>
                    
                    </table>
           
                </div>

            </div>
        </div>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/2cbbc87d30.js" crossorigin="anonymous"></script>
        <script src='https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js'></script>
    </body>
    <script>
        var app = new Vue({
            el: '#app',
            data: {
                titulo:"Listado de Pacientes"
            },
            methods: {
                eliminar(url){
                    console.log(url)
                    Swal.fire({
                        title: 'Estas seguro de eliminar a este cliente?',
                        text: "No se podrá volver para atras",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Si, porsupuesto!'
                        }).then((result) => {
                        if (result.isConfirmed) {
                            Swal.fire(
                            'Eliminado!',
                            'El paciente fue eliminado.',
                            'success'
                            )
                            setTimeout(() => {
                                
                                location.href = url;

                            }, 3000);
                        }
                    })
                    
                }
            },
        })
    </script>
</html>
