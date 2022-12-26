<%-- 
    Document   : nuevo
    Created on : 6 dic 2022, 12:55:20
    Author     : windows
--%>

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
            <h1 class="text-center" >Añadir Alumno</h1>
            <div v-if="errores.length!=0" class="alert alert-danger">
                {{mostrarErrores}}
            </div>
                <div class="row" >
                    <form ref="form" class="p-4" method="POST" action="SociosController?accion=insert" @submit="enviarForm">
                        <div class="mb-2">
                            <label for="nombre" class="form-label" >Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre"  v-model="nombre">  
                            {{nombre}}              
                                    
                        </div> 
                        <div class="mb-2">
                            <label for="apellido" class="form-label" >Apellido</label>
                            <input type="text" class="form-control" id="apellido" name="apellido" v-model="apellido">                          
                        </div> 
                         <div class="mb-2">
                            <label for="direccion" class="form-label" >Direccion</label>
                            <input type="text" class="form-control" id="direccion" name="direccion" v-model="direccion">                          
                        </div> 
                         <div class="mb-2">
                            <label for="localidad" class="form-label" >Localidad</label>
                            <input type="text" class="form-control" id="localidad" name="localidad" v-model="localidad" >                          
                        </div> 
                          <div class="mb-2">
                            <label for="fnac" class="form-label" >Fecha Nac</label>
                            <input type="date" class="form-control" id="fnac" name="fnac" v-model="fechaNacimiento">                          
                        </div> 
                        <div class="mb-2">
                            <label for="mail" class="form-label" >E-Mail</label>
                            <input type="text" class="form-control" id="mail" name="mail" attern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" v-model="email" required>                          
                        </div>  
                        <div class="mb-2">
                            <label for="telefono" class="form-label" >Telefono</label>
                            <input type="text" class="form-control" id="telefono" name="telefono" v-model="telefono">                          
                        </div>                
                        <button  type="button" class="btn btn-secondary float-start" @click="volver()">Volver </button>                       
                        <button :disabled="deshabilitado"  class="btn btn-primary float-end">Añadir </button>
                        
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
                    nombre: "",
                    apellido:"",
                    direccion:"",
                    localidad:"",
                    fechaNacimiento:"",
                    email:"",
                    telefono:"",
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
                    if(this.nombre && this.apellido && this.direccion && this.localidad && this.fechaNacimiento && this.email && this.telefono){
                        //alert("Campos obligatorios están ok, enviando formulario!");
                        // return true;
                        Swal.fire({
                            title: 'Felicitaciones!',
                            text: "Se ha creado un nuevo usuario",
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
                    if(!this.localidad){
                        this.errores.push("La localidad es obligatorio. ");
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
