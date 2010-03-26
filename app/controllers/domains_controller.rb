class DomainsController < ApplicationController
  # GET /domains
  # GET /domains.xml
  def wellcome
  end

  def index
    @domain=Domain.search(params[:search], params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @domain }
    end
  end

  # GET /domains/1
  # GET /domains/1.xml
  def show
    @domain = Domain.find(params[:id])
   # @domain = Domain.search(params[:search])

    respond_to do |format|

      format.html # show.html.erb
      format.xml  { render :xml => @domain }
    end
  end

  # GET /domains/new
  # GET /domains/new.xml
  def new
    @domain = Domain.new
    @domain.records.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @domain }
    end
  end

  # GET /domains/1/edit
  def edit
    @domain = Domain.find(params[:id])
  end

  # POST /domains
  # POST /domains.xml
  def create
    @domain = Domain.new(params[:domain])

    respond_to do |format|
      if @domain.save
        flash[:notice] = 'Dominio Creado Correctamente.'
        format.html { redirect_to(@domain) }
        format.xml  { render :xml => @domain, :status => :created, :location => @domain }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @domain.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /domains/1
  # PUT /domains/1.xml
  def update
    @domain = Domain.find(params[:id])

    respond_to do |format|
      if @domain.update_attributes(params[:domain])
        flash[:notice] = 'Dominio Actualizado Correctamente.'
        format.html { redirect_to(@domain) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @domain.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /domains/1
  # DELETE /domains/1.xml
  def destroy
    @domain = Domain.find(params[:id])
    @domain.destroy

    respond_to do |format|
      format.html { redirect_to(domains_url) }
      format.xml  { head :ok }
    end
  end
  def reload
    f = File.new("/tmp/file.yaml", "w+")
    Domain.all.each do |d|
      value=" "
      f.puts "#{d.name.gsub(".","_")}:"
      value=" yes" if d.enabled
      f.puts "\tenabled:#{value}"
      f.puts "\tttl: #{d.ttl}"
      address=[]
      acls=[]
      d.records.each do |r|
        address << r.address
        acls << r.acl
      end
      f.puts "\tA: #{address.join(",")}"
      f.puts "\tallow: #{acls.join(",")}"
    end
    f.close
    #llamada a system con el dig 
    dig=`host  da39a3ee5e6b4b0d3255bfef95601890afd80709 127.0.0.1 |tail -n 1|cut -d" " -f4`
    flash[:notice]="#{dig} Recargado con éxito"
    redirect_to :domains  
  end

  def search
    @domain=Domain.search params[:search]
  end

end
