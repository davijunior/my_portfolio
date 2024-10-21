export const isAuthenticated = () => {
    return !!localStorage.getItem('session_token');
};
  