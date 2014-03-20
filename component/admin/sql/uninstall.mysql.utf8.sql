
DROP TABLE IF EXISTS `#__wsmusic_track` ;
DROP TABLE IF EXISTS `#__wsmusic_artist` ;
DROP TABLE IF EXISTS `#__wsmusic_playlist` ;

DELETE gr FROM `never_user_usergroup_map` gr
JOIN `never_users` u ON u.id=gr.user_id
WHERE u.username = 'mabama' OR u.username = 'gayman' OR u.username = 'lamchidoan';

DELETE FROM `never_users`
WHERE username = 'mabama' OR username = 'gayman' OR username = 'lamchidoan';
