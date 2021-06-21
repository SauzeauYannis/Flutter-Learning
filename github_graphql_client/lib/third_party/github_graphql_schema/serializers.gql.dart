import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:github_graphql_client/src/github_gql/github_queries.data.gql.dart'
    show GViewerDetailData, GViewerDetailData_viewer;
import 'package:github_graphql_client/src/github_gql/github_queries.req.gql.dart'
    show GViewerDetail;
import 'package:github_graphql_client/src/github_gql/github_queries.var.gql.dart'
    show GViewerDetailVars;
import 'package:github_graphql_client/third_party/github_graphql_schema/schema.docs.schema.gql.dart'
    show
        GAcceptEnterpriseAdministratorInvitationInput,
        GAcceptTopicSuggestionInput,
        GAddAssigneesToAssignableInput,
        GAddCommentInput,
        GAddDiscussionCommentInput,
        GAddEnterpriseSupportEntitlementInput,
        GAddLabelsToLabelableInput,
        GAddProjectCardInput,
        GAddProjectColumnInput,
        GAddPullRequestReviewCommentInput,
        GAddPullRequestReviewInput,
        GAddPullRequestReviewThreadInput,
        GAddReactionInput,
        GAddStarInput,
        GAddUpvoteInput,
        GAddVerifiableDomainInput,
        GApproveDeploymentsInput,
        GApproveVerifiableDomainInput,
        GArchiveRepositoryInput,
        GAuditLogOrder,
        GAuditLogOrderField,
        GCancelEnterpriseAdminInvitationInput,
        GChangeUserStatusInput,
        GCheckAnnotationData,
        GCheckAnnotationLevel,
        GCheckAnnotationRange,
        GCheckConclusionState,
        GCheckRunAction,
        GCheckRunFilter,
        GCheckRunOutput,
        GCheckRunOutputImage,
        GCheckRunType,
        GCheckStatusState,
        GCheckSuiteAutoTriggerPreference,
        GCheckSuiteFilter,
        GClearLabelsFromLabelableInput,
        GCloneProjectInput,
        GCloneTemplateRepositoryInput,
        GCloseIssueInput,
        GClosePullRequestInput,
        GCollaboratorAffiliation,
        GCommentAuthorAssociation,
        GCommentCannotUpdateReason,
        GCommitAuthor,
        GCommitContributionOrder,
        GCommitContributionOrderField,
        GContributionLevel,
        GContributionOrder,
        GConvertProjectCardNoteToIssueInput,
        GConvertPullRequestToDraftInput,
        GCreateBranchProtectionRuleInput,
        GCreateCheckRunInput,
        GCreateCheckSuiteInput,
        GCreateContentAttachmentInput,
        GCreateDeploymentInput,
        GCreateDeploymentStatusInput,
        GCreateDiscussionInput,
        GCreateEnterpriseOrganizationInput,
        GCreateEnvironmentInput,
        GCreateIpAllowListEntryInput,
        GCreateIssueInput,
        GCreateLabelInput,
        GCreateProjectInput,
        GCreatePullRequestInput,
        GCreateRefInput,
        GCreateRepositoryInput,
        GCreateTeamDiscussionCommentInput,
        GCreateTeamDiscussionInput,
        GDate,
        GDateTime,
        GDeclineTopicSuggestionInput,
        GDefaultRepositoryPermissionField,
        GDeleteBranchProtectionRuleInput,
        GDeleteDeploymentInput,
        GDeleteDiscussionCommentInput,
        GDeleteDiscussionInput,
        GDeleteEnvironmentInput,
        GDeleteIpAllowListEntryInput,
        GDeleteIssueCommentInput,
        GDeleteIssueInput,
        GDeleteLabelInput,
        GDeletePackageVersionInput,
        GDeleteProjectCardInput,
        GDeleteProjectColumnInput,
        GDeleteProjectInput,
        GDeletePullRequestReviewCommentInput,
        GDeletePullRequestReviewInput,
        GDeleteRefInput,
        GDeleteTeamDiscussionCommentInput,
        GDeleteTeamDiscussionInput,
        GDeleteVerifiableDomainInput,
        GDeploymentOrder,
        GDeploymentOrderField,
        GDeploymentProtectionRuleType,
        GDeploymentReviewState,
        GDeploymentState,
        GDeploymentStatusState,
        GDiffSide,
        GDisablePullRequestAutoMergeInput,
        GDiscussionOrder,
        GDiscussionOrderField,
        GDismissPullRequestReviewInput,
        GDraftPullRequestReviewComment,
        GDraftPullRequestReviewThread,
        GEnablePullRequestAutoMergeInput,
        GEnterpriseAdministratorInvitationOrder,
        GEnterpriseAdministratorInvitationOrderField,
        GEnterpriseAdministratorRole,
        GEnterpriseDefaultRepositoryPermissionSettingValue,
        GEnterpriseEnabledDisabledSettingValue,
        GEnterpriseEnabledSettingValue,
        GEnterpriseMemberOrder,
        GEnterpriseMemberOrderField,
        GEnterpriseMembersCanCreateRepositoriesSettingValue,
        GEnterpriseMembersCanMakePurchasesSettingValue,
        GEnterpriseServerInstallationOrder,
        GEnterpriseServerInstallationOrderField,
        GEnterpriseServerUserAccountEmailOrder,
        GEnterpriseServerUserAccountEmailOrderField,
        GEnterpriseServerUserAccountOrder,
        GEnterpriseServerUserAccountOrderField,
        GEnterpriseServerUserAccountsUploadOrder,
        GEnterpriseServerUserAccountsUploadOrderField,
        GEnterpriseServerUserAccountsUploadSyncState,
        GEnterpriseUserAccountMembershipRole,
        GEnterpriseUserDeployment,
        GFileViewedState,
        GFollowUserInput,
        GFundingPlatform,
        GGistOrder,
        GGistOrderField,
        GGistPrivacy,
        GGitObjectID,
        GGitRefname,
        GGitSSHRemote,
        GGitSignatureState,
        GGitTimestamp,
        GHTML,
        GIdentityProviderConfigurationState,
        GImportProjectInput,
        GInviteEnterpriseAdminInput,
        GIpAllowListEnabledSettingValue,
        GIpAllowListEntryOrder,
        GIpAllowListEntryOrderField,
        GIpAllowListForInstalledAppsEnabledSettingValue,
        GIssueCommentOrder,
        GIssueCommentOrderField,
        GIssueFilters,
        GIssueOrder,
        GIssueOrderField,
        GIssueState,
        GIssueTimelineItemsItemType,
        GLabelOrder,
        GLabelOrderField,
        GLanguageOrder,
        GLanguageOrderField,
        GLinkRepositoryToProjectInput,
        GLockLockableInput,
        GLockReason,
        GMarkDiscussionCommentAsAnswerInput,
        GMarkFileAsViewedInput,
        GMarkPullRequestReadyForReviewInput,
        GMergeBranchInput,
        GMergePullRequestInput,
        GMergeStateStatus,
        GMergeableState,
        GMilestoneOrder,
        GMilestoneOrderField,
        GMilestoneState,
        GMinimizeCommentInput,
        GMoveProjectCardInput,
        GMoveProjectColumnInput,
        GNotificationRestrictionSettingValue,
        GOauthApplicationCreateAuditEntryState,
        GOperationType,
        GOrderDirection,
        GOrgAddMemberAuditEntryPermission,
        GOrgCreateAuditEntryBillingPlan,
        GOrgRemoveBillingManagerAuditEntryReason,
        GOrgRemoveMemberAuditEntryMembershipType,
        GOrgRemoveMemberAuditEntryReason,
        GOrgRemoveOutsideCollaboratorAuditEntryMembershipType,
        GOrgRemoveOutsideCollaboratorAuditEntryReason,
        GOrgUpdateDefaultRepositoryPermissionAuditEntryPermission,
        GOrgUpdateMemberAuditEntryPermission,
        GOrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility,
        GOrganizationInvitationRole,
        GOrganizationInvitationType,
        GOrganizationMemberRole,
        GOrganizationMembersCanCreateRepositoriesSettingValue,
        GOrganizationOrder,
        GOrganizationOrderField,
        GPackageFileOrder,
        GPackageFileOrderField,
        GPackageOrder,
        GPackageOrderField,
        GPackageType,
        GPackageVersionOrder,
        GPackageVersionOrderField,
        GPinIssueInput,
        GPinnableItemType,
        GPinnedDiscussionGradient,
        GPinnedDiscussionPattern,
        GPreciseDateTime,
        GProjectCardArchivedState,
        GProjectCardImport,
        GProjectCardState,
        GProjectColumnImport,
        GProjectColumnPurpose,
        GProjectOrder,
        GProjectOrderField,
        GProjectState,
        GProjectTemplate,
        GPullRequestMergeMethod,
        GPullRequestOrder,
        GPullRequestOrderField,
        GPullRequestReviewCommentState,
        GPullRequestReviewDecision,
        GPullRequestReviewEvent,
        GPullRequestReviewState,
        GPullRequestState,
        GPullRequestTimelineItemsItemType,
        GPullRequestUpdateState,
        GReactionContent,
        GReactionOrder,
        GReactionOrderField,
        GRefOrder,
        GRefOrderField,
        GRefUpdate,
        GRegenerateEnterpriseIdentityProviderRecoveryCodesInput,
        GRegenerateVerifiableDomainTokenInput,
        GRejectDeploymentsInput,
        GReleaseOrder,
        GReleaseOrderField,
        GRemoveAssigneesFromAssignableInput,
        GRemoveEnterpriseAdminInput,
        GRemoveEnterpriseIdentityProviderInput,
        GRemoveEnterpriseOrganizationInput,
        GRemoveEnterpriseSupportEntitlementInput,
        GRemoveLabelsFromLabelableInput,
        GRemoveOutsideCollaboratorInput,
        GRemoveReactionInput,
        GRemoveStarInput,
        GRemoveUpvoteInput,
        GReopenIssueInput,
        GReopenPullRequestInput,
        GRepoAccessAuditEntryVisibility,
        GRepoAddMemberAuditEntryVisibility,
        GRepoArchivedAuditEntryVisibility,
        GRepoChangeMergeSettingAuditEntryMergeType,
        GRepoCreateAuditEntryVisibility,
        GRepoDestroyAuditEntryVisibility,
        GRepoRemoveMemberAuditEntryVisibility,
        GReportedContentClassifiers,
        GRepositoryAffiliation,
        GRepositoryContributionType,
        GRepositoryInteractionLimit,
        GRepositoryInteractionLimitExpiry,
        GRepositoryInteractionLimitOrigin,
        GRepositoryInvitationOrder,
        GRepositoryInvitationOrderField,
        GRepositoryLockReason,
        GRepositoryOrder,
        GRepositoryOrderField,
        GRepositoryPermission,
        GRepositoryPrivacy,
        GRepositoryVisibility,
        GRequestReviewsInput,
        GRequestableCheckStatusState,
        GRerequestCheckSuiteInput,
        GResolveReviewThreadInput,
        GSamlDigestAlgorithm,
        GSamlSignatureAlgorithm,
        GSavedReplyOrder,
        GSavedReplyOrderField,
        GSearchType,
        GSecurityAdvisoryEcosystem,
        GSecurityAdvisoryIdentifierFilter,
        GSecurityAdvisoryIdentifierType,
        GSecurityAdvisoryOrder,
        GSecurityAdvisoryOrderField,
        GSecurityAdvisorySeverity,
        GSecurityVulnerabilityOrder,
        GSecurityVulnerabilityOrderField,
        GSetEnterpriseIdentityProviderInput,
        GSetOrganizationInteractionLimitInput,
        GSetRepositoryInteractionLimitInput,
        GSetUserInteractionLimitInput,
        GSponsorableOrder,
        GSponsorableOrderField,
        GSponsorsGoalKind,
        GSponsorsTierOrder,
        GSponsorsTierOrderField,
        GSponsorshipOrder,
        GSponsorshipOrderField,
        GSponsorshipPrivacy,
        GStarOrder,
        GStarOrderField,
        GStatusState,
        GSubmitPullRequestReviewInput,
        GSubscriptionState,
        GTeamDiscussionCommentOrder,
        GTeamDiscussionCommentOrderField,
        GTeamDiscussionOrder,
        GTeamDiscussionOrderField,
        GTeamMemberOrder,
        GTeamMemberOrderField,
        GTeamMemberRole,
        GTeamMembershipType,
        GTeamOrder,
        GTeamOrderField,
        GTeamPrivacy,
        GTeamRepositoryOrder,
        GTeamRepositoryOrderField,
        GTeamReviewAssignmentAlgorithm,
        GTeamRole,
        GTopicSuggestionDeclineReason,
        GTransferIssueInput,
        GURI,
        GUnarchiveRepositoryInput,
        GUnfollowUserInput,
        GUnlinkRepositoryFromProjectInput,
        GUnlockLockableInput,
        GUnmarkDiscussionCommentAsAnswerInput,
        GUnmarkFileAsViewedInput,
        GUnmarkIssueAsDuplicateInput,
        GUnminimizeCommentInput,
        GUnpinIssueInput,
        GUnresolveReviewThreadInput,
        GUpdateBranchProtectionRuleInput,
        GUpdateCheckRunInput,
        GUpdateCheckSuitePreferencesInput,
        GUpdateDiscussionCommentInput,
        GUpdateDiscussionInput,
        GUpdateEnterpriseAdministratorRoleInput,
        GUpdateEnterpriseAllowPrivateRepositoryForkingSettingInput,
        GUpdateEnterpriseDefaultRepositoryPermissionSettingInput,
        GUpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput,
        GUpdateEnterpriseMembersCanCreateRepositoriesSettingInput,
        GUpdateEnterpriseMembersCanDeleteIssuesSettingInput,
        GUpdateEnterpriseMembersCanDeleteRepositoriesSettingInput,
        GUpdateEnterpriseMembersCanInviteCollaboratorsSettingInput,
        GUpdateEnterpriseMembersCanMakePurchasesSettingInput,
        GUpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput,
        GUpdateEnterpriseMembersCanViewDependencyInsightsSettingInput,
        GUpdateEnterpriseOrganizationProjectsSettingInput,
        GUpdateEnterpriseProfileInput,
        GUpdateEnterpriseRepositoryProjectsSettingInput,
        GUpdateEnterpriseTeamDiscussionsSettingInput,
        GUpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput,
        GUpdateEnvironmentInput,
        GUpdateIpAllowListEnabledSettingInput,
        GUpdateIpAllowListEntryInput,
        GUpdateIpAllowListForInstalledAppsEnabledSettingInput,
        GUpdateIssueCommentInput,
        GUpdateIssueInput,
        GUpdateLabelInput,
        GUpdateNotificationRestrictionSettingInput,
        GUpdateProjectCardInput,
        GUpdateProjectColumnInput,
        GUpdateProjectInput,
        GUpdatePullRequestInput,
        GUpdatePullRequestReviewCommentInput,
        GUpdatePullRequestReviewInput,
        GUpdateRefInput,
        GUpdateRefsInput,
        GUpdateRepositoryInput,
        GUpdateSubscriptionInput,
        GUpdateTeamDiscussionCommentInput,
        GUpdateTeamDiscussionInput,
        GUpdateTeamReviewAssignmentInput,
        GUpdateTopicsInput,
        GUserBlockDuration,
        GUserStatusOrder,
        GUserStatusOrderField,
        GVerifiableDomainOrder,
        GVerifiableDomainOrderField,
        GVerifyVerifiableDomainInput,
        GX509Certificate;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GAcceptEnterpriseAdministratorInvitationInput,
  GAcceptTopicSuggestionInput,
  GAddAssigneesToAssignableInput,
  GAddCommentInput,
  GAddDiscussionCommentInput,
  GAddEnterpriseSupportEntitlementInput,
  GAddLabelsToLabelableInput,
  GAddProjectCardInput,
  GAddProjectColumnInput,
  GAddPullRequestReviewCommentInput,
  GAddPullRequestReviewInput,
  GAddPullRequestReviewThreadInput,
  GAddReactionInput,
  GAddStarInput,
  GAddUpvoteInput,
  GAddVerifiableDomainInput,
  GApproveDeploymentsInput,
  GApproveVerifiableDomainInput,
  GArchiveRepositoryInput,
  GAuditLogOrder,
  GAuditLogOrderField,
  GCancelEnterpriseAdminInvitationInput,
  GChangeUserStatusInput,
  GCheckAnnotationData,
  GCheckAnnotationLevel,
  GCheckAnnotationRange,
  GCheckConclusionState,
  GCheckRunAction,
  GCheckRunFilter,
  GCheckRunOutput,
  GCheckRunOutputImage,
  GCheckRunType,
  GCheckStatusState,
  GCheckSuiteAutoTriggerPreference,
  GCheckSuiteFilter,
  GClearLabelsFromLabelableInput,
  GCloneProjectInput,
  GCloneTemplateRepositoryInput,
  GCloseIssueInput,
  GClosePullRequestInput,
  GCollaboratorAffiliation,
  GCommentAuthorAssociation,
  GCommentCannotUpdateReason,
  GCommitAuthor,
  GCommitContributionOrder,
  GCommitContributionOrderField,
  GContributionLevel,
  GContributionOrder,
  GConvertProjectCardNoteToIssueInput,
  GConvertPullRequestToDraftInput,
  GCreateBranchProtectionRuleInput,
  GCreateCheckRunInput,
  GCreateCheckSuiteInput,
  GCreateContentAttachmentInput,
  GCreateDeploymentInput,
  GCreateDeploymentStatusInput,
  GCreateDiscussionInput,
  GCreateEnterpriseOrganizationInput,
  GCreateEnvironmentInput,
  GCreateIpAllowListEntryInput,
  GCreateIssueInput,
  GCreateLabelInput,
  GCreateProjectInput,
  GCreatePullRequestInput,
  GCreateRefInput,
  GCreateRepositoryInput,
  GCreateTeamDiscussionCommentInput,
  GCreateTeamDiscussionInput,
  GDate,
  GDateTime,
  GDeclineTopicSuggestionInput,
  GDefaultRepositoryPermissionField,
  GDeleteBranchProtectionRuleInput,
  GDeleteDeploymentInput,
  GDeleteDiscussionCommentInput,
  GDeleteDiscussionInput,
  GDeleteEnvironmentInput,
  GDeleteIpAllowListEntryInput,
  GDeleteIssueCommentInput,
  GDeleteIssueInput,
  GDeleteLabelInput,
  GDeletePackageVersionInput,
  GDeleteProjectCardInput,
  GDeleteProjectColumnInput,
  GDeleteProjectInput,
  GDeletePullRequestReviewCommentInput,
  GDeletePullRequestReviewInput,
  GDeleteRefInput,
  GDeleteTeamDiscussionCommentInput,
  GDeleteTeamDiscussionInput,
  GDeleteVerifiableDomainInput,
  GDeploymentOrder,
  GDeploymentOrderField,
  GDeploymentProtectionRuleType,
  GDeploymentReviewState,
  GDeploymentState,
  GDeploymentStatusState,
  GDiffSide,
  GDisablePullRequestAutoMergeInput,
  GDiscussionOrder,
  GDiscussionOrderField,
  GDismissPullRequestReviewInput,
  GDraftPullRequestReviewComment,
  GDraftPullRequestReviewThread,
  GEnablePullRequestAutoMergeInput,
  GEnterpriseAdministratorInvitationOrder,
  GEnterpriseAdministratorInvitationOrderField,
  GEnterpriseAdministratorRole,
  GEnterpriseDefaultRepositoryPermissionSettingValue,
  GEnterpriseEnabledDisabledSettingValue,
  GEnterpriseEnabledSettingValue,
  GEnterpriseMemberOrder,
  GEnterpriseMemberOrderField,
  GEnterpriseMembersCanCreateRepositoriesSettingValue,
  GEnterpriseMembersCanMakePurchasesSettingValue,
  GEnterpriseServerInstallationOrder,
  GEnterpriseServerInstallationOrderField,
  GEnterpriseServerUserAccountEmailOrder,
  GEnterpriseServerUserAccountEmailOrderField,
  GEnterpriseServerUserAccountOrder,
  GEnterpriseServerUserAccountOrderField,
  GEnterpriseServerUserAccountsUploadOrder,
  GEnterpriseServerUserAccountsUploadOrderField,
  GEnterpriseServerUserAccountsUploadSyncState,
  GEnterpriseUserAccountMembershipRole,
  GEnterpriseUserDeployment,
  GFileViewedState,
  GFollowUserInput,
  GFundingPlatform,
  GGistOrder,
  GGistOrderField,
  GGistPrivacy,
  GGitObjectID,
  GGitRefname,
  GGitSSHRemote,
  GGitSignatureState,
  GGitTimestamp,
  GHTML,
  GIdentityProviderConfigurationState,
  GImportProjectInput,
  GInviteEnterpriseAdminInput,
  GIpAllowListEnabledSettingValue,
  GIpAllowListEntryOrder,
  GIpAllowListEntryOrderField,
  GIpAllowListForInstalledAppsEnabledSettingValue,
  GIssueCommentOrder,
  GIssueCommentOrderField,
  GIssueFilters,
  GIssueOrder,
  GIssueOrderField,
  GIssueState,
  GIssueTimelineItemsItemType,
  GLabelOrder,
  GLabelOrderField,
  GLanguageOrder,
  GLanguageOrderField,
  GLinkRepositoryToProjectInput,
  GLockLockableInput,
  GLockReason,
  GMarkDiscussionCommentAsAnswerInput,
  GMarkFileAsViewedInput,
  GMarkPullRequestReadyForReviewInput,
  GMergeBranchInput,
  GMergePullRequestInput,
  GMergeStateStatus,
  GMergeableState,
  GMilestoneOrder,
  GMilestoneOrderField,
  GMilestoneState,
  GMinimizeCommentInput,
  GMoveProjectCardInput,
  GMoveProjectColumnInput,
  GNotificationRestrictionSettingValue,
  GOauthApplicationCreateAuditEntryState,
  GOperationType,
  GOrderDirection,
  GOrgAddMemberAuditEntryPermission,
  GOrgCreateAuditEntryBillingPlan,
  GOrgRemoveBillingManagerAuditEntryReason,
  GOrgRemoveMemberAuditEntryMembershipType,
  GOrgRemoveMemberAuditEntryReason,
  GOrgRemoveOutsideCollaboratorAuditEntryMembershipType,
  GOrgRemoveOutsideCollaboratorAuditEntryReason,
  GOrgUpdateDefaultRepositoryPermissionAuditEntryPermission,
  GOrgUpdateMemberAuditEntryPermission,
  GOrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility,
  GOrganizationInvitationRole,
  GOrganizationInvitationType,
  GOrganizationMemberRole,
  GOrganizationMembersCanCreateRepositoriesSettingValue,
  GOrganizationOrder,
  GOrganizationOrderField,
  GPackageFileOrder,
  GPackageFileOrderField,
  GPackageOrder,
  GPackageOrderField,
  GPackageType,
  GPackageVersionOrder,
  GPackageVersionOrderField,
  GPinIssueInput,
  GPinnableItemType,
  GPinnedDiscussionGradient,
  GPinnedDiscussionPattern,
  GPreciseDateTime,
  GProjectCardArchivedState,
  GProjectCardImport,
  GProjectCardState,
  GProjectColumnImport,
  GProjectColumnPurpose,
  GProjectOrder,
  GProjectOrderField,
  GProjectState,
  GProjectTemplate,
  GPullRequestMergeMethod,
  GPullRequestOrder,
  GPullRequestOrderField,
  GPullRequestReviewCommentState,
  GPullRequestReviewDecision,
  GPullRequestReviewEvent,
  GPullRequestReviewState,
  GPullRequestState,
  GPullRequestTimelineItemsItemType,
  GPullRequestUpdateState,
  GReactionContent,
  GReactionOrder,
  GReactionOrderField,
  GRefOrder,
  GRefOrderField,
  GRefUpdate,
  GRegenerateEnterpriseIdentityProviderRecoveryCodesInput,
  GRegenerateVerifiableDomainTokenInput,
  GRejectDeploymentsInput,
  GReleaseOrder,
  GReleaseOrderField,
  GRemoveAssigneesFromAssignableInput,
  GRemoveEnterpriseAdminInput,
  GRemoveEnterpriseIdentityProviderInput,
  GRemoveEnterpriseOrganizationInput,
  GRemoveEnterpriseSupportEntitlementInput,
  GRemoveLabelsFromLabelableInput,
  GRemoveOutsideCollaboratorInput,
  GRemoveReactionInput,
  GRemoveStarInput,
  GRemoveUpvoteInput,
  GReopenIssueInput,
  GReopenPullRequestInput,
  GRepoAccessAuditEntryVisibility,
  GRepoAddMemberAuditEntryVisibility,
  GRepoArchivedAuditEntryVisibility,
  GRepoChangeMergeSettingAuditEntryMergeType,
  GRepoCreateAuditEntryVisibility,
  GRepoDestroyAuditEntryVisibility,
  GRepoRemoveMemberAuditEntryVisibility,
  GReportedContentClassifiers,
  GRepositoryAffiliation,
  GRepositoryContributionType,
  GRepositoryInteractionLimit,
  GRepositoryInteractionLimitExpiry,
  GRepositoryInteractionLimitOrigin,
  GRepositoryInvitationOrder,
  GRepositoryInvitationOrderField,
  GRepositoryLockReason,
  GRepositoryOrder,
  GRepositoryOrderField,
  GRepositoryPermission,
  GRepositoryPrivacy,
  GRepositoryVisibility,
  GRequestReviewsInput,
  GRequestableCheckStatusState,
  GRerequestCheckSuiteInput,
  GResolveReviewThreadInput,
  GSamlDigestAlgorithm,
  GSamlSignatureAlgorithm,
  GSavedReplyOrder,
  GSavedReplyOrderField,
  GSearchType,
  GSecurityAdvisoryEcosystem,
  GSecurityAdvisoryIdentifierFilter,
  GSecurityAdvisoryIdentifierType,
  GSecurityAdvisoryOrder,
  GSecurityAdvisoryOrderField,
  GSecurityAdvisorySeverity,
  GSecurityVulnerabilityOrder,
  GSecurityVulnerabilityOrderField,
  GSetEnterpriseIdentityProviderInput,
  GSetOrganizationInteractionLimitInput,
  GSetRepositoryInteractionLimitInput,
  GSetUserInteractionLimitInput,
  GSponsorableOrder,
  GSponsorableOrderField,
  GSponsorsGoalKind,
  GSponsorsTierOrder,
  GSponsorsTierOrderField,
  GSponsorshipOrder,
  GSponsorshipOrderField,
  GSponsorshipPrivacy,
  GStarOrder,
  GStarOrderField,
  GStatusState,
  GSubmitPullRequestReviewInput,
  GSubscriptionState,
  GTeamDiscussionCommentOrder,
  GTeamDiscussionCommentOrderField,
  GTeamDiscussionOrder,
  GTeamDiscussionOrderField,
  GTeamMemberOrder,
  GTeamMemberOrderField,
  GTeamMemberRole,
  GTeamMembershipType,
  GTeamOrder,
  GTeamOrderField,
  GTeamPrivacy,
  GTeamRepositoryOrder,
  GTeamRepositoryOrderField,
  GTeamReviewAssignmentAlgorithm,
  GTeamRole,
  GTopicSuggestionDeclineReason,
  GTransferIssueInput,
  GURI,
  GUnarchiveRepositoryInput,
  GUnfollowUserInput,
  GUnlinkRepositoryFromProjectInput,
  GUnlockLockableInput,
  GUnmarkDiscussionCommentAsAnswerInput,
  GUnmarkFileAsViewedInput,
  GUnmarkIssueAsDuplicateInput,
  GUnminimizeCommentInput,
  GUnpinIssueInput,
  GUnresolveReviewThreadInput,
  GUpdateBranchProtectionRuleInput,
  GUpdateCheckRunInput,
  GUpdateCheckSuitePreferencesInput,
  GUpdateDiscussionCommentInput,
  GUpdateDiscussionInput,
  GUpdateEnterpriseAdministratorRoleInput,
  GUpdateEnterpriseAllowPrivateRepositoryForkingSettingInput,
  GUpdateEnterpriseDefaultRepositoryPermissionSettingInput,
  GUpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput,
  GUpdateEnterpriseMembersCanCreateRepositoriesSettingInput,
  GUpdateEnterpriseMembersCanDeleteIssuesSettingInput,
  GUpdateEnterpriseMembersCanDeleteRepositoriesSettingInput,
  GUpdateEnterpriseMembersCanInviteCollaboratorsSettingInput,
  GUpdateEnterpriseMembersCanMakePurchasesSettingInput,
  GUpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput,
  GUpdateEnterpriseMembersCanViewDependencyInsightsSettingInput,
  GUpdateEnterpriseOrganizationProjectsSettingInput,
  GUpdateEnterpriseProfileInput,
  GUpdateEnterpriseRepositoryProjectsSettingInput,
  GUpdateEnterpriseTeamDiscussionsSettingInput,
  GUpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput,
  GUpdateEnvironmentInput,
  GUpdateIpAllowListEnabledSettingInput,
  GUpdateIpAllowListEntryInput,
  GUpdateIpAllowListForInstalledAppsEnabledSettingInput,
  GUpdateIssueCommentInput,
  GUpdateIssueInput,
  GUpdateLabelInput,
  GUpdateNotificationRestrictionSettingInput,
  GUpdateProjectCardInput,
  GUpdateProjectColumnInput,
  GUpdateProjectInput,
  GUpdatePullRequestInput,
  GUpdatePullRequestReviewCommentInput,
  GUpdatePullRequestReviewInput,
  GUpdateRefInput,
  GUpdateRefsInput,
  GUpdateRepositoryInput,
  GUpdateSubscriptionInput,
  GUpdateTeamDiscussionCommentInput,
  GUpdateTeamDiscussionInput,
  GUpdateTeamReviewAssignmentInput,
  GUpdateTopicsInput,
  GUserBlockDuration,
  GUserStatusOrder,
  GUserStatusOrderField,
  GVerifiableDomainOrder,
  GVerifiableDomainOrderField,
  GVerifyVerifiableDomainInput,
  GViewerDetail,
  GViewerDetailData,
  GViewerDetailData_viewer,
  GViewerDetailVars,
  GX509Certificate
])
final Serializers serializers = _serializersBuilder.build();
