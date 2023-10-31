function img_recon = filtered_bp(img,angles)
    img = padding(img);
    R_img = radon(img, angles);
    img_recon = iradon(R_img, angles,'linear','Ram-Lak',1,255);
end