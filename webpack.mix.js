require('dotenv').config();
const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin;
const VuetifyLoaderPlugin = require('vuetify-loader/lib/plugin');
const Dotenv = require('dotenv-webpack');

let mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix
  .js(
    'resources/assets/js/app.js',
    'public/js'
  )

  /**
  .sass(
    'resources/assets/css/sass/app.scss',
    'public/css/bootstraped.css'
  )
  */
  .styles(
    [
      'node_modules/open-sans-all/css/open-sans.css',
      'node_modules/font-awesome/css/font-awesome.css',
      'resources/assets/css/style.css',
    ],
    'public/css/style.css'
  )

  .copy('node_modules/open-sans-all/fonts', 'public/fonts')
  .copy('node_modules/font-awesome/fonts', 'public/fonts')
  .copy('resources/assets/images', 'public/images')
  .browserSync({
    proxy: process.env.APP_URL
  });

mix.options({
  extractVueStyles: 'public/css/vue-style.css'
});

mix.webpackConfig({
  module: {
    rules: [
      {
        test: /\.s(c|a)ss$/,
        use: [
          'vue-style-loader',
          'css-loader',
          {
            loader: 'sass-loader',
            options: {
              implementation: require('sass'),
              fiber: require('fibers')
            }
          }
        ]
      }
    ]
  },
  plugins: [
    new BundleAnalyzerPlugin(),
    new VuetifyLoaderPlugin(),
    new Dotenv()
  ],
  resolve: {
    alias: {
      'vue$': 'vue/dist/vue.runtime.esm.js'
    }
  }
});

Mix.listen('configReady', webpackConfig => {
  // Exclude vuetify folder from default sass/scss rules
  const sassConfig = webpackConfig.module.rules.find(
    rule =>
      String(rule.test) ===
      String(/\.sass$/)
  );
  const scssConfig = webpackConfig.module.rules.find(
    rule =>
      String(rule.test) ===
      String(/\.scss$/)
  );
  sassConfig.exclude.push(path.resolve(__dirname, 'node_modules/vuetify'))
  scssConfig.exclude.push(path.resolve(__dirname, 'node_modules/vuetify'))
});
