import { withPluginApi } from "discourse/lib/plugin-api";
import { hbs } from "ember-cli-htmlbars";

export default {
  name: "add-sidebar-search",
  initialize() {
    withPluginApi("1.8.0", (api) => {
      api.renderInOutlet("sidebar-before-sections", hbs`
        <div class="sidebar-search-wrapper">
          <form action="/search" method="get">
            <input 
              type="text" 
              name="q"
              placeholder="Search..." 
              class="sidebar-search-input"
            />
          </form>
        </div>
      `);
    });
  },
};
