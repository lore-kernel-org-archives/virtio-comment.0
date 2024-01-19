Return-Path: <virtio-comment-return-8971-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EAFC4725D
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:25:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DC0F07A8C7
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:25:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D6346986823
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:25:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CC3F29867B8; Fri, 19 Jan 2024 19:25:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BF1829867CD
	for <virtio-comment@lists.oasis-open.org>; Fri, 19 Jan 2024 19:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQ0sHqF3aj11Ih0sI+h93AO/FkMoxeAF69Z7/JgsprVosC+57sjjkbw5/ggVF2FX+KhKuOJIZh79twh47/oDsCUaZz/h8b45P/jMs6+SsGsZMXRPJyjJPu/4XXuMBgFYa8JmuZ2KokOgqNX0JoCWira3UB/pmcvNHqNFzM39cfeSPlEcL2BSrfLzeQ2IJNRaY7DFwpdCpOwB8bR5dVDYaVOmVssC2gPzAaACawFUENwDwjcJ5cJynmprInCXc+3mRsmz0iVkdCVtL2IZZzk1TmYcj+GGRvZgE6I4ZV8NbXwxRtYGyTQqOBrn9mERBDJhNRO0AKFuCRFlRwLaUFYm/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVgaudCyT0pF8/QNzPAn8vbFt0yIdiy/xlx3XFbz5lY=;
 b=JwbM/ItxPlOEDgU4SDGWkfQg0Oqqb0IkMlbWlkSAwPP3ltXUjl2gCgkUSVvHnrG1pYpJ5VXnGxSuNtcfqoRIztaWODum3y+yWubDmBHVIzhr9cYuNhHjSl+F0tDl8+j/eOEMg+Akc6AsvoX/7gubsdLuGOck9gQmvu1EpayxilMDl/zLfIpYr29xU6VSOQPs4lUvT2/1OM1R/6nGdlow73wUrtiWFAxMm03vXEsJW5oW6rUVL0Wpxm+f+gkvl7ozTlmgaHhhyMoPP6+2fYQgw0e1huqbTy1WPcGCuZHsdl7JtMfRba/q5gLN3t5ivou4ZTOsa7IR0mC0P7ClygBtXA==
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
Date: Fri, 19 Jan 2024 21:24:44 +0200
Message-ID: <20240119192452.3571467-6-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|SA1PR12MB8600:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e6b1199-e43c-4ba2-6f75-08dc192472f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8oG9GOPc61hh/ybC6Vnb3/5Dg5S7DDngShvsADysqtP3dJ8gNs2cVgV3e56lfm3QEoWOaMXJLXSPk8Jyj4K01B+Y7M+GSVRJ2rqy0u905M2rvFVHwjabTf5tdmCE7VNERS7XCUe7PceKBK0IBPW2kZs74CWF/HEwW03b7Q6FUfjk394Vz+ws+1/uKQjSfTgsd0UFYjIV3GvtcDYXmEGrnyh0U/xC2lgXXdKNM36nF2yDSGX9+hfCdHcMLkv4ckZ/3KW1plG+19CDyq5rWCGAi7xnA5N0bWSS2dBb1VDVE9n07JLegZdzXpJEg9Du8pYzI724czAskLS6/kNuY8NrlX/ajeFnEY4tHQz5aAdUSxV5ZGLdmcybj9ACvXxbVrLkjjwudHRPCRKbKW+KY01y48ygca8FW86TnRvGKFnr2tniFCTnf1pfxJDvSJlEodl6MD+AS/jq74IT7zAP8gZgYzgDXFdxljuQrm0zZsvyuI5OCi3KvL7fhhE2NNKXoJ3uvLUCp+LXToZ36ShZ+GOawklwMzj8swYfeH7p6an2kNtz3DxlbD038U7UrEQjcN5Gmb4MjNT36eu6LJyDM1SyGcd2rPpSyp8uOZJf5PUYQWZRUH+WLWsQ68Hst89PzyC08GGjUbr6cTgeeUjGfrpYNwPI1WPTMXlJx22z1aUAUGqWDzafexZ877iGA1rcVziwjnocda4HFTjlUQwrlxhWcyGVrGhtUEvjn/rydxmI0V54c/0pIT69ER+28jYBDmoemJI2qKIM3h6bVtpgNcpktP/A7w9MDTfuCTW1lyLgD3c=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(82310400011)(36840700001)(46966006)(40470700004)(41300700001)(86362001)(16526019)(26005)(1076003)(107886003)(83380400001)(2616005)(8676002)(426003)(336012)(6666004)(316002)(8936002)(70206006)(54906003)(966005)(110136005)(478600001)(70586007)(356005)(36860700001)(4326008)(7636003)(82740400003)(47076005)(40460700003)(40480700001)(2906002)(5660300002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 19:25:51.5810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6b1199-e43c-4ba2-6f75-08dc192472f3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8600
Subject: [virtio-comment] [PATCH v7 05/13] resources: Add theory of operation for device resources

The device may support device operation by means of resources.
The driver creates the device resources and operates the device
in a certain way.

These operations include create, query, modify, and destroy the device
resources.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 content.tex   |  1 +
 resources.tex | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
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
index 0000000..587cc32
--- /dev/null
+++ b/resources.tex
@@ -0,0 +1,66 @@
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

