# CountrySelect
module ActionView
  module Helpers
    module FormOptionsHelper
      # Return select and option tags for the given object and method, using country_options_for_select to generate the list of option tags.
      def country_select(object, method, priority_countries = nil, options = {}, html_options = {})
        InstanceTag.new(object, method, self, options.delete(:object)).to_country_select_tag(priority_countries, options, html_options)
      end
      # Returns a string of option tags for pretty much any country in the world. Supply a country name as +selected+ to
      # have it marked as the selected option tag. You can also supply an array of countries as +priority_countries+, so
      # that they will be listed above the rest of the (long) list.
      #
      # NOTE: Only the option tags are returned, you have to wrap this call in a regular HTML select tag.
      def country_options_for_select(selected = nil, priority_countries = nil)
        country_options = ""

        unless priority_countries
          priority_countries = [
            ['Portugal','pt'],
            ['United Kingdom', 'gb']
          ]
        end

        country_options += options_for_select(priority_countries, selected)
        country_options += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"

        return country_options + options_for_select(COUNTRIES, selected)
      end
      # All the countries included in the country_options output.
      COUNTRIES = [
              ['Afghanistan', 'af'],
              ['Albania','al'],
              ['Algeria','dz'],
              ['Andorra','ad'],
              ['Anguilla','ai'],
              ['Antigua - Barbuda','ag'],
              ['Argentina','ar'],
              ['Armenia','am'],
              ['Aruba','aw'],
              ['Australia','au'],
              ['Azerbaijan','az'],
              ['Bahamas','bs'],
              ['Bahrain','bh'],
              ['Bangladesh','bd'],
              ['Barbados','bb'],
              ['Belarus','by'],
              ['Belgium','be'],
              ['Belize','bz'],
              ['Benin','bj'],
              ['Bermuda','bm'],
              ['Bhutan','bt'],
              ['Bolivia','bo'],
              ['Bosnia','ba'],
              ['Botswana','bw'],
              ['Brazil','br'],
              ['Brunei','bn'],
              ['Bulgaria','bg'],
              ['Burkina Faso','bf'],
              ['Burundi','bi'],
              ['Cambodia','kh'],
              ['Cameroon','cm'],
              ['Canada','ca'],
              ['Cape Verde','cv'],
              ['Central Africa Republic','cf'],
              ['Chad','td'],
              ['Chile','cl'],
              ['Christmas Island','ci'],
              ['China','cn'],
              ['Colombia','co'],
              ['Congo','cg'],
              ['Cook Islands','ck'],
              ['Costa Rica','cr'],
              ['Cote D\'Ivoire','ct'],
              ['Croatia','hr'],
              ['Cuba','cu'],
              ['Curacao','cb'],
              ['Cyprus','cy'],
              ['Czech Republic','cz'],
              ['Denmark','dk'],
              ['Djibouti','dj'],
              ['Dominica','dm'],
              ['Dominican Republic','do'],
              ['Ecuador','ec'],
              ['Egypt','eg'],
              ['El Salvador','sv'],
              ['Equatorial Guinea','gq'],
              ['Eritrea','er'],
              ['Estonia','ee'],
              ['Ethiopia','et'],
              ['Europe', 'europeanunion'],
              ['Faroe Islands','fo'],
              ['Fiji','fj'],
              ['Finland','fi'],
              ['France','fr'],
              ['Georgia','ge'],
              ['Germany','de'],
              ['Ghana','gh'],
              #['Great Britain','gb'],
              ['Greece','gr'],
              ['Greenland','gl'],
              ['Grenada','gd'],
              ['Guadaloupe','gp'],
              ['Guam','gu'],
              ['Guatemala','gt'],
              ['Guinea','gn'],
              ['Guyana','gy'],
              ['Haiti','ht'],
              ['Honduras','hn'],
              ['Hong Kong','hk'],
              ['Hungary','hu'],
              ['Iceland','is'],
              ['India','in'],
              ['Indonesia','id'],
              ['Iran','ia'],
              ['Iraq','iq'],
              ['Ireland','ir'],
              ['Israel','il'],
              ['Italy','it'],
              ['Jamaica','jm'],
              ['Japan','jp'],
              ['Jordan','jo'],
              ['Kazakhstan','kz'],
              ['Kenya','ke'],
              ['Kiribati','ki'],
              ['Korea','kr'],
              ['Kuwait','kw'],
              ['Kyrgyzstan','kg'],
              ['Laos','la'],
              ['Latvia','lv'],
              ['Lebanon','lb'],
              ['Liberia','lr'],
              ['Liechtenstein','li'],
              ['Lithuania', 'lt'],
              ['Luxembourg','lu'],
              ['Lybia','ly'],
              ['Macedonia','mk'],
              ['Malaysia','my'],
              ['Mali','ml'],
              ['Malta','mt'],
              ['Mexico','mx'],
              ['Moldova','md'],
              ['Mongolia','mn'],
              ['Morocco','ma'],
              ['Mozambique','mz'],
              ['Myanmar','mn'],
              ['Namibia','na'],
              ['Nauru','nu'],
              ['Nepal','np'],
              ['Netherlands','nl'],
              ['New Zealand','nz'],
              ['Nicaragua','ni'],
              ['Niger','ne'],
              ['Nigeria','ng'],
              ['Norway','no'],
              ['Oman','om'],
              ['Pakistan','pk'],
              ['Panama','pa'],
              ['Paraguay','py'],
              ['Peru','pe'],
              ['Philippines','ph'],
              ['Poland','pl'],
              ['Portugal','pt'],
              ['Puerto Rico','pr'],
              ['Qatar','qa'],
              ['Romania','ro'],
              ['Russia','ru'],
              ['Rwanda','rw'],
              ['St Lucia','lc'],
              ['San Marino','sm'],
              ['Saudi Arabia','sa'],
              ['Senegal','sn'],
              ['Serbia - Montenegro','ss'],
              ['Singapore','sg'],
              ['Slovakia','sk'],
              ['Slovenia','si'],
              ['Somalia','so'],
              ['South Africa','za'],
              ['Spain','es'],
              ['Sudan','sd'],
              ['Suriname','sr'],
              ['Sweden','se'],
              ['Switzerland','ch'],
              ['Syria','sy'],
              ['Taiwan','tw'],
              ['Thailand','th'],
              ['Togo','tg'],
              ['Tokelau','tk'],
              ['Tonga','to'],
              ['Tridinidad Tobago','tt'],
              ['Tunisia','tn'],
              ['Turkey','tr'],
              ['Ukraine','ua'],
              ['United Arab Emirate','ae'],
              ['United Kingdom','gb'],
              ['United States','us'],
              ['Poland','pl'],
              ['Portugal','pt'],
              ['Puerto Rico','pr'],
              ['Qatar','qa'],
              ['Romania','ro'],
              ['Russia','ru'],
              ['Rwanda','rw'],
              ['St Lucia','lc'],
              ['San Marino','sm'],
              ['Saudi Arabia','sa'],
              ['Senegal','sn'],
              ['Serbia - Montenegro','ss'],
              ['Singapore','sg'],
              ['Slovakia','sk'],
              ['Slovenia','si'],
              ['Somalia','so'],
              ['South Africa','za'],
              ['Spain','es'],
              ['Sudan','sd'],
              ['Suriname','sr'],
              ['Sweden','se'],
              ['Switzerland','ch'],
              ['Syria','sy'],
              ['Taiwan','tw'],
              ['Thailand','th'],
              ['Togo','tg'],
              ['Tokelau','tk'],
              ['Tonga','to'],
              ['Tridinidad Tobago','tt'],
              ['Tunisia','tn'],
              ['Turkey','tr'],
              ['Ukraine','ua'],
              ['United Arab Emirate','ae'],
              ['United Kingdom','gb'],
              ['United States','us'],
              ['Uruguay','uy'],
              ['Vatican','va'],
              ['Venezuela','ve'],
              ['Vietnam','vn'],
              ['Zimbawe''za']
      ] unless const_defined?("COUNTRIES")
    end
    
    class InstanceTag
      def to_country_select_tag(priority_countries, options, html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        value = value(object)
        content_tag("select",
          add_options(
            country_options_for_select(value, priority_countries),
            options, value
          ), html_options
        )
      end
    end
    
    class FormBuilder
      def country_select(method, priority_countries = nil, options = {}, html_options = {})
        @template.country_select(@object_name, method, priority_countries, options.merge(:object => @object), html_options)
      end
    end
  end
end
