// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// nrowC
int nrowC(DataFrame x);
RcppExport SEXP _Orcs_nrowC(SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< DataFrame >::type x(xSEXP);
    rcpp_result_gen = Rcpp::wrap(nrowC(x));
    return rcpp_result_gen;
END_RCPP
}
// ncolC
int ncolC(DataFrame x);
RcppExport SEXP _Orcs_ncolC(SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< DataFrame >::type x(xSEXP);
    rcpp_result_gen = Rcpp::wrap(ncolC(x));
    return rcpp_result_gen;
END_RCPP
}
// dimC
IntegerVector dimC(DataFrame x);
RcppExport SEXP _Orcs_dimC(SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< DataFrame >::type x(xSEXP);
    rcpp_result_gen = Rcpp::wrap(dimC(x));
    return rcpp_result_gen;
END_RCPP
}