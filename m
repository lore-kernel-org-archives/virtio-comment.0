Return-Path: <virtio-comment-return-8975-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8733DC4725D
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:26:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F06C2F3F4F
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:26:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DF2DB9867B7
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:26:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D49C7986484; Fri, 19 Jan 2024 19:26:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B61979867D4
	for <virtio-comment@lists.oasis-open.org>; Fri, 19 Jan 2024 19:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfG1y5caqBt0jkBqf+RY53PiJwggurBbWnrFeKMe0/FcItLW8cqWACmhKfNfZB/xiqW5H+hYtWXfv47DS5AmZ9PzVzSRa2ctFg4rBBLBNbbcz5mxdJJS7iWTfs4aOMQU7d0Tk5rIOp77UBuTQkWY2aP82fj17S638byQHe7KY063NzeLiV6L0Ysfs1AYps4V11dv97Q3muOiqJ/Wai7dSN18tcfDyaOTcYZc62YYK3+djxW7VfOt2yXCXWp8LshfHLLv4yFehgnR6KOkDm0AHn8Z2iqGE4uQenyCrfuPUMxnU/JWleMtcIbTa8bVO6Om3jh0fhFqz+PTVcX1mYOztA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHuN5uqBiha2UwHZEjFycA6ay8Qw3pvmEc9LiF0iHV4=;
 b=EhcmDliYd2oWqy5TCiD+Drie+TO3mHIr9Eg01Xd9GIhxIVxru4FMX2tdka8mNr6dboGIC69I/B97JWj+XFnHB5qrTc/VD1D1gktxUBfOiQ0pBHI6MFrHWWd/TlsaktB97OwlDIba+YwqGyFe7Zs/mL19UIpLx4cV2OhWVGNVYTvnDHa/tXug6Ks41RkL3XJfSaGeUxZgEN3M630ITFapmR520SnKEZktL1ORbdcpWpzGmjTJfzczUiKB9L2ufUQzb1urLaKrgHTsJ6fEF8tO4dYv/Xa/wkKKjqOnSLz23F/D/bHITDGmuj9z+7Y5dRL3aAJDdjynMMK29sxBlc0KrA==
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
Date: Fri, 19 Jan 2024 21:24:48 +0200
Message-ID: <20240119192452.3571467-10-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240119192452.3571467-1-parav@nvidia.com>
References: <20240119192452.3571467-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|DM4PR12MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: daf42af4-5286-44fa-159b-08dc19247868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yAdb+/sGSQGnqWNKCPSZU8kaeQX1OHJMw2y71JxRvTOCv3rUzSlbqbSMpk2z8gM+qcmlBBwCAH5nUiOFEXMD6O14uhreqtqXemZWehCNBssi7YpcJUC4ER4/uylwRFLW/sE2STFifo/6TPVpuuE4kZBBZ+e/MIcYjEq2QKK3h26zCd9Chqz0hkPGEA96KSUnGRSkoUPp8vqFacVm1mcgnPx9NV3oXcLA1F3Kienc3xkX6nmfbDQFE1j+VHpbOth58jP7+rdyiY+VpVdatLT+9DCJ/rscays9fm1//X7q2dB2p0RwbKqIzdfZWz5rnIxmkheT+czK7JirJtcibq8yVV3/iXdXiDxij8FhNU+3moFWb4aW74GepFVbvPgaZYPARcyqvS+r1A7n0u7OcjIbEtDNirF8Kr13C3DWu51nqhhhgs7yNNkSeLJUtuVhzh7OdIi8/fH+aiiMYoQhpTLKYGR0EElD7IXC9n+9cInqU/bhidyD2FP+H0t0uh+k1MvHKgTNJcO0wKwiSNoFatRAV6nMJlsjnkNO/tQU+rzoMAGbK/OozE/03+zYNlbP62BoBoxJqob/rwMh7+VbHelzinboK3mz6m4SsuaAiZnz37gdXQMwQqnRnXifBGUAkJCS4OpGnev/wT8nQLAlj1UbWbSAkdMDimT0tHA5IvnkiC31NqvB8rPkngTnwx91htxCKNQl7stdbCaN/MeUT4eCKjdjaYHmzhFGZ616gFdwRZ1cBBiANi1S29B6kJY1VWguVmD8tPZ6VBk5UVcHmuhoQdU61pp/+WXIt1SL+n65p40=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(451199024)(82310400011)(64100799003)(1800799012)(186009)(36840700001)(46966006)(40470700004)(54906003)(316002)(47076005)(107886003)(70206006)(110136005)(70586007)(83380400001)(16526019)(5660300002)(36860700001)(8936002)(4326008)(8676002)(2616005)(966005)(426003)(336012)(1076003)(26005)(478600001)(36756003)(41300700001)(82740400003)(86362001)(2906002)(40480700001)(7636003)(356005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 19:26:00.9059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daf42af4-5286-44fa-159b-08dc19247868
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7597
Subject: [virtio-comment] [PATCH v7 09/13] virtio-net: Add flow filter group resource

A flow filter group resource holds the flow filter rules.
The device can have one or more flow filter groups. Each flow filter
group has its own priority. The group priority defines the packet
processing order in the flow filter domain.

Add resource definition for flow filter group.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>

---
changelog:
v6->v7:
- addressed comments from Cornelia
- reworded the description for group delete command
- rebased the series on top of generic resource framework
---
 device-types/net/description.tex | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index efe363b..05979e7 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -472,14 +472,33 @@ \subsubsection{Flow Filter Match Capabilities}\label{sec:Device Types / Network
 is supported or not.
 
 \field{num_types} indicates the length of the array \field{types}.
-Each array entry of \field{types} represents the fields of the packet
-which are supported for matching by the device.
-
 Each array entry of \field{types} represents packet match fields.
 
 For each \field{type} the \field{fields_bmap} indicates supported fields
 of the packet header which can be matched.
 
+\subsection{Device Resources}\label{sec:Device Types / Network Device / Device Resources}
+
+\begin{tabularx}{\textwidth}{ |l||l|X| }
+\hline
+type & Name & Description \\
+\hline \hline
+0x0200 & VIRTIO_NET_RESOURCE_FF_GROUP & Flow filter group \\
+\hline
+\end{tabularx}
+
+\subsubsection{Flow Filter Group}\label{sec:Device Types / Network Device / Device Resources / Flow Filter Group}
+
+For the device resource VIRTIO_NET_RESOURCE_FF_GROUP, the
+\field{resource_specific_data} is in the format of
+\field{struct virtio_net_resource_ff_group}.
+
+\begin{lstlisting}
+struct virtio_net_resource_ff_group {
+        le16 priority;	/* higher priority groups are processed first */
+};
+\end{lstlisting}
+
 \subsection{Device Operation}\label{sec:Device Types / Network Device / Device Operation}
 
 Packets are transmitted by placing them in the
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

