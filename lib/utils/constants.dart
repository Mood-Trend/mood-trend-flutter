const flavor = String.fromEnvironment('FLAVOR');
const isProd = flavor == 'prod';
const isDev = flavor == 'dev';
const hostingUrlforProd = 'https://mood-trend-prod.web.app';
const hostingUrlforDev = 'https://mood-trend-dev.web.app';

const defaultMaxPlannedVolume = 10;
