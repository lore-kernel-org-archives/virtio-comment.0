Return-Path: <virtio-comment-return-9043-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC35C46CD2
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9BB2EC6116
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 851919868CD
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 75D7A986876; Tue, 30 Jan 2024 14:07:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5CA17986899
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Jan 2024 14:07:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uphootq1rQbPRZOv1sE5yeu8OKkJQX7S2Xj46NXmtFv5SGkMYIIKhKDbqogp0iohcU9wr7uW6uQdCMQMbSkbFo1QZhNNsRuGVDFqMtHB0kiON/duFvkIZHphXbICwQtDLmsdz6JHxN9QF1Cmn/xXd3e7BvK92mM2e0mr3lYmnskEb+ks3bmJ6U7mbeusKoWtOLdjRTgv/DzPr8R81vGFv2UWWe7JeM0uL02Ag+cdo8eWFizwC1tY59+yhIkB1tv1tNAXLY0TuAxs73/pYGRT8VdzScmSqepyaY2gkcDr2N+BQAop9I77z2ez3Gg0Y8tO33SHuh2/qE/6UVmVafE5bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkdO1BC5EvsBtJhQYwXa1sQvf4nD38p13P/s7igb0lY=;
 b=KTtMKBpl6RDmzS1hKGpJUk8n7tDQzjORcZEU/cCejQp7bvhhjH76CdHuVDt8svOvpj+XwEAkc4HH4VC0YGCUrUKAFsGIgOz22sDO7BcWzJRPac67lnFTVY7nzD8zCNbX770BhCBX+y8N6mr/79qnTRUC3gBgkhSAe2aFIkCZ90rR4hwXtur8urKnS1aOZefrZmzAd/ReONq23mDqHOd8uEImad1PWoObX0xgUn3bSYL8C2yzY73LwyxDPIiLoNRidmb2Y+a6Hkw3HVNlC/klfX69YLuiS5cOcNr+mNAmyH3WVJLDhrVmJzuoZ5LOBRgfn4KQRyEc7QH6qtW7fD6ahg==
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
Date: Tue, 30 Jan 2024 16:06:34 +0200
Message-ID: <20240130140642.406882-6-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130140642.406882-1-parav@nvidia.com>
References: <20240130140642.406882-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|MN0PR12MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fa3c6e0-a44e-47bb-68f5-08dc219ccc96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s7L1Eh6vSmYiaoW1ihJXRiRxHJDdH/v3xWGqCqe9/N5nLnaEieswMMLZrBt+MI5hGURrISNOV03Wf8WiNVJmMsXDETwIP+CUahcn8Cq7zdgjCd598HmUdAKDJzUCcBxytmjWL+SqvXw8PVLmFZA8HLstb11g9p6UYEeShVQ3zWvrZ0mxP5KgJv37msyhXBX76wLCB8kYpmHvygFNd/6FPaFyPnayeUDd0/plq5Q7r4MWXLG0o7R624fD1eYq13I9trq7ZRrfUHvDp/Ph3pKAHSwg5uVVFFlHZHrKo19Gps72ANPVaMiPgbLnfegENkpa4yZEw2va5abs/DloO43OG6MyVMxoWmaDTxqs2Ve2hvMZZwyByw39MDkwBi712tv3zNORhqr9js0ro9sPoMl5l19yEzgou1/yUDEHi5g5+ed+yUa9bZcQYHSfV/qnyCNNNTOhnclKlIHyXO8wMrA0bQ36CeT9xXGjJKOgdy/fH3aJvyhH491fDENKYKDw+0rh3ykSkBnL80RrZzlRH4aTHNjnad7599iPT4BX7+38EnCKLcryGq+pFK4zE4oUWMHCZgluHtL8NSB+H2cU8ix3qeqntWJmiqhqVP+7qxsLRsfWIVUEMim/MNlnFcJqaLliJrsITmonSj7SuOImhoVBRxxwS4z0FYGYGRAnJwloK+Jx11O+8NaT9OFJlA/vgyIzlwSGkPfzWtgh8GPBMJYnpSq3Td59ZroEwYIm0IOsPAcwEY8JM/Doz46ZQBgKDd1lQNMf3TIaQsQX1qx81qA3zaAhPGlm1f+L/8/u1z0lby8=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(82310400011)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(83380400001)(110136005)(36756003)(86362001)(82740400003)(356005)(7636003)(36860700001)(41300700001)(47076005)(1076003)(26005)(107886003)(2616005)(336012)(16526019)(426003)(966005)(70206006)(478600001)(2906002)(70586007)(316002)(6666004)(54906003)(4326008)(5660300002)(8936002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 14:07:30.9073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa3c6e0-a44e-47bb-68f5-08dc219ccc96
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5882
Subject: [virtio-comment] [PATCH v8 05/13] resources: Add theory of operation for device resources

The device may support device operation by means of resources.
The driver creates the device resources and operates the device
in a certain way.

These operations include create, query, modify, and destroy the device
resources.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v7->v8:
- added text about administration commands execution rate behavior
---
 content.tex   |  1 +
 resources.tex | 70 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 resources.tex

diff --git a/content.tex b/content.tex
index 4938fc0..33d7169 100644
--- a/content.tex
+++ b/content.tex
@@ -503,6 +503,7 @@ \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Expo
 UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
 
 \input{capabilities.tex}
+\input{resources.tex}
 \input{admin.tex}
 
 \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
diff --git a/resources.tex b/resources.tex
new file mode 100644
index 0000000..307308c
--- /dev/null
+++ b/resources.tex
@@ -0,0 +1,70 @@
+\section{Device Resources}\label{sec:Basic Facilities of a Virtio Device / Device Resources}
+
+A device may support certain device functioning by means of a device
+resource. A device resource typically defines how the device should
+function. For example, a driver can instruct the virtio network
+device to forward or drop packets by using flow filter group and
+flow filter rule resources. The driver can create, query, modify, or
+destroy a resource using the administration commands. The driver
+sends the device resource related administration commands, thereby
+instructing the device to operate in a certain way.
+
+Each device resource is identified by a unique resource identifier. The driver
+assigns the resource identifier when creating a device resource. Once the resource
+successfully created, subsequent operations of modifying, querying or destroying
+the resource refers to this unique resource identifier. A device may support
+multiple types of resources. Resource identifiers are unique per resource type;
+in other words resources of two different resource types may have the same
+resource identifier.
+
+A resource of one type may be linked to the resource of other type. Such linking
+of resources is done by referring to the unique resource identifier in the
+administration commands. For example, a driver creates the resource identified
+by id A of one type, followed by creating another resource identified by id B
+of a different type linked to resource A. Such linked resources establish
+the dependencies in the life cycle of these resources. The driver which creates
+the linked resource, destroys the resources in exact reverse order of their
+creation. In this example, driver destroys the resource B before removing the
+resource A.
+
+Broadly there are two types of device resources. One type of resources
+which are common across all the device types. Other resources are specific
+to a device type.
+
+\begin{tabular}{|l|l|}
+\hline
+Type & Description \\
+\hline \hline
+0x000-0x1ff & Generic resource type common across all devices \\
+\hline
+0x200-0x4ff & Device type specific resource \\
+\hline
+0x500-0xffff & Reserved for future use  \\
+\hline
+\end{tabular}
+
+The device and the driver may publish a resource limit by using
+\field{struct virtio_resource_limit} as part of
+\field{Device and Driver Capabilities} described in
+\ref{sec:Basic Facilities of a Virtio Device / Device and Driver Capabilities}.
+
+\begin{lstlisting}
+struct virtio_resource_limit {
+        le32 max_limit; /* maximum resource identifier = max_limit - 1 */
+};
+\end{lstlisting}
+
+A valid resource identifier is \field{max_limit - 1}. For example, when a device
+reports a \field{max_limit = 10} capability for a resource, and driver writes
+\field{max_limit = 8}, the valid resource identifier range for the driver
+and device is 0 to 7 for all the resource operations. In this example,
+the driver can only create 8 resources of a specified type.
+
+When the device starts, device starts with zero resources; the driver creates
+the resource up to the published limit of \field{max_limit}, the driver can
+destroy the resource and recreate it one or multiple times. On the device reset,
+all the resources created by the driver are destroyed within the device.
+
+Managing resources using administration commands using administration virtqueues
+are assumed to be slower operations compared to data path operations such as
+handling tranmitq or receiveq.
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

