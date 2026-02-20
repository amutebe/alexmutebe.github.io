class objective_cat(models.Model):

    description=models.CharField("Description:", max_length=200,null=True,blank=True)
    def __str__(self):
        return self.description
        
class objective_type(models.Model):

    description=models.CharField("Description:", max_length=200,null=True,blank=True)
    def __str__(self):
        return self.description       
        
class action_plan(models.Model):

    description=models.CharField("Description:", max_length=200,null=True,blank=True)
    def __str__(self):
        return self.description 

class Measure_of_success(models.Model):

    description=models.CharField("Description:", max_length=200,null=True,blank=True)
    def __str__(self):
        return self.description   

  

class service_objectives(models.Model):
	risk_no=models.ForeignKey('mod9001_risks', on_delete=models.CASCADE,verbose_name='Risk#:',null=True,blank=True)
	id=models.CharField("OBJ No:",max_length=200,primary_key=True)
	date=models.DateField("Date:",default=datetime.datetime.now,null=False)
	objcat=models.ForeignKey('objective_cat', on_delete=models.CASCADE,verbose_name='Objective Category:',null=True,blank=True)
	objtype=models.ForeignKey('objective_type', on_delete=models.CASCADE,verbose_name='Objective Type:',null=True,blank=True)
	obj_desc=models.TextField("Ojective Description:",null=False)	
    plan=models.ForeignKey('action_plan', on_delete=models.CASCADE,verbose_name='Action Plan:',null=True,blank=True)
    plan_details=models.TextField("Details:",null=False)
	timeline=models.DateField("Action timeline:",default=datetime.datetime.now,null=False)
	frequency=models.ForeignKey('bcp_test_frequency', on_delete=models.CASCADE,verbose_name='Action Frequency:',null=True,blank=True)
	document = models.FileField("Attachment:",upload_to='documents/',null=True,blank=True,validators=[validate_file_size_verification])
	uploaded_at = models.DateTimeField(auto_now_add=True,null=True)
	assigned_to = models.ForeignKey('accounts.employees',null=True,blank=True,verbose_name='Assigned To:',on_delete=models.SET_NULL)
	resources=models.TextField("Resources:",null=False)
	details=models.TextField("Additional Details:",null=False)
 	success_measure=models.ForeignKey('Measure_of_success', on_delete=models.CASCADE,verbose_name='Measure of Success:',null=True,blank=True)   
	target=models.TextField("Target:",null=False)
	eva_method=models.ForeignKey('evaluation_method', on_delete=models.CASCADE,verbose_name='Evaluation Method:',null=True,blank=True)
    entered_by = models.ForeignKey(settings.AUTH_USER_MODEL,null=True, blank=True,on_delete=models.CASCADE,related_name='SrequestBy')
	date_today=models.DateField("Date created:",default=datetime.datetime.now)
	record_group=models.CharField("Data Group",max_length=20,null=True,blank=True)
	due=models.DateField("Date:",default=datetime.datetime.now,null=False)
	co_code=models.ForeignKey(Company,null=False,on_delete=models.SET_NULL,verbose_name=("Company/Organisation"))
	verification_status=models.TextField(max_length=200, null=True,blank=True)
	verification_failed=models.TextField("Reason for rejecting:",null=True,blank=True)
	status=models.ForeignKey('issues_9001.approval_status', on_delete=models.CASCADE,verbose_name='Status:',null=True,blank=True)
	qmsstatus=models.ForeignKey('operations_9001.qmsstatus', on_delete=models.SET_NULL,null=True,verbose_name='Verification Status:')
	scheduled=models.DateField("Re-scheduled:",default=datetime.datetime.now,null=True,blank=True)
	completedby= models.ForeignKey('accounts.employees',on_delete=models.SET_NULL,verbose_name='Completed by:',null=True,blank=True)
	def __str__(self):
	    return str(self.id)