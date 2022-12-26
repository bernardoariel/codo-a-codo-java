<%-- 
    Document   : modificar
    Created on : 6 dic 2022, 12:55:02
    Author     : windows
--%>

<%@page import="modelo.SociosDAO"%>
<%@page import="modelo.Socios"%>
<%@page import="java.util.List"%>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
       
    
    </head>
    <body>        
        <div class="container" id="app">
            
            <div class="row" >
                <%
                    String id=request.getParameter("id");
                    int mid;
                    mid=Integer.parseInt(id);				
                    Socios resultado=null;
                    SociosDAO  socio=new SociosDAO();
                    resultado=socio.mostrarSocio(mid);				
                %>      
                
            <h1 class="text-center">{{ titulo }} {{nombre}} {{apellido}}</h1>
            <div v-if="errores.length!=0" class="alert alert-danger">
                {{mostrarErrores}}
            </div>
                <form ref="form" class="p-5" method="POST" action="SociosController?accion=actualizar" @submit.prevent="enviarForm">
                   <div class="mb-2">
                        <label for="id" class="form-label" >id</label>
                        <input type="text" class="form-control" id="id" name="id" readonly="true"  value=<%=resultado.getIdPaciente() %> >                          
                    </div> 
                    <div class="mb-2">
                        <label for="nombre" class="form-label" >Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" value=<%=resultado.getNombre() %>   >                       
                    </div> 
                    <div class="mb-2">
                        <label for="apellido" class="form-label" >Apellido</label>
                        <input type="text" class="form-control" id="apellido" name="apellido" v-model="apellido" value=<%=resultado.getApellido() %>   >                       
                    </div> 
                        <div class="mb-2">
                        <label for="direccion" class="form-label" >Direccion</label>
                        <input type="text" class="form-control" id="direccion" name="direccion" v-model="direccion" value=<%=resultado.getDireccion() %>  >                          
                    </div> 
                        <div class="mb-2">
                        <label for="foto" class="form-label" >Foto</label>
                        <input type="text" class="form-control" id="foto" name="foto" v-model="foto" value=<%=resultado.getFoto() %>   >                          
                    </div> 
                        <div class="mb-2">
                        <label for="fnac" class="form-label" >Fecha Nac</label>
                        <input type="date" class="form-control" id="fnac" name="fnac"  v-model="fechaNacimiento" value=<%=resultado.getFnac() %>  >                          
                    </div> 
                    <div class="mb-2">
                        <label for="mail" class="form-label" >E-Mail</label>
                        <input type="text" class="form-control" id="mail" name="mail" v-model="email" value=<%=resultado.getMail()%>  >                          
                    </div>  
                    <div class="mb-2">
                        <label for="telefono" class="form-label" >Telefono</label>
                        <input type="text" class="form-control" id="telefono" name="telefono" v-model="telefono" value=<%=resultado.getTelefono()%> >                          
                    </div> 
                    
                                  
                        <button type="button" class="btn btn-secondary float-start" @click="volver()">Volver </button>   
                        <button  class="btn btn-primary float-end"  type="submit" @click="enviarForm">Modificar </button>
                        
                    
                </form>                
            </div>
       </div>  
     <!-- JavaScript Bundle with Popper -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
     <script src="https://kit.fontawesome.com/2cbbc87d30.js" crossorigin="anonymous"></script>
     <script src='https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js'></script>
     <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
     
 </body>
 <script>
     var app = new Vue({
            el: '#app',
            data(){
                return{
                    titulo:'Modificando al Paciente',
                    id:"<%=resultado.getIdPaciente() %>",
                    nombre: "<%=resultado.getNombre() %> ",
                    apellido:"<%=resultado.getApellido() %>",
                    direccion:"<%=resultado.getDireccion() %>",
                    foto:"<%=resultado.getFoto() %>",
                    fechaNacimiento:"<%=resultado.getFnac() %>",
                    email:"<%=resultado.getMail()%>",
                    telefono:"<%=resultado.getTelefono()%>",
                    deshabilitado:false,
                    errores:[]
                }
                 
            },
            methods: {
                volver(){
                   
                    return history.go(-1);
                },
                enviarForm(event) {
                    console.log(event)
                    event.preventDefault()
                    this.deshabilitado = true;
                    console.log('ingresamos por aca')
                    if(this.nombre && this.apellido && this.direccion && this.foto && this.fechaNacimiento && this.email && this.telefono){
                        //alert("Campos obligatorios están ok, enviando formulario!");
                        // return true;
                        Swal.fire({
                            title: 'Felicitaciones!',
                            text: "Se ha guardado la modificacion del paciente",
                            icon: 'success',
                            confirmButtonColor: '#3085d6',
                            confirmButtonText: 'OK!'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                this.$refs.form.submit()
                            
                            }
                        })
                        
                    }
                    if(!this.nombre){
                        this.errores.push("El nombre es obligatorio. ");
                    }
                    if(!this.email){
                        this.errores.push("El email es obligatorio. ");
                    }
                    if(!this.foto){
                        this.errores.push("La Foto es obligatoria. ");
                    }
                    if(!this.fechaNacimiento){
                        this.errores.push("La Fecha de Nacimiento es obligatorio. ");
                    }
                    if(!this.telefono){
                        this.errores.push("El telefono es obligatorio. ");
                    }
                    
                    setTimeout(()=>{
                    this.errores = []
                    this.deshabilitado = false;
                    },5000)
                },
            },
            computed:{
                mostrarErrores(){
                let misErrores = this.errores.join(" ")
                return misErrores
                }
            }
            
        })
 </script>
</html>