Return-Path: <virtio-comment-return-9081-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE92C4828D
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8222D77AF2
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6DA409868F3
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 619B29868D7; Wed,  7 Feb 2024 07:24:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 51FA698690D
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Feb 2024 07:24:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5aSKCnzQdOn6S1LCtsUSR6v8lIFHMhfdwsL8iTkIKAd4+Olj3j5AHSeRyQwbBX9Na1NNsrcAW4yBpP6JJrRoES5ODpUCYzcEmfY3Cz15BRRiG9/wlR5IlS92QqGNKx0wo/6NpNzymkc052r6dxRMSHGrVDq1xxdTRw2lI1qAtYOCkPl9xJN5uFMBmaMQ+NhqobtlbwDvABSlQMTce4JOtPo2xkwG6A9JG2iigoETrPz+5/gqIOILnKbxcpqx5bLK6RR7dLNs23N9/utgkqpcf6mbMHdhhWWwQdyoANicTe0JMYrrsFO3Bzs1DXj1wFxkFokwIbeehaXfZDPzhY+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAan++lkTzm8LA5XLS4KPEckSKmLlGQSeJbgUOepc4I=;
 b=LQtSkFovZM9XvEDU3AfqhYN8lsOnevOh0diY+U5TgAzFx9SDTPUVPaCXEghLE7LfJwb/hVftDl+dhyciEiSvEeCZ7mueYJ4vE/aWvIETSDTQ1XkrBG4pWWOr3R42eajDf+PuEQP2S+K0b86ExFg53VnetXgoVoCEysx8i5mjltdampqApbTikvLl04A4yBdi0InJjJfLYSNxvRpImSKSlsgYQ+RPLko2AcW0QpDNwicw18JPWPrkU9JZ7TCrjBWOeWht9+oFVypwUC2d6u3x5TDGKUHmr72Nw5QpKN3Dn/fRhaR5zSVSK8BOcfcDJRNvOkqg9QLTy932eyX2g7RaRw==
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
Date: Wed, 7 Feb 2024 09:23:27 +0200
Message-ID: <20240207072336.477606-5-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|MN0PR12MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e3d34fc-8a7d-4418-66f7-08dc27adcae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kUtSJCE+dW0iiAQAVPnNwERYeVsq9Q/qB9PUxqKyPMyBRuoyhoF6+1ZWzgHtlYvZfqOehflUKMNGLxu3nud3n4RKe31T3+jYjBESryTLyxuLcJW1HpAOWxP1xdXbfSDVbx/EYUYbzV89AZsdhCv6dhedqnhhjZkP4AzN1A/tR9xoFCAQaabpfbiBA+IRI+DnLpth78G15rZGmEkpj8+Es4MJE9vS6D+zdt+NiEN22N4MNO0Tz+tln2YjlN8l9GxAfFs/qWIZqbR122txPPy5dT0C5okejjTD+cy0Jq0EK0a73V+laU9cShgE+ndoJ0GV1lk6g8crCmXotgPWKWuHX/soerh/uSe/paNJ6U7pv/7sjDXHtMBeHGkdyzvGQE52pH53GGqf7ZIBbSLc0Js2A/V3lzuTpfpXFoxcgCAPX7/uWPBuKuwltSIGG6VUTA2cP4i6Kg5arINdA4ZNUorBulSsODkM/njyt7WDve7ED/D+FOE1X3rmLkKEKpkKPUkJfqkMDRtBqyuTY9SmvEKSG58H5TEgqsuVF3bOBn9jpAXmufDjdkPPRBNmg32A00whEMQ+e8rUszx17OS8rNa1pShkN7RYh6Twqkdvr9xb36Ri2iTdelUglgma4LxEKzhgOTSi/6ryeXUVleMsXJKY/hyLMKGbA1r244ImliPE/51ItsdvX4tamoX3qU4lmmhB3q3oTX3cwa6pdNO8SGHNshw1UCX+fXw6gfe3BlghwG4yLOSatarIUKYOjkk+GCIhkSrw3NkymxdcbTc3ExHXgm+kxv511/LIwDWYNzV3ppE=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(64100799003)(82310400011)(1800799012)(451199024)(186009)(46966006)(36840700001)(40470700004)(40460700003)(36756003)(40480700001)(478600001)(966005)(356005)(41300700001)(316002)(82740400003)(2616005)(426003)(54906003)(107886003)(1076003)(16526019)(47076005)(83380400001)(26005)(4326008)(30864003)(36860700001)(5660300002)(6666004)(336012)(8676002)(70206006)(8936002)(70586007)(7636003)(110136005)(86362001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 07:24:16.4799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3d34fc-8a7d-4418-66f7-08dc27adcae1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5883
Subject: [virtio-comment] [PATCH v9 04/13] admin-cmds-capabilities: Add capabilities admin commands

Add three capabilities related commands.
First to read the device and driver capabilities.
Second to write the driver capabilities.
Third for driver to discover which capabilities can be accessed.

Write capabilities by the owner driver is not currently supported.
It will be supported in future by the owner driver to write for
the member device.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin-cmds-capabilities.tex | 161 ++++++++++++++++++++++++++++++++++++
 admin.tex                   |   9 +-
 capabilities.tex            |   3 +
 conformance.tex             |   2 +
 4 files changed, 174 insertions(+), 1 deletion(-)
 create mode 100644 admin-cmds-capabilities.tex

diff --git a/admin-cmds-capabilities.tex b/admin-cmds-capabilities.tex
new file mode 100644
index 0000000..47394c7
--- /dev/null
+++ b/admin-cmds-capabilities.tex
@@ -0,0 +1,161 @@
+\subsubsection{Device and Driver Capabilities}\label{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and Driver Capabilities}
+
+The device and driver capabilities commands are currently defined for self group type and for
+SR-IOV group type.
+
+\begin{enumerate}
+\item Device Capabilities Support Query Command
+\item Capabilities Read Command
+\item Capabilities Write Command
+\end{enumerate}
+
+\paragraph{Device Capabilities Support Query Command}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and Driver Capabilities / Device Capabilities Support Query Command}
+
+For the command VIRTIO_ADMIN_CMD_CAP_SUPPORT_QUERY, \field{opcode} is set to 0x7.
+
+This command queries the supported device capabilities identifiers bitmap in
+\field{supported_caps}. Each bit in \field{supported_caps} corresponds to the
+capability identifier. Thus, supported_caps[0] refers to the first 64-bit value
+in this array corresponding to identifiers 0 to 63, supported_caps[1]
+is the second 64-bit value corresponding to identifiers 64 to 127, etc.
+For example, with \field{num_caps = 2}, the array of size 2 including the values
+0x3 in supported_caps[0], and 0x1 in supported_caps[1] indicates that only 
+identifiers 0, 1 and 64 are supported.
+
+The length of the array \field{supported_caps} depends on the supported
+identifiers - it is large enough to include bits set for all supported
+identifiers, that is the length is set by calculating by starting with the
+largest supported opcode adding one, dividing by 64 and rounding up.
+
+The array \field{supported_caps} is also allowed to be larger and to
+additionally include an arbitrary number of all-zero entries.
+
+For each identifier, the driver can read the device capabilities and write
+the driver capabilities. The driver can also read the written capabilities.
+
+This command has no command specific data.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_query_supported_cap_result {
+        le16 num_caps;
+        u8 reserved[6];
+        le64 supported_caps[];
+};
+\end{lstlisting}
+
+When the command completes successfully, \field{command_specific_result}
+is in the format \field{struct virtio_admin_cmd_query_supported_cap_result}
+returned by the device. The number of valid array entries of
+\field{supported_caps} are indicated in \field{num_caps}.
+
+\paragraph{Capabilities Read Command}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and Driver Capabilities / Capabilities Read Command}
+
+This command reads the device or driver capabilities. It either reads the
+capability of the own device or the owner device can read the capabilities of
+the member device.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_cap_read_data {
+        le16 cid;
+        u8 type; /* 0 = device cap, 1 = driver cap */
+        u8 reserved[5];
+};
+\end{lstlisting}
+
+For the command VIRTIO_ADMIN_CMD_CAP_READ, \field{opcode} is set to 0x8.
+
+\field{group_member_id} refers to the device itself or the member device to be accessed.
+\field{cid} refers to the capability identifier listed in
+\ref{sec:Basic Facilities of a Virtio Device / Device and Driver Capabilities}.
+When \field{type} is set to 0, it refers to the device capability, when
+\field{type} is set to 1, it refers to the driver capability, rest of the
+values are reserved.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_cap_read_result {
+        le16 length;
+        u8 reserved[6];
+        u8 cap_specific_data[];
+};
+\end{lstlisting}
+
+When the command completes successfully, \field{command_specific_result}
+is in the format \field{struct virtio_admin_cmd_cap_read_result} responded
+by the device. The \field{length} is set to the length of the
+\field{cap_specific_data}. Each capability uses different capability specific
+\field{cap_specific_data} and is described separately.
+
+\paragraph{Capabilities Write Command}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and Driver Capabilities / Capabilities Write Command}
+
+This command writes the driver capabilities indicating to the device which
+capabilities are used by the driver. The driver can write capabilities which
+are smaller or equal in value than the values published by the device
+capabilities.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_cap_write_data {
+        le16 cid;
+        u8 type; /* 1 = driver cap */
+        u8 reserved;
+        le16 length;
+        u8 reserved1[2];
+        u8 cap_specific_data[];
+};
+\end{lstlisting}
+
+For the command VIRTIO_ADMIN_CMD_CAP_WRITE, \field{opcode} is set to 0x9.
+
+\field{group_member_id} refers to the the device itself. Currently the owner
+device cannot write the member device's capabilities. This will be supported
+in the future.
+\field{cid} refers to the capability identifier listed in
+\ref{sec:Basic Facilities of a Virtio Device / Device and Driver Capabilities}.
+\field{type} is set to 1, refers to the driver capability, when
+\field{length} refers to the length of the \field{cap_specific_data}.
+
+There is no command specific result.
+When the command completes successfully the driver capabilities are
+updated to values supplied in \field{cap_specific_data}.
+
+\devicenormative{\paragraph}{Device and Driver Capabilities}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and Driver Capabilities}
+
+If the device supports capabilities, it MUST support
+VIRTIO_ADMIN_CMD_CAP_SUPPORT_QUERY, VIRTIO_ADMIN_CMD_CAP_WRITE and
+VIRTIO_ADMIN_CMD_CAP_READ commands.
+
+The device MUST support writing all the driver capabilities in
+VIRTIO_ADMIN_CMD_CAP_WRITE command to same or smaller value than what is reported
+in device capabilities in VIRTIO_ADMIN_CMD_CAP_READ command unless
+otherwise explicitly stated capability fields as non writeable fields.
+
+In VIRTIO_ADMIN_CMD_CAP_WRITE command, if any of the written capability
+field value is larger than the value reported by the device capability,
+the device MUST complete VIRTIO_ADMIN_CMD_CAP_WRITE command with \field{status}
+VIRTIO_ADMIN_STATUS_EINVAL.
+
+The device MUST support VIRTIO_ADMIN_CMD_CAP_READ command for the owner
+device to read capabilities for the member device.
+
+The device MUST complete VIRTIO_ADMIN_CMD_CAP_WRITE command with
+\field{status} VIRTIO_ADMIN_STATUS_EINVAL for the owner device to
+write the capabilities of the member device.
+
+The device MUST complete VIRTIO_ADMIN_CMD_CAP_WRITE command with \field{status}
+VIRTIO_ADMIN_STATUS_EBUSY if the command requested to disable a capability and
+the device has any valid resources related to the capability being disabled.
+
+On device reset, the device MUST reset all the driver capabilities.
+
+\drivernormative{\paragraph}{Device and Driver Capabilities}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and Driver Capabilities}
+
+The driver MUST send VIRTIO_ADMIN_CMD_CAP_WRITE command before using
+any resources related to such capabilities.
+
+The driver SHOULD NOT send VIRTIO_ADMIN_CMD_CAP_WRITE command
+containing values which is larger than
+the device capabilities reported by the device in
+VIRTIO_ADMIN_CMD_CAP_READ command.
+
+The driver SHOULD NOT disable any of the driver capabilities by sending
+VIRTIO_ADMIN_CMD_CAP_WRITE command when any functionality related
+to such capabilities is in use by the device.
diff --git a/admin.tex b/admin.tex
index fdf25c5..c0ba54e 100644
--- a/admin.tex
+++ b/admin.tex
@@ -133,7 +133,13 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline
 0x0006 & VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO & Query the notification region information \\
 \hline
