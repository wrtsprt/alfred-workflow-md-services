query = ARGV[0]
the_input = ENV['the_input']

result = ''

if query == 'test'
    result = `/usr/bin/automator -i - "/Users/rap/Library/Services/direct-output-of-input.workflow" <<EOF
#{the_input}
EOF`

elsif query == 'new_link'
    result = `/usr/bin/automator "/Users/rap/Library/Services/md - Links - New Link.workflow"`
elsif query == 'table_from_csv'
    result = `/usr/bin/automator -i - "/Users/rap/Library/Services/md\ -\ Tables\ -\ Create\ from\ CSV.workflow" <<EOF
#{the_input}
EOF`
else
       puts 'else'
end

lines = result.split("\n")
result_lines = lines.map do |elem|
    if elem == '(' || elem == ')'
        nil
    else
        elem.match(/\"([^"]*)\"/)[1]
     end
end

puts result_lines.compact
