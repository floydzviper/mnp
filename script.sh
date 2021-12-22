pipeline () {
	agent any
	stages {
	    stage ('building image') {
	       steps {
                 sh 'docker build -t i7 /home/image'
               }
             }
             
              stage ('tagging image') {
	        steps {
	           sh 'docker tag i7:latest floydz/banglore:latest'
	         }
               }
            
               stage ('creating volume') {
	          steps {
	            sh 'docker volume create vol8'
	           }	
               }
               stage ('create vol container') {
	          steps {
		     sh ,docker run -d --name c6 -p 8012:80 -v vol8:/var/www/html i6 /bin/bash
	          }
	       }  
	       stage ('verifying container') {
	          steps {
		     sh 'docker container ls -a | grep c6'
		  }
	       }
               stage ('pushing image') {
	          
	       environment {
	                    registry = "floydz/hari"
			    registrycredential = 'abhigaduking3978@
	       
	       }
	             steps {
		         sh 'docker push floydz/banglore:latest'
	             }
               }
               stage ('creating container') {
	             steps {
	                 sh 'docker run -d --name c14 -p 8015:80 i6 /bin/bash
	    	     }
               }	
         }
} 
