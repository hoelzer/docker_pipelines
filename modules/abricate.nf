process abricate {
    publishDir "${params.output}/${name}/ABR-Screening", mode: 'copy', pattern: "*.tab"
    label 'abricate'
    //if (workflow.profile == 'standard' && params.fastq) { maxForks 1 }   
  input:
    tuple val(name), file(fasta) 
    each method
  output:
	  tuple val(name), val("${method}"), file("*.tab")
  script:
    """
  	abricate ${fasta} --nopath --quiet --mincov 85 --db ${method} > ${method}.tab
    """
}

