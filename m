Return-Path: <virtio-comment-return-9044-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788CEC46CD2
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 161C6F3F63
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DD1439868D9
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CF6E0986876; Tue, 30 Jan 2024 14:07:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B361B986892
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Jan 2024 14:07:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjMnYzHrlPYmts+YXHlXXmpR+PBULMg4LYkmMHP5nGTRUkXLn8b3KRkWODx8yxh1vgIT5V1lk4oqatm0pXJcEEOeTqeJYjupfzmoMhP9Ajof9l8zR6NZTVCiK5CwJNAh0Jtcr8YIjQdHKJ70CK0q7YaD/t+qekv5YjuSUyLO+nAMwrpvgcUuhMjdx+V3WIHdr3wuVICw1g4kc71/4fojXPEOKrysi+YMt2h1U3YL5sheReWl817qe8AaqIUftOcoaqtXYKjpwJCmfAHzW+gvi4plTwAN5wNWLG0+KCT4TasetLhBBa3owFshk7cfYzBhH/q8zIs0PHR7xT7uVME0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSbUDHIcgnMApVY+vMqStLusaLaz9bwUADPTYom0MQY=;
 b=SeW522hJ82X94DNz4xgtWJwwq5Hhc9XFUxfadDgBSAxKyCqKjeKIRnngRmsIwRvPirw5kQt94Lgk7nuSDHd6SSuW2+dULYOpQQl4CbkPo5M2Ux4GAE5MlAX8JntDSQTW66QEUR7lw81PUjEqMLzeVJ+RhDffJ2PQaJi+Sid9Y3EXNlxaD1XAWRKA70QceCVSrgkC15YxfVrk3awj/gxCcMjBY/mMrMXdQMzhod0qnsmQDQoiZHW7k2nMn6ymi8rVpp21S2f6+KZAHDFvfbZ7U1wVst8J94ciHBu4Jr3EcWni/Pt6U75Ziy0cwBGbc4uUX5kIQ5JXe5NHyTL8Il0KQg==
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
Date: Tue, 30 Jan 2024 16:06:35 +0200
Message-ID: <20240130140642.406882-7-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|SJ0PR12MB5633:EE_
X-MS-Office365-Filtering-Correlation-Id: ea5e7fca-20ba-424f-20d8-08dc219ccf9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zz0S2u5H0Oi9Icaoq8AD+OnG+v1r/Ocw6pnYqtlAHvwEow3vtHrNOk7i2/jqWOqNAdQK0xYBJcJ1OY5Fw0UTnFNplgtIRTVCyRLKyigVX68x8H1gHCppXjIlQlDC9QJCRpmeVda1apw5/zCM2yfkAjhaTK6d+XVfxxT2wCVUzfFcnf1rw/ul8yVrdrJ7Vm3D9DSjgwdU8vOw244V0Tm5ZJZZARTh1GInOdMkyGDn6Vk0uZiES7DqCK4+63XuqGGuzm5V90EinuDchPctInZdV/ZBw4V425rXnOBQSDNgBY/PxoQGtY375xXhXUveMUMvnmrWITbiOA84BB8J3lAh9P3Yl9SwWhNvEgHgeXaV1wKGHK3vHHDuI1CwJdTd0eBJHVNAYpjyEwBeYTfEzeNFyA2+l9Hi8DSiJ84VbN89w+zHiNu/QJApQY8msgbZ71JTi79mPbrbCSGtjUSJ3NKmNbr7UTwAEyerduVAUcnipOHQ1R0x4IKugA2fNR2EulNFOeZesT4y3d4jY1e5N91wN/jAQqji4j3Gqkit6aJNFeWO++qrGvnZjDBQ+QPQfUtL+XwZFUbUG6zGyW1stJ5Thxyk8nhm7WwjT8xYmCkCp8jQhIIZx5DV9Saa2YdCCh6cL7sC+tBwRazG2U6H86FqXcvVR0MwFT+grrqCl5EHhVZdBJSJO9SQMsYrmXynT5n34pCGJngofvdkBIj1HFhuiCbsZza6Oda37hXHT1o7SnNDo1Ry44jtas0UFJOBYnVQ332rigkQcHqOVdfXP+kk7KAUwqSoPbMUQy44dl1MAlM=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(46966006)(36840700001)(40470700004)(83380400001)(16526019)(426003)(1076003)(6666004)(336012)(478600001)(36860700001)(316002)(47076005)(8936002)(107886003)(2616005)(30864003)(4326008)(5660300002)(41300700001)(2906002)(966005)(8676002)(70586007)(54906003)(110136005)(70206006)(82740400003)(26005)(36756003)(86362001)(356005)(7636003)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 14:07:35.9532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5e7fca-20ba-424f-20d8-08dc219ccf9d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5633
Subject: [virtio-comment] [PATCH v8 06/13] admin-cmds-resources: Add device resources admin commands

