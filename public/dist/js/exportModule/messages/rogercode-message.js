export const errorMessage = (message) => {
    Swal.fire(
        'Error!',
        message,
        'error'
    )
};

export const successMessage = (message) => {
    Swal.fire(
        'Exito!',
        message,
        'success'
    )
}

export const toastSuccessMessage = (message) => {
    const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
    })

    Toast.fire({
    icon: 'success',
    title: message
    })
}