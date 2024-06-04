Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2057.outbound.protection.outlook.com [40.107.102.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B285146A7A
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 13:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717507801; cv=fail; b=hgMvoegRthHaci6qWu09KQyJrKrxeUqadSs7pzyX19GjpPi/wSl6u88eu6ehF96qoXcRB4nApXQaXmtLGV6+LoZgjetFTeP+zUU6Thd8S1YNeQdQY/1aWwXIneoc1Hjr5ajCnOSXVvy3rlZJpu1IyPMa8ehv2Wxm3SudNLI3bqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717507801; c=relaxed/simple;
	bh=iu9GzXqZebCX5VPaOD7sPtAv4NiElZFfmrIT3Jg6qM8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IxqKxk3hpuNi5xA47sy94Q715veEoHpSIuoVJdTiWfzFMSo1oHPXVN9rn+pRpyBP0vPMFWF8T6ZXEKPLwCnLJN2jyXo+xZqff30MDvVrJ/E2AGce143lDuDWjqy51Z2VhJ8TGuhqDz5+HmUj+/u3AqEFjIDdxqubCloUdRHn5nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PeUMzwWz; arc=fail smtp.client-ip=40.107.102.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PeUMzwWz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEwbL/M7BP1QmPVbAuxDKPnHFBPOBINaPVP3B+CTzxkXyx59pvD7iZa+TEOfiyOM37kisiqWwzWDIzqCEZH4ikXREHKmX3f/YVy5K2EI4J2Md4PnqQS6BTHUSixOCwkI3t3hacwANT9kSVsw0nlt6d1ChhYuHsidpE8t1RX8T+Xrjceg6owSbDBA0EJSTcATKN2WWgMWI9tiJutIOyqtXyodhE7bcakPMcW+dQYOEYic0mw8gGg83rTnYLM4YFtGdIsn10RHAvts7K9+3bpwjjUZLjWIreS4FL3Iskcaogz42x9xDlMnhX9VMemmU0LmeUEPy/EREIl2XA3iOqejiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+n6BoHhsB7MlTjAecX1t6YdZ8GV1LmD7LHgAnJk4TiA=;
 b=XOE1SZ7tdY6tuNPjh3obtNdDl0QeZMFYknhaJYbiebCr8oi6/lTb3pPmAo25szyLuLziIvzhVoQB6N2vfQyQnL3e4jDUHC2NNNa53GmvebFM6Pm4iBGwKgNYnStvSW0+pdUMnnM1n+mDd/9aWapFrjlsPOgf0/XJeapNx832PNsly3WGIvCd1Ka7Q7RwXLGqBORJIxK+sCoTibRljgQX681Xt8HMq8YMcEvlfUFE3sY89Hfm1MhfqPxNE9gCxnV5riAhRlcK1KJ/4HfA63C4zK9XrTkrnNTGsXciapGe7gv5gWezUyt3Y/xwxjFzfbLrFSUehgDJNdvprGeMz6d23Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+n6BoHhsB7MlTjAecX1t6YdZ8GV1LmD7LHgAnJk4TiA=;
 b=PeUMzwWzFBNMAQlM1oYEKCECO625Viende5oFjUxFewDasnakFatNOFlCpjumIzV97n8dld4YlBkqklRz3WDPonqeKekBR302odtBvWn4U75A/sc1sfx+fydb+m3N9cueDhHgrB+WC6tHTnHOwu7DI4mw1ESfjZb5CozX9dogElS0dVtZo3u+8jqBhA+dxHbVNOWzltsKQ5w1LS9hIaLqRjfZJISZKcs3xLVPA9kUQfYgXAhM4l/7n8i9pbgvDwFkG82TfXt7kAV6chxfcSEy2AbtTII7qqdrNQpFbtMqEaZJM+UxbRbI/l8RgSmEAsGsREusN3/nbu+AimZTrorPQ==
Received: from MW4PR04CA0087.namprd04.prod.outlook.com (2603:10b6:303:6b::32)
 by SJ0PR12MB5664.namprd12.prod.outlook.com (2603:10b6:a03:42b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Tue, 4 Jun
 2024 13:29:54 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::5) by MW4PR04CA0087.outlook.office365.com
 (2603:10b6:303:6b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.29 via Frontend
 Transport; Tue, 4 Jun 2024 13:29:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 13:29:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 4 Jun 2024
 06:29:37 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 4 Jun 2024 06:29:34 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v11 05/13] admin: Add capability admin commands
Date: Tue, 4 Jun 2024 16:28:55 +0300
Message-ID: <20240604132903.2093195-6-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604132903.2093195-1-parav@nvidia.com>
References: <20240604132903.2093195-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|SJ0PR12MB5664:EE_
X-MS-Office365-Filtering-Correlation-Id: fac3b2d0-c80a-4c92-e907-08dc849a6b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9/M8vHQDTukv0uqRjY9hga0iuZsnRNV1ceUmlazClkjyTJk/NF5NQ7hPdPCk?=
 =?us-ascii?Q?NzSrk2IibiWMkpdOcFuZmaO5jx+W0iRT8Ffn8aWEkl/IiIgQ35tp+mgf5yRG?=
 =?us-ascii?Q?3oLOWd6qjX7dfsFQBwgep1UNjXXr9VdHGSwmbR/6C9i5LU0XR8yvXfT05yQN?=
 =?us-ascii?Q?NcsdNw+Bc0pCa/bWXEpuPtmJsolFeQaU3DuawK7UvaKS2OF21fl2eNdgOPo0?=
 =?us-ascii?Q?XLSvYEXTF/X6d8OK2dfz9OOMP8RMNCLa8ZTVJ8wPIcUTAlI51w3PAtA6H0Ah?=
 =?us-ascii?Q?DwHvR7ym4ig6b/JbL6Ba+nlnElzWdjwqtCBYoUFnfxkDt/YZXBof7dXeOPyz?=
 =?us-ascii?Q?pKCdlL7pNhowdGN8ToKZ7FzHkcj4UMSuzH1xq65qLvKD0jj7ymQGF9yRcpGB?=
 =?us-ascii?Q?aKzz9T/wan3xe5CT6TNNt+CNmMpOkrTJB4TcT548kIirrL5uYq3UzyCmTHal?=
 =?us-ascii?Q?vGHpe4eIumyTytO2T8KJFoapAL9+sj5NGLjQo08svz14i6J9c9/j6V0d2eXZ?=
 =?us-ascii?Q?IAq6Dm/VYxSRe8OA+8/6NAP2GbopSQD49vaarQwsB7b6uaaOJluIKGp2U8+D?=
 =?us-ascii?Q?12EGiJSC49HW3/BKnD6nqA1i4ysw6+e2LI9qB8AKxyWRIrWCGEDQcHXsvAAB?=
 =?us-ascii?Q?5Jr74foTY4M1RaPWIpLWnqxaoKW/6qE0I8ofpGBlEpKuD7HfaKzPDHPj/CaC?=
 =?us-ascii?Q?0BOPFKiwFJxDdiNHfZ5UrL8eK8wS2tgVdKKrNS1Z03YeU+0gRahdNJm2of5k?=
 =?us-ascii?Q?7Zd+MnxiRWlmQHvPaS7iN7Kh7glXHUo1jhpnsv0QUEKJ83m2riCK3JlRsASw?=
 =?us-ascii?Q?wyIzAf9tY2Em6nY62AkiUqiJG4uRpbSNmR3JK+d5Jl9uZDk312V0+X6F1Fco?=
 =?us-ascii?Q?P/rgcPTBhl5waO4ancVSG2nMRw5araqHWcCawPS3oRzthSgnobmvuEQXmgRJ?=
 =?us-ascii?Q?nbL9NL5Iohbo+yIK/DH6RieGzRvGmq7oHoxbD4WWl/zLmwtWecxgpMpVl8Pv?=
 =?us-ascii?Q?vShdMdCRqTf32uvvVmsIAK2CAx2WVj4MCfm6GLF5yopDBdgKmNib5SQbeKHB?=
 =?us-ascii?Q?t31ygSTENeUi5RY1dlKh9ZXr06WghO7A6DJXioHpelkPf1pMfMYTPyhejYOA?=
 =?us-ascii?Q?vrBVgrxSwUrMC73UV62m1sebUFgVplh6kgz3ZU+T49AP5iB7DzB6lLzv/bhr?=
 =?us-ascii?Q?UHngFcWHOYzn2Znebv17kYPEzibX7KdK56kfuB5w8e4eWQGi6BYxC2P6JUA2?=
 =?us-ascii?Q?S95dT2WSvYpwjn6cHWHY59keTF7LB2RR+zLs6vJ9EQqFnhaKY7f5B/IzGM+p?=
 =?us-ascii?Q?JjmcwXKwoCRAmGbrhBs2wFCKW5fnROxS1OKBT+MS8740+tu2oT6iC8lUCGxT?=
 =?us-ascii?Q?02MIx98aQdiJRboJ4o/+pt6IkI4z?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 13:29:54.3334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fac3b2d0-c80a-4c92-e907-08dc849a6b95
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5664

Add three capabilities related administration commands.
First to get the device capability.
Second to set the driver capability.
Third for the driver to discover which capabilities can be accessed.

Even though the current series restricts device capability reading
to the self group type, same structure and command format etc will
be reusable in future to read the capability from the owner device
and also to set the device capability via owner device using
new DEV_CAP_SET command.

Resource objects are introduced in subsequent patch which utilizes
the capability, however some description around resource object
limit is covered in this patch to keep things simple.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
changelog:
v9->v10:
- removed white space at end of line
- squashed the dedicated patch of status code with the usage patch (this one)
- renamed read/write caps to device_get_cap/driver_set_cap
- restrict get and set command to only self group
- supported_caps renamed to cap_id query
- removed length from the get/set/query commands as it can be derived
- renamed cid to id as its part of the cap command structure
---
 admin-cmds-capabilities.tex | 196 ++++++++++++++++++++++++++++++++++++
 admin.tex                   |  12 ++-
 conformance.tex             |   2 +
 virtio.tex                  |   1 +
 4 files changed, 210 insertions(+), 1 deletion(-)

diff --git a/admin-cmds-capabilities.tex b/admin-cmds-capabilities.tex
index ef9481c..07b8ddb 100644
--- a/admin-cmds-capabilities.tex
+++ b/admin-cmds-capabilities.tex
@@ -32,3 +32,199 @@ \subsubsection{Device and driver capabilities}\label{sec:Basic Facilities of a V
 indefinite growth of a single capability, it is expected that new
 functionality will lead to the creation of new capability rather
 than expanding existing ones.
+
+Capabilities are categorized into two ranges by their IDs, as listed:
+
+\begin{table}[H]
+\caption{Capability ids}
+\label{table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / capability ids}
+\begin{tabularx}{\textwidth}{ |l|X| }
+\hline
+Id & Description  \\
+\hline \hline
+0x0000-0x07ff & Generic capability for all device types \\
+\hline
+0x0800-0x0fff & Device type specific capability \\
+\hline
+0x1000 - 0xFFFF & Reserved for future \\
+\hline
+\end{tabularx}
+\end{table}
+
+Device type specific capabilities are described separately for each device
+type under \field{Device and driver capabilities}.
+
+The device and driver capabilities commands are currently defined for self group
+type.
+
+\begin{enumerate}
+\item VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY
+\item VIRTIO_ADMIN_CMD_DEVICE_CAP_GET
+\item VIRTIO_ADMIN_CMD_DRIVER_CAP_SET
+\end{enumerate}
+
+\paragraph{VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY}
+
+This command queries the bitmap of capability ids
+listed in \ref{table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / capability ids}.
+
+For the command VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY, \field{opcode} is set to 0x7.
+\field{group_member_id} is set to zero.
+
+This command has no command specific data.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_query_cap_id_result {
+        le64 supported_caps[];
+};
+\end{lstlisting}
+
+When the command completes successfully, \field{command_specific_result}
+is in the format \field{struct virtio_admin_cmd_query_cap_id_result}.
+
+\field{supported_caps} is an array of 64 bit values in little-endian byte
+order, in which a bit is set if the specific capability is supported.
+Thus, \field{supported_caps[0]} refers to the first 64-bit value in this
+array corresponding to capability ids 0 to
+63, \field{supported_caps[1]} is the second 64-bit value corresponding to
+capability ids 64 to 127, etc. For example, the array of size 2 including
+the values 0x3 in \field{supported_caps[0]} and 0x1 in
+\field{supported_caps[1]} indicates that only capability id 0, 1
+and 64 are supported.
+The length of the array depends on the supported capabilities - it is
+large enough to include bits set for all supported capability ids,
+that is the length can be calculated by starting with the largest
+supported capability id adding one, dividing by 64 and rounding up.
+In other words, for VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY the length of
+\field{command_specific_result} will be
+$DIV_ROUND_UP(max_cap_id, 64) * 8$ where DIV_ROUND_UP is integer division
+with round up and \field{max_cap_id} is the largest available capability id.
+
+The array is also allowed to be larger and to additionally include an arbitrary
+number of all-zero entries.
+
+\paragraph{VIRTIO_ADMIN_CMD_DEVICE_CAP_GET}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO_ADMIN_CMD_DEVICE_CAP_GET}
+
+This command gets the device capability for the specified capability
+id \field{id}.
+
+For the command VIRTIO_ADMIN_CMD_DEVICE_CAP_GET, \field{opcode} is set to 0x8.
+\field{group_member_id} is set to zero.
+
+\field{command_specific_data} is in format
+\field{struct virtio_admin_cmd_cap_get_data}.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_cap_get_data {
+        le16 id;
+        u8 reserved[6];
+};
+\end{lstlisting}
+
+\field{id} refers to the capability id listed in \ref{table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / capability ids}.
+\field{reserved} is reserved for future use and set to zero.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_cap_get_result {
+        u8 cap_specific_data[];
+};
+\end{lstlisting}
+
+When the command completes successfully, \field{command_specific_result}
+is in the format \field{struct virtio_admin_cmd_cap_get_result} responded
+by the device. Each capability uses different capability specific
+\field{cap_specific_data} and is described separately.
+
+\paragraph{VIRTIO_ADMIN_CMD_DRIVER_CAP_SET}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO_ADMIN_CMD_DRIVER_CAP_SET}
+
+This command sets the driver capability, indicating to the device which capability
+the driver uses. The driver can set a resource object limit capability that is smaller
+than or equal to the value published by the device capability.
+If the capability is a set of flags, the driver sets the flag bits that are set
+in the device capability; the driver does not set any flag bits that are not
+set by the device.
+
+For the command VIRTIO_ADMIN_CMD_DRIVER_CAP_SET, \field{opcode} is set to 0x9.
+\field{group_member_id} is set to zero.
+The \field{command_specific_data} is in the format
+\field{struct virtio_admin_cmd_cap_set_data}.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_cap_set_data {
+        le16 id;
+        u8 reserved[6];
+        u8 cap_specific_data[];
+};
+\end{lstlisting}
+
+\field{id} refers to the capability id listed in \ref{table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / capability ids}.
+\field{reserved} is reserved for future use and set to zero.
+
+There is no command specific result.
+When the command completes successfully, the driver capability is updated to
+the values supplied in \field{cap_specific_data}.
+
+\devicenormative{\paragraph}{Device and driver capabilities}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
+
+If the device supports capabilities, it MUST support the commands
+VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY,
+VIRTIO_ADMIN_CMD_DRIVER_CAP_SET, and
+VIRTIO_ADMIN_CMD_DEVICE_CAP_GET.
+
+For the VIRTIO_ADMIN_CMD_DRIVER_CAP_SET command,
+\begin{itemize}
+\item the device MUST support the setting of resource object limit driver capability to a
+value that is same as or smaller than the one reported in the device
+capability,
+\item the device MUST support the setting of capability flags bits to
+all or fewer bits than the one reported in the device capability;
+\end{itemize}
+this is applicable unless specific capability fields are explicitly
+stated as non-writable in the VIRTIO_ADMIN_CMD_DEVICE_CAP_GET command.
+
+The device MAY complete the command VIRTIO_ADMIN_CMD_DRIVER_CAP_SET with
+\field{status} set to VIRTIO_ADMIN_STATUS_EINVAL,
+if the capability resource object limit is larger than the value reported by the
+device's capability, or the capability flag bit is set, which is not set in
+the device's capability.
+
+The device MUST complete the commands VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY,
+VIRTIO_ADMIN_CMD_DRIVER_CAP_GET, and VIRTIO_ADMIN_CMD_DRIVER_CAP_SET
+with \field{status} set to VIRTIO_ADMIN_STATUS_EINVAL if the commands are not
+for the self group type.
+
+The device SHOULD complete the commands VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY,
+VIRTIO_ADMIN_CMD_DRIVER_CAP_GET, VIRTIO_ADMIN_CMD_DRIVER_CAP_SET with
+\field{status} set to VIRTIO_ADMIN_STATUS_EINVAL if the commands are not for the
+self group type.
+
+The device SHOULD complete the command VIRTIO_ADMIN_CMD_DRIVER_CAP_SET with
+\field{status} set to VIRTIO_ADMIN_STATUS_EBUSY if the command requests to disable
+a capability while the device still has valid resource objects related to the
+capability being disabled.
+
+The device SHOULD complete the comands VIRTIO_ADMIN_CMD_DEVICE_CAP_GET and
+VIRTIO_ADMIN_CMD_DRIVER_CAP_SET with \field{status} set to
+VIRTIO_ADMIN_STATUS_ENXIO if the capability id is not reported
+in command VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY.
+
+Upon a device reset, the device MUST reset all driver capabilities.
+
+\drivernormative{\paragraph}{Device and driver capabilities}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
+
+The driver MUST send the command VIRTIO_ADMIN_CMD_DRIVER_CAP_SET before
+using any resource objects that depend on such a capability.
+
+In VIRTIO_ADMIN_CMD_DRIVER_CAP_SET command, the driver MUST NOT set
+\begin{itemize}
+\item the resource object limit value larger than the value reported
+by the device in the command VIRTIO_ADMIN_CMD_DEVICE_CAP_GET,
+\item flags bits which was not reported by the device in the command
+VIRTIO_ADMIN_CMD_DEVICE_CAP_GET,
+\item array entries not reported by the device in the command
+VIRTIO_ADMIN_CMD_DEVICE_CAP_GET.
+\end{itemize}
+
+The driver MUST NOT disable any of the driver capability using the command
+VIRTIO_ADMIN_CMD_DRIVER_CAP_SET when related resource objects
+are created but not destroyed.
diff --git a/admin.tex b/admin.tex
index c93c74c..c8b3de4 100644
--- a/admin.tex
+++ b/admin.tex
@@ -136,7 +136,13 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline
 0x0006 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO]{VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO} & Query the notification region information \\
 \hline
-0x0007 - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
+0x0007 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY]{VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY} & Query the supported device capabilities bitmap \\
+\hline
+0x0008 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO_ADMIN_CMD_DEVICE_CAP_GET]{VIRTIO_ADMIN_CMD_DEVICE_CAP_GET} & Get the device capabilities \\
+\hline
+0x0009 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO_ADMIN_CMD_DRIVER_CAP_SET]{VIRTIO_ADMIN_CMD_DRIVER_CAP_SET} & Set the driver capabilities \\
+\hline
+0x000a - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
 \hline
 0x8000 - 0xFFFF & - & Reserved for future commands (possibly using a different structure)    \\
 \hline
@@ -162,10 +168,14 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline \hline
 00   & VIRTIO_ADMIN_STATUS_OK    & successful completion  \\
 \hline
+06   & VIRTIO_ADMIN_STATUS_ENXIO & no such capability \\
+\hline
 11   & VIRTIO_ADMIN_STATUS_EAGAIN    & try again \\
 \hline
 12   & VIRTIO_ADMIN_STATUS_ENOMEM    & insufficient resources \\
 \hline
+16   & VIRTIO_ADMIN_STATUS_EBUSY     & device busy \\
+\hline
 22   & VIRTIO_ADMIN_STATUS_EINVAL    & invalid command \\
 \hline
 other   & -    & group administration command error  \\
