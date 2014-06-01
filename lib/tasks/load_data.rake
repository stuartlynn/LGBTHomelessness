
task :load_data => :environment do
  Organization.delete_all
  Program.delete_all

  orgs  = IO.read("data/Organization.tsv").split("\n")[1..-1].collect{|l| l.split("\t")}
  progs = IO.read("data/Program.tsv").split("\n")[1..24].collect{|l| l.split("\t")}
  look_up = {}
  orgs.each do |org_data|
    o = Organization.create(name: org_data[1],
                        address: org_data[2],
                        address2: org_data[3],
                        city: org_data[4],
                        state: org_data[5],
                        zip: org_data[6],
                        phone_no: org_data[7],
                        website: org_data[8],
                        email: org_data[9],
                        description: "",
                        latitude: org_data[10],
                        longitude: org_data[11])
    look_up[org_data[0]] = o.id
  end

  progs.each do |prog|


    Program.create({
        name: prog[2],
        friendliness_rating: prog[3],
        min_age: prog[4],
        max_age: prog[5],
        health_status_req: prog[6],
        gender_req: prog[7],
        access_to_services: prog[8],
        description: prog[9],
        program_timing: prog[10],
        language_req: prog[11],
        program_categorization: prog[12],
        services: prog[13],
        organization_id: look_up[prog[1]]
      })


  end
end