-0x0007 - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
+0x0007 & VIRTIO_ADMIN_CMD_CAP_SUPPORT_QUERY & Query the supported device capabilities bitmap \\
+\hline
+0x0008 & VIRTIO_ADMIN_CMD_CAP_READ & Read the device and driver capabilities \\
+\hline
+0x0009 & VIRTIO_ADMIN_CMD_CAP_WRITE & Write the device and driver capabilities \\
+\hline
+0x000a - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
 \hline
 0x8000 - 0xFFFF & - & Reserved for future commands (possibly using a different structure)    \\
 \hline
@@ -311,6 +317,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 might differ between different group types.
 
 \input{admin-cmds-legacy-interface.tex}
+\input{admin-cmds-capabilities.tex}
 
 \devicenormative{\subsubsection}{Group administration commands}{Basic Facilities of a Virtio Device / Device groups / Group administration commands}
 
diff --git a/capabilities.tex b/capabilities.tex
index c375089..77d4aa5 100644
--- a/capabilities.tex
+++ b/capabilities.tex
@@ -38,3 +38,6 @@ \section{Device and Driver Capabilities}\label{sec:Basic Facilities of a Virtio
 Whichever device supports the device specific capabilities, such
 capabilities are described in the respective \field{Device and Driver Capabilities}
 section of the device.
+
+Device and driver capabilities related administration commands are listed in
+\ref{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and Driver Capabilities}.
diff --git a/conformance.tex b/conformance.tex
index 863f9c5..4782016 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -95,6 +95,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:General Initialization And Device Operation / Device Initialization}
 \item \ref{drivernormative:General Initialization And Device Operation / Device Cleanup}
 \item \ref{drivernormative:Reserved Feature Bits}
+\item \ref{drivernormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and Driver Capabilities}
 \end{itemize}
 
 \conformance{\subsection}{PCI Driver Conformance}\label{sec:Conformance / Driver Conformance / PCI Driver Conformance}
@@ -175,6 +176,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Packed Virtqueues / Scatter-Gather Support}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Shared Memory Regions}
 \item \ref{devicenormative:Reserved Feature Bits}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and Driver Capabilities}
 \end{itemize}
 
 \conformance{\subsection}{PCI Device Conformance}\label{sec:Conformance / Device Conformance / PCI Device Conformance}
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