Add generic administration commands create, modify, query and destroy
device resources.

Each resource defines resource specific attributes for the commands.
Once the resource is created by the driver, it can be query/modify or
destroyed by the driver.

Each resource is identified using a unique resource identifier per
resource type.

Administration commands for managing resources using administration
commands are relatively slower operations compared to data path
operations of transmitq and receiveq of the network device.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin-cmds-resources.tex | 186 +++++++++++++++++++++++++++++++++++++++
 admin.tex                |  11 ++-
 conformance.tex          |   2 +
 resources.tex            |   4 +
 4 files changed, 202 insertions(+), 1 deletion(-)
 create mode 100644 admin-cmds-resources.tex

diff --git a/admin-cmds-resources.tex b/admin-cmds-resources.tex
new file mode 100644
index 0000000..da4e576
--- /dev/null
+++ b/admin-cmds-resources.tex
@@ -0,0 +1,186 @@
+\subsubsection{Device Resources}\label{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Resources}
+
+The device resource operates the device as described in
+\ref{sec:Basic Facilities of a Virtio Device / Device Resources}.
+
+Following device resource commands are currently defined only for the self
+group type:
+
+\begin{enumerate}
+\item Device Resource Create Command
+\item Device Resource Modify Command
+\item Device Resource Query Command
+\item Device Resource Destroy Command
+\end{enumerate}
+
+\begin{lstlisting}
+struct virtio_admin_cmd_resource_cmd_hdr {
+        le16 type;
+        u8 reserved[2];
+        le32 rid; /* Indicates unique resource id per resource type */
+};
+\end{lstlisting}
+
+\field{type} refers to the device resource type.
+\field{rid} uniquely identifies the resource of a specified \field{type}.
+
+\paragraph{Device Resource Create Command}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Resources / Device Resource Create Command}
+
+This command creates the specified resource of \field{type} identified by the
+resource identifier \field{rid}. The valid range of \field{rid} is defined by the
+device in the related device capabilities. The driver assigns the unique \field{rid}
+for the resource for the specified \field{type}.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_resource_create_data {
+        struct virtio_admin_cmd_resource_cmd_hdr hdr;
+        le16 length;
+        u8 reserved[6];
+        u8 resource_specific_data[];
+};
+\end{lstlisting}
+
+For the command VIRTIO_ADMIN_CMD_RESOURCE_CREATE, \field{opcode} is set to 0xa.
+
+\field{group_member_id} refers to the device itself to be accessed.
+\field{length} refers to the length of the \field{resource_specific_data}.
+\field{resource_specific_data} refers to the resource specific data. Each resource
+uses a different \field{resource_specific_data} and is described separately.
+
+When the command completes successfully, the resource is created in the
+device and in use by the device. This command has no command specific result.
+
+\paragraph{Device Resource Modify Command}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Resources / Device Resource Modify Command}
+
+This command modifies the existing resource of \field{type} identified
+by \field{rid}, which is previously created using command
+VIRTIO_ADMIN_CMD_RESOURCE_CREATE.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_resource_modify_data {
+        struct virtio_admin_cmd_resource_cmd_hdr hdr;
+        le16 length;
+        le16 reserved[6];
+        u8 resource_specific_data[];
+};
+\end{lstlisting}
+
+For the command VIRTIO_ADMIN_CMD_RESOURCE_MODIFY, \field{opcode} is set to 0xb.
+
+\field{group_member_id} refers to the device itself to be accessed.
+\field{type} refers to the device resource type.
+\field{rid} uniquely identifies the resource of type \field{type} to be created.
+\field{length} refers to the length of the \field{data}.
+
+When the command completes successfully, the resource is modified with
+updated \field{resource_specific_data}.
+This command has no command specific result.
+
+\paragraph{Device Resource Query Command}\label{par:Basic Facilities of a Virtio Device / Device groups / Group
+administration commands / Device Resources / Device Resource Query Command}
+
+This command reads the existing resource of \field{type} identified
+by \field{rid}, which is previously created using command
+VIRTIO_ADMIN_CMD_RESOURCE_CREATE.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_resource_read_data {
+        struct virtio_admin_cmd_resource_cmd_hdr hdr;
+};
+\end{lstlisting}
+
+\begin{lstlisting}
+struct virtio_admin_cmd_resource_read_result {
+        le16 length;
+        le16 reserved[6];
+        u8 resource_specific_data[];
+};
+\end{lstlisting}
+
+For the command VIRTIO_ADMIN_CMD_RESOURCE_QUERY, \field{opcode} is set to 0xc.
+
+\field{group_member_id} refers to the device itself to be accessed.
+\field{type} refers to the device resource type.
+\field{rid} identifies the existing resource of type \field{type}.
+\field{length} refers to the length of the \field{data}.
+
+When the command completes successfully, the resource information is returned
+to the driver in \field{resource_specific_data}.
+
+\paragraph{Device Resource Remove Command}\label{par:Basic Facilities of a Virtio Device / Device groups / Group
+administration commands / Device Resources / Device Resource Destroy Command}
+
+This command reads the specified resource of \field{type} identified
+by \field{rid}, which is previously created using command
+VIRTIO_ADMIN_CMD_RESOURCE_CREATE.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_resource_destroy_data {
+        struct virtio_admin_cmd_resource_cmd_hdr hdr;
+};
+\end{lstlisting}
+
+For the command VIRTIO_ADMIN_CMD_RESOURCE_DESTROY, \field{opcode} is set to 0xd.
+
+\field{group_member_id} refers to the device itself to be accessed.
+\field{type} refers to the device resource type.
+\field{rid} identifies the existing resource of type \field{type} to be destroyd.
+
+When the command completes successfully, the resource is destroyd from the device.
+This command has no command specific result.
+
+\devicenormative{\paragraph}{Device Resources}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Resources}
+
+The device MUST set VIRTIO_ADMIN_STATUS_EEXIST for the command
+VIRTIO_ADMIN_CMD_RESOURCE_CREATE if a resource already exists with supplied
+resource \field{rid} for the specified \field{type}.
+
+The device MUST complete the command with status \field{status}
+VIRTIO_ADMIN_STATUS_ENXIO for the commands
+VIRTIO_ADMIN_CMD_RESOURCE_MODIFY, VIRTIO_ADMIN_CMD_RESOURCE_QUERY and
+VIRTIO_ADMIN_CMD_RESOURCE_DESTROY if the specified resource does not exist.
+
+The device MUST set \field{status} to VIRTIO_ADMIN_STATUS_ENOSPC for the command
+VIRTIO_ADMIN_CMD_RESOURCE_CREATE if the device fail to create the
+resource.
+
+The device MUST complete the command with \field{status}
+VIRTIO_ADMIN_STATUS_EBUSY if the resource
+modified or destroyd is linked to other resource and if the device cannot perform
+the requested VIRTIO_ADMIN_CMD_RESOURCE_MODIFY or VIRTIO_ADMIN_CMD_RESOURCE_DESTROY
+commands.
+
+The device MUST allow recreating the resource using
+VIRTIO_ADMIN_CMD_RESOURCE_CREATE command which was previously created
+and destroyed using VIRTIO_ADMIN_CMD_RESOURCE_CREATE and
+VIRTIO_ADMIN_CMD_RESOURCE_DESTROY command respectively without undergoing
+a device reset.
+
+The device MUST allow creating the resource using
+VIRTIO_ADMIN_CMD_RESOURCE_CREATE command with any resource
+identifier as long as the resource does not exist and if the resource
+identifier is less than the device and driver capabilities published resource
+limit \field{max_limit}.
+
+The device MAY fail VIRTIO_ADMIN_CMD_RESOURCE_CREATE command even if the
+resources within the device have not reached upto the \field{max_limit}
+but the device MAY have reached an internal limit.
+
+On device reset, the device MUST destroy all the resources which driver MAY
+have created.
+
+\drivernormative{\paragraph}{Device Resources}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Resources}
+
+The driver SHOULD NOT create the resource with the \field{rid} which is
+already created previously by the driver.
+
+The driver SHOULD NOT create the resource using command
+VIRTIO_ADMIN_CMD_RESOURCE_CREATE when maximum resource limit has reached.
+
+The driver SHOULD NOT modify, read and destroy the resource which is
+already destroyd previously by the driver.
+
+The driver MUST NOT destroy the resource which is in use by other
+linked resource; the driver MUST destroy all the linked resources before
+removing the resource which is used by the linked resources by using
+command VIRTIO_ADMIN_CMD_RESOURCE_DESTROY.
diff --git a/admin.tex b/admin.tex
index c0ba54e..aa4ff59 100644
--- a/admin.tex
+++ b/admin.tex
@@ -139,7 +139,15 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline
 0x0009 & VIRTIO_ADMIN_CMD_CAP_WRITE & Write the device and driver capabilities \\
 \hline
