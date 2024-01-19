Return-Path: <virtio-comment-return-8972-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F392AC47DD3
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:26:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 71E7F843F0
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:26:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6A2A39867FD
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:26:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 59F109867CE; Fri, 19 Jan 2024 19:26:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4C5F29867B4
	for <virtio-comment@lists.oasis-open.org>; Fri, 19 Jan 2024 19:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhKWcZMdqjXJuPqSPNs1bnklSaD0oUFpFAGaEyOIUe7Wi2BtujzSAP8LHS8dD6Hqi8qIReS/O7Uh+NjENIL4pYIGaQvagSGsSZWwwvjRcB5A44uhZ6R4+DFu3J3HnSiXUPe6pX+jAlBgSpidQG7qn67OXoB9062nFQmZBE/LfBRG61QON0PNH7/FoFFl+hPSmz1w/HyOF+67wM/BiqOThItieqsbz8ioH8Aq6kjXkNrDQmOb1ltTfmTIqtQB2hCktVlWqShiLSv1NXRPXAWghNiNU5tDjo/dw6T5GFAQt/qdcbg80Q4gMTZWb5KbnJvtwmKQdIgiVoYSvtVRzX2AwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2qjt5S5Jnvy4Fd2GamEHjaxaSxT8f8kLODqajguCHA=;
 b=X0C3qiLsJVw+pDMloLvT6H893+7HBW9r95B0LBN3DtKTohUzeTk6ZvapoQMHoxI7aumMmjbJrZMDvuuAV3dgYH+rNcxYUo3ojvtk0PpRwtM6K6gEAOf3RyOI5l9DkXNV2gpbDjXQnmHM/BvTPYfLuzo5ejnKdhIEPErd/v1a+xsIhBaa2WFv6D20TnyCszr5s6cjttPthJnqIvcHbmM+z5FTCOnVj8Nn0qAyAILYN4dyjh54drO6iiA3ad0saKMVYrLpnKGCuOywgBEyS9nbtVZ/blRPGDLHvAOCBZwV+KWuAfVQEYN8vX4Jt3A3gH2TW+xie/TbWz2TC/D8KKvg2Q==
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
Date: Fri, 19 Jan 2024 21:24:45 +0200
Message-ID: <20240119192452.3571467-7-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|MW4PR12MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e82242-baae-4e70-d9e4-08dc19247497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cGhXpMcRLyfbnZLhgUtLEuqncmQvtpVegfXf2V0MoOQ6Clt5bDbN3VyGQQGHKpllQN3Fv+o80RTzi/jF42wMHueZ72Hl7BGQwU1pvEGxI4nmHBl8NuK7YYpr+PFLg6s8wRsT+CW6otEjGeeoCzDTGGGrLe6HWz+ZxzuW/whbYFndM2zYeqxqcnkG8HaXCY8y5k8s50BtULStIfMVJ4179TOkRch7I5yxPvqUWa2ANZR2UWhQxl/rgCbyuLJ+NUfPDfybalwQF7txHdJ/PiM5LGirkb0IgMfjEnYKbqoRfsgRi1k9JdCepP5f0c1HQqH/ZEfjZfCnlhsLD5u+oYMbZ17djfrBu6gbDsbp/TwVOC5fuXjF2MHq9MjPR+1Z3Yg51HUCClDsHX7GBTsZajsgbCy6zRO8RM77TmRFobJNnFk1Re5OWEKY7hzip1hDVPtOg5asZ/Np1+CEIpZ5+8LIzMQL7i0oC+JhLWorxHBjVP4hFVDtKhL9w0HbQ3SEHdA05o6JwmaexbfF+4Sqlc44Rnj+qiEHjMhfKN+ESDMjZhm5jMk9o+hQtymFA18V6nStQxYPoX4gEiAkXraI7SK22KbSGcNh0D48v0kAWLwO/Q76LOwAJJKbkq5svGQaDfhFDLOArHESZ20I3YNfv3h6BVmn9EshWRK2FDjr/ny7agRrA5RN2w/2YH3TbcY4NZKVRd5MlnpLkVHEKlJQesag9VG/jKJT0nPEpNxJ42u7Vq+0hPTuvndqrm/ob6Yh0MlkehFetIsIvJ95ZzNL8GVUt2+WH7L/Yj/zTkeuOld2kA8=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(186009)(64100799003)(82310400011)(1800799012)(451199024)(36840700001)(46966006)(40470700004)(40460700003)(40480700001)(41300700001)(26005)(336012)(426003)(83380400001)(16526019)(36756003)(86362001)(82740400003)(356005)(7636003)(1076003)(316002)(8676002)(8936002)(5660300002)(47076005)(2616005)(107886003)(36860700001)(70206006)(70586007)(110136005)(4326008)(30864003)(6666004)(966005)(478600001)(2906002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 19:25:54.3362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e82242-baae-4e70-d9e4-08dc19247497
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6779
Subject: [virtio-comment] [PATCH v7 06/13] admin-cmds-resources: Add device resources admin commands

Add generic administration commands create, modify, query and destroy
device resources.

Each resource defines resource specific attributes for the commands.
Once the resource is created by the driver, it can be query/modify or
destroyed by the driver.

Each resource is identified using a unique resource identifier per
resource type.

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
index 587cc32..d4a7c7f 100644
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

