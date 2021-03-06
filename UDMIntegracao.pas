unit UDMIntegracao;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TDMIntegracao = class(TDataModule)
    qParametros_Geral: TSQLQuery;
    sdsFilial: TSQLDataSet;
    dspFilial: TDataSetProvider;
    cdsFilial: TClientDataSet;
    dsFilial: TDataSource;
    sdsMovimento: TSQLDataSet;
    dspMovimento: TDataSetProvider;
    cdsMovimento: TClientDataSet;
    dsMovimento: TDataSource;
    cdsFilialID: TIntegerField;
    cdsFilialNOME: TStringField;
    cdsFilialENDERECO: TStringField;
    cdsFilialBAIRRO: TStringField;
    cdsFilialCEP: TStringField;
    cdsFilialID_CIDADE: TIntegerField;
    cdsFilialCIDADE: TStringField;
    cdsFilialUF: TStringField;
    cdsFilialNOME_INTERNO: TStringField;
    cdsFilialCOMPLEMENTO_END: TStringField;
    cdsFilialNUM_END: TStringField;
    cdsFilialDDD1: TIntegerField;
    cdsFilialFONE1: TStringField;
    cdsFilialDDD2: TIntegerField;
    cdsFilialFONE: TStringField;
    cdsFilialPESSOA: TStringField;
    cdsFilialCNPJ_CPF: TStringField;
    cdsFilialINSCR_EST: TStringField;
    cdsFilialSIMPLES: TStringField;
    cdsFilialINATIVO: TStringField;
    cdsFilialINSCMUNICIPAL: TStringField;
    cdsFilialCNAE: TStringField;
    cdsFilialID_CONTABILISTA: TIntegerField;
    cdsFilialDDDFAX: TIntegerField;
    cdsFilialFAX: TStringField;
    cdsFilialEMAIL_NFE: TStringField;
    mAuxiliar: TClientDataSet;
    mAuxiliarDtLancamento: TDateField;
    mAuxiliarCod_Debito: TIntegerField;
    mAuxiliarCod_Credito: TIntegerField;
    mAuxiliarCod_Historico: TIntegerField;
    mAuxiliarDesc_Historico: TStringField;
    mAuxiliarVlr_Lancamento: TFloatField;
    mAuxiliarCod_CentroCusto: TIntegerField;
    mAuxiliarClas_Contabil_Deb: TStringField;
    mAuxiliarClas_Contabil_Cre: TStringField;
    mAuxiliarSequencia: TIntegerField;
    mAuxiliarObs: TStringField;
    mAuxiliarCod_CentroCusto2: TIntegerField;
    mErros: TClientDataSet;
    mErrosNumDuplicata: TStringField;
    mErrosParcela: TIntegerField;
    mErrosErro: TStringField;
    dsmAuxiliar: TDataSource;
    dsmErros: TDataSource;
    sdsTitulos_Pagos: TSQLDataSet;
    dspTitulos_Pagos: TDataSetProvider;
    cdsTitulos_Pagos: TClientDataSet;
    cdsTitulos_PagosID: TIntegerField;
    cdsTitulos_PagosID_PESSOA: TIntegerField;
    cdsTitulos_PagosFILIAL: TIntegerField;
    cdsTitulos_PagosID_CONTA: TIntegerField;
    cdsTitulos_PagosID_CONTA_ORCAMENTO: TIntegerField;
    cdsTitulos_PagosDTLANCAMENTO: TDateField;
    cdsTitulos_PagosVLR_PAGAMENTO: TFloatField;
    cdsTitulos_PagosVLR_JUROSPAGOS: TFloatField;
    cdsTitulos_PagosCOD_CONTABIL_CONTAS: TIntegerField;
    cdsTitulos_PagosCOD_CONTABIL_ORC: TIntegerField;
    cdsTitulos_PagosCOD_CONTABIL_CLIENTE: TIntegerField;
    cdsTitulos_PagosCOD_CONTABIL_FORNECEDOR: TIntegerField;
    cdsTitulos_PagosTIPO_ES: TStringField;
    qParametros_GeralEND_ARQ_INT_CONTABIL: TStringField;
    qParametros_GeralID: TIntegerField;
    cdsTitulos_PagosNUMDUPLICATA: TStringField;
    cdsTitulos_PagosPARCELA: TIntegerField;
    cdsTitulos_PagosCOD_CONTABIL_JUROS_PAGOS: TIntegerField;
    cdsTitulos_PagosCOD_CONTABIL_JUROS_REC: TIntegerField;
    cdsTitulos_PagosTIPO_MOV: TStringField;
    cdsTitulos_PagosNUMNOTA: TIntegerField;
    cdsTitulos_PagosNOME_PESSOA: TStringField;
    sdsFilial_Contabil: TSQLDataSet;
    dspFilial_Contabil: TDataSetProvider;
    cdsFilial_Contabil: TClientDataSet;
    dsFilial_Contabil: TDataSource;
    sdsFilial_ContabilID: TIntegerField;
    sdsFilial_ContabilCOD_CONTABIL_JUROS_PAGOS: TIntegerField;
    sdsFilial_ContabilCOD_CONTABIL_JUROS_REC: TIntegerField;
    sdsFilial_ContabilNUM_SEQ_LOTE_INTEGRACAO: TIntegerField;
    sdsFilial_ContabilID_CONTABIL_OPE_BAIXA_CRE: TIntegerField;
    sdsFilial_ContabilID_CONTABIL_OPE_BAIXA_CPA: TIntegerField;
    cdsFilial_ContabilID: TIntegerField;
    cdsFilial_ContabilCOD_CONTABIL_JUROS_PAGOS: TIntegerField;
    cdsFilial_ContabilCOD_CONTABIL_JUROS_REC: TIntegerField;
    cdsFilial_ContabilNUM_SEQ_LOTE_INTEGRACAO: TIntegerField;
    cdsFilial_ContabilID_CONTABIL_OPE_BAIXA_CRE: TIntegerField;
    cdsFilial_ContabilID_CONTABIL_OPE_BAIXA_CPA: TIntegerField;
    cdsTitulos_PagosID_CONTABIL_OPE_BAIXA_CRE: TIntegerField;
    cdsTitulos_PagosID_CONTABIL_OPE_BAIXA_CPA: TIntegerField;
    dspContabil_Ope_Lacto: TDataSetProvider;
    cdsContabil_Ope_Lacto: TClientDataSet;
    sdsContabil_Ope_Lacto: TSQLDataSet;
    cdsContabil_Ope_LactoID: TIntegerField;
    cdsContabil_Ope_LactoITEM: TIntegerField;
    cdsContabil_Ope_LactoCONTA_DEBITO: TIntegerField;
    cdsContabil_Ope_LactoCONTA_CREDITO: TIntegerField;
    cdsContabil_Ope_LactoHISTORICO: TStringField;
    cdsContabil_Ope_LactoELEMENTO_VALOR: TStringField;
    cdsContabil_Ope_LactoOPERACAO_SD: TStringField;
    cdsContabil_Ope_LactoCOD_HISTORICO: TIntegerField;
    cdsTitulos_PagosCOD_CONTABIL_DESC_CRE: TIntegerField;
    cdsTitulos_PagosCOD_CONTABIL_DESC_CPA: TIntegerField;
    cdsTitulos_PagosCOD_CONTABIL_MULTA_CRE: TIntegerField;
    cdsTitulos_PagosCOD_CONTABIL_MULTA_CPA: TIntegerField;
    cdsTitulos_PagosNUMCHEQUE: TIntegerField;
    cdsTitulos_PagosSERIE: TStringField;
    cdsTitulos_PagosDTVENCIMENTO: TDateField;
    cdsTitulos_PagosDTEMISSAO: TDateField;
    cdsTitulos_PagosVLR_MULTA: TFloatField;
    cdsTitulos_PagosVLR_DESCONTOS: TFloatField;
    cdsTitulos_PagosVLR_PARCELA: TFloatField;
    cdsTitulos_PagosID_CONTABIL_OPE_BAIXA: TIntegerField;
    cdsTitulos_PagosDESCRICAO: TStringField;
    cdsTitulos_PagosMES_REF: TIntegerField;
    cdsTitulos_PagosANO_REF: TIntegerField;
    mPlano: TClientDataSet;
    mPlanoClassificacao_Cont: TStringField;
    mPlanoReservado_Ebs: TStringField;
    mPlanoCod_Reduzida: TStringField;
    mPlanoNome_Conta: TStringField;
    mPlanoGrau: TStringField;
    mPlanoTipo_Conta: TStringField;
    mPlanoNatureza: TStringField;
    mPlanoSinal: TStringField;
    dsmPlano: TDataSource;
    mPlanoSaldo: TStringField;
    sdsPessoa: TSQLDataSet;
    dspPessoa: TDataSetProvider;
    cdsPessoa: TClientDataSet;
    cdsPessoaCODIGO: TIntegerField;
    cdsPessoaNOME: TStringField;
    cdsPessoaCOD_ALFA: TStringField;
    sdsNota: TSQLDataSet;
    dspNota: TDataSetProvider;
    cdsNota: TClientDataSet;
    dsNota: TDataSource;
    cdsNotaID: TIntegerField;
    cdsNotaTIPO_REG: TStringField;
    cdsNotaTIPO_NOTA: TStringField;
    cdsNotaNUMNOTA: TIntegerField;
    cdsNotaSERIE: TStringField;
    cdsNotaID_CLIENTE: TIntegerField;
    cdsNotaDTEMISSAO: TDateField;
    cdsNotaDTSAIDAENTRADA: TDateField;
    cdsNotaTIPO_CONDICAO: TStringField;
    cdsNotaTIPO_FRETE: TStringField;
    sdsItens: TSQLDataSet;
    dspItens: TDataSetProvider;
    cdsItens: TClientDataSet;
    dsItens: TDataSource;
    cdsItensID_CFOP: TIntegerField;
    cdsItensID_PRODUTO: TIntegerField;
    cdsItensQTD: TFloatField;
    cdsItensVLR_UNITARIO: TFloatField;
    cdsItensVLR_TOTAL: TFloatField;
    cdsItensBASE_IPI: TFloatField;
    cdsItensBASE_ICMS: TFloatField;
    cdsItensBASE_ICMSSUBST: TFloatField;
    cdsItensVLR_ICMS: TFloatField;
    cdsItensVLR_IPI: TFloatField;
    cdsItensVLR_ICMSSUBST: TFloatField;
    cdsItensTIPO_NS: TStringField;
    cdsItensID_NOTA: TIntegerField;
    cdsItensPERC_ICMS: TFloatField;
    cdsItensVLR_ICMS_UF_DEST: TFloatField;
    cdsItensVLR_ICMS_UF_REMET: TFloatField;
    cdsItensVLR_ICMS_FCP_DEST: TFloatField;
    cdsItensBASE_INSS: TFloatField;
    cdsItensVLR_INSS: TFloatField;
    cdsItensBASE_CALCULO: TFloatField;
    cdsItensVLR_ISS: TFloatField;
    cdsItensVLR_ISS_RETIDO: TFloatField;
    cdsItensVLR_IR: TFloatField;
    cdsItensVLR_PIS: TFloatField;
    cdsItensVLR_COFINS: TFloatField;
    cdsItensVLR_CSLL: TFloatField;
    cdsItensRETEM_INSS: TStringField;
    mCFOP: TClientDataSet;
    mCFOPNumNota: TIntegerField;
    mCFOPSerie: TStringField;
    mCFOPID_CFOP: TIntegerField;
    mCFOPCodCFOP: TStringField;
    mCFOPID_Pessoa: TIntegerField;
    mCFOPCNPJ_EMITENTE: TStringField;
    mCFOPVlr_Total: TFloatField;
    mCFOPVlr_IPI: TFloatField;
    mCFOPBase_IPI: TFloatField;
    mCFOPBase_ST: TFloatField;
    mCFOPVlr_ICMSST: TFloatField;
    mCFOPVlr_ICMS_Diferido: TFloatField;
    mCFOPBase_ISS: TFloatField;
    mCFOPVlr_ISS: TFloatField;
    mCFOPVlr_ISS_Isento: TFloatField;
    mCFOPVlr_IR: TFloatField;
    mCFOPVlr_Pis: TFloatField;
    mCFOPVlr_Cofins: TFloatField;
    mCFOPVlr_CSLL: TFloatField;
    mCFOPINSS_Retido: TStringField;
    mCFOPISS_Retido: TStringField;
    mCFOPVlr_ICMS_UF_Dest: TFloatField;
    mCFOPVlr_ICMS_UF_Remet: TFloatField;
    cdsNotaTIPO_NS: TStringField;
    mProd: TClientDataSet;
    mProdID_CFOP: TIntegerField;
    mProdCod_Produto: TStringField;
    mProdQtd: TFloatField;
    mProdVlr_Unitario: TFloatField;
    mProdVlr_Total: TFloatField;
    mProdVlr_Desconto: TFloatField;
    mProdBase_ICMS: TFloatField;
    mProdPerc_ICMS: TFloatField;
    mProdVlr_IPI: TFloatField;
    mProdBase_ICMSST: TFloatField;
    mProdPerc_IPI: TFloatField;
    mProdPerc_Red_ICMS: TFloatField;
    mProdCODCST_ICMS: TStringField;
    mProdIdentificacao: TStringField;
    mProdCODCST_IPI: TStringField;
    mProdBase_IPI: TFloatField;
    mProdCODCST_PIS: TStringField;
    mProdBase_PIS: TFloatField;
    mProdPerc_Pis: TFloatField;
    mProdQtd_Base_Pis: TFloatField;
    mProdVlr_Pis: TFloatField;
    mProdCODCST_Cofins: TStringField;
    mProdBase_Cofins: TFloatField;
    mProdPerc_Cofins: TFloatField;
    mProdQtd_Base_Cofins: TFloatField;
    mProdVlr_Cofins: TFloatField;
    mProdVlr_Icms_ST: TFloatField;
    mProdPerc_Icms_ST: TFloatField;
    mProdVlr_Icms: TFloatField;
    mProdCodCFOP: TStringField;
    mProdUnidade: TStringField;
    mProdBase_Icms_Diferencial: TFloatField;
    mProdVlr_Icms_Origem: TFloatField;
    mProdVlr_Icms_Interno: TFloatField;
    mProdVlr_Icms_Recolher: TFloatField;
    mProdBase_Icms_Ant: TFloatField;
    mProdVlr_Icms_Ori_Ant: TFloatField;
    mProdSimples: TStringField;
    mProdProprio_Terceiro: TStringField;
    mProdVlr_Frete: TFloatField;
    mProdVlr_Seguro: TFloatField;
    mProdVlr_Despesas: TFloatField;
    dsmCFOP: TDataSource;
    qFornecedor: TSQLQuery;
    qFornecedorCODIGO: TIntegerField;
    qFornecedorNOME: TStringField;
    qFornecedorFANTASIA: TStringField;
    qFornecedorENDERECO: TStringField;
    qFornecedorCOMPLEMENTO_END: TStringField;
    qFornecedorNUM_END: TStringField;
    qFornecedorBAIRRO: TStringField;
    qFornecedorID_CIDADE: TIntegerField;
    qFornecedorCIDADE: TStringField;
    qFornecedorUF: TStringField;
    qFornecedorCEP: TStringField;
    qFornecedorDDDFONE1: TIntegerField;
    qFornecedorTELEFONE1: TStringField;
    qFornecedorDDDFONE2: TIntegerField;
    qFornecedorTELEFONE2: TStringField;
    qFornecedorDDDFAX: TIntegerField;
    qFornecedorFAX: TStringField;
    qFornecedorPESSOA: TStringField;
    qFornecedorCNPJ_CPF: TStringField;
    qFornecedorINSCR_EST: TStringField;
    qFornecedorENDERECO_ENT: TStringField;
    qFornecedorCOMPLEMENTO_END_ENT: TStringField;
    qFornecedorNUM_END_ENT: TStringField;
    qFornecedorBAIRRO_ENT: TStringField;
    qFornecedorID_CIDADE_ENT: TIntegerField;
    qFornecedorCIDADE_ENT: TStringField;
    qFornecedorCEP_ENT: TStringField;
    qFornecedorUF_ENT: TStringField;
    qFornecedorPESSOA_ENT: TStringField;
    qFornecedorCNPJ_CPF_ENT: TStringField;
    qFornecedorINSC_EST_ENT: TStringField;
    qFornecedorENDERECO_PGTO: TStringField;
    qFornecedorCOMPLEMENTO_END_PGTO: TStringField;
    qFornecedorNUM_END_PGTO: TStringField;
    qFornecedorBAIRRO_PGTO: TStringField;
    qFornecedorID_CIDADE_PGTO: TIntegerField;
    qFornecedorCIDADE_PGTO: TStringField;
    qFornecedorCEP_PGTO: TStringField;
    qFornecedorUF_PGTO: TStringField;
    qFornecedorUSUARIO: TStringField;
    qFornecedorDTCADASTRO: TDateField;
    qFornecedorHRCADASTRO: TTimeField;
    qFornecedorOBS: TMemoField;
    qFornecedorCAIXAPOSTAL: TStringField;
    qFornecedorRG: TStringField;
    qFornecedorID_VENDEDOR: TIntegerField;
    qFornecedorID_CONDPGTO: TIntegerField;
    qFornecedorID_CONTABOLETO: TIntegerField;
    qFornecedorID_TRANSPORTADORA: TIntegerField;
    qFornecedorID_TIPOCOBRANCA: TIntegerField;
    qFornecedorID_REDESPACHO: TIntegerField;
    qFornecedorID_PAIS: TIntegerField;
    qFornecedorID_REGIME_TRIB: TIntegerField;
    qFornecedorPERC_COMISSAO: TFloatField;
    qFornecedorDDD_ENT: TIntegerField;
    qFornecedorFONE_ENT: TStringField;
    qFornecedorDDD_PGTO: TIntegerField;
    qFornecedorFONE_PGTO: TStringField;
    qFornecedorINATIVO: TStringField;
    qFornecedorHOMEPAGE: TStringField;
    qFornecedorTIPO_FRETE: TStringField;
    qFornecedorNOME_ENTREGA: TStringField;
    qFornecedorEMAIL_NFE: TStringField;
    qFornecedorEMAIL_PGTO: TStringField;
    qFornecedorEMAIL_NFE2: TStringField;
    qFornecedorPESSOA_PGTO: TStringField;
    qFornecedorCNPJ_CPG_PGTO: TStringField;
    qFornecedorINSC_EST_PGTO: TStringField;
    qFornecedorUF_PLACA: TStringField;
    qFornecedorPLACA: TStringField;
    qFornecedorTP_CLIENTE: TStringField;
    qFornecedorTP_FORNECEDOR: TStringField;
    qFornecedorTP_TRANSPORTADORA: TStringField;
    qFornecedorTP_VENDEDOR: TStringField;
    qFornecedorTIPO_ICMS: TStringField;
    qFornecedorID_TAB_PRECO: TIntegerField;
    qFornecedorTP_ATELIER: TStringField;
    qFornecedorTIPO_COMISSAO: TStringField;
    qFornecedorPERC_COMISSAO_VEND: TFloatField;
    qFornecedorNOME_CONTATO: TStringField;
    qFornecedorINSC_MUNICIPAL: TStringField;
    qFornecedorDT_CONTRATO_INI: TDateField;
    qFornecedorDT_CONTRATO_FIN: TDateField;
    qFornecedorID_SERVICO: TIntegerField;
    qFornecedorID_SERVICO_INT: TIntegerField;
    qFornecedorVLR_SERVICO: TFloatField;
    qFornecedorCLIENTE_CONTA_ID: TIntegerField;
    qFornecedorFORNECEDOR_CONTA_ID: TIntegerField;
    qFornecedorVENDEDOR_CONTA_ID: TIntegerField;
    qFornecedorTRANSPORTADORA_CONTA_ID: TIntegerField;
    qFornecedorATELIER_CONTA_ID: TIntegerField;
    qFornecedorRETEM_ISS: TStringField;
    qFornecedorRETEM_CSLL: TStringField;
    qFornecedorRETEM_PISCOFINS: TStringField;
    qFornecedorRETEM_INSS: TStringField;
    qFornecedorEMAIL_COMPRAS: TStringField;
    qFornecedorCONTATO_COMPRAS: TStringField;
    qFornecedorORGAO_PUBLICO: TStringField;
    qFornecedorID_NATUREZA: TIntegerField;
    qFornecedorDIMINUIR_RETENCAO: TStringField;
    qFornecedorPERC_REDUCAO_INSS: TFloatField;
    qFornecedorUSA_TRANSFICMS: TStringField;
    qFornecedorCLIENTE_ESTOQUE: TStringField;
    qFornecedorUSA_TAMANHO_AGRUPADO_NFE: TStringField;
    qFornecedorCOD_ANT: TIntegerField;
    qFornecedorID_EDI: TIntegerField;
    qFornecedorPAI_NOME: TStringField;
    qFornecedorMAE_NOME: TStringField;
    qFornecedorTP_ALUNO: TStringField;
    qFornecedorCOBRAR_TAXA_BANCO: TStringField;
    qFornecedorVLR_LIMITE_CREDITO: TFloatField;
    qFornecedorINSC_EST_ST: TStringField;
    qFornecedorUF_ST: TStringField;
    qFornecedorTIPO_CONSUMIDOR: TSmallintField;
    qFornecedorTIPO_CONTRIBUINTE: TSmallintField;
    qFornecedorINSC_SUFRAMA: TStringField;
    qFornecedorCOD_ALFA: TStringField;
    qFornecedorTP_PREPOSTO: TStringField;
    qFornecedorTP_EXPORTACAO: TStringField;
    qFornecedorCARIMBO: TStringField;
    qFornecedorDTPEDIDO: TDateField;
    qFornecedorDTNOTA: TDateField;
    qFornecedorPERC_DESC_SUFRAMA: TFloatField;
    qFornecedorVLR_LIMITE_COMPRA: TFloatField;
    qFornecedorID_GRUPO: TIntegerField;
    qFornecedorTP_FUNCIONARIO: TStringField;
    qFornecedorIMP_COD_PRODUTO_CLI: TStringField;
    qFornecedorFILIAL: TIntegerField;
    qFornecedorVLR_ULT_FATURAMENTO: TFloatField;
    qFornecedorQTD_ULT_FATURAMENTO: TFloatField;
    qFornecedorCOD_CONTABIL_CLIENTE: TIntegerField;
    qFornecedorCOD_CONTABIL_FORNECEDOR: TIntegerField;
    qFornecedorID_REGIAO_VENDA: TIntegerField;
    qFornecedorTIPO_CREDITO: TStringField;
    qFornecedorUSUARIO_LOG: TStringField;
    qFornecedorPROTESTAR: TStringField;
    qFornecedorID_CARTEIRA: TIntegerField;
    cdsNotaVLR_NOTA: TFloatField;
    cdsNotaVLR_PIS: TFloatField;
    cdsNotaVLR_COFINS: TFloatField;
    cdsNotaBASE_ICMS: TFloatField;
    cdsNotaVLR_ICMS: TFloatField;
    cdsItensVLR_DESCONTO: TFloatField;
    cdsItensPERC_IPI: TFloatField;
    cdsItensID_CSTICMS: TIntegerField;
    cdsItensUNIDADE: TStringField;
    cdsItensVLR_FRETE: TFloatField;
    cdsTitulos_PagosCOD_CONTABIL_TXBANCARIA_CRE: TIntegerField;
    cdsTitulos_PagosCOD_CONTABIL_TXBANCARIA_CPA: TIntegerField;
    cdsTitulos_PagosHIST_DUPLICATA: TStringField;
    sdsTransferencia: TSQLDataSet;
    dspTransferencia: TDataSetProvider;
    cdsTransferencia: TClientDataSet;
    cdsTransferenciaID: TIntegerField;
    cdsTransferenciaID_CONTABIL_OPE: TIntegerField;
    cdsTransferenciaNUMCHEQUE: TIntegerField;
    cdsItensPERC_BASE_ICMS_RED: TFloatField;
    cdsItensID_PIS: TIntegerField;
    cdsItensID_COFINS: TIntegerField;
    cdsItensPERC_PIS: TFloatField;
    cdsItensPERC_COFINS: TFloatField;
    cdsItensPERC_ICMSSUBST_PROPRIO: TFloatField;
    cdsItensORIGEM_PROD: TStringField;
    cdsNotaCODCFOP: TStringField;
    cdsTransferenciaID_CONTA_ORI: TIntegerField;
    cdsTransferenciaID_CONTA_DEST: TIntegerField;
    cdsTransferenciaID_CONTA_ORC_ORIGEM: TIntegerField;
    cdsTransferenciaID_CONTA_ORC_DESTINO: TIntegerField;
    cdsTransferenciaDTEMISSAO: TDateField;
    cdsTransferenciaCOD_CONTABIL_ORI: TIntegerField;
    cdsTransferenciaNOME_CONTA_ORI: TStringField;
    cdsTransferenciaNOME_CONTA_DEST: TStringField;
    cdsTransferenciaCOD_CONTABIL_DEST: TIntegerField;
    cdsTransferenciaCOD_CONTABIL_CONTAS_ORI: TIntegerField;
    cdsTransferenciaCOD_CONTABIL_CONTAS_DEST: TIntegerField;
    cdsTransferenciaVLR_MOVIMENTO: TFloatField;
    qParametros_Fin: TSQLQuery;
    qParametros_FinUSA_ID_SAGE_INT: TStringField;
    cdsItensREFERENCIA: TStringField;
    sdsConsProd: TSQLDataSet;
    dspConsProd: TDataSetProvider;
    cdsConsProd: TClientDataSet;
    dsConsProd: TDataSource;
    cdsConsProdID_PRODUTO: TIntegerField;
    cdsConsProdREFERENCIA: TStringField;
    cdsConsProdNOME: TStringField;
    cdsConsProdUNIDADE: TStringField;
    cdsConsProdNCM: TStringField;
    cdsConsProdPESOLIQUIDO: TFloatField;
    cdsConsProdPESOBRUTO: TFloatField;
    cdsConsProdSPED_TIPO_ITEM: TStringField;
    cdsConsProdID_CSTICMS_BRED: TIntegerField;
    cdsConsProdID_CSTICMS: TIntegerField;
    cdsConsProdCST_ICMS_RED: TStringField;
    cdsConsProdCST_ICMS: TStringField;
    cdsConsProdCST_IPI: TStringField;
    cdsConsProdPERC_ICMS_NFCE: TFloatField;
    cdsConsProdPERC_IPI: TFloatField;
    cdsConsProdCOD_BARRA: TStringField;
    cdsConsProdCOD_CEST: TStringField;
    mUnidade: TClientDataSet;
    mUnidadeUnidade: TStringField;
    mUnidadeNome: TStringField;
    qUnidade: TSQLQuery;
    qUnidadeUNIDADE: TStringField;
    qUnidadeNOME: TStringField;
    sdsConsUnidade_Conv: TSQLDataSet;
    dspConsUnidade_Conv: TDataSetProvider;
    cdsConsUnidade_Conv: TClientDataSet;
    dsConsUnidade_Conv: TDataSource;
    cdsConsUnidade_ConvID_PRODUTO: TIntegerField;
    cdsConsUnidade_ConvUNIDADE: TStringField;
    cdsConsUnidade_ConvUNIDADE_CONV: TStringField;
    cdsConsUnidade_ConvQTD: TFloatField;
    cdsConsUnidade_ConvTIPO_CONVERSOR: TStringField;
    cdsConsUnidade_ConvPESOLIQUIDO: TFloatField;
    cdsConsUnidade_ConvPESOBRUTO: TFloatField;
    cdsConsUnidade_ConvREFERENCIA: TStringField;
    cdsNotaVLR_IPI: TFloatField;
    cdsNotaBASE_IPI: TFloatField;
    cdsNotaVLR_ICMSSUBST: TFloatField;
    cdsNotaBASE_ICMSSUBST: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ctNotaFiscal : String;
    procedure prc_Localiza_Fornecedor(ID : Integer);
  end;

var
  DMIntegracao: TDMIntegracao;

implementation

uses DmdDatabase, DmdDatabase_EBS;

{$R *.dfm}

procedure TDMIntegracao.DataModuleCreate(Sender: TObject);
begin
  qParametros_Geral.Open;
  qParametros_Fin.Open;
  cdsFilial.Open;

  if qParametros_FinUSA_ID_SAGE_INT.AsString = 'S' then
   dmDatabase_EBS := TdmDatabase_EBS.Create(Self);
end;


procedure TDMIntegracao.prc_Localiza_Fornecedor(ID: Integer);
begin
  qFornecedor.Close;
  qFornecedor.ParamByName('CODIGO').AsInteger := ID;
  qFornecedor.Open;
end;

end.
