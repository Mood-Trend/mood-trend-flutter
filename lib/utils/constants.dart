const flavor = String.fromEnvironment('FLAVOR');
const isProd = flavor == 'prod';
const isDev = flavor == 'dev';
