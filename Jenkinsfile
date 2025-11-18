@Library('Shared')_
pipeline{
    agent { label 'sagar'}
    
    stages{
        stage("Code clone"){
            steps{
                sh "whoami"
            clone("https://github.com/cs7165/django-notes-apk.git","main")
            }
        }
        stage("Code Build"){
            steps{
           
            }
        }
        stage("Push to DockerHub"){
            steps{
                
            }
        }
        stage("Deploy"){
            steps{
                deploy()
            }
        }
        
    }
}
