export const fetchSips = () => {
  return $.ajax({
    method: "GET",
    url: "/api/sips", //check rails routes
  });
};

export const fetchUserSips = (id) => {
  
  return $.ajax({
    method: "GET",
    url: `/api/users/${id}`, //check rails routes
  });
};

export const createSip = (sip) => {
  return $.ajax({
    method: "POST",
    url: "/api/sips",
    data: { sip },
  });
};
