#!/usr/bin/env nextflow

nextflow.preview.dsl = 2

params.bedtools_genomecov_args = '' //'-bg'

include check_output from  '../../../../tests/functions/check_process_outputs.nf' // params(params)
include BEDTOOLS_GENOMECOV from '../main.nf' params(params)

// Define input channels
ch_input = Channel.fromPath('./input_data/JK2067_downsampled_s0.1.bam')
chrom_sizes = Channel.fromPath('./input_data/genome.sizes')

// Run the workflow
workflow {
    BEDTOOLS_GENOMECOV(ch_input, chrom_sizes, params.bedtools_genomecov_args)
    // .check_output()
}
