Return-Path: <virtio-comment-return-7060-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B62C001DB
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 08:22:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B4C93747D5
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 08:22:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A6119986479
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 08:22:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9DE3E98403A; Tue,  8 Aug 2023 08:22:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8CC1D986460;
	Tue,  8 Aug 2023 08:22:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/0rRsmKb3d9o9cW61EwMroiPPdDfHeNhlTmlRnE/IDeuVZ63hFxtUP36F2JbZvg1Uixs+Cyw9wP0gZVTwzpeg0vAlWS2bobk+nXPBbPRZL1TSYUYR86FCBK9pjcSM8Vbk1KEufwscfDmCki2xWT3DULeb4loZwSOlCmK6UaZMsUwUhVaIYzQWt5dE7Vq78AxueQyEjTn/A4nEiYqnwYDIlIerN+aOlCkqcWDrmLF9F8QfFY/J0hEO3AgQoYonMZ1M9D9G780Ve7TsWpcUtxUIx8poBPQnLyCxmG0AD/hzRDHXUxlIgLowRQ/PIwzslAKGEaSUoZDeB2FemgVdHUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=mx0BxBWuvp6Nzrow36OOjG89mq+wZcljn+lvSP1CYc4i+qIOjaBdjvuaN7KWHuWP4JeaK/mTJr8d9yW9L8IU1lgSmku2+r+uERqs/58r0OrVSu27uSfRt3OeQ95Hk/p8yRnFtt6T3Itzf0P9c0JhXSHRRj/GTcIckdDEE9/XE7InHRUJl3eTBs0CXYx4WDgr0qIkRzEX89UjNrDQ1MZmG3h9/u/7ycAPF2CcZ/a5CfC/2bceZf9Eob/Y7Nn019UxLbEbVrTNknWSzhMFVTYPO6ODDOPeZ5RBDvoPfJ74qYlS0f9zM7kpe/CNCw4nI8VQdTaR4zicdG7APOISvAWTyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-2-parav@nvidia.com>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Parav Pandit <parav@nvidia.com>
Cc: shahafs@nvidia.com, hengqi@linux.alibaba.com, virtio@lists.oasis-open.org,
        virtio-comment@lists.oasis-open.org
