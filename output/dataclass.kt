import com.google.gson.annotations.SerializedName

data class Response(
    @SerializedName("content") val content: Content? = null
) {
    data class Content(
        @SerializedName("overDueAmount") val overDueAmount: Int? = null,
        @SerializedName("maxCashDisbursed") val maxCashDisbursed: Double? = null,
        @SerializedName("loanPayeeCode") val loanPayeeCode: String? = null,
        @SerializedName("accountStatus") val accountStatus: String? = null,
        @SerializedName("expiryDate") val expiryDate: String? = null,
        @SerializedName("paymentChannel") val paymentChannel: String? = null,
        @SerializedName("interestRate") val interestRate: Double? = null,
        @SerializedName("accountOpenDate") val accountOpenDate: String? = null,
        @SerializedName("accountCloseDate") val accountCloseDate: String? = null,
        @SerializedName("accountClosedDueDate") val accountClosedDueDate: String? = null,
        @SerializedName("dueDate") val dueDate: String? = null,
        @SerializedName("accountName") val accountName: String? = null,
        @SerializedName("maximumPaymentPercentage") val maximumPaymentPercentage: Int? = null,
        @SerializedName("productGroup") val productGroup: String? = null,
        @SerializedName("maximumCashDisbursementPercentage") val maximumCashDisbursementPercentage: Double? = null,
        @SerializedName("productType") val productType: String? = null,
        @SerializedName("ledgerBalance") val ledgerBalance: Double? = null,
        @SerializedName("availableBalance") val availableBalance: Double? = null,
        @SerializedName("payoutAccountNo") val payoutAccountNo: String? = null,
        @SerializedName("productMarketName") val productMarketName: String? = null,
        @SerializedName("currentBilling") val currentBilling: CurrentBilling? = null,
        @SerializedName("cutOffDate") val cutOffDate: String? = null,
        @SerializedName("lastPaymentDate") val lastPaymentDate: String? = null,
        @SerializedName("interestAmount") val interestAmount: Double? = null,
        @SerializedName("lateChargeAmount") val lateChargeAmount: Double? = null,
        @SerializedName("collectionFeeAmount") val collectionFeeAmount: Double? = null,
        @SerializedName("allAccrualInterest") val allAccrualInterest: Double? = null,
        @SerializedName("availableCashLimit") val availableCashLimit: Double? = null,
        @SerializedName("paymentFrequency") val paymentFrequency: String? = null,
        @SerializedName("accountNo") val accountNo: String? = null,
        @SerializedName("isEligible") val isEligible: Boolean? = null,
        @SerializedName("productTypeDisplayName") val productTypeDisplayName: String? = null,
        @SerializedName("currencyCode") val currencyCode: String? = null,
        @SerializedName("accountRestrictionCode") val accountRestrictionCode: String? = null,
        @SerializedName("limitAmount") val limitAmount: Double? = null,
        @SerializedName("creditLimit") val creditLimit: Double? = null,
        @SerializedName("expectedCreditLimit") val expectedCreditLimit: Double? = null,
        @SerializedName("termPaymentAmount") val termPaymentAmount: Int? = null,
        @SerializedName("payOffAmount") val payOffAmount: Double? = null,
        @SerializedName("nextPaymentDueDate") val nextPaymentDueDate: String? = null,
        @SerializedName("repaymentAccountNo") val repaymentAccountNo: String? = null,
        @SerializedName("approveCreditLimit") val approveCreditLimit: Int? = null,
        @SerializedName("ddrPaymentMethod") val ddrPaymentMethod: String? = null
    ) {
        data class CurrentBilling(
            @SerializedName("remainingAmount") val remainingAmount: Double? = null,
            @SerializedName("isOverdue") val isOverdue: Boolean? = null,
            @SerializedName("billDate") val billDate: String? = null,
            @SerializedName("dueDate") val dueDate: String? = null,
            @SerializedName("cutOffDate") val cutOffDate: String? = null,
            @SerializedName("totalInterestAmount") val totalInterestAmount: Int? = null,
            @SerializedName("totalPenaltyInterestAmount") val totalPenaltyInterestAmount: Int? = null,
            @SerializedName("billTransactions") val billTransactionsList: List<BillTransaction>? = null,
            @SerializedName("firstOverdueDate") val firstOverdueDate: String? = null,
            @SerializedName("totalPrincipalAmount") val totalPrincipalAmount: Int? = null
        ) {
            data class BillTransaction(
                @SerializedName("transactionType") val transactionType: String? = null,
                @SerializedName("amount") val amount: Double? = null,
                @SerializedName("datetime") val datetime: String? = null,
                @SerializedName("drawdownInstallmentAmount") val drawdownInstallmentAmount: Double? = null,
                @SerializedName("drawdownToAccount") val drawdownToAccount: String? = null,
                @SerializedName("drawdownInstallmentCurrentTerm") val drawdownInstallmentCurrentTerm: Int? = null,
                @SerializedName("drawdownInstallmentTotalTerm") val drawdownInstallmentTotalTerm: Int? = null
            )
        }
    }
}