diff --git a/conformance.tex b/conformance.tex
index 183c059..8b77eba 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -99,6 +99,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:General Initialization And Device Operation / Device Initialization}
 \item \ref{drivernormative:General Initialization And Device Operation / Device Cleanup}
 \item \ref{drivernormative:Reserved Feature Bits}
+\item \ref{drivernormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
 \end{itemize}
 
 \conformance{\subsection}{PCI Driver Conformance}\label{sec:Conformance / Driver Conformance / PCI Driver Conformance}
@@ -181,6 +182,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Packed Virtqueues / Scatter-Gather Support}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Shared Memory Regions}
 \item \ref{devicenormative:Reserved Feature Bits}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
 \end{itemize}
 
 \conformance{\subsection}{PCI Device Conformance}\label{sec:Conformance / Device Conformance / PCI Device Conformance}
diff --git a/virtio.tex b/virtio.tex
index 7c52a40..3bb5c14 100644
--- a/virtio.tex
+++ b/virtio.tex
@@ -39,6 +39,7 @@
 \usepackage{underscore}
 \usepackage{xstring}
 \usepackage{enumitem}
+\usepackage{float}
 \IfFileExists{ellipsis.sty}{\usepackage{ellipsis}}{
 \message{!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!}
 \message{LaTeX Warning: Missing ellipsis.sty: dots (...) will look ugly}
-- 
2.34.1

