#!/bin/bash

mkdir_(){
    echo "Create directory: $1"
    mkdir $1
    chmod 770 $1
    echo "Successfully created directory $1"
    echo
}

groupadd_(){
    echo "Create group: $1"
    groupadd $1
    echo "Successfully created group $1"    
    groupWithDirectory $1 $2
}

groupWithDirectory(){
    echo "Associate group with directory: $1 and $2"
    chown root:$1 $2
    echo "Successfully associated"
    echo
}

useradd_(){
    echo "Create user: $1 and set group's $2"
    useradd $1 -m -c "Usuário $1" -s /bin/bash -p $(openssl passwd -crypt 123) -G $2
    passwd $1 -e
    echo "Default password: 123"
    echo "Successfully created: User "
    echo
}

deleteall(){
   echo 
   echo ":: Delete struct directories, users and group ::"
   echo
   echo "Delete directories: /publio, /adm, /ven and /sec "
   rm -rf /publico /adm /ven /sec
   echo "Sucessfully deleted directories"
   separator
   echo "Delete users: carlos, maria, joao, debora, sebastiana, roberto, josefina, amanda and rogerio"
   userdel_ carlos
   userdel_ maria
   userdel_ joao
   userdel_ debora
   userdel_ sebastiana
   userdel_ roberto
   userdel_ josefina
   userdel_ amanda
   userdel_ rogerio
   echo "Successfully deleted users"
   separator
   echo "Delete groups: GRP_ADM, GRP_VEN and GRP_SEC" 
   groupdel GRP_ADM
   groupdel GRP_VEN
   groupdel GRP_SEC
   echo "Successfully deleted groups"
}

userdel_(){
    userdel -r -f $1
}

separator(){
echo 
echo ":: ==================== ::"
echo 
}

createall(){
    echo
    echo ":: Created structed: directories, users and groups ::"
    echo
    
    mkdir_ /publico
    chmod 777 /publico
    mkdir_ /adm
    mkdir_ /ven
    mkdir_ /sec
    separator

    groupadd_ GRP_ADM /adm
    groupadd_ GRP_VEN /ven
    groupadd_ GRP_SEC /sec
    separator

    useradd_ carlos GRP_ADM
    useradd_ maria GRP_ADM
    useradd_ joao GRP_ADM
    separator

    useradd_ debora GRP_VEN
    useradd_ sebastiana GRP_VEN
    useradd_ roberto GRP_VEN
    separator

    useradd_ josefina GRP_SEC
    useradd_ amanda GRP_SEC
    useradd_ rogerio GRP_SEC
    echo
    echo ":: Finish created"
}


echo 
echo ":: Create or delete struct: directories, users and groups ::"
echo
PS3="Inform an option: "
select option in create delete
do
    case $option in
    create) createall;;
    delete) deleteall;;
    *) echo "Invalid option";;
    esac
    break;
done

