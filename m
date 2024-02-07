Return-Path: <virtio-comment-return-9076-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EF1C4828D
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 51F792AED5
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 320B39868E4
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1531C9868D7; Wed,  7 Feb 2024 07:24:08 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0308F9868D8
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Feb 2024 07:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7w0c23lZ4VyDWxTRG8df6NJdhe9rfvA26Gqg4UXiyGVWSVeQGsR4Ono8JLZYP7G1ggWOybgxgsDY6QDo6p+7/MFQ4y+HtDLuzGrL7HfzRC4Msmf2yvb+Pgl0CxsdQhAYUNQrnzZj8drM49nP+8Pfl6KDmw2C8AThbRbM6frpKKbmDZo0jq37J31826nbz/GcIG23lXb9JhmeU9oH0uz15RHvKFAQv1z5ipDkoJAGAAajmsYBFPOWZpp9NuLQtXnZZZ5Zg7q/XxaPaFM3C0IF+G7KIKM2V/YOuAxWzL7Qp3VgD6xetFoLawkFs6Uf9uAcXNDwpFj+ZnBTC6+jA2vCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YSZDR227wiRxpo4fdWZEX8t2PQs3+lZL0G7e/kR2zc=;
 b=XGT6cYwnn3R1fHppqLRLMGa98X96X5Gdn1/Bqp2/P4nhBcfxJbReRqeR7BDirNUQRv3iJFiv0p6i1EnPzhlYVqHX3FFG9MfJ/lwLNjB/PLYs/BLbh38tcKRIGKDVGBw5WsLbtYIowRNuFQfTLhf4cka6QXGsnpCgVEoNXOV9hiN2bnsYBEMZ6mgjGiwizDqIvSPOQkqXXJcQJCyhWnpDvVRkn40lDyxbKvpj+UiORd6gOVOd2d7dcVAtwuziIs5+n2eL5qxVtXP31tBatPshchnvrtJEVuBvk2hG6pjrmkV/q6u6vGLcS1p99EutKW6zYZvIXgR7IUikcxwIxZMiBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Date: Wed, 7 Feb 2024 09:23:24 +0200
Message-ID: <20240207072336.477606-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207072336.477606-1-parav@nvidia.com>
References: <20240207072336.477606-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|CY8PR12MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: 04f912b8-2566-49ee-9695-08dc27adc396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xD5TURvHFJDMFFdUgDqLojEyubdvDL1r6HwVP5h7M2SRn457UUVbX8nrJ4p4OAoeKgQUp7fty0ILlOSFk5z7lqk45+TST2RXYqHntsNBlIqideTU0El19dtREnCcLxDRuJetWn4r1J+5eI3azYiVfSi+/YYYRBegNGx7/GEdiFBCQ9uY5j2t22DoxwjCNdHrj74GysncAz6B5eTYVP6h3TeNqVBzQlsdFV8a+c0uBIUsvg3oz29NJv755T+vSf+MDcSeomn6Nt6HvJm0H2/cFqYk1y5USsGUcn5Nze2/R7/D6pVcm0uYhOm+ltCnTdmoYlFlQG8KeKgV6RVJBVvShaYcZwP5oezDFfA3CZIUHBq28ksIWWDzlQAEHYlhNRY25w6v8OefjCfG8HzuL+cWywT81i8+QD7QTCW+hIZkSR0H3uF+VrMJjnUJW4b/6hvpSkey3fiUfLRBnCvfQOkQ3C+xCfGg4qBR0XMFioscWNqp1MMVPVwe25Jf0Y/g/VPlfqEMO6PuAJwDsGzLAv7tvIqCeU7sWqfMWl2O9LcuY2c9yvdZ+FY69z0UJAYunxVacWIh2zHSdk89ETVV8znOPMDYDV3p1U8shcE2Mt4M6MuusUWLehwM0POTtM+/LgpX4GLLmIvjNY1mGY/0jaLfjgNqImqQZQU4TO3EvHQ4Ry/jqpEDBXXKf6LFWzSdYP991bQNpS1ta3wgwSwbm8amqyP27x7r0+GANDKonI7YImWbHyJIxaeluxkMe07g+BtAcPUz+nhYzTmSBiM7DQi27/eRBkmdz54o8SCkZ1TYUeY=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(1800799012)(186009)(451199024)(82310400011)(64100799003)(36840700001)(46966006)(40470700004)(86362001)(478600001)(4326008)(426003)(2906002)(70206006)(41300700001)(16526019)(2616005)(5660300002)(107886003)(26005)(110136005)(1076003)(336012)(70586007)(966005)(6666004)(8936002)(8676002)(316002)(54906003)(7636003)(36756003)(356005)(82740400003)(47076005)(40480700001)(83380400001)(40460700003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 07:24:04.2613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f912b8-2566-49ee-9695-08dc27adc396
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7316
Subject: [virtio-comment] [PATCH v9 01/13] admin: Introduce self group

Define self group to control the self device itself.

Subsequent patches introduces the concept of device capabilities
and device resources which utilizes the self group to access
capabilities and uses device resources to refer to the device itself.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin.tex | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/admin.tex b/admin.tex
index 0803c26..00784b3 100644
--- a/admin.tex
+++ b/admin.tex
@@ -1,7 +1,7 @@
 \section{Device groups}\label{sec:Basic Facilities of a Virtio Device / Device groups}
 
 It is occasionally useful to have a device control a group of
-other devices. Terminology used in such cases:
+other devices or self control. Terminology used in such cases:
 
 \begin{description}
 \item[Device group]
@@ -37,6 +37,11 @@ \section{Device groups}\label{sec:Basic Facilities of a Virtio Device / Device g
 
 The following group types, and their identifiers, are currently specified:
 \begin{description}
+\item[Self group type (0x0)]
+This device group refers to the device itself.
+The member identifier for this group has a value of 0x0. This group type
+is used by the driver to control the device itself.
+
 \item[SR-IOV group type (0x1)]
 This device group has a PCI Single Root I/O Virtualization
 (SR-IOV) physical function (PF) device as the owner and includes
@@ -78,6 +83,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
         /* Device-readable part */
         le16 opcode;
         /*
+         * 0       - Self
          * 1       - SR-IOV
          * 2-65535 - reserved
          */
-- 
2.34.1


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