-0x000a - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
+0x000a & VIRTIO_ADMIN_CMD_RESOURCE_CREATE & Create a device resource \\
+\hline
+0x000c & VIRTIO_ADMIN_CMD_RESOURCE_MODIFY & Modify a device resource \\
+\hline
+0x000b & VIRTIO_ADMIN_CMD_RESOURCE_QUERY & Query a device resource \\
+\hline
+0x000d & VIRTIO_ADMIN_CMD_RESOURCE_DESTROY & Destroy a device resource \\
+\hline
+0x000e - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
 \hline
 0x8000 - 0xFFFF & - & Reserved for future commands (possibly using a different structure)    \\
 \hline
@@ -318,6 +326,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 
 \input{admin-cmds-legacy-interface.tex}
 \input{admin-cmds-capabilities.tex}
+\input{admin-cmds-resources.tex}
 
 \devicenormative{\subsubsection}{Group administration commands}{Basic Facilities of a Virtio Device / Device groups / Group administration commands}
 
diff --git a/conformance.tex b/conformance.tex
index 4782016..fbf63e3 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -96,6 +96,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:General Initialization And Device Operation / Device Cleanup}
 \item \ref{drivernormative:Reserved Feature Bits}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and Driver Capabilities}
+\item \ref{drivernormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Resources}
 \end{itemize}
 
 \conformance{\subsection}{PCI Driver Conformance}\label{sec:Conformance / Driver Conformance / PCI Driver Conformance}
@@ -177,6 +178,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Shared Memory Regions}
 \item \ref{devicenormative:Reserved Feature Bits}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and Driver Capabilities}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Resources}
 \end{itemize}
 
 \conformance{\subsection}{PCI Device Conformance}\label{sec:Conformance / Device Conformance / PCI Device Conformance}
diff --git a/resources.tex b/resources.tex
index 307308c..4b0efb6 100644
--- a/resources.tex
+++ b/resources.tex
@@ -9,6 +9,10 @@ \section{Device Resources}\label{sec:Basic Facilities of a Virtio Device / Devic
 sends the device resource related administration commands, thereby
 instructing the device to operate in a certain way.
 
+The device supports resource control using the administration commands
+described in
+\ref{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Resources}.
+
 Each device resource is identified by a unique resource identifier. The driver
 assigns the resource identifier when creating a device resource. Once the resource
 successfully created, subsequent operations of modifying, querying or destroying
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

