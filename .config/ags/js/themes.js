import { Utils } from './imports.js';
const WP = `/home/${Utils.USER}/.config/wallpapers/`;

const editScheme = (scheme, edit) => {
    const obj = {};
    Object.keys(scheme).forEach(color => obj[color] = edit(scheme[color]));
    return obj;
};

const gnome = {
    red: '#F38BA8',
    green: '#A6E3A1',
    yellow: '#F9E2AF',
    blue: '#B4BEFE',
    magenta: '#CBA6F7',
    teal: '#94E2D5',
    orange: '#FAB387',
};

const charm = {
    red: '#e55f86',
    green: '#00D787',
    yellow: '#EBFF71',
    blue: '#51a4e7',
    magenta: '#9077e7',
    teal: '#51e6e6',
    orange: '#E79E64',
};

const dark = {
    color_scheme: 'dark',
    bg_color: '#1E1E2E',
    fg_color: '#CDD6F4',
    hover_fg: '#7F849C',
    ...gnome,
};

const light = {
    color_scheme: 'light',
    bg_color: '#fffffa',
    fg_color: '#141414',
    hover_fg: '#0a0a0a',
    ...editScheme(gnome, c => `darken(${c}, 8%)`),
};

const misc = {
    wm_gaps: 14,
    radii: 10,
    spacing: 9,
    shadow: 'rgba(0, 0, 0, .0)',
    drop_shadow: true,
    transition: 200,
    screen_corners: true,
    bar_style: 'floating',
    layout: 'topbar',
    desktop_clock: 'center center',
    font: 'JetBrainsMono Nerd Font',
    mono_font: 'JetBrainsMono Nerd Font',
    font_size: 19,
};

const colors = {
    wallpaper_fg: 'white',
    hypr_active_border: 'rgba(B4BEFEDD)',
    hypr_inactive_border: 'rgba(3f3f3fDD)',
    accent: '$blue',
    accent_fg: '#141414',
    widget_bg: '$fg_color',
    widget_opacity: 90,
    active_gradient: 'to right, $accent, lighten($accent, 6%)',
    border_color: '$fg_color',
    border_opacity: 100,
    border_width: 3,
};

// themes
const kitty_dark = {
    wallpaper: WP + 'kitty.jpeg',
    name: 'kitty_dark',
    icon: '󰄛',
    ...dark,
    ...misc,
    ...colors,
};

const kitty_light = {
    wallpaper: WP + 'kitty.jpeg',
    name: 'kitty_light',
    icon: '󰄛',
    ...light,
    ...misc,
    ...colors,
    widget_bg: '$accent',
    widget_opacity: 84,
};

const leaves_dark = {
    ...kitty_dark,
    wallpaper: WP + 'leaves.jpg',
    name: 'leaves_dark',
    icon: '󰌪',
    accent: '$green',
    widget_opacity: 92,
    active_gradient: 'to right, $accent, darken($accent, 14%)',
    border_opacity: 86,
    bg_color: 'transparentize(#171717, 0.3)',
    hypr_active_border: 'rgba(57e389FF)',
    bar_style: 'floating',
    radii: 0,
    wallpaper_fg: 'white',
    additional_scss: `
        window#quicksettings .quicksettings {
            margin-right: $wm_gaps;
        }
    `,
};

const leaves_light = {
    ...leaves_dark,
    ...light,
    name: 'leaves_light',
    accent: 'darken($green, 10%)',
    bg_color: 'transparentize(#fff, 0.1)',
    active_gradient: 'to right, $accent, darken($accent, 6%)',
};

const ivory = {
    wallpaper: WP + 'ivory.png',
    name: 'ivory',
    icon: '󰟆',
    ...light,
    ...misc,
    ...colors,
    bg_color: '#fffff0',
    bar_style: 'separated',
    widget_bg: '$accent',
    widget_opacity: 64,
    drop_shadow: false,
    border_width: 2,
    border_opacity: 0,
    active_gradient: 'to right, $accent, darken($accent, 6%)',
    wallpaper_fg: '$bg_color',
    hypr_active_border: 'rgba(111111FF)',
    additional_scss: `
        window#quicksettings .quicksettings,
        window#dashboard .dashboard {
            margin-top: 0;
        }
    `,
};

const cutefish = {
    ...kitty_dark,
    wallpaper: WP + 'cutefish.jpeg',
    name: 'cutefish',
    icon: '󰈺',
    accent: 'lighten($blue, 20%)',
    active_gradient: 'to right, $accent, lighten(mix($orange, $blue, 70%), 20%)',
    border_opacity: 100,
    brorder_width: 4,
    radii: 9,
    desktop_clock: 'end end',
    hypr_active_border: 'rgba(3f3f3fFF)',
    bg_color: 'transparentize(#171717, 0.3)',
};

const cherry = {
    ...kitty_dark,
    wallpaper: WP + 'cherry.png',
    name: 'cherry',
    icon: '',
    accent: '$blue',
    active_gradient: 'to right, $accent, lighten(mix($magenta, $blue, 70%), 18%)',
    brorder_width: 2,
    radii: 13,
    bg_color: 'transparentize(#171717, 0.3)',
};

export default [
    kitty_dark,
    kitty_light,
    leaves_dark,
    leaves_light,
    ivory,
    cutefish,
    cherry,
];