Date: Tue, 08 Aug 2023 09:16:14 +0100
In-reply-to: <20230724033421.249893-2-parav@nvidia.com>
Message-ID: <m28ramndtk.fsf@oracle.com>
Content-Type: text/plain
Suggest: 
X-ClientProxiedBy: LO4P123CA0059.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::10) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|CO1PR10MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: 25caa7c3-101a-4710-69d9-08db97e89f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lEv6gQcV65CvQk8vIp/u3F+uLyqcu6yOKWoLdghGTjZi4tWFQClCritKahkYXaZt4cim6TiEulWof3yFbQf2KPXEDsNWW0Yp/AvPPIgTIXHIQvp87LsGn59xK4Aq2WedB9BqtXREBylwuTGZBW66T+dquindRJBSsBwTU9/83OEyr8yuGaN0+wRhCYDM9MfFk/+BO4vbC4dqV8vFv9f16Och+OSANQeD7wMfFfrIs2Qb5TFvJ5CqddlLdSQt7cDrnsbNCyoC97Db9biS4m2ERb+/u7HihG1z58oAuYj80oePD7NlFDYkXpsj5xucBVWNQDp3zQGGnQ4U4OYfrk9aKVRkmAB5uZ2cNX/WAsYgTdvHH08OCev9evn9aLOnpqTdEpePmMcStckjNd8rApSAQA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(136003)(396003)(39860400002)(90021799007)(1800799003)(186006)(451199021)(90011799007)(26005)(2906002)(73894004)(44832011)(621065003)(8676002)(41300700001)(8936002)(4270600006)(2616005)(6916009)(316002)(6506007)(6486002)(38100700002)(66476007)(66556008)(66946007)(6666004)(86362001)(478600001)(6512007)(4326008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?brWWJ3xvL3BhVtrRFYFYX9JLKv3LuLT/DXbv+5OyD8gSKFQcmABc6HrMaORa?=
 =?us-ascii?Q?Rp23UY8ZVli/PhotilLn/EcjCImQAfOnucAldiv7CJpDFrPY2pF2F5AMrzCE?=
 =?us-ascii?Q?dJMrloXHXaAtua2AiXftnEit+SZZdXTls8DChI06/LbjMRE9MksrTZId0CiP?=
 =?us-ascii?Q?44gw17KB3fxkatqXboeuDgcjj7eRwJSfDfTJOAyF4EPw9HDw6w4ZAZFbvofB?=
 =?us-ascii?Q?QMdxu9565Y0J/hIUvhCxsFzW8diiBqLpN7Cj42a1C2pjzVfZ8NDtn8WOZgZ4?=
 =?us-ascii?Q?kbCBP4f/hjV5zUo7xo9gzcKix0l+z9H68tNqYc0U6h3CrmDTt4dsRfLTrlnr?=
 =?us-ascii?Q?6bp6H9enqSx2AyxzFZemPEGSsGONdnSDMypob4lia7NQfzqw5UvtDJiyaZTJ?=
 =?us-ascii?Q?lUShXoJTUosSIvVH1RbZ7BSGZFtxTJI1OBX0hGNhwbMPrQNtZX6Vru0PxPBU?=
 =?us-ascii?Q?ACqJb7mVqK0EvJQXFs418ek6tpqb/+OcZnyWsyYhQXtXrtvAg//EMg/GBLqj?=
 =?us-ascii?Q?FPDClcGXv5MCRD70SRIRmj/Arq71hZZvlG1e9zouE4KSEbMwmuUSnD76O4lg?=
 =?us-ascii?Q?hwO7qQtcqGOs2YEn1lHfAtIzL8r+KfmYPV9S7+eX4uEyTZD4AU6s+3zjmBXO?=
 =?us-ascii?Q?ECV51e+JZeRAWdu+dI05czUq0EOZi+JJHkMs1Zuz2qfOQaE5/S2psFjtRfKU?=
 =?us-ascii?Q?faFBo3nWwQH7AchS4s0bQPYDKvS/8ZFNEQ7xuMzuDhQRIR1yRwEttpwthGuw?=
 =?us-ascii?Q?Lg7oPNVd0evHioe05fTQwdtO07a6lWiZUWeG8T3PY0Y4mPbZR1p5n+b1+a0W?=
 =?us-ascii?Q?E7jkL5NWmbqM5RVw7LLUHeC2Xqkd5pQPFs7LqGlw95NbAEz9b7J2Pwvzv6H9?=
 =?us-ascii?Q?gji/pWKe2I+tiDD98A5ugU/QrgDZ/og7WdCnhbRNmvPVUSoj4gLddzMiFgl9?=
 =?us-ascii?Q?vVVrd0vmGgfX8pSqLd9xnzzl9qkgLt2cM/aEUcxKaIRaf60Y67xPC7vEfIUe?=
 =?us-ascii?Q?TfWS39TbtB2UK5WrNSB8O7cO+rj5BCfwv5nloOa4mpbKv20FWMUL3VWNTxdT?=
 =?us-ascii?Q?zt3hM3ascbtFsnHFnQGxqzhNg6oG4BjhjDyMqoWg65FhwjeYiI7MwVSsScCV?=
 =?us-ascii?Q?ve8mYFoSCtSoeVS8oIlwtv6YS1YUOy91xmcBpAZn3AOjv6258NNhDcqObUx9?=
 =?us-ascii?Q?+iPExtQwiTOldjPZ2deDH2do7bose49M20jgILSTQa0en5p8DIes7qHeUQjs?=
 =?us-ascii?Q?T7mdS9VBpeCPJUDNDdsVw9SyuEGGkaiuFmB3cDBY0CR6JB3n/QhVcjxpEXrG?=
 =?us-ascii?Q?6lE3T0srFR2s6scen42GB+kQ4bkNJzS86aPSCFmQv9L2C6X/NkoqLM+OyhsI?=
 =?us-ascii?Q?9g8FVkWSyB04jNrFPBYbuhq9Y2O1sCDbWoVQkRGeIRgWMxCsamEcR2MxEkh9?=
 =?us-ascii?Q?lzTQZ8D1b1h5rrTEkacNjMfhIO7Rr1R6nRlMLjeVi4CSUE7tvXy4LW9pRmO2?=
 =?us-ascii?Q?MMt+o3+TkXdlnX/jTJWbHKCx4vIabhB27WBj5Lfa9q0ltyqioiMyOh4vEiry?=
 =?us-ascii?Q?1QAhieBtP0V2ll2tO+IQiLkgAZJbCB3jsBFWo+wB08TmOnnjVD0Ijr0Tiu7i?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	s/6MxoDx31sSK9TtQTOrTPyDtRdQOdSN7lVZLJ18RlNrXb/3iNimUcFNVt8tj0MeNneSjdZOQJmiPaSaf6Bh624SQUU1mYUuEwnAJNSIC+zUrEh1E9I979JvmWr8+jzFp7d61eKgAWoo+IY5pYd0AHZZ+oK4IObv8DLnW7LD2uAsHs+5CEgfXzaGF1hwe1INK1Okeh2xWgOtw0R2nIl1int02jz4egIsGrigMgVTM4zH43+JMIoStBHDomSShru/0xtdA5lav5seMMdbZLbGqUWF+NMqQiPdO69ggm557K4xRGm3WD8fTjwRq6c7+VUYT6boULhWxUkpl9AxaCQB518YpHr5PgGZnHH2tIKS11ofceFyvyPENzkxrxAwsxVQCel8lqRuA60+IAZdpPjiOx/DUqgp+nDZ55G8z0/ZLPlyI0Wv9U/StDpHQLysnwwp5YcbUBBpPoLTSe/235VMz5Guglx/x0xUyF/Zc9qx/DlGE/r6z/6jpvbmbcJ2Dsqe5udcbgeOPejWc6GsuTiXVSqlTS8KQwNN/vGA8af1nDZUA0HZi+Ew72/yBq7ocgh/SISKwykrFNcZPaUXMjE7WgpIvRHLMhlzMz5ghCqsNmo7NNy6PJ0S7AGTo71IDfbeynrgzwg/Lz/CT3N3cJAE4FKNQzu8lrVh0SK4a2ZBQuhBu3v8f+skUeWwqMPlPspBz90gMWvPlj1qq84jenlbYrIQDwD7kx8DPoPNsaGe8wcVi/zI7RT2qbDCy+bLncN6hMN3Z9rDyDQaBWvJ83RTRWu4RnGkmuB1mgvTHvppplzHzi8GUFHumG5fkOZnHa2KjFa5iGvZzaC9BjcPuKoPGZHtouvWcua8uERSyoihioo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25caa7c3-101a-4710-69d9-08db97e89f51
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 08:22:36.5962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQscTlKMAVu/31TKbx9AhSnSPMwvTwWKHvz6jjaKh3+1A2Cs8xxz95clvD+TeXgFVL/BG4sSo6+hehvE03kuU9uGndUsawez5+LLv7Q8k64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: 
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 spamscore=0
 adultscore=0 mlxlogscore=813 bulkscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308080074
X-Proofpoint-GUID: rOD0yImWA3IeINiUY6mQ58F1DSNoaBU6
X-Proofpoint-ORIG-GUID: rOD0yImWA3IeINiUY6mQ58F1DSNoaBU6
Subject: Re: [virtio-comment] [PATCH requirements 1/7] net-features: Add
 requirements document for release 1.4


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

