import { environment } from '@rails/webpacker'
const webpack = requrie("webpack")

environment.plugins.append("Provide", new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js','default']
}))

export default environment
