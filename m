Return-Path: <virtio-comment-return-9079-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59F7C4828D
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4AD38F4F
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2E5C39868EA
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1F5579868DA; Wed,  7 Feb 2024 07:24:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 116669868DB
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Feb 2024 07:24:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdX3yD0gIKKJctTN4KTO4FnnazBxLnLTYDISh0lYkkYTZsrmuL3pN/E86p5nu34PK1wgQPMqkPPPnrz5ojRXF+W7DEAkPu279KPdAxeEQee3f8aExr67WcFAnjqezBGDKltXxah/kgN7/2Nlb0h4m5oc2dAJ9wYkFopf9xvivRn5pXVoTdayBQAHRRhh5bBArWpUOJjvMpd5SdzkMwCXuK6eVu9atakYt2P19jWcZArkcdKDZbDIoz6tgME9mplG7fC9TfEWyi3sR+ySr5380OzckK7NsZ4L8eIXbNHfNLWFAs0cBZofbrRu/Bc+uiaw68xJ0RjZte7cHyFSQBNbnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbWVfHIlxLsMHy5wnqpsWolcwPAmafDGlh5Pf7nT8dg=;
 b=iCNuBKEQbUqyeAtbdus5QWMNYOxFPgBB0N9jLyH4j+UymH4Ww+joYvbUoqkG7s4DrlteiXbxWV6SB/A2AOiMsZ7WZHzg4YtBN4Kh25zJIN0c3MXR49JKHbQ73altpsmjkyVcr3uBZsgLA6X4s5vFlYCrZ7TWPt2vCSCKAFS59t8B0ggsWX7OdmK9503IFxhjmh76EXdin0Hv9AynA3R4BSmCS+GwSc2G/sT1y2OZGeeb0W5v1xyukgCCbirZIs+fUZ4avQECYaZDIdM/8w3QRw3R1lAFyyA8Xw4dxWCX3JnJjj6IWhJBEHPC3A7ibPkGBUjk2ZZFIYj+jvzoQufj5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Date: Wed, 7 Feb 2024 09:23:25 +0200
Message-ID: <20240207072336.477606-3-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|PH8PR12MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d79e799-81fd-45b2-af59-08dc27adc967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZcOg9s70dDNLc0/GAnGqr9WiZiHktGvJff9X59KiobQ+/7HLw2GgU8hk09LqDk4f2fGdsStDAbKZXraF27EM4rTEGhEU9fjWJi0SNNDBeW9jLURp3PtgeUH/gYLc2luUi/pez7aRqWfOw+q0oU4D7SeLc93Byo/2jJ6BT7TeSHUk3VdxRi7jBjdwDhqvr7WGfWX2FmCMzf5ml9pm/c7J8WHXCzYgFUPJRch1iSUPwT7D3m7e5450RHq2y1mmZ+SrRJSu2Z3+XPopV+0Ej9RYhYwCh2FX9JgbsOm4y3+kZEYmXnfRsip6QS8MdVbhrGM6fAawmlAFwu0jEp0prEqvL2ow9BzlQpM7IkrmQZvSec4cZzOG0bS1L3Ve3NHrKIOjEQnrYyzubCw3ivk1yoEWg4KFZoB1044vJOROmi646Qz2Qq2Vaq94Zxt1qgDtDu5kGiHhisOngQC38FNgLnFy54YPXPuo1zJQxNjRoZd49jhA6KA9yEeDgHQNmjvw6Mt8SfjTDB+Z4fo/hxod8ifXENt48gLN+oroRkkPMgSnKOyvfjSH5ET5ZPk3xoRf0kewdBul4myh4IWJOeqrxGR8dxQRqWV5XtX0vW3WLwmgilAU0UDbTPZ97NOEJqdgKBildjTxa9mvJtNdve/qSL4fTBydS3T9eYUSbKy0k/prnogBYu8U2ieTE98sLbbzpeHHd93OWz8AzCffaHoJrxhxgMqI3zvnKSIgU6skR0lkyB8lcVCUPhP9MEZJ+Gfr8iFG4cTaK+w3oncSLIjLpieXCg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(451199024)(186009)(1800799012)(82310400011)(64100799003)(40470700004)(46966006)(36840700001)(16526019)(41300700001)(82740400003)(356005)(26005)(2616005)(7636003)(107886003)(1076003)(47076005)(83380400001)(336012)(426003)(36860700001)(54906003)(2906002)(86362001)(8936002)(8676002)(316002)(4326008)(110136005)(6666004)(478600001)(5660300002)(70206006)(70586007)(966005)(40460700003)(40480700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 07:24:14.0046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d79e799-81fd-45b2-af59-08dc27adc967
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7349
Subject: [virtio-comment] [PATCH v9 02/13] admin: Add more admin command status error codes

Add more error code values to be used by new administration
commands in subsequent patches.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin.tex | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/admin.tex b/admin.tex
index 00784b3..fdf25c5 100644
--- a/admin.tex
+++ b/admin.tex
@@ -159,12 +159,20 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline \hline
 00   & VIRTIO_ADMIN_STATUS_OK    & successful completion  \\
 \hline
+06   & VIRTIO_ADMIN_STATUS_ENXIO & no such resource or address present \\
+\hline
 11   & VIRTIO_ADMIN_STATUS_EAGAIN    & try again \\
 \hline
 12   & VIRTIO_ADMIN_STATUS_ENOMEM    & insufficient resources \\
 \hline
+16   & VIRTIO_ADMIN_STATUS_EBUSY     & device or resource busy \\
+\hline
+17   & VIRTIO_ADMIN_STATUS_EEXIST    & device or resource exists \\
+\hline
 22   & VIRTIO_ADMIN_STATUS_EINVAL    & invalid command \\
 \hline
+28   & VIRTIO_ADMIN_STATUS_ENOSPC    & resources exhausted on device \\
+\hline
 other   & -    & group administration command error  \\
 \hline
 \end{tabular}
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

