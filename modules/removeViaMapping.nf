process removeViaMapping {
        publishDir "${params.output}/${name}", mode: 'copy', pattern: "${name}_*_non_mappers.fastq.gz"
        label 'seqtk'
    input:
        set val(name), file(readlist), file(shortreads)
    output:
        set val(name), file("${name}_forward_non_mappers.fastq.gz"), file("${name}_reverse_non_mappers.fastq.gz")
    script:
        """    
        seqtk subseq library1.forward.fastq ${readlist} | gzip > ${name}_forward_non_mappers.fastq.gz
        seqtk subseq library1.reverse.fastq ${readlist} | gzip > ${name}_reverse_non_mappers.fastq.gz
        """
}