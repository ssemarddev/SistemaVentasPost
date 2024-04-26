
export const registerNewSale = async (url,form,token) => {
    try {
        const dataform = new FormData(form);
        let response = await fetch(url, {
        headers: {
            'X-CSRF-TOKEN': token
        },
        method: 'POST',
        body: dataform
        });
        let data = await response.json();
        return data;
    } catch (error) {
        console.log(error);
    }
        
}

export const getdata = async (ruta,id) => {
    try {
        let response = await fetch(ruta+id); 
        let data = await response.json();
        return data;
    } catch (error) {
        console.log(error)    
    }
}