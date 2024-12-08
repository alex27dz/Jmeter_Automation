# run tests
.\run.ps1 -TestPlan .\cams-cloud-qa.jmx -PropertyFile .\run-cams.props
.\run.ps1 -TestPlan .\appr-cloud-qa.jmx -PropertyFile .\run-appr.props
.\run.ps1 -TestPlan .\spc.jmx -PropertyFile .\run-spc.props
.\run.ps1 -TestPlan .\ca-cloud-qa.jmx -PropertyFile .\run-ca.props
