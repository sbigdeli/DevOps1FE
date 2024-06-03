import { Route, Navigate, Outlet } from 'react-router-dom';
import { useAuthentication } from '../hooks/useAuthentication';
import React from 'react';
const PrivateRoute: React.FC = () => {
    const isAuthenticated = useAuthentication();

    console.log(isAuthenticated)

    return isAuthenticated ? <Outlet /> : <Navigate to="/auth" />;

};

export default PrivateRoute