import React, { useEffect } from 'react'
import { logoutUser } from '../../reducers/authSlice';
import { useNavigate } from 'react-router-dom';
import { useDispatch } from 'react-redux';

const Logout = () => {
    const dispatch = useDispatch();
    const navigate=useNavigate();

    useEffect(() => {
        dispatch(logoutUser());
        navigate("/")
    }, [])
    // if (!isAuthenticated)
    return <></>


}

export default Logout